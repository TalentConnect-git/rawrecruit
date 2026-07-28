import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:rawrecruit/src/common/index.dart';
import 'package:rawrecruit/src/core/index.dart';
import 'package:rawrecruit/src/features/scheduled_interviews/index.dart'
    show InterviewViewModel, InterviewModel;
import 'package:url_launcher/url_launcher.dart';

class InterviewsScreen extends StatefulWidget {
  const InterviewsScreen({super.key});

  @override
  State<InterviewsScreen> createState() => _InterviewsScreenState();
}

class _InterviewsScreenState extends State<InterviewsScreen> {
  final InterviewViewModel interviewViewModel = getIt<InterviewViewModel>();
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      final failure = await interviewViewModel.getInterviews();
      if (mounted) failure?.showError(context);

      getIt<AppStateProvider>().clearNewInterviewsAvailable();
    });
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: interviewViewModel,
      child: Scaffold(
        backgroundColor: AppColors.kBg,

        appBar: RAppBar(
          iconTheme: IconThemeData(color: AppColors.white),
          title: Text(
            'Scheduled Interviews',
            style: TextStyle(color: AppColors.white),
          ),
        ),

        body: Consumer<InterviewViewModel>(
          builder: (context, vm, _) {
            if (vm.viewState == ViewState.busy) {
              return const Center(child: CircularProgressIndicator());
            }

            if (vm.interviews.isEmpty) {
              return Center(
                child: Text(
                  'No scheduled interviews found.',
                  style: TextStyle(color: AppColors.white),
                ),
              );
            }

            return ListView.separated(
              padding: const EdgeInsets.all(16),
              itemCount: vm.interviews.length,
              separatorBuilder: (_, __) => const SizedBox(height: 12),
              itemBuilder: (context, index) {
                return InterviewCard(
                  interview: vm.interviews[index],
                  onTap: () {
                    vm.markInterviewById(vm.interviews[index].id ?? '');
                  },
                );
              },
            );
          },
        ),
      ),
    );
  }
}

/// ─────────────────────────────────────────────

class InterviewCard extends StatelessWidget {
  const InterviewCard({
    super.key,
    required this.interview,
    required this.onTap,
  });

  final InterviewModel interview;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final companyName =
        interview.companySnapshot?.companyName ??
        interview.jobId?.companyName ??
        'Unknown Company';

    final jobTitle =
        interview.jobId?.title ??
        ((interview.jobId?.jobRoles?.isNotEmpty ?? false)
            ? interview.jobId!.jobRoles!.first
            : 'Unknown Job');
    final roles = interview.jobRole?.join(', ') ?? '';
    final status = interview.status ?? 'Scheduled';

    return GestureDetector(
      onTap: () {
        if (interview.id != null) {
          onTap.call();
          context.pushNamed(RouteNames.interviewDetail, extra: interview.id);
        }
      },

      /// 🔥 THEMED CARD
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: AppColors.kCard,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: (interview.readByApplicant ?? false)
                ? AppColors.kBorder
                : AppColors.kGreen,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// 🔹 HEADER
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    companyName,
                    style: TextStyle(
                      color: AppColors.white,
                      fontWeight: FontWeight.w600,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                _StatusBadge(status: status),
              ],
            ),

            const SizedBox(height: 6),

            /// 🔹 JOB TITLE
            Text(
              jobTitle,
              style: TextStyle(
                color: AppColors.kGreen,
                fontWeight: FontWeight.w500,
              ),
            ),

            if (roles.isNotEmpty) ...[
              const SizedBox(height: 4),
              Text(roles, style: TextStyle(color: AppColors.secText)),
            ],

            Divider(color: AppColors.kBorder, height: 20),

            /// 🔹 DATE + TIME
            Row(
              children: [
                Image.asset(
                  "assets/images/calendar.png",
                  width: 15,
                  height: 15,
                ),
                const SizedBox(width: 6),
                Text(
                  interview.date ?? '—',
                  style: TextStyle(color: AppColors.white),
                ),

                const SizedBox(width: 16),

                Icon(
                  Icons.access_time_outlined,
                  size: 16,
                  color: AppColors.secText,
                ),
                const SizedBox(width: 6),
                Text(
                  interview.time ?? '—',
                  style: TextStyle(color: AppColors.white),
                ),
              ],
            ),

            /// 🔹 JOIN BUTTON
            if (interview.meetLink?.isNotEmpty == true) ...[
              const SizedBox(height: 10),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  onPressed: () async {
                    try {
                      String url = interview.meetLink!.trim();

                      if (!url.startsWith(RegExp(r'https?://'))) {
                        url = 'https://$url';
                      }

                      final uri = Uri.parse(url);

                      final launched = await launchUrl(
                        uri,
                        mode: LaunchMode.platformDefault,
                      );

                      debugPrint('Meet launch result: $launched');
                    } catch (e) {
                      debugPrint('Meet launch error: $e');
                    }
                  },
                  icon: const Icon(Icons.videocam_outlined, size: 16),
                  label: const Text('Join Meet'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.kGreen,
                    foregroundColor: Colors.white,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),
            ],

            /// 🔹 MESSAGE
            if (interview.message?.isNotEmpty == true) ...[
              const SizedBox(height: 8),
              Text(
                interview.message!,
                style: TextStyle(
                  color: AppColors.secText,
                  fontStyle: FontStyle.italic,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ],

            /// 🔹 SCHEDULED BY
            if (interview.companySnapshot?.scheduledBy?.name?.isNotEmpty ==
                true) ...[
              const SizedBox(height: 8),
              Row(
                children: [
                  Icon(
                    Icons.person_outline,
                    size: 16,
                    color: AppColors.secText,
                  ),
                  const SizedBox(width: 6),
                  Text(
                    'Scheduled by ${interview.companySnapshot!.scheduledBy!.name}',
                    style: TextStyle(color: AppColors.secText),
                  ),
                ],
              ),
            ],
          ],
        ),
      ),
    );
  }
}

/// 🔹 STATUS CHIP

class _StatusBadge extends StatelessWidget {
  const _StatusBadge({required this.status});

  final String status;

  Color _bgColor() {
    switch (status.toLowerCase()) {
      case 'scheduled':
        return AppColors.kGreen.withOpacity(0.15);
      case 'completed':
        return Colors.blue.withOpacity(0.15);
      case 'cancelled':
        return Colors.red.withOpacity(0.15);
      default:
        return Colors.grey.withOpacity(0.15);
    }
  }

  Color _textColor() {
    switch (status.toLowerCase()) {
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
