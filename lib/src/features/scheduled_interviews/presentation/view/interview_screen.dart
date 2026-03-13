import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:rawrecruit/src/common/index.dart';
import 'package:rawrecruit/src/core/index.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../data/entity/interview_model.dart';
import '../view_model/scheduled_interview_view_model.dart';

class InterviewsScreen extends StatefulWidget {
  const InterviewsScreen({super.key});

  @override
  State<InterviewsScreen> createState() => _InterviewsScreenState();
}

class _InterviewsScreenState extends State<InterviewsScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      final failure =
          await context.read<InterviewViewModel>().getInterviews();
      if (mounted) failure?.showError(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: RAppBar(title: const Text('Scheduled Interviews')),
      body: Consumer<InterviewViewModel>(
        builder: (context, vm, _) {
          if (vm.viewState == ViewState.busy) {
            return const Center(child: CircularProgressIndicator());
          }

          if (vm.interviews.isEmpty) {
            return const Center(
              child: Text('No scheduled interviews found.'),
            );
          }

          return ListView.separated(
            padding: const EdgeInsets.all(16),
            itemCount: vm.interviews.length,
            separatorBuilder: (_, __) => const SizedBox(height: 12),
            itemBuilder: (context, index) {
              return InterviewCard(interview: vm.interviews[index]);
            },
          );
        },
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────

class InterviewCard extends StatelessWidget {
  const InterviewCard({super.key, required this.interview});

  final InterviewModel interview;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final companyName = interview.companySnapshot?.companyName ??
        interview.jobId?.companyName ??
        'Unknown Company';
    final jobTitle = interview.jobId?.jobTitle ?? 'Interview';
    final roles = interview.jobRole?.join(', ') ?? '';
    final status = interview.status ?? 'Scheduled';
print("${interview.id} intervieww idddddddddd");
    return GestureDetector(
      
      onTap: () {
        print("${interview.id} intervieww idddddddddd");

        if (interview.id != null) {
          context.pushNamed(
            RouteNames.interviewDetail,
            extra:interview.id,
          );
        }
      },
      
      child: Card(
        elevation: 2,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header: company + status badge
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      companyName,
                      style: theme.textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  _StatusBadge(status: status),
                ],
              ),
              const SizedBox(height: 4),

              // Job title
              Text(
                jobTitle,
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: theme.colorScheme.primary,
                ),
              ),

              if (roles.isNotEmpty) ...[
                const SizedBox(height: 4),
                Text(
                  roles,
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: theme.colorScheme.onSurfaceVariant,
                  ),
                ),
              ],

              const Divider(height: 20),

              // Date & Time row
              Row(
                children: [
                  const Icon(Icons.calendar_today_outlined, size: 16),
                  const SizedBox(width: 6),
                  Text(
                    interview.date ?? '—',
                    style: theme.textTheme.bodySmall,
                  ),
                  const SizedBox(width: 16),
                  const Icon(Icons.access_time_outlined, size: 16),
                  const SizedBox(width: 6),
                  Text(
                    interview.time ?? '—',
                    style: theme.textTheme.bodySmall,
                  ),
                ],
              ),

              // Meet link
           if (interview.meetLink?.isNotEmpty == true) ...[
  const SizedBox(height: 8),
  SizedBox(
    width: double.infinity,
    child: OutlinedButton.icon(
      onPressed: () async {
        final uri = Uri.parse(interview.meetLink!);
        if (await canLaunchUrl(uri)) {
          await launchUrl(uri, mode: LaunchMode.externalApplication);
        } else {
          if (context.mounted) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Could not open meet link')),
            );
          }
        }
      },
      icon: const Icon(Icons.videocam_outlined, size: 16),
      label: const Text('Join Meet'),
      style: OutlinedButton.styleFrom(
        foregroundColor: Colors.green.shade700,
        side: BorderSide(color: Colors.green.shade700),
        padding: const EdgeInsets.symmetric(vertical: 8),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    ),
  ),
],

              // Message
              if (interview.message?.isNotEmpty == true) ...[
                const SizedBox(height: 8),
                Text(
                  interview.message!,
                  style: theme.textTheme.bodySmall?.copyWith(
                    fontStyle: FontStyle.italic,
                    color: theme.colorScheme.onSurfaceVariant,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ],

              // Scheduled by
              if (interview.companySnapshot?.scheduledBy?.name?.isNotEmpty == true) ...[
                const SizedBox(height: 8),
                Row(
                  children: [
                    const Icon(Icons.person_outline, size: 16),
                    const SizedBox(width: 6),
                    Text(
                      'Scheduled by ${interview.companySnapshot!.scheduledBy!.name}',
                      style: theme.textTheme.bodySmall,
                    ),
                  ],
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────

class _StatusBadge extends StatelessWidget {
  const _StatusBadge({required this.status});

  final String status;

  Color _bgColor() {
    switch (status.toLowerCase()) {
      case 'scheduled':
        return Colors.blue.shade50;
      case 'completed':
        return Colors.green.shade50;
      case 'cancelled':
        return Colors.red.shade50;
      default:
        return Colors.grey.shade100;
    }
  }

  Color _textColor() {
    switch (status.toLowerCase()) {
      case 'scheduled':
        return Colors.blue.shade700;
      case 'completed':
        return Colors.green.shade700;
      case 'cancelled':
        return Colors.red.shade700;
      default:
        return Colors.grey.shade700;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: _bgColor(),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        status,
        style: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w600,
          color: _textColor(),
        ),
      ),
    );
  }
}