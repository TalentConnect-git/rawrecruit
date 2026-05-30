import 'package:flutter/material.dart';
import 'package:rawrecruit/src/features/professional/job_postng/presentation/entities/referral_application.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../common/index.dart';

class ApplicationDetailsView extends StatelessWidget {
  final ReferralApplication application;

  const ApplicationDetailsView({
    super.key,
    required this.application,
  });

  @override
  Widget build(BuildContext context) {

    final applicant =
        application.applicant;

    final currentEducation =
    applicant?.educations != null &&
            applicant!
                .educations!
                .isNotEmpty
        ? applicant.educations!.firstWhere(
            (e) =>
                e.isCurrent == true,

            orElse: () =>
                applicant
                    .educations!
                    .first,
          )
        : null;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Application Details",

          style: TextStyle(
            color: AppColors.white,
          ),
        ),
      ),

      body: SingleChildScrollView(
        padding:
            const EdgeInsets.all(
          16,
        ),

        child: Column(
          crossAxisAlignment:
              CrossAxisAlignment
                  .start,

          children: [

            /// PROFILE IMAGE
            if (applicant
                    ?.profileImage !=
                null)

              Center(
                child: CircleAvatar(
                  radius: 50,

                  backgroundImage:
                      NetworkImage(
                    applicant!
                        .profileImage!,
                  ),
                ),
              ),

            const SizedBox(
              height: 20,
            ),

            /// BASIC INFO
            _buildTile(
              "Name",
              applicant?.name,
            ),

            _buildTile(
              "Email",
              applicant?.email,
            ),

            _buildTile(
              "Phone",
              applicant?.phone,
            ),

            _buildTile(
              "Gender",
              applicant?.gender,
            ),

            const Divider(),

            /// PROFESSIONAL INFO
            _buildTile(
              "Current Company",
              applicant?.currentCompany,
            ),

            _buildTile(
              "Degree",
              currentEducation
                  ?.degree,
            ),

            _buildTile(
              "College",
              currentEducation
                  ?.college,
            ),

            _buildTile(
              "Experience Roles",
              applicant?.jobRoles
                  ?.join(", "),
            ),

            _buildTile(
              "Industry",
              applicant?.industry
                  ?.join(", "),
            ),

            _buildTile(
              "Skills",
              applicant?.skills
                  ?.join(", "),
            ),

            const Divider(),

            /// SALARY & NOTICE
            _buildTile(
              "Current Salary",
              applicant
                  ?.currentSalaryAmount,
            ),

            _buildTile(
              "Expected Salary",
              applicant
                  ?.expectedSalaryAmount,
            ),

            _buildTile(
              "Notice Period",
              applicant?.noticePeriod,
            ),

            const Divider(),

            /// RESUME
            if (applicant?.resume !=
                null)

              TextButton(
                onPressed: () async {

                  final resumeUrl =
                      application
                          .applicant
                          ?.resume;

                  if (resumeUrl ==
                          null ||
                      resumeUrl
                          .isEmpty) {

                    ScaffoldMessenger.of(
                      context,
                    ).showSnackBar(
                      const SnackBar(
                        content: Text(
                          "Resume not available",
                        ),
                      ),
                    );

                    return;
                  }

                  final uri =
                      Uri.parse(
                    resumeUrl,
                  );

                  if (!await launchUrl(
                    uri,

                    mode:
                        LaunchMode
                            .externalApplication,
                  )) {

                    ScaffoldMessenger.of(
                      context,
                    ).showSnackBar(
                      const SnackBar(
                        content: Text(
                          "Could not open resume",
                        ),
                      ),
                    );
                  }
                },

                child: const Text(
                  "View Resume",
                ),
              ),

            const SizedBox(
              height: 20,
            ),

            /// STATUS
            Text(
              "Current Status: ${application.currentStatus ?? '-'}",

              style:
                  const TextStyle(
                fontSize: 16,

                fontWeight:
                    FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTile(
    String title,
    String? value,
  ) {

    if (value == null ||
        value.isEmpty) {

      return const SizedBox();
    }

    return Padding(
      padding:
          const EdgeInsets.symmetric(
        vertical: 6,
      ),

      child: Row(
        crossAxisAlignment:
            CrossAxisAlignment
                .start,

        children: [

          SizedBox(
            width: 130,

            child: Text(
              "$title:",

              style:
                  const TextStyle(
                fontWeight:
                    FontWeight.w600,
              ),
            ),
          ),

          Expanded(
            child: Text(value),
          ),
        ],
      ),
    );
  }
}