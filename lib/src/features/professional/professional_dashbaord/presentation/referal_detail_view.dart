import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:rawrecruit/src/core/index.dart';
import 'package:rawrecruit/src/feature/revamp_alumni/presentation/widgets/alumni_hiring_card.dart';
import 'package:rawrecruit/src/feature/revamp_application/presentation/view_model/application_view_model.dart';
import 'package:rawrecruit/src/features/professional/professional_dashbaord/data/entities/referral_job_model.dart';
import 'package:rawrecruit/src/features/shortlist/presentation/view_model/shortlist_view_model.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../common/index.dart';
import 'view_model/prof_dashboard_view_model.dart';

class ReferralDetailView extends StatefulWidget {
  final String jobId;
  final String? companyName;
  const ReferralDetailView({super.key, required this.jobId, this.companyName});

  @override
  State<ReferralDetailView> createState() => _ReferralDetailViewState();
}

class _ReferralDetailViewState extends State<ReferralDetailView> {
  final viewModel = ProfessionalViewModel();
  final shortlistVm = getIt<ShortlistViewModel>();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      viewModel.fetchReferralJobDetails(widget.jobId);
      shortlistVm.fetchSaved();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: viewModel),
        ChangeNotifierProvider.value(value: shortlistVm),
        ChangeNotifierProvider(
          create: (_) => ApplicationViewModel()..fetchApplications(),
        ),
      ],
      child: Consumer<ProfessionalViewModel>(
        builder: (context, vm, _) {
          if (vm.viewState == ViewState.busy) {
            return const Scaffold(
              body: Center(child: CircularProgressIndicator()),
            );
          }

          final referral = vm.selectedReferralJob;
          final job = referral != null ? mapReferralToJob(referral) : null;

          if (job == null) {
            return const Scaffold(body: Center(child: Text("No Data")));
          }

          final shortlistVM = context.watch<ShortlistViewModel>();
          final applicationVM = context.watch<ApplicationViewModel>();

          final jobId = job.id ?? '';
          final isSaved = shortlistVM.savedJobIds.contains(jobId);
          final isApplied = applicationVM.isApplied(jobId);

          return Scaffold(
            backgroundColor: AppColors.secBorder,

            /// 🔥 APPBAR
            appBar: AppBar(
              backgroundColor: AppColors.kCard,
              iconTheme: const IconThemeData(color: Colors.white),
              title: Text(
                job.jobTitle ?? '',
                style: const TextStyle(color: Colors.white),
              ),
              actions: [
                GestureDetector(
                  onTap: () => shortlistVM.toggleSave(
                    jobId: jobId,
                    jobType: "Referral",
                    isSaved: isSaved,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Icon(
                      isSaved ? Icons.bookmark : Icons.bookmark_border,
                      color: isSaved ? AppColors.kGreen : Colors.grey,
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () async {
                    final url = Uri.tryParse(
                      'https://rawrecruit.in/professional-dashboard/Referral/',
                    );
                    if (url != null) await launchUrl(url);
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(right: 16),
                    child: Icon(Icons.share, color: AppColors.kGreen),
                  ),
                ),
              ],
            ),

            /// 🔥 BOTTOM SAVE + APPLY BAR (logic preserved, only styling refreshed)
            bottomNavigationBar: SafeArea(
              top: false,
              child: Container(
                padding: const EdgeInsets.fromLTRB(16, 12, 16, 16),
                decoration: BoxDecoration(
                  color: AppColors.kCard,
                  border: Border(
                    top: BorderSide(color: Colors.white.withOpacity(0.06)),
                  ),
                ),

                child: Row(
                  children: [
                    Expanded(
                      child: OutlinedButton.icon(
                        onPressed: () => shortlistVM.toggleSave(
                          jobId: jobId,
                          jobType: "Referral",
                          isSaved: isSaved,
                        ),

                        icon: Icon(
                          isSaved ? Icons.bookmark : Icons.bookmark_border,
                          color: AppColors.kGreen,
                          size: 18,
                        ),

                        label: Text(
                          isSaved ? "Saved" : "Save",
                          style: TextStyle(
                            color: AppColors.kGreen,
                            fontWeight: FontWeight.w600,
                          ),
                        ),

                        style: OutlinedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 14),

                          side: BorderSide(
                            color: AppColors.kGreen.withOpacity(.5),
                          ),

                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(width: 12),

                    Expanded(
                      flex: 2,
                      child: ElevatedButton.icon(
                        onPressed: isApplied
                            ? null
                            : () => applicationVM.apply(
                                jobId: jobId,
                                jobType: "Referral",
                                matchScore: job.matchScore,
                                companyName:
                                    job.candidatePosted?.currentCompany ?? '',
                              ),

                        icon: Icon(
                          isApplied ? Icons.check_circle : Icons.send_rounded,
                          size: 18,
                        ),

                        label: Text(
                          isApplied ? "Applied" : "Apply Now",

                          style: const TextStyle(fontWeight: FontWeight.w600),
                        ),

                        style: ElevatedButton.styleFrom(
                          backgroundColor: isApplied
                              ? Colors.grey
                              : AppColors.kGreen,

                          foregroundColor: Colors.white,

                          padding: const EdgeInsets.symmetric(vertical: 14),

                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            /// 🔥 BODY
            body: SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _header(job, referral),
                  const SizedBox(height: 16),

                  _postedBySection(job, referral),
                  const SizedBox(height: 16),

                  _matchInsightsSection(job),
                  const SizedBox(height: 16),

                  _roleOverviewSection(job),
                  const SizedBox(height: 16),

                  _jobDetailsSection(job),
                  const SizedBox(height: 16),

                  _skillsSection(job),
                  const SizedBox(height: 16),

                  _eligibilitySection(job),
                  const SizedBox(height: 16),

                  _alumniHeader(),
                  const SizedBox(height: 12),
                  _alumniSection(),
                  const SizedBox(height: 40),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  // ============================================================
  // HEADER (logo, title, chips, salary + experience)
  // ============================================================
  // ============================================================
  // HEADER (compact - tight spacing, inline info row with dividers)
  // ============================================================
  Widget _header(Job job, dynamic referral) {
    final role = job.jobTitle ?? "Software Developer";
    final company =
        widget.companyName ??
        referral?.candidatePosted?.currentCompany ??
        job.candidatePosted?.currentCompany ??
        "Company";
    final location = (job.location?.isNotEmpty ?? false)
        ? job.location!.join(", ")
        : "—";
    final mode = (job.workMode?.isNotEmpty ?? false)
        ? job.workMode!.join(", ")
        : "—";

    final salary = job.packageDetails?.totalCTC != null
        ? "₹${job.packageDetails!.totalCTC}"
        : "—";
    final experience = job.yearsOfExperience != null
        ? "${job.yearsOfExperience} Years"
        : "—";

    final deadline = job.endDate != null
        ? DateFormat("dd MMM yyyy").format(job.endDate!)
        : "Not mentioned";

    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColors.kCard,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: Colors.white.withOpacity(0.06)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// Top row: logo + title + company (compact)
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: 44,
                width: 44,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Text(
                    company.isNotEmpty ? company[0].toUpperCase() : "C",
                    style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      role,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 17,
                        fontWeight: FontWeight.w700,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 2),
                    Row(
                      children: [
                        Flexible(
                          child: Text(
                            company,
                            style: const TextStyle(
                              color: Colors.grey,
                              fontSize: 13,
                            ),
                            maxLines: 2,
                          ),
                        ),
                        const SizedBox(width: 4),
                        Icon(Icons.verified, size: 12, color: AppColors.kGreen),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),

          /// Inline info row with vertical dividers
          Row(
            children: [
              const Icon(
                Icons.location_on_outlined,
                size: 13,
                color: Colors.grey,
              ),
              const SizedBox(width: 4),
              Flexible(
                child: Text(
                  location,
                  style: const TextStyle(color: Colors.grey, fontSize: 11),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              _vDivider(),
              const Icon(
                Icons.business_center_outlined,
                size: 13,
                color: Colors.grey,
              ),
              const SizedBox(width: 4),
              Flexible(
                child: Text(
                  mode,
                  style: const TextStyle(color: Colors.grey, fontSize: 11),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              _vDivider(),
              const Icon(
                Icons.calendar_today_outlined,
                size: 12,
                color: Colors.grey,
              ),
              const SizedBox(width: 4),
              Flexible(
                child: RichText(
                  maxLines: 2,

                  text: TextSpan(
                    children: [
                      const TextSpan(
                        text: "Deadline: ",
                        style: TextStyle(color: Colors.grey, fontSize: 11),
                      ),
                      TextSpan(
                        text: deadline,
                        style: TextStyle(
                          color: AppColors.kGreen,
                          fontSize: 11,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),

          /// Salary + experience bar (compact)
          Container(
            padding: const EdgeInsets.symmetric(vertical: 12),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.03),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.white.withOpacity(0.05)),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    children: [
                      Text(
                        salary,
                        style: TextStyle(
                          color: AppColors.kGreen,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(height: 2),
                      const Text(
                        "EST. ANNUAL SALARY",
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 10,
                          letterSpacing: 0.5,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 30,
                  width: 1,
                  color: Colors.white.withOpacity(0.08),
                ),
                Expanded(
                  child: Column(
                    children: [
                      Text(
                        experience,
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(height: 2),
                      const Text(
                        "EXPERIENCE REQUIRED",
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 10,
                          letterSpacing: 0.5,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  /// Tiny vertical divider used between inline info chunks
  Widget _vDivider() {
    return Container(
      height: 12,
      width: 1,
      margin: const EdgeInsets.symmetric(horizontal: 8),
      color: Colors.white.withOpacity(0.15),
    );
  }

  Widget _headerChip(IconData icon, String text, {Color? valueColor}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.05),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.white.withOpacity(0.05)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 14, color: Colors.grey),
          const SizedBox(width: 6),
          Text(
            text,
            style: TextStyle(
              color: valueColor ?? Colors.grey[300],
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }

  // ============================================================
  // POSTED BY (REFERRER) - profile + single Message button
  // ============================================================
  Widget _postedBySection(Job job, dynamic referral) {
    final candidate = referral?.candidatePosted;
    final name = candidate?.name ?? job.candidatePosted?.name ?? "Referrer";
    final company =
        widget.companyName ?? candidate?.currentCompany ?? "Company";
    final college = candidate?.college ?? "—";

    return _cardContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Posted by (Referrer)",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Row(
                children: [
                  Container(
                    width: 8,
                    height: 8,
                    decoration: BoxDecoration(
                      color: AppColors.kGreen,
                      shape: BoxShape.circle,
                    ),
                  ),
                  const SizedBox(width: 6),
                  Text(
                    "Active Referrer",
                    style: TextStyle(color: AppColors.kGreen, fontSize: 12),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 14),
          Row(
            children: [
              Stack(
                children: [
                  CircleAvatar(
                    radius: 28,
                    backgroundColor: Colors.white.withOpacity(0.08),
                    child: Text(
                      name.isNotEmpty ? name[0].toUpperCase() : "R",
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                      padding: const EdgeInsets.all(2),
                      decoration: BoxDecoration(
                        color: AppColors.kCard,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.check_circle,
                        size: 14,
                        color: AppColors.kGreen,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      job.jobTitle ?? 'Software Engineer',
                      style: const TextStyle(color: Colors.grey, fontSize: 12),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      company,
                      style: const TextStyle(color: Colors.grey, fontSize: 11),
                    ),
                    const SizedBox(height: 6),
                    // Container(
                    //   padding: const EdgeInsets.symmetric(
                    //     horizontal: 8,
                    //     vertical: 4,
                    //   ),
                    //   decoration: BoxDecoration(
                    //     color: AppColors.kGreen.withOpacity(0.12),
                    //     borderRadius: BorderRadius.circular(6),
                    //   ),
                    //   child: Row(
                    //     mainAxisSize: MainAxisSize.min,
                    //     children: [
                    //       Icon(
                    //         Icons.people_outline,
                    //         size: 12,
                    //         color: AppColors.kGreen,
                    //       ),
                    //       const SizedBox(width: 4),
                    //       Text(
                    //         "2nd Degree Connection",
                    //         style: TextStyle(
                    //           color: AppColors.kGreen,
                    //           fontSize: 10,
                    //           fontWeight: FontWeight.w600,
                    //         ),
                    //       ),
                    //     ],
                    //   ),
                    // ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton.icon(
              onPressed: () {
                final c = referral?.candidatePosted;
                if (c == null) return;

                final user = User(
                  id: c.userId ?? c.id,
                  name: c.name ?? "",
                  email: c.email ?? "",
                  phone: c.phone ?? "",
                );

                context.pushNamed(RouteNames.chatUser, extra: user);
              },
              icon: const Icon(Icons.message_outlined, size: 18),
              label: const Text(
                "Message",
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.kGreen,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ),
          const SizedBox(height: 10),

          SizedBox(
            width: double.infinity,

            child: OutlinedButton.icon(
              onPressed: () async {
                final c = referral?.candidatePosted;

                final userId = c?.userId ?? c?.id;

                if (userId == null) return;

                context.pushNamed(RouteNames.profileDetail, extra: userId);
              },

              icon: Icon(
                Icons.person_outline,
                size: 18,
                color: AppColors.kGreen,
              ),

              label: Text(
                "Show Profile",
                style: TextStyle(
                  color: AppColors.kGreen,
                  fontWeight: FontWeight.w600,
                ),
              ),

              style: OutlinedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 12),

                side: BorderSide(color: AppColors.kGreen.withOpacity(.5)),

                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ============================================================
  // MATCH INSIGHTS (no "Why you're a good fit", keep score + improve)
  // ============================================================
  // ============================================================
  // MATCH INSIGHTS — score circle + real job stats on the left
  // ============================================================
  Widget _matchInsightsSection(Job job) {
    final openings = job.numberOfOpenings?.toString() ?? "—";
    final rounds = (job.rounds?.length ?? 0).toString();

    final process = (job.selectionProcess?.isNotEmpty ?? false)
        ? job.selectionProcess!.join(", ")
        : "—";
    final views = job.views?.toString() ?? "0";
    final score = (job.matchScore ?? 0).clamp(0, 100);
    return _cardContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: const [
              Icon(Icons.track_changes, size: 18, color: Colors.purpleAccent),
              SizedBox(width: 8),
              Text(
                "Match & Referral Insights",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Stats list (replaces the "what you can improve" text)
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _insightRow(Icons.work_outline, "Openings", openings),
                    const SizedBox(height: 10),
                    _insightRow(
                      Icons.checklist_rounded,
                      "Selection Rounds",
                      rounds,
                    ),

                    const SizedBox(height: 10),

                    _insightRow(
                      Icons.account_tree_outlined,
                      "Selection Process",
                      process,
                    ),
                    const SizedBox(height: 10),
                    _insightRow(Icons.visibility_outlined, "Views", views),
                  ],
                ),
              ),
              const SizedBox(width: 16),
              // Match Score circle (kept)
              AnimatedMatchScore(score: score),
            ],
          ),
        ],
      ),
    );
  }

  Widget _insightRow(IconData icon, String label, String value) {
    return Row(
      children: [
        Icon(icon, size: 14, color: AppColors.kGreen),
        const SizedBox(width: 8),
        Text(
          "$label: ",
          style: const TextStyle(color: Colors.grey, fontSize: 12),
        ),
        Flexible(
          child: Text(
            value,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 12,
              fontWeight: FontWeight.w600,
            ),
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }

  // ============================================================
  // ROLE OVERVIEW (description as bullet points)
  // ============================================================
  Widget _roleOverviewSection(Job job) {
    final raw = job.description ?? "";
    List<String> bullets = [];
    if (raw.isNotEmpty) {
      bullets = raw
          .split(RegExp(r'[\n•]'))
          .map((e) => e.trim())
          .where((e) => e.isNotEmpty)
          .toList();
    }
    if (bullets.isEmpty) bullets = ["—"];

    return _cardContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: const [
              Icon(
                Icons.description_outlined,
                size: 18,
                color: Colors.lightBlueAccent,
              ),
              SizedBox(width: 8),
              Text(
                "Role Overview",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          ...bullets.map(
            (e) => Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(top: 6, right: 8),
                    child: Icon(Icons.circle, size: 5, color: Colors.grey),
                  ),
                  Expanded(
                    child: Text(
                      e,
                      style: const TextStyle(
                        color: Colors.grey,
                        fontSize: 13,
                        height: 1.4,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ============================================================
  // JOB DETAILS - 2 column grid
  // ============================================================
  Widget _jobDetailsSection(Job job) {
    final exp = job.yearsOfExperience != null
        ? "${job.yearsOfExperience}"
        : "—";
    final education = job.minEducation ?? "—";
    final openings = job.numberOfOpenings?.toString() ?? "—";
    final String jobType =
        job.jobType ??
        ((job.employmentType?.isNotEmpty ?? false)
            ? job.employmentType!.join(", ")
            : "—");
    final workMode = (job.workMode?.isNotEmpty ?? false)
        ? job.workMode!.join(", ")
        : "—";
    final location = (job.location?.isNotEmpty ?? false)
        ? job.location!.join(", ")
        : "—";

    return _cardContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: const [
              Icon(
                Icons.business_center_outlined,
                size: 18,
                color: Colors.blueAccent,
              ),
              SizedBox(width: 8),
              Text(
                "Job Details",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          const SizedBox(height: 14),
          Row(
            children: [
              // Expanded(child: _detailRow("Experience", exp)),
              Expanded(child: _detailRow("Job Type", jobType)),
              Expanded(child: _detailRow("Education", education)),
            ],
          ),
          // const SizedBox(height: 14),
          // Row(
          //   children: [
          //     Expanded(child: _detailRow("Education", education)),
          //     // Expanded(child: _detailRow("Work Mode", workMode)),
          //   ],
          // ),
          // const SizedBox(height: 14),
          // Row(
          //   children: [
          //     Expanded(child: _detailRow("Openings", openings)),
          //     // Expanded(
          //     //   child: _detailRow(
          //     //     "Location",
          //     //     location,
          //     //     valueColor: AppColors.kGreen,
          //     //   ),
          //     // ),
          //   ],
          // ),
        ],
      ),
    );
  }

  Widget _detailRow(String label, String value, {Color? valueColor}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(color: Colors.grey, fontSize: 11)),
        const SizedBox(height: 4),
        Text(
          value,
          style: TextStyle(
            color: valueColor ?? Colors.white,
            fontSize: 13,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }

  // ============================================================
  // SKILLS REQUIRED - chip tags
  // ============================================================
  Widget _skillsSection(Job job) {
    final skills = job.skills ?? [];
    final visible = skills.take(6).toList();
    final extra = skills.length - visible.length;

    return _cardContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: const [
              Icon(Icons.code, size: 18, color: Colors.greenAccent),
              SizedBox(width: 8),
              Text(
                "Skills Required",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          if (visible.isEmpty)
            const Text("—", style: TextStyle(color: Colors.grey))
          else
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                ...visible.map((s) => _skillChip(s)),
                if (extra > 0)
                  Padding(
                    padding: const EdgeInsets.only(top: 6),
                    child: Text(
                      "+$extra more",
                      style: TextStyle(
                        color: AppColors.kGreen,
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
              ],
            ),
        ],
      ),
    );
  }

  Widget _skillChip(String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.06),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.white.withOpacity(0.05)),
      ),
      child: Text(
        text,
        style: const TextStyle(color: Colors.white, fontSize: 12),
      ),
    );
  }

  // ============================================================
  // ELIGIBILITY - check items
  // ============================================================
  Widget _eligibilitySection(Job job) {
    final List<String> items = [];

    if (job.cgpa != null) {
      items.add("CGPA > ${job.cgpa} or Above");
    }
    if (job.eligibilityCriteria != null) {
      if (job.eligibilityCriteria is List) {
        items.addAll(
          (job.eligibilityCriteria as List).map((e) => e.toString()),
        );
      } else {
        final s = job.eligibilityCriteria.toString();
        if (s.isNotEmpty) items.add(s);
      }
    }
    if (items.isEmpty) items.add("—");

    return _cardContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.verified_outlined, size: 18, color: AppColors.kGreen),
              const SizedBox(width: 8),
              const Text(
                "Eligibility",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          ...items.map(
            (e) => Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 2),
                    child: Icon(
                      Icons.check_circle,
                      size: 14,
                      color: AppColors.kGreen,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      e,
                      style: const TextStyle(color: Colors.grey, fontSize: 13),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ============================================================
  // ABOUT COMPANY
  // ============================================================
  // Widget _aboutCompanySection(Job job) {
  //   final company = widget.companyName ?? "Company";
  //   return _cardContainer(
  //     child: Column(
  //       crossAxisAlignment: CrossAxisAlignment.start,
  //       children: [
  //         Row(
  //           children: const [
  //             Icon(Icons.apartment_rounded, size: 18, color: Colors.blueAccent),
  //         //     SizedBox(width: 8),
  //         //     Text(
  //         //       "About Company",
  //         //       style: TextStyle(
  //         //         color: Colors.white,
  //         //         fontSize: 15,
  //         //         fontWeight: FontWeight.w600,
  //         //       ),
  //         //     ),
  //         //   ],
  //         // ),
  //   //       const SizedBox(height: 10),
  //   //       Text(
  //   //         "$company is a leading organization focused on innovation, growth and excellence. Join the team to work on impactful, cutting-edge projects.",
  //   //         style: const TextStyle(
  //   //           color: Colors.grey,
  //   //           fontSize: 12,
  //   //           height: 1.5,
  //   //         ),
  //   //       ),
  //   //     ],
  //   //   ),
  //   // );
  // }

  // ============================================================
  // ALUMNI SECTION (logic preserved)
  // ============================================================
  Widget _alumniHeader() {
    return const Padding(
      padding: EdgeInsets.only(left: 4),
      child: Text(
        "Alumni Who Can Help",
        style: TextStyle(
          color: Colors.white,
          fontSize: 16,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  Widget _alumniSection() {
    return Consumer<ProfessionalViewModel>(
      builder: (context, vm, _) {
        if (vm.companyAlumni.isEmpty) {
          return const Padding(
            padding: EdgeInsets.symmetric(vertical: 12),
            child: Text(
              "No alumni available",
              style: TextStyle(color: Colors.grey),
            ),
          );
        }

        final list = vm.companyAlumni.values.toList();

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [...list.take(3).map((e) => AlumniHiringCard(jobs: e))],
        );
      },
    );
  }

  // ============================================================
  // SHARED CARD CONTAINER
  // ============================================================
  Widget _cardContainer({required Widget child}) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.kCard,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.white.withOpacity(0.06)),
      ),
      child: child,
    );
  }

  // ============================================================
  // MODEL CONVERTER (UNCHANGED LOGIC)
  // ============================================================
  Job mapReferralToJob(ReferralJobModel r) {
    return Job(
      id: r.id,
      jobTitle: r.jobTitle,
      endDate: r.endDate,
      description: r.description,
      jobType: r.jobType,
      jobStatus: r.jobStatus,
      minEducation: r.minEducation,
      yearsOfExperience: r.yearsOfExperience,
      location: r.location,
      workMode: r.workMode,
      skills: r.skills,
      benefits: r.benefits,
      selectionProcess: r.selectionProcess,
      numberOfOpenings: r.numberOfOpenings,
      eligibilityCriteria: r.eligibilityCriteria,
      cgpa: r.cgpa,
      views: r.views,
      matchScore: r.matchScore,
      status: r.status,
      toolsAndPlatforms: r.toolsAndPlatforms,
      employmentType: r.employmentType,
      certifications: r.certifications,
      packageDetails: PackageDetail(
        totalCTC: r.packageDetails?.totalCTC,
        fixedPay: r.packageDetails?.fixedPay,
        joiningBonus: r.packageDetails?.joiningBonus,
        currency: r.packageDetails?.currency,
      ),
      candidatePosted: User(
        id: r.candidatePosted?.userId,
        name: r.candidatePosted?.name,
        college: r.candidatePosted?.college,
        currentCompany: r.candidatePosted?.currentCompany,
        email: r.candidatePosted?.email,
        phone: r.candidatePosted?.phone,
      ),
    );
  }
}

class AnimatedMatchScore extends StatefulWidget {
  final int score;
  const AnimatedMatchScore({super.key, required this.score});

  @override
  State<AnimatedMatchScore> createState() => _AnimatedMatchScoreState();
}

class _AnimatedMatchScoreState extends State<AnimatedMatchScore>
    with SingleTickerProviderStateMixin {
  late final AnimationController _ctrl;
  late final Animation<double> _anim;

  @override
  void initState() {
    super.initState();
    final target = (widget.score.clamp(0, 100) / 100);

    _ctrl = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    );

    _anim = Tween<double>(
      begin: 0.0,
      end: target,
    ).animate(CurvedAnimation(parent: _ctrl, curve: Curves.easeOut));

    WidgetsBinding.instance.addPostFrameCallback((_) => _ctrl.forward());
  }

  @override
  void dispose() {
    _ctrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _anim,
      builder: (context, _) {
        final displayed = (_anim.value * 100).round();
        return SizedBox(
          width: 80,
          height: 80,
          child: Stack(
            alignment: Alignment.center,
            children: [
              SizedBox(
                width: 80,
                height: 80,
                child: CircularProgressIndicator(
                  value: _anim.value, // animated 0 → target
                  strokeWidth: 6,
                  backgroundColor: Colors.white.withOpacity(0.08),
                  valueColor: AlwaysStoppedAnimation(AppColors.kGreen),
                ),
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    '$displayed%', // counts up live
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Match Score',
                    style: TextStyle(color: AppColors.kGreen, fontSize: 9),
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
