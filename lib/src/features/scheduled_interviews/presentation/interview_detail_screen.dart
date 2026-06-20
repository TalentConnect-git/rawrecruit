import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rawrecruit/src/common/index.dart';
import 'package:rawrecruit/src/core/index.dart';
import 'package:rawrecruit/src/features/scheduled_interviews/index.dart';
import 'package:url_launcher/url_launcher.dart';

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
      final failure = await vm.getInterviewById(widget.interviewId ?? '');
      if (mounted) failure?.showError(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: vm,
      child: Scaffold(
        backgroundColor: AppColors.secBorder,

        /// 🔹 APPBAR
        appBar: RAppBar(
          title: const Text(
            'Interview Details',
            style: TextStyle(color: Colors.white),
          ),
          iconTheme: const IconThemeData(color: Colors.white),
        ),

        body: Consumer<InterviewViewModel>(
          builder: (context, vm, _) {
            if (vm.viewState == ViewState.busy) {
              return const Center(child: CircularProgressIndicator());
            }

            final interview = vm.selectedInterview;
            if (interview == null) {
              return const Center(
                child: Text(
                  'Interview not found.',
                  style: TextStyle(color: Colors.white),
                ),
              );
            }

            return SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  /// 🔹 HEADER CARD
                  _StatusHeader(interview: interview),

                  const SizedBox(height: 16),

                  /// 🔹 SCHEDULE
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

                        /// 🔥 JOIN BUTTON
                        Padding(
                          padding: const EdgeInsets.all(12),
                          child: SizedBox(
                            width: double.infinity,
                            child: ElevatedButton.icon(
                              onPressed: () async {
                                final uri = Uri.parse(interview.meetLink!);
                                if (await canLaunchUrl(uri)) {
                                  await launchUrl(
                                    uri,
                                    mode: LaunchMode.externalApplication,
                                  );
                                }
                              },
                              icon: const Icon(Icons.video_call),
                              label: const Text('Join Meet'),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: AppColors.kGreen,
                                foregroundColor: Colors.white,
                                elevation: 0,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
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

                  /// 🔹 COMPANY
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
                          icon: Icons.person_outline,
                          label: 'Scheduled By',
                          value: interview.companySnapshot!.scheduledBy!.name!,
                        ),
                        // _InfoTile(
                        //   icon: Icons.work_outline,
                        //   label: 'Designation',
                        //   value:
                        //       interview
                        //           .companySnapshot
                        //           ?.scheduledBy
                        //           ?.designation ??
                        //       '—',
                        // ),
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
                          padding: const EdgeInsets.all(12),
                          child: Text(
                            interview.message!,
                            style: const TextStyle(
                              color: Colors.grey,
                              fontStyle: FontStyle.italic,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],

                  const SizedBox(height: 30),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

/// 🔥 HEADER CARD

class _StatusHeader extends StatelessWidget {
  const _StatusHeader({required this.interview});

  final InterviewModel interview;

  Color _color() {
    switch ((interview.status ?? '').toLowerCase()) {
      case 'scheduled':
        return AppColors.kGreen;
      case 'completed':
        return Colors.blue;
      case 'cancelled':
        return Colors.red;
      default:
        return Colors.grey;
    }
  }

  @override
  Widget build(BuildContext context) {
    final companyName = interview.companySnapshot?.companyName ?? '—';

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.kCard,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.kBorder),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  companyName,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                if (interview.jobRole?.isNotEmpty == true)
                  Text(
                    interview.jobRole!.join(', '),
                    style: TextStyle(color: AppColors.kGreen),
                  ),
              ],
            ),
          ),

          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: _color().withOpacity(0.15),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              interview.status ?? '—',
              style: TextStyle(color: _color(), fontWeight: FontWeight.w600),
            ),
          ),
        ],
      ),
    );
  }
}

/// 🔥 SECTION

class _InfoSection extends StatelessWidget {
  const _InfoSection({required this.title, required this.children});

  final String title;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.kCard,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.kBorder),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 12),
          ...children,
        ],
      ),
    );
  }
}

/// 🔥 TILE

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
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        children: [
          Icon(icon, size: 18, color: Colors.grey),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: const TextStyle(fontSize: 11, color: Colors.grey),
                ),
                const SizedBox(height: 2),
                Text(
                  value,
                  style: TextStyle(
                    color: isLink ? AppColors.kGreen : Colors.white,
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
