import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:rawrecruit/src/common/index.dart';
import 'package:rawrecruit/src/core/index.dart';
import 'package:rawrecruit/src/features/professional/job_postng/presentation/view_model/posted_job_application_view_model.dart';
import 'package:rawrecruit/src/features/professional/job_postng/presentation/view_model/referral_detail_view_model.dart';
import 'package:rawrecruit/src/features/professional/job_postng/utils/enum.dart';
import 'package:rawrecruit/src/features/professional/professional_dashbaord/presentation/referal_detail_view.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:ui';
import '../../../../core/models/experience.dart';

class ReferralDetailPage extends StatefulWidget {
  final String applicationId;

  const ReferralDetailPage({super.key, required this.applicationId});

  @override
  State<ReferralDetailPage> createState() => _ReferralDetailPageState();
}

class _ReferralDetailPageState extends State<ReferralDetailPage> {
  String safe(dynamic val) {
    if (val == null) return "";
    if (val.toString().trim().isEmpty) return "";
    if (val.toString() == "null") return "";
    return val.toString();
  }

  Future<void> openUrl(String url) async {
    if (url == "-" || url.trim().isEmpty) return;

    String normalizedUrl = url.trim();

    if (!normalizedUrl.startsWith(RegExp(r'https?://'))) {
      normalizedUrl = 'https://$normalizedUrl';
    }

    final uri = Uri.parse(normalizedUrl);

    try {
      final launched = await launchUrl(uri, mode: LaunchMode.platformDefault);

      debugPrint('Launch result: $launched');
    } catch (e) {
      debugPrint('Launch error: $e');
    }
  }

  ReferralDetailViewModel referralDetailViewModel = ReferralDetailViewModel();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      final failure = await referralDetailViewModel.getApplicationDetail(
        widget.applicationId,
      );
      failure?.showError(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => PostedJobApplicationViewModel()),
        ChangeNotifierProvider.value(value: referralDetailViewModel),
      ],
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: AppColors.kCard,
          iconTheme: const IconThemeData(color: Colors.white),
          title: Text(
            "Candidate Profile",
            style: TextStyle(color: AppColors.white),
          ),
        ),

        body: Consumer<PostedJobApplicationViewModel>(
          builder: (context, vm, _) {
            return Consumer<ReferralDetailViewModel>(
              builder: (_, vM, _) {
                if (vM.application == null) {
                  return const Center(child: CircularProgressIndicator());
                }
                final user = vM.application?.applicant;

                final linkedin = safe(user?.linkedin);
                final github = safe(user?.github);
                final portfolio = safe(user?.portfolio);

                final status = safe(vM.application?.currentStatus);

                final skills = user?.skills ?? [];
                final isAskForReferral =
                    vM.application?.job?.isAskForReferral ?? false;

                final careerPageUrl = vM.application?.job?.careerPageUrl ?? '';
                return RefreshIndicator(
                  onRefresh: () async {
                    final failure = await referralDetailViewModel
                        .getApplicationDetail(widget.applicationId);
                    failure?.showError(context);
                  },
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      children: [
                        /// HEADER
                        ///
                        _candidateHeader(context, vm, vM, status),

                        const SizedBox(height: 18),

                        isAskForReferral
                            ? Container(
                                width: double.infinity,
                                padding: const EdgeInsets.all(16),
                                decoration: BoxDecoration(
                                  color: AppColors.kGreen.withOpacity(.08),
                                  borderRadius: BorderRadius.circular(12),
                                  border: Border.all(
                                    color: AppColors.kGreen.withOpacity(.3),
                                  ),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      "Career Page",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 15,
                                      ),
                                    ),
                                    const SizedBox(height: 12),
                                    InkWell(
                                      onTap: () => openUrl(careerPageUrl),
                                      child: Row(
                                        children: [
                                          Icon(
                                            Icons.link,
                                            color: AppColors.kGreen,
                                          ),
                                          const SizedBox(width: 8),
                                          Expanded(
                                            child: Text(
                                              careerPageUrl,
                                              style: TextStyle(
                                                color: AppColors.kGreen,
                                                decoration:
                                                    TextDecoration.underline,
                                              ),
                                            ),
                                          ),
                                          const Icon(
                                            Icons.open_in_new,
                                            color: Colors.white,
                                            size: 18,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            : Container(
                                width: double.infinity,
                                padding: const EdgeInsets.all(16),
                                decoration: BoxDecoration(
                                  color: Colors.amber.withOpacity(.08),
                                  borderRadius: BorderRadius.circular(12),
                                  border: Border.all(
                                    color: Colors.amber.withOpacity(.3),
                                  ),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Row(
                                      children: [
                                        Text(
                                          "Candidate Assessment",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w600,
                                            fontSize: 15,
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 16),

                                    const Text(
                                      "Rating",
                                      style: TextStyle(
                                        color: Colors.white70,
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),

                                    const SizedBox(height: 8),

                                    Row(
                                      children: List.generate(
                                        5,
                                        (index) => Icon(
                                          index < (vM.application?.rating ?? 0)
                                              ? Icons.star
                                              : Icons.star_border,
                                          color: Colors.amber,
                                          size: 20,
                                        ),
                                      ),
                                    ),

                                    const SizedBox(height: 16),

                                    Divider(
                                      color: Colors.white.withOpacity(.08),
                                      height: 1,
                                    ),

                                    const SizedBox(height: 16),

                                    const Text(
                                      "Review",
                                      style: TextStyle(
                                        color: Colors.white70,
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),

                                    const SizedBox(height: 8),

                                    Text(
                                      vM.application?.adminComment ?? '',
                                      style: const TextStyle(
                                        color: Colors.white,
                                        height: 1.5,
                                        fontSize: 14,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                        const SizedBox(height: 18),

                        /// EDUCATION + SKILLS
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            /// EDUCATION
                            Expanded(
                              child: _modernCard(
                                title: "Education",
                                icon: Icons.school_outlined,
                                child:
                                    user?.educations != null &&
                                        user!.educations!.isNotEmpty
                                    ? Column(
                                        children: (user.educations ?? [])
                                            .map(
                                              (edu) => Container(
                                                width: double.infinity,
                                                margin: const EdgeInsets.only(
                                                  bottom: 12,
                                                ),
                                                padding: const EdgeInsets.all(
                                                  12,
                                                ),
                                                decoration: BoxDecoration(
                                                  color: Colors.white
                                                      .withOpacity(.03),
                                                  borderRadius:
                                                      BorderRadius.circular(12),
                                                  border: Border.all(
                                                    color: Colors.white
                                                        .withOpacity(.05),
                                                  ),
                                                ),

                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,

                                                  children: [
                                                    /// DEGREE
                                                    Text(
                                                      safe(edu.degree),
                                                      style: const TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                      ),
                                                    ),

                                                    const SizedBox(height: 4),

                                                    /// SPECIALIZATION
                                                    Text(
                                                      safe(edu.specialization),

                                                      style: const TextStyle(
                                                        color: Colors.white70,
                                                        fontSize: 12,
                                                      ),
                                                    ),

                                                    /// COLLEGE
                                                    Text(
                                                      safe(edu.college),
                                                      style: TextStyle(
                                                        color: AppColors.kGreen,
                                                        fontSize: 12,
                                                      ),
                                                    ),

                                                    const SizedBox(height: 10),

                                                    /// GRADUATION
                                                    Row(
                                                      children: [
                                                        Image.asset(
                                                          "assets/images/calendar.png",
                                                          width: 15,
                                                          height: 15,
                                                        ),

                                                        const SizedBox(
                                                          width: 6,
                                                        ),

                                                        Expanded(
                                                          child: Text(
                                                            safe(
                                                              edu.yearOfGraduation,
                                                            ),
                                                            style:
                                                                const TextStyle(
                                                                  color: Colors
                                                                      .grey,
                                                                  fontSize: 12,
                                                                ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),

                                                    const SizedBox(height: 6),

                                                    /// CGPA
                                                    Row(
                                                      children: [
                                                        const Icon(
                                                          Icons.star_border,
                                                          size: 14,
                                                          color: Colors.grey,
                                                        ),

                                                        const SizedBox(
                                                          width: 6,
                                                        ),

                                                        Expanded(
                                                          child: Text(
                                                            "CGPA: ${safe(edu.cgpa)}",

                                                            style:
                                                                const TextStyle(
                                                                  color: Colors
                                                                      .grey,
                                                                  fontSize: 12,
                                                                ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            )
                                            .toList(),
                                      )
                                    : const Text(
                                        "-",
                                        style: TextStyle(color: Colors.grey),
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
                                            .map((e) => _skillChip(e))
                                            .toList(),
                                      )
                                    : const Text(
                                        "-",
                                        style: TextStyle(color: Colors.grey),
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
                                "assets/images/linkedin.png",
                              ),
                              _modernLinkTile(
                                "GitHub",
                                github,
                                "assets/images/github.png",
                              ),

                              _modernLinkTile(
                                "Portfolio",
                                portfolio,
                                "assets/images/portfolio.png",
                              ),

                              const SizedBox(height: 14),

                              SizedBox(
                                width: double.infinity,
                                child: ElevatedButton.icon(
                                  style: ElevatedButton.styleFrom(
                                    iconColor: Colors.white,
                                    foregroundColor: Colors.white,
                                    backgroundColor: isResumeAvailable(user)
                                        ? AppColors.kGreen
                                        : Colors.grey.shade800,
                                    padding: const EdgeInsets.symmetric(
                                      vertical: 14,
                                    ),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                  ),
                                  onPressed: () async {
                                    if (!isResumeAvailable(user)) {
                                      return;
                                    }

                                    openUrl(user?.resume ?? '');
                                  },
                                  icon: const Icon(Icons.download),
                                  label: Text(
                                    isResumeAvailable(user)
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
                                style: ElevatedButton.styleFrom(
                                  iconColor: Colors.white,
                                  foregroundColor: Colors.white,
                                  backgroundColor: status == "Accepted"
                                      ? AppColors.kGreen.withOpacity(.3)
                                      : AppColors.kGreen,
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 15,
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(14),
                                  ),
                                ),
                                onPressed: () async {
                                  await vm.updateApplicationStatus(
                                    id: widget.applicationId,
                                    status: ApplicationStatus.referred,
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
                                style: OutlinedButton.styleFrom(
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 15,
                                  ),
                                  side: BorderSide(
                                    color: Colors.red.withOpacity(.4),
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(14),
                                  ),
                                ),
                                onPressed: () async {
                                  await vm.updateApplicationStatus(
                                    id: widget.applicationId,
                                    status: ApplicationStatus.rejected,
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
                                  style: TextStyle(color: Colors.red),
                                ),
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(height: 40),
                      ],
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }

  Widget _candidateHeader(
    BuildContext context,
    PostedJobApplicationViewModel vm,
    ReferralDetailViewModel vM,
    String status,
  ) {
    final user = vM.application?.applicant ?? const User();
    final currentEducation =
        user.educations != null && user.educations!.isNotEmpty
        ? user.educations!.firstWhere(
            (e) => e.isCurrent == true,

            orElse: () => user.educations!.first,
          )
        : null;
    final name = safe(user.name);

    final college = safe(currentEducation?.college);

    final cgpa = safe(currentEducation?.cgpa);
    Experience? currentExp;

    if (user.experiences?.isNotEmpty ?? false) {
      currentExp = user.experiences!.firstWhere(
        (e) => e.isCurrent == true,
        orElse: () => user.experiences!.first,
      );
    }

    final role = safe(currentExp?.role);

    final company = safe(currentExp?.company);

    final experience = safe(user.totalYearsOfExperience);
    print("MATCH SCORE FROM API = ${vM.application?.matchScore}");
    print("APPLICATION ID = ${vM.application?.id}");
    final match = vM.application?.matchScore ?? 9;
    print("MATCH VARIABLE = $match");
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.kCard,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.white.withOpacity(.06)),
      ),
      child: Column(
        children: [
          /// TOP
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(
                radius: 34,
                backgroundColor: AppColors.kGreen,
                child: ClipOval(
                  child: (user.profileImage ?? '').isNotEmpty
                      ? Image.network(
                          user.profileImage!,
                          width: 68,
                          height: 68,
                          fit: BoxFit.cover,
                          errorBuilder: (_, __, ___) {
                            return Center(
                              child: Text(
                                name.isNotEmpty
                                    ? name
                                          .trim()
                                          .split(' ')
                                          .where((e) => e.isNotEmpty)
                                          .map((e) => e[0])
                                          .take(2)
                                          .join()
                                          .toUpperCase()
                                    : 'U',
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            );
                          },
                        )
                      : Center(
                          child: Text(
                            name.isNotEmpty
                                ? name
                                      .trim()
                                      .split(' ')
                                      .where((e) => e.isNotEmpty)
                                      .map((e) => e[0])
                                      .take(2)
                                      .join()
                                      .toUpperCase()
                                : 'U',
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                ),
              ),

              const SizedBox(width: 14),

              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            name,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),

                        Icon(Icons.verified, color: AppColors.kGreen, size: 18),
                      ],
                    ),

                    // const SizedBox(height: 4),

                    // Text(
                    //   degree,
                    //   style:
                    //       const TextStyle(
                    //     color: Colors.grey,
                    //     fontSize: 13,
                    //   ),
                    // ),
                    const SizedBox(height: 10),

                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,

                      children: [
                        /// LOCATION / DEGREE

                        /// COLLEGE
                        if (college.isNotEmpty)
                          Row(
                            children: [
                              const Icon(
                                Icons.school_outlined,
                                size: 14,
                                color: Colors.grey,
                              ),
                              const SizedBox(width: 6),
                              Expanded(
                                child: Text(
                                  college,
                                  style: const TextStyle(
                                    color: Colors.white70,
                                    fontSize: 12,
                                  ),
                                ),
                              ),
                            ],
                          ),

                        const SizedBox(height: 6),

                        /// ROLE @ COMPANY
                        if (role.isNotEmpty || company.isNotEmpty)
                          Row(
                            children: [
                              const Icon(
                                Icons.work_outline,
                                size: 14,
                                color: Colors.grey,
                              ),
                              const SizedBox(width: 6),
                              Expanded(
                                child: Text(
                                  company.isNotEmpty
                                      ? "$role @ $company"
                                      : role,
                                  style: const TextStyle(
                                    color: Colors.white70,
                                    fontSize: 12,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        const SizedBox(height: 6),

                        /// EXPERIENCE
                        if (experience.isNotEmpty)
                          Row(
                            children: [
                              const Icon(
                                Icons.work_history_outlined,
                                size: 14,
                                color: Colors.grey,
                              ),
                              const SizedBox(width: 6),
                              Expanded(
                                child: Text(
                                  "$experience years experience",
                                  style: const TextStyle(
                                    color: Colors.white70,
                                    fontSize: 12,
                                  ),
                                ),
                              ),
                            ],
                          ),
                      ],
                    ),
                  ],
                ),
              ),

              const SizedBox(width: 10),

              /// ANIMATED SCORE
              if (!(vM.application?.isAskForReferral ?? false))
                AnimatedMatchScore(key: ValueKey(match), score: match),
            ],
          ),

          const SizedBox(height: 18),

          /// BUTTONS
          Row(
            children: [
              /// REFER
              Expanded(
                child: ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.kGreen,
                    iconColor: Colors.white,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  onPressed: () async {
                    await vm.updateApplicationStatus(
                      id: widget.applicationId,
                      status: ApplicationStatus.referred,
                    );
                    if (context.mounted) {
                      showStatusPopup(
                        context,
                        "Candidate referred successfully",
                        AppColors.kGreen,
                      );
                    }
                  },
                  icon: const Icon(Icons.send),
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
              /// MESSAGE
              Expanded(
                child: OutlinedButton.icon(
                  style: OutlinedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    side: BorderSide(color: AppColors.kGreen.withOpacity(.5)),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  onPressed: () {
                    final userId = user.userId;

                    if (userId == null || userId.isEmpty) {
                      return;
                    }

                    context.pushNamed(RouteNames.chatUser, extra: userId);
                  },
                  icon: Icon(Icons.message_outlined, color: AppColors.kGreen),
                  label: Text(
                    "Message",
                    style: TextStyle(
                      color: AppColors.kGreen,
                      fontWeight: FontWeight.w600,
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
                padding: const EdgeInsets.symmetric(vertical: 14),

                side: BorderSide(color: AppColors.kGreen.withOpacity(.4)),

                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),

              onPressed: () {
                final userId = user?.userId;

                if (userId == null || userId.isEmpty) {
                  return;
                }

                context.pushNamed(RouteNames.profileDetail, extra: userId);
              },

              icon: Icon(Icons.person_outline, color: AppColors.kGreen),

              label: Text(
                "View Full Profile",
                style: TextStyle(
                  color: AppColors.kGreen,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
          const SizedBox(height: 6),

          if (!(vM.application?.job?.isAskForReferral ?? false)) ...[
            const SizedBox(height: 2),

            SizedBox(
              width: double.infinity,
              child: OutlinedButton.icon(
                style: OutlinedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  side: BorderSide(color: AppColors.kGreen.withOpacity(.4)),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                onPressed: () {
                  final jobId = vM.application?.job?.id;

                  if (jobId == null || jobId.isEmpty) return;

                  context.pushNamed(
                    RouteNames.referralPostDetail,
                    extra: jobId,
                  );
                },
                icon: Icon(Icons.work_outline, color: AppColors.kGreen),
                label: Text(
                  "View Job Details",
                  style: TextStyle(
                    color: AppColors.kGreen,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }

  void showStatusPopup(BuildContext context, String message, Color color) {
    showDialog(
      context: context,
      barrierColor: Colors.black.withOpacity(0.4),
      builder: (_) {
        return BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 6, sigmaY: 6),
          child: AlertDialog(
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
                  child: Icon(Icons.check, color: color, size: 28),
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
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: Colors.white.withOpacity(.05)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, color: Colors.grey, size: 18),

              const SizedBox(width: 8),

              Text(
                title,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
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
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(.06),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Text(
        text,
        style: const TextStyle(color: Colors.white, fontSize: 11),
      ),
    );
  }

  Widget _modernLinkTile(String title, String url, String assetPath) {
    final enabled = url != "-";

    return InkWell(
      onTap: enabled ? () => openUrl(url) : null,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 14),
        child: Row(
          children: [
            Image.asset(
              assetPath,
              width: 18,
              height: 18,

              color: enabled ? null : Colors.grey,
            ),
            const SizedBox(width: 10),

            Expanded(
              child: Text(title, style: const TextStyle(color: Colors.white)),
            ),

            Icon(
              Icons.open_in_new,
              size: 16,
              color: enabled ? Colors.white : Colors.grey,
            ),
          ],
        ),
      ),
    );
  }

  bool isResumeAvailable(User? user) {
    return user?.resume != null && (user?.resume ?? '').isNotEmpty;
  }
}
