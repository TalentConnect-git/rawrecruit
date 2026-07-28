import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:rawrecruit/src/common/index.dart';
import 'package:rawrecruit/src/core/index.dart';
import 'package:rawrecruit/src/features/web_jobs/data/entities/referral_alumni.dart';

import '../data/entities/career_page_referral_response.dart';
import 'view_models/web_jobs_view_model.dart';

class CareerPageAlumniListView extends StatelessWidget {
  final String careerPageUrl;
  final CareerPageReferralResponse response;

  const CareerPageAlumniListView({
    super.key,
    required this.careerPageUrl,
    required this.response,
  });
  @override
  Widget build(BuildContext context) {
    final alumni = response.data?.alumni ?? [];

    return ChangeNotifierProvider(
      create: (_) => getIt<WebJobViewModel>(),
      child: Scaffold(
        backgroundColor: AppColors.kBg,
        appBar: AppBar(
          backgroundColor: AppColors.kBg,
          elevation: 0,
          scrolledUnderElevation: 0,
          centerTitle: false,
          title: Text(
            response.data?.alumniFound == true
                ? 'Available Alumni'
                : 'Profiles Working in Company',
            style: AppTextStyles.s18W600.copyWith(color: AppColors.white),
          ),
          leading: IconButton(
            onPressed: () => context.pop(),
            icon: Icon(
              Icons.arrow_back_ios_new_rounded,
              color: AppColors.white,
            ),
          ),
        ),
        body: alumni.isEmpty
            ? Center(
                child: Text(
                  'No Alumni Found',
                  style: TextStyle(color: AppColors.white),
                ),
              )
            : Consumer<WebJobViewModel>(
                builder: (_, vm, __) {
                  return Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(16),
                        child: SizedBox(
                          width: double.infinity,
                          height: 48,
                          child: ElevatedButton.icon(
                            icon: Icon(
                              Icons.groups_rounded,
                              color: AppColors.onGreenButton,
                            ),
                            label: Text(
                              'Request All (${alumni.length})',
                              style: const TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 15,
                              ),
                            ),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.kGreen,
                              foregroundColor: AppColors.onGreenButton,
                              elevation: 0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(14),
                              ),
                            ),
                            onPressed: () async {
                              final ids = alumni
                                  .map((e) => e.userId)
                                  .whereType<String>()
                                  .toList();

                              final failure = await vm.sendCareerPageReferral(
                                careerPageUrl: careerPageUrl,
                                receiverUserIds: ids,
                              );

                              if (!context.mounted) return;

                              if (failure != null) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                      failure.message ?? 'Something went wrong',
                                    ),
                                  ),
                                );
                                return;
                              }

                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text(
                                    'Referral requests sent to all alumni',
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ),

                      Expanded(
                        child: ListView.separated(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          itemCount: alumni.length,
                          separatorBuilder: (_, __) =>
                              const SizedBox(height: 12),
                          itemBuilder: (_, index) {
                            final alumniUser = alumni[index];

                            return _AlumniCard(
                              alumni: alumniUser,
                              careerPageUrl: careerPageUrl,
                            );
                          },
                        ),
                      ),
                    ],
                  );
                },
              ),
      ),
    );
  }
}

class _AlumniCard extends StatefulWidget {
  final ReferralAlumni alumni;
  final String careerPageUrl;

  const _AlumniCard({required this.alumni, required this.careerPageUrl});

  @override
  State<_AlumniCard> createState() => _AlumniCardState();
}

class _AlumniCardState extends State<_AlumniCard> {
  bool isRequestSent = false;
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    String employeeStatus;
    Color employeeStatusColor;

    if (widget.alumni.currentlyWorking == true) {
      employeeStatus = 'Current Employee';
      employeeStatusColor = AppColors.kGreen;
    } else if (widget.alumni.previouslyWorked == true) {
      employeeStatus = 'Former Employee';
      employeeStatusColor = Colors.orange;
    } else {
      employeeStatus = '';
      employeeStatusColor = AppColors.secText;
    }
    return Consumer<WebJobViewModel>(
      builder: (_, vm, __) {
        return Container(
          padding: const EdgeInsets.all(18),
          decoration: BoxDecoration(
            color: AppColors.kCard,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: AppColors.kBorder),
          ),
          child: Column(
            children: [
              /// Avatar
              CircleAvatar(
                radius: 34,
                backgroundColor: AppColors.kGreen,
                backgroundImage: widget.alumni.profileImage?.isNotEmpty == true
                    ? NetworkImage(widget.alumni.profileImage!)
                    : null,
                child: widget.alumni.profileImage?.isNotEmpty == true
                    ? null
                    : Text(
                        (widget.alumni.name ?? 'A')
                            .substring(0, 1)
                            .toUpperCase(),
                        style: TextStyle(
                          color: AppColors.onGreenButton,
                          fontWeight: FontWeight.bold,
                          fontSize: 22,
                        ),
                      ),
              ),

              const SizedBox(height: 14),

              /// Name
              Text(
                widget.alumni.name ?? '',
                textAlign: TextAlign.center,
                style: AppTextStyles.s18W600.copyWith(color: AppColors.white),
              ),

              const SizedBox(height: 10),

              /// Company
              if ((widget.alumni.currentCompany ?? '').isNotEmpty)
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.business_center_outlined,
                      size: 15,
                      color: AppColors.secText,
                    ),

                    const SizedBox(width: 6),

                    Flexible(
                      child: Text(
                        widget.alumni.currentCompany!,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: AppColors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ],
                ),

              /// Current Role
              if ((widget.alumni.jobRoles ?? []).isNotEmpty)
                Padding(
                  padding: const EdgeInsets.only(top: 6),
                  child: Text(
                    widget.alumni.jobRoles!.first,
                    textAlign: TextAlign.center,
                    style: TextStyle(color: AppColors.secText, fontSize: 13),
                  ),
                ),

              const SizedBox(height: 10),

              /// Employee Status
              if (employeeStatus.isNotEmpty)
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 8,
                      height: 8,
                      decoration: BoxDecoration(
                        color: employeeStatusColor,
                        shape: BoxShape.circle,
                      ),
                    ),
                    const SizedBox(width: 6),
                    Text(
                      employeeStatus,
                      style: TextStyle(
                        color: employeeStatusColor,
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),

              /// Skills
              if ((widget.alumni.jobRoles ?? []).length > 1) ...[
                const SizedBox(height: 14),

                Wrap(
                  alignment: WrapAlignment.center,
                  spacing: 8,
                  runSpacing: 8,
                  children: widget.alumni.jobRoles!
                      .take(3)
                      .map(
                        (role) => Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 6,
                          ),
                          decoration: BoxDecoration(
                            color: AppColors.kGreen.withValues(alpha: .12),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Text(
                            role,
                            style: TextStyle(
                              color: AppColors.kGreen,
                              fontSize: 11,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      )
                      .toList(),
                ),
              ],

              const SizedBox(height: 20),

              Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () {
                        context.pushNamed(
                          RouteNames.profileDetail,
                          extra: widget.alumni.userId,
                        );
                      },
                      child: Text(
                        'View Profile',
                        style: TextStyle(
                          color: AppColors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(width: 10),

                  Expanded(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.kGreen,
                        foregroundColor: AppColors.onGreenButton,

                        disabledBackgroundColor: AppColors.kBorder,
                        disabledForegroundColor: AppColors.secText,
                      ),
                      onPressed: isLoading || isRequestSent
                          ? null
                          : () async {
                              setState(() {
                                isLoading = true;
                              });

                              final failure = await vm.sendCareerPageReferral(
                                careerPageUrl: widget.careerPageUrl,
                                receiverUserIds: [widget.alumni.userId ?? ''],
                              );

                              if (!mounted) return;

                              if (failure != null) {
                                setState(() {
                                  isLoading = false;
                                });

                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                      failure.message ?? 'Something went wrong',
                                    ),
                                  ),
                                );
                                return;
                              }

                              setState(() {
                                isLoading = false;
                                isRequestSent = true;
                              });
                            },
                      child: isLoading
                          ? SizedBox(
                              width: 18,
                              height: 18,
                              child: CircularProgressIndicator(
                                strokeWidth: 2,
                                color: AppColors.onGreenButton,
                              ),
                            )
                          : Text(
                              isRequestSent ? 'Request Sent' : 'Ask Referral',
                            ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
