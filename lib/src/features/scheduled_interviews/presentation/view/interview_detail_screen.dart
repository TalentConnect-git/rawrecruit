import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rawrecruit/src/common/index.dart';
import 'package:rawrecruit/src/core/index.dart';
import 'package:rawrecruit/src/features/scheduled_interviews/data/entity/interview_model.dart';
import 'package:url_launcher/url_launcher.dart';

import '../view_model/scheduled_interview_view_model.dart';

class InterviewDetailScreen extends StatefulWidget {
  const InterviewDetailScreen({super.key, required this.interviewId});

  final String? interviewId;

  @override
  State<InterviewDetailScreen> createState() => _InterviewDetailScreenState();
}

class _InterviewDetailScreenState extends State<InterviewDetailScreen> {
  final InterviewViewModel vm = getIt<InterviewViewModel>();
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      print("init");

      final failure = await vm.getInterviewById(widget.interviewId ?? '');

      if (mounted) failure?.showError(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    print(widget.interviewId);

    return ChangeNotifierProvider.value(
      value: vm,
      child: Scaffold(
        appBar: RAppBar(title: const Text('Interview Details')),
        body: Consumer<InterviewViewModel>(
          builder: (context, vm, _) {
            if (vm.viewState == ViewState.busy) {
              return const Center(child: CircularProgressIndicator());
            }
      
            final interview = vm.selectedInterview;
            if (interview == null) {
              return const Center(child: Text('Interview not found.'));
            }
      
            return SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _StatusHeader(interview: interview),
                  const SizedBox(height: 16),
                  _InfoSection(
                    title: 'Interview Schedule',
                    children: [
                      _InfoTile(
                        icon: Icons.calendar_today_outlined,
                        label: 'Date',
                        value: interview.date ?? '—',
                      ),
                      _InfoTile(
                        icon: Icons.access_time_outlined,
                        label: 'Time',
                        value: interview.time ?? '—',
                      ),
                     if (interview.meetLink?.isNotEmpty == true) ...[
  _InfoTile(
    icon: Icons.videocam_outlined,
    label: 'Meet Link',
    value: interview.meetLink!,
    isLink: true,
  ),
  Padding(
    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
    child: SizedBox(
      width: double.infinity,
      child: ElevatedButton.icon(
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
        icon: const Icon(Icons.video_call),
        label: const Text('Join Meet'),
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.green.shade600,
          foregroundColor: Colors.white,
          padding: const EdgeInsets.symmetric(vertical: 12),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    ),
  ),
],
                      if (interview.jobRole?.isNotEmpty == true)
                        _InfoTile(
                          icon: Icons.work_outline,
                          label: 'Role',
                          value: interview.jobRole!.join(', '),
                        ),
                      _InfoTile(
                        icon: Icons.category_outlined,
                        label: 'Job Type',
                        value: interview.jobType ?? '—',
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
            
                  const SizedBox(height: 16),
                  _InfoSection(
                    title: 'Company',
                    children: [
                      _InfoTile(
                        icon: Icons.business_outlined,
                        label: 'Company',
                        value: interview.companySnapshot?.companyName ?? '—',
                      ),
                      if (interview
                              .companySnapshot
                              ?.scheduledBy
                              ?.name
                              ?.isNotEmpty ==
                          true) ...[
                        _InfoTile(
                          icon: Icons.person_pin_outlined,
                          label: 'Scheduled By',
                          value: interview.companySnapshot!.scheduledBy!.name!,
                        ),
                        _InfoTile(
                          icon: Icons.work_history_outlined,
                          label: 'Designation',
                          value:
                              interview
                                  .companySnapshot
                                  ?.scheduledBy
                                  ?.designation ??
                              '—',
                        ),
                        _InfoTile(
                          icon: Icons.email_outlined,
                          label: 'Email',
                          value:
                              interview.companySnapshot?.scheduledBy?.email ??
                              '—',
                        ),
                      ],
                    ],
                  ),
                  if (interview.message?.isNotEmpty == true) ...[
                    const SizedBox(height: 16),
                    _InfoSection(
                      title: 'Message',
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 8,
                          ),
                          child: Text(
                            interview.message!,
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                        ),
                      ],
                    ),
                  ],
                  const SizedBox(height: 24),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────

class _StatusHeader extends StatelessWidget {
  const _StatusHeader({required this.interview});

  final InterviewModel interview;

  Color _statusColor() {
    switch ((interview.status ?? '').toLowerCase()) {
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

  Color _statusBg() {
    switch ((interview.status ?? '').toLowerCase()) {
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

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final companyName = interview.companySnapshot?.companyName ?? '—';

    return Card(
      elevation: 0,
      color: theme.colorScheme.surfaceVariant.withOpacity(0.4),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    companyName,
                    style: theme.textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  if (interview.jobRole?.isNotEmpty == true) ...[
                    const SizedBox(height: 4),
                    Text(
                      interview.jobRole!.join(', '),
                      style: theme.textTheme.bodyMedium?.copyWith(
                        color: theme.colorScheme.primary,
                      ),
                    ),
                  ],
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: _statusBg(),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                interview.status ?? '—',
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                  color: _statusColor(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────

class _InfoSection extends StatelessWidget {
  const _InfoSection({required this.title, required this.children});

  final String title;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.titleSmall?.copyWith(
            fontWeight: FontWeight.w700,
            color: Theme.of(context).colorScheme.onSurfaceVariant,
            letterSpacing: 0.5,
          ),
        ),
        const SizedBox(height: 8),
        Card(
          elevation: 1,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(children: children),
        ),
      ],
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────

class _InfoTile extends StatelessWidget {
  const _InfoTile({
    required this.icon,
    required this.label,
    required this.value,
    this.isLink = false,
  });

  final IconData icon;
  final String label;
  final String value;
  final bool isLink;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, size: 18, color: theme.colorScheme.onSurfaceVariant),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: theme.textTheme.labelSmall?.copyWith(
                    color: theme.colorScheme.onSurfaceVariant,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  value,
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: isLink ? theme.colorScheme.primary : null,
                    decoration: isLink ? TextDecoration.underline : null,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
