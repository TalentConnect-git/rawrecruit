import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:rawrecruit/src/common/index.dart';
import 'package:rawrecruit/src/core/index.dart';
import 'package:rawrecruit/src/features/professional/job_postng/presentation/entities/referral_application.dart';
import 'package:rawrecruit/src/features/professional/job_postng/presentation/view_model/posted_job_application_view_model.dart';
import 'package:rawrecruit/src/features/professional/job_postng/utils/enum.dart';
import 'package:rawrecruit/src/features/professional/professional_dashbaord/presentation/referal_detail_view.dart';
import 'package:url_launcher/url_launcher.dart';

class ReferralDetailPage extends StatelessWidget {
  final ReferralApplication application;

  const ReferralDetailPage({
    super.key,
    required this.application,
  });

  String safe(dynamic val) {
    if (val == null) return "-";
    if (val.toString().trim().isEmpty) return "-";
    if (val.toString() == "null") return "-";
    return val.toString();
  }

  Future<void> openUrl(String url) async {
    if (url == "-" || url.isEmpty) return;

    final uri = Uri.tryParse(url);

    if (uri != null) {
      await launchUrl(uri);
    }
  }

  @override
  Widget build(BuildContext context) {
    final user = application.applicant ?? const User();

    final name = safe(user.name);
    final college = safe(user.college);
    final degree = safe(user.degree);
    final graduation = safe(user.yearOfGraduation);
    final cgpa = safe(user.cgpa);

    final linkedin = safe(user.linkedin);
    final github = safe(user.github);
    final portfolio = safe(user.portfolio);

    final status = safe(application.statusText);

    final skills = application.applicant?.skills ?? [];

    return ChangeNotifierProvider(
      create: (_) => PostedJobApplicationViewModel(),
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: AppColors.kCard,
          title: Text(
            "Candidate Profile",
            style: TextStyle(
              color: AppColors.white,
            ),
          ),
        ),

        body: Consumer<PostedJobApplicationViewModel>(
          builder: (context, vm, _) {
            return SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [

                  /// HEADER
                  _candidateHeader(
                    context,
                    vm,
                    status,
                  ),

                  const SizedBox(height: 18),

                  /// EDUCATION + SKILLS
                  Row(
                    crossAxisAlignment:
                        CrossAxisAlignment.start,
                    children: [

                      /// EDUCATION
                      Expanded(
                        child: _modernCard(
                          title: "Education",
                          icon: Icons.school_outlined,
                          child: Column(
                            crossAxisAlignment:
                                CrossAxisAlignment.start,
                            children: [

                              Text(
                                degree,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight:
                                      FontWeight.w600,
                                  fontSize: 15,
                                ),
                              ),

                              const SizedBox(height: 4),

                              Text(
                                college,
                                style: TextStyle(
                                  color:
                                      AppColors.kGreen,
                                  fontSize: 12,
                                ),
                              ),

                              const SizedBox(height: 10),

                              Row(
                                children: [

                                  Icon(
                                    Icons.calendar_month,
                                    size: 14,
                                    color: Colors.grey,
                                  ),

                                  const SizedBox(width: 6),

                                  Expanded(
                                    child: Text(
                                      graduation,
                                      style:
                                          const TextStyle(
                                        color:
                                            Colors.grey,
                                        fontSize: 12,
                                      ),
                                    ),
                                  ),
                                ],
                              ),

                              const SizedBox(height: 6),

                              Row(
                                children: [

                                  Icon(
                                    Icons.star_border,
                                    size: 14,
                                    color: Colors.grey,
                                  ),

                                  const SizedBox(width: 6),

                                  Expanded(
                                    child: Text(
                                      "CGPA: $cgpa",
                                      style:
                                          const TextStyle(
                                        color:
                                            Colors.grey,
                                        fontSize: 12,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),

                      const SizedBox(width: 14),

                      /// SKILLS
                      Expanded(
                        child: _modernCard(
                          title: "Skills",
                          icon: Icons.code,
                          child: skills.isNotEmpty
                              ? Wrap(
                                  spacing: 6,
                                  runSpacing: 6,
                                  children: skills
                                      .take(8)
                                      .map(
                                        (e) =>
                                            _skillChip(e),
                                      )
                                      .toList(),
                                )
                              : const Text(
                                  "-",
                                  style: TextStyle(
                                    color: Colors.grey,
                                  ),
                                ),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 18),

                  /// LINKS
                  _modernCard(
                    title: "Links",
                    icon: Icons.link,
                    child: Column(
                      children: [

                        _modernLinkTile(
                          "LinkedIn",
                          linkedin,
                          Icons.business,
                        ),

                        _modernLinkTile(
                          "GitHub",
                          github,
                          Icons.code,
                        ),

                        _modernLinkTile(
                          "Portfolio",
                          portfolio,
                          Icons.web,
                        ),

                        const SizedBox(height: 14),

                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton.icon(
                            style:
                                ElevatedButton.styleFrom(
                                  iconColor: Colors.white,
foregroundColor: Colors.white,
                              backgroundColor:
                                  isResumeAvailable(
                                          application
                                              .applicant)
                                      ? AppColors.kGreen
                                      : Colors.grey
                                          .shade800,
                              padding:
                                  const EdgeInsets.symmetric(
                                vertical: 14,
                              ),
                              shape:
                                  RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.circular(
                                        12),
                              ),
                            ),
                            onPressed: () async {
                              if (!isResumeAvailable(
                                application.applicant,
                              )) {
                                return;
                              }

                              openUrl(
                                application
                                        .applicant
                                        ?.resume ??
                                    '',
                              );
                            },
                            icon:
                                const Icon(Icons.download),
                           label: Text(
  isResumeAvailable(application.applicant)
      ? "Download Resume"
      : "No Resume Found",
  style: const TextStyle(
    color: Colors.white,
    fontWeight: FontWeight.w600,
  ),
),
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 24),

                  /// ACCEPT + REJECT
                  Row(
                    children: [

                      /// ACCEPT
                      Expanded(
                        child: ElevatedButton.icon(
                          style:
                              ElevatedButton.styleFrom(
                                iconColor: Colors.white,
foregroundColor: Colors.white,
                            backgroundColor:
                                status == "Accepted"
                                    ? AppColors.kGreen
                                        .withOpacity(.3)
                                    : AppColors.kGreen,
                            padding:
                                const EdgeInsets.symmetric(
                              vertical: 15,
                            ),
                            shape:
                                RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.circular(
                                      14),
                            ),
                          ),
                          onPressed: () async {
                            await vm
                                .updateApplicationStatus(
                              id: application.id ?? "",
                              status:
                                  ApplicationStatus
                                      .accepted,
                            );
if (context.mounted) {
  showStatusPopup(
    context,
    "Candidate accepted successfully",
    Colors.green,
  );
}
                          },
                          icon: const Icon(Icons.check),
                        label: const Text(
  "Refer",
  style: TextStyle(
    color: Colors.white,
    fontWeight: FontWeight.w600,
  ),
),
                        ),
                      ),

                      const SizedBox(width: 14),

                      /// REJECT
                      Expanded(
                        child: OutlinedButton.icon(
                          style:
                              OutlinedButton.styleFrom(
                            padding:
                                const EdgeInsets.symmetric(
                              vertical: 15,
                            ),
                            side: BorderSide(
                              color: Colors.red
                                  .withOpacity(.4),
                            ),
                            shape:
                                RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.circular(
                                      14),
                            ),
                          ),
                          onPressed: () async {
                            await vm
                                .updateApplicationStatus(
                              id: application.id ?? "",
                              status:
                                  ApplicationStatus
                                      .rejected,
                            );

                         if (context.mounted) {
  showStatusPopup(
    context,
    "Candidate rejected successfully",
    Colors.red,
  );
}
                          },
                          icon: const Icon(
                            Icons.close,
                            color: Colors.red,
                          ),
                          label: const Text(
                            "Reject",
                            style: TextStyle(
                              color: Colors.red,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 40),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _candidateHeader(
    BuildContext context,
    PostedJobApplicationViewModel vm,
    String status,
  ) {
    final user = application.applicant ?? const User();

    final name = safe(user.name);
    final degree = safe(user.degree);
    final college = safe(user.college);
    final graduation =
        safe(user.yearOfGraduation);

    final match =
        application.matchScore ?? 0;

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.kCard,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: Colors.white.withOpacity(.06),
        ),
      ),
      child: Column(
        children: [

          /// TOP
          Row(
            crossAxisAlignment:
                CrossAxisAlignment.start,
            children: [

              CircleAvatar(
                radius: 34,
                backgroundColor:
                    Colors.white12,
                child: Text(
                  name.isNotEmpty
                      ? name[0].toUpperCase()
                      : "U",
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 26,
                    fontWeight:
                        FontWeight.bold,
                  ),
                ),
              ),

              const SizedBox(width: 14),

              Expanded(
                child: Column(
                  crossAxisAlignment:
                      CrossAxisAlignment.start,
                  children: [

                    Row(
                      children: [

                        Expanded(
                          child: Text(
                            name,
                            style:
                                const TextStyle(
                              color:
                                  Colors.white,
                              fontSize: 18,
                              fontWeight:
                                  FontWeight
                                      .w700,
                            ),
                          ),
                        ),

                        Icon(
                          Icons.verified,
                          color:
                              AppColors.kGreen,
                          size: 18,
                        ),
                      ],
                    ),

                    const SizedBox(height: 4),

                    Text(
                      degree,
                      style:
                          const TextStyle(
                        color: Colors.grey,
                        fontSize: 13,
                      ),
                    ),

                    const SizedBox(height: 10),

                    Row(
                      children: [

                        Icon(
                          Icons.school,
                          size: 14,
                          color: Colors.grey,
                        ),

                        const SizedBox(width: 6),

                        Expanded(
                          child: Text(
                            college,
                            style:
                                const TextStyle(
                              color:
                                  Colors.white70,
                              fontSize: 12,
                            ),
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 6),

                    Row(
                      children: [

                        Icon(
                          Icons.calendar_month,
                          size: 14,
                          color: Colors.grey,
                        ),

                        const SizedBox(width: 6),

                        Text(
                          graduation,
                          style:
                              const TextStyle(
                            color:
                                Colors.white70,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              const SizedBox(width: 10),

             /// ANIMATED SCORE
AnimatedMatchScore(
  score: match,
),
            ],
          ),

          const SizedBox(height: 18),

          /// BUTTONS
          Row(
            children: [

              /// REFER
              Expanded(
                child:
                    ElevatedButton.icon(
                      
                  style:
                      ElevatedButton
                          .styleFrom(
                    backgroundColor:
                        AppColors.kGreen,
                        iconColor: Colors.white,
foregroundColor: Colors.white,
                    padding:
                        const EdgeInsets
                            .symmetric(
                      vertical: 14,
                    ),
                    shape:
                        RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius
                              .circular(
                                  12),
                    ),
                  ),
                  onPressed: () async {
                    await vm
                        .updateApplicationStatus(
                      id:
                          application.id ??
                              "",
                      status:
                          ApplicationStatus
                              .referred,
                    );
                    if (context.mounted) {
  showStatusPopup(
    context,
    "Candidate referred successfully",
    AppColors.kGreen
  );
}
                  },
                  icon:
                      const Icon(Icons.send),
                label: const Text(
  "Refer Candidate",
  style: TextStyle(
    color: Colors.white,
    fontWeight: FontWeight.w600,
  ),
),
                ),
              ),

              const SizedBox(width: 12),

              /// REJECT
              Expanded(
                child:
                    OutlinedButton.icon(
                  style:
                      OutlinedButton
                          .styleFrom(
                    padding:
                        const EdgeInsets
                            .symmetric(
                      vertical: 14,
                    ),
                    side: BorderSide(
                      color: Colors.red
                          .withOpacity(.5),
                    ),
                    shape:
                        RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius
                              .circular(
                                  12),
                    ),
                  ),
                  onPressed: () async {
                    await vm
                        .updateApplicationStatus(
                          
                      id:
                          application.id ??
                              "",
                      status:
                          ApplicationStatus
                              .rejected,
                    );
                    if (context.mounted) {
  showStatusPopup(
    context,
    "Candidate rejected successfully",
   Colors.red,
  );
}
                  },
                  icon: const Icon(
                    Icons.close,
                    color: Colors.red,
                  ),
                  label: const Text(
                    "Reject",
                    style: TextStyle(
                      color: Colors.red,
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),

SizedBox(
  width: double.infinity,

  child: OutlinedButton.icon(
    style: OutlinedButton.styleFrom(
      padding: const EdgeInsets.symmetric(
        vertical: 14,
      ),

      side: BorderSide(
        color: AppColors.kGreen.withOpacity(.4),
      ),

      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
    ),

    onPressed: () {
      final userId =
          application.applicant?.userId;

      if (userId == null ||
          userId.isEmpty) {
        return;
      }

      context.pushNamed(
        RouteNames.profileDetail,
        extra: userId,
      );
    },

    icon: Icon(
      Icons.person_outline,
      color: AppColors.kGreen,
    ),

    label: Text(
      "View Full Profile",
      style: TextStyle(
        color: AppColors.kGreen,
        fontWeight: FontWeight.w600,
      ),
    ),
  ),
),
        ],
      ),
    );
  }
void showStatusPopup(
  BuildContext context,
  String message,
  Color color,
) {
  showDialog(
    context: context,

    builder: (_) {
      return AlertDialog(
        backgroundColor: AppColors.kCard,

        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18),
        ),

        content: Column(
          mainAxisSize: MainAxisSize.min,

          children: [
            CircleAvatar(
              radius: 28,
              backgroundColor: color.withOpacity(.15),

              child: Icon(
                Icons.check,
                color: color,
                size: 28,
              ),
            ),

            const SizedBox(height: 16),

            Text(
              message,
              textAlign: TextAlign.center,

              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      );
    },
  );

  Future.delayed(const Duration(seconds: 2), () {
    if (context.mounted) {
      Navigator.pop(context);
    }
  });
}
  Widget _modernCard({
    required String title,
    required IconData icon,
    required Widget child,
  }) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.kCard,
        borderRadius:
            BorderRadius.circular(18),
        border: Border.all(
          color:
              Colors.white.withOpacity(.05),
        ),
      ),
      child: Column(
        crossAxisAlignment:
            CrossAxisAlignment.start,
        children: [

          Row(
            children: [

              Icon(
                icon,
                color: Colors.grey,
                size: 18,
              ),

              const SizedBox(width: 8),

              Text(
                title,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight:
                      FontWeight.w600,
                ),
              ),
            ],
          ),

          const SizedBox(height: 14),

          child,
        ],
      ),
    );
  }

  Widget _skillChip(String text) {
    return Container(
      padding:
          const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 6,
      ),
      decoration: BoxDecoration(
        color:
            Colors.white.withOpacity(.06),
        borderRadius:
            BorderRadius.circular(30),
      ),
      child: Text(
        text,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 11,
        ),
      ),
    );
  }

  Widget _modernLinkTile(
    String title,
    String url,
    IconData icon,
  ) {
    final enabled = url != "-";

    return InkWell(
      onTap:
          enabled ? () => openUrl(url) : null,
      child: Padding(
        padding:
            const EdgeInsets.only(
          bottom: 14,
        ),
        child: Row(
          children: [

            Icon(
              icon,
              size: 18,
              color: enabled
                  ? AppColors.kGreen
                  : Colors.grey,
            ),

            const SizedBox(width: 10),

            Expanded(
              child: Text(
                title,
                style: const TextStyle(
                  color: Colors.white,
                ),
              ),
            ),

            Icon(
              Icons.open_in_new,
              size: 16,
              color: enabled
                  ? Colors.white
                  : Colors.grey,
            ),
          ],
        ),
      ),
    );
  }

  bool isResumeAvailable(User? user) {
    return application.applicant
                ?.resume !=
            null &&
        (application.applicant
                    ?.resume ??
                '')
            .isNotEmpty;
  }
}