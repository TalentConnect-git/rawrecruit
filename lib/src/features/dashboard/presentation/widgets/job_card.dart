import 'package:flutter/material.dart';

import '../../../../common/index.dart';

class JobCard extends StatelessWidget {
  final String jobId;
  final String title;
  final String workMode;
  final String location;
  final String package;
  final String description;
  final List<String> skills;
  final int yoe;
  final bool isSaved;
  final VoidCallback onBookmarkToggle;
  final VoidCallback onApply;
  final VoidCallback onTap;

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
    required this.isSaved,
    required this.onBookmarkToggle,
    required this.onApply,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin:
            const EdgeInsets.only(bottom: 16),
        padding:
            const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: AppColors.background,
          borderRadius:
              BorderRadius.circular(16),
          border:
              Border.all(color: AppColors.border),
        ),
        child: Column(
          crossAxisAlignment:
              CrossAxisAlignment.start,
          children: [
            /// 🔹 Title + Bookmark
            Row(
              children: [
                Expanded(
                  child: Text(
                    title,
                    style:
                        AppTextStyles.s18W600
                            .copyWith(
                                color:
                                    AppColors.text),
                  ),
                ),

                GestureDetector(
                  onTap:
                      onBookmarkToggle,
                  child:
                      AnimatedSwitcher(
                    duration:
                        const Duration(
                            milliseconds:
                                200),
                    child: Icon(
                      isSaved
                          ? Icons
                              .bookmark
                          : Icons
                              .bookmark_border,
                      key:
                          ValueKey(
                              isSaved),
                      color: isSaved
                          ? AppColors
                              .primary
                          : AppColors
                              .text
                              .withOpacity(
                                  0.6),
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 8),

            Row(
              children: [
                _chip("YOE : $yoe"),
                const SizedBox(width: 8),
                Text(workMode,
                    style:
                        AppTextStyles
                            .s12W400),
              ],
            ),

            const SizedBox(height: 10),

            Wrap(
              spacing: 8,
              runSpacing: 6,
              children: skills
                  .map((e) =>
                      _skillChip(e))
                  .toList(),
            ),

            const SizedBox(height: 10),

            Text(
              description,
              style:
                  AppTextStyles.s12W400,
              maxLines: 2,
              overflow:
                  TextOverflow.ellipsis,
            ),

            const SizedBox(height: 14),

            Row(
              mainAxisAlignment:
                  MainAxisAlignment
                      .spaceBetween,
              children: [
                Column(
                  crossAxisAlignment:
                      CrossAxisAlignment
                          .start,
                  children: [
                    Row(
                      children: [
                        const Icon(
                            Icons
                                .location_on,
                            size: 16),
                        const SizedBox(
                            width: 4),
                        Text(location,
                            style:
                                AppTextStyles
                                    .s12W400),
                      ],
                    ),
                    const SizedBox(
                        height: 4),
                    Text("Package",
                        style:
                            AppTextStyles
                                .s12W400),
                    Text(package,
                        style:
                            AppTextStyles
                                .s14W600),
                  ],
                ),

                ElevatedButton(
                  onPressed:
                      onApply,
                  style:
                      ElevatedButton
                          .styleFrom(
                    backgroundColor:
                        AppColors
                            .primary,
                  ),
                  child: const Text(
                      "Apply"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _chip(String text) {
    return Container(
      padding:
          const EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 4),
      decoration: BoxDecoration(
        color: AppColors.background,
        borderRadius:
            BorderRadius.circular(20),
      ),
      child: Text(text,
          style:
              AppTextStyles.s12W600),
    );
  }

  Widget _skillChip(String text) {
    return Container(
      padding:
          const EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 4),
      decoration: BoxDecoration(
        color: AppColors.primary
            .withOpacity(0.1),
        borderRadius:
            BorderRadius.circular(20),
      ),
      child: Text(
        text,
        style: AppTextStyles.s12W600
            .copyWith(
                color:
                    AppColors.primary),
      ),
    );
  }
}
