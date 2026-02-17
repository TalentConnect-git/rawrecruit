import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rawrecruit/src/common/index.dart';
import 'package:rawrecruit/src/features/dashboard/data/dashboard_provider.dart';

class JobCard extends StatelessWidget {
  final String jobId;
  final String title;
  final String workMode;
  final String location;
  final String package;
  final String description;
  final List<String> skills;
  final int yoe;
  final VoidCallback onApply;

  const JobCard({
    super.key,
    required this.jobId,
    required this.title,
    required this.workMode,
    required this.location,
    required this.package,
    required this.description,
    required this.skills,
    required this.yoe,
    required this.onApply,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.background,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.border),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// 🔹 Title + Shortlist Icon
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Text(
                  title,
                  style: AppTextStyles.s18W600
                      .copyWith(color: AppColors.text),
                ),
              ),

              /// Bookmark Selector (only this rebuilds)
              Selector<DashboardProvider, bool>(
                selector: (_, provider) =>
                    provider.isShortlisted(jobId),
                builder: (context, isShortlisted, _) {
                  return GestureDetector(
                    onTap: () => context
                        .read<DashboardProvider>()
                        .toggleShortlist(jobId),
                    child: AnimatedSwitcher(
                      duration:
                          const Duration(milliseconds: 200),
                      transitionBuilder:
                          (child, animation) =>
                              ScaleTransition(
                        scale: animation,
                        child: child,
                      ),
                      child: Icon(
                        isShortlisted
                            ? Icons.bookmark
                            : Icons.bookmark_border,
                        key: ValueKey(isShortlisted),
                        color: isShortlisted
                            ? AppColors.primary
                            : AppColors.text
                                .withOpacity(0.6),
                      ),
                    ),
                  );
                },
              ),
            ],
          ),

          const SizedBox(height: 8),

          /// 🔹 YOE + Work Mode
          Row(
            children: [
              _chip("YOE : $yoe"),
              const SizedBox(width: 8),
              Text(
                workMode,
                style: AppTextStyles.s12W400,
              ),
            ],
          ),

          const SizedBox(height: 10),

          /// 🔹 Skills
          Wrap(
            spacing: 8,
            runSpacing: 6,
            children:
                skills.map((e) => _skillChip(e)).toList(),
          ),

          const SizedBox(height: 10),

          /// 🔹 Description
          SizedBox(
            width: double.infinity,
            child: Text(
              description,
              style: AppTextStyles.s12W400,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),

          const SizedBox(height: 14),

          /// 🔹 Location + Package + Apply
          Row(
            mainAxisAlignment:
                MainAxisAlignment.spaceBetween,
            crossAxisAlignment:
                CrossAxisAlignment.end,
            children: [

              /// Left Side
              Column(
                crossAxisAlignment:
                    CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Icon(
                        Icons.location_on,
                        size: 16,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        location,
                        style:
                            AppTextStyles.s12W400,
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Text(
                    "Package",
                    style:
                        AppTextStyles.s12W400,
                  ),
                  Text(
                    package,
                    style:
                        AppTextStyles.s14W600,
                  ),
                ],
              ),

              /// Apply Selector (only button rebuilds)
              Selector<DashboardProvider, bool>(
                selector: (_, provider) =>
                    provider.isApplied(jobId),
                builder: (context, isApplied, _) {
                  return SizedBox(
                    height: 36,
                    child: isApplied
                        ? OutlinedButton(
                            onPressed: null,
                            style:
                                OutlinedButton.styleFrom(
                              side: BorderSide(
                                  color:
                                      AppColors.border),
                              shape:
                                  RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius
                                        .circular(10),
                              ),
                            ),
                            child: Text(
                              "Applied",
                              style:
                                  AppTextStyles
                                      .s12W600,
                            ),
                          )
                        : ElevatedButton(
                            onPressed: () {
                              context
                                  .read<
                                      DashboardProvider>()
                                  .markApplied(
                                      jobId);
                              onApply();
                            },
                            style:
                                ElevatedButton
                                    .styleFrom(
                              backgroundColor:
                                  AppColors.primary,
                              shape:
                                  RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius
                                        .circular(
                                            10),
                              ),
                              padding:
                                  const EdgeInsets
                                      .symmetric(
                                          horizontal:
                                              20),
                            ),
                            child: Text(
                              "Apply",
                              style:
                                  AppTextStyles
                                      .s12W600
                                      .copyWith(
                                          color: Colors
                                              .white),
                            ),
                          ),
                  );
                },
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _chip(String text) {
    return Container(
      padding: const EdgeInsets.symmetric(
          horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: AppColors.background,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        text,
        style: AppTextStyles.s12W600,
      ),
    );
  }

  Widget _skillChip(String text) {
    return Container(
      padding: const EdgeInsets.symmetric(
          horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color:
            AppColors.primary.withOpacity(0.1),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        text,
        style: AppTextStyles.s12W600.copyWith(
          color: AppColors.primary,
        ),
      ),
    );
  }
}
