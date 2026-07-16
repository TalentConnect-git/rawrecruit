import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:rawrecruit/src/core/navigation/routes_index.dart';
import 'package:rawrecruit/src/features/alumni/presentation/widgets/alumni_hiring_card.dart';
import 'package:rawrecruit/src/features/application/index.dart'
    show ApplicationViewModel;
import 'package:rawrecruit/src/features/dashboard/presentation/view_model/internship_detail_view_model.dart';

import '../../../common/index.dart';
import '../../../core/index.dart';

class JobDetailView extends StatefulWidget {
  final Job job;
  final bool hideApplyButton;

  const JobDetailView({
    super.key,
    required this.job,
    this.hideApplyButton = false,
  });
  @override
  State<JobDetailView> createState() => _JobDetailViewState();
}

class _JobDetailViewState extends State<JobDetailView> {
  final InternshipDetailViewModel internshipDetailViewModel =
      InternshipDetailViewModel();
  final ShortlistViewModel shortlistViewModel = getIt<ShortlistViewModel>();
  final ApplicationViewModel applicationViewModel =
      getIt<ApplicationViewModel>();
  final DashboardViewModel dashboardViewModel = getIt<DashboardViewModel>();

  bool _isAppliedLocal = false; // 👈 sticky local flag

  @override
  void initState() {
    super.initState();
    _isAppliedLocal = applicationViewModel.isApplied(widget.job.id ?? '');

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      shortlistViewModel.fetchSaved();
      applicationViewModel.fetchApplications();
      dashboardViewModel.getAlumniData();
      await internshipDetailViewModel.fetchCompanyAlumni(
        companyName: widget.job.companyName ?? '',
        userId: widget.job.postedByUser ?? '',
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: shortlistViewModel),
        ChangeNotifierProvider.value(value: applicationViewModel),
        ChangeNotifierProvider.value(value: dashboardViewModel),
        ChangeNotifierProvider.value(value: internshipDetailViewModel),
      ],
      child: Builder(
        builder: (context) {
          final shortlistVM = context.watch<ShortlistViewModel>();
          final applicationVM = context.watch<ApplicationViewModel>();

          final jobId = widget.job.id ?? '';

          final isSaved =
              widget.hideApplyButton || shortlistVM.savedJobIds.contains(jobId);

          // ✅ local flag is sticky — VM can't flip it back
          final isApplied =
              widget.hideApplyButton ||
              _isAppliedLocal ||
              applicationVM.isApplied(jobId);

          final company = widget.job.companyPosted?.companyDetails;
          final employer = widget.job.companyPosted?.employerDetails;
          final contact = widget.job.contactPerson;

          return Scaffold(
            backgroundColor: AppColors.secBorder,

            appBar: AppBar(
              backgroundColor: AppColors.kCard,
              iconTheme: const IconThemeData(color: Colors.white),
              title: Text(
                widget.job.jobRoles?.first ??
                    widget.job.jobTitle ??
                    'Job Detail',
                style: const TextStyle(color: Colors.white),
              ),
            ),

            bottomNavigationBar: SafeArea(
              top: false,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(16, 12, 16, 32),
                child: Row(
                  children: [
                    /// 🔻 Hide Save once applied
                    if (!isApplied) ...[
                      Expanded(
                        child: OutlinedButton(
                          onPressed: () => shortlistVM.toggleSave(
                            jobId: jobId,
                            jobType: 'Internship',
                            isSaved: isSaved,
                          ),
                          child: Text(
                            isSaved ? 'Saved' : 'Save',
                            style: TextStyle(color: AppColors.kGreen),
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                    ],

                    Expanded(
                      flex: 2,
                      child: ElevatedButton(
                        onPressed: isApplied
                            ? null
                            : () async {
                                await applicationVM.apply(
                                  jobId: jobId,
                                  jobType: "Off-campus",
                                  companyName: widget.job.companyName ?? '',
                                );

                                if (mounted) {
                                  setState(() {
                                    _isAppliedLocal = true;
                                  });
                                }

                                applicationVM.fetchApplications();
                              },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: isApplied
                              ? Colors.grey
                              : AppColors.kGreen,
                        ),
                        child: Text(
                          isApplied ? 'Applied' : 'Apply Now',
                          style: TextStyle(color: AppColors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            body: SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _header(),
                  const SizedBox(height: 20),
                  if ((widget.job.description ?? '').isNotEmpty)
                    _roleOverviewSection(),
                  _matchInsightsSection(),
                  if ((widget.job.workAchievements ?? []).isNotEmpty)
                    _responsibilitySection(),
                  if ((widget.job.skills ?? []).isNotEmpty) _skillsSection(),
                  if ((widget.job.certifications ?? []).isNotEmpty)
                    _sectionList("Preferred", widget.job.certifications),
                  _packageSection(),
                  if (widget.job.startDate != null ||
                      widget.job.endDate != null ||
                      widget.job.onlineTestDate != null ||
                      widget.job.offerRolloutDate != null ||
                      widget.job.interviewWindow != null)
                    _importantDatesSection(),
                  if ((widget.job.toolsAndPlatforms ?? []).isNotEmpty)
                    _toolsSection(),
                  _benefitsSection(),

                  _containerSection(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        if (company != null) ...[
                          const Text(
                            "Company Details",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 14),
                          _highlightInfo("Company", company.companyName),
                          _highlightInfo("Industry", company.industryType),
                          _highlightInfo("Company Type", company.companyType),
                          _highlightInfo(
                            "Location",
                            "${company.city ?? ''}, ${company.state ?? ''}",
                          ),
                          _highlightInfo(
                            "Employees",
                            company.numberOfEmployees,
                          ),
                          const SizedBox(height: 20),
                        ],

                        if (contact != null) ...[
                          const SizedBox(height: 20),
                          const Text(
                            "Contact Person",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 14),
                          _highlightInfo("Name", contact.name),
                          _highlightInfo("Email", contact.email),
                          _highlightInfo("Designation", employer?.designation),
                          _highlightInfo("Mobile", contact.mobile),
                        ],
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),

                  Text(
                    "Alumni Who Can Help",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),

                  const SizedBox(height: 12),

                  Consumer<InternshipDetailViewModel>(
                    builder: (context, vm, _) {
                      if (vm.companyAlumni.isEmpty) {
                        return const Text(
                          "No alumni available",
                          style: TextStyle(color: Colors.grey),
                        );
                      }

                      final alumniList = vm.companyAlumni.values.toList();

                      return ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: alumniList.length,
                        itemBuilder: (context, index) {
                          return AlumniHiringCard(jobs: alumniList[index]);
                        },
                      );
                    },
                  ),
                  const SizedBox(height: 40),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _containerSection({required Widget child}) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
        color: AppColors.kCard,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.kGreen.withOpacity(.25)),
      ),
      child: child,
    );
  }

  Widget _highlightInfo(String title, String? value) {
    final text = (value == null || value.trim().isEmpty) ? "-" : value;

    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 110,
            child: Text(
              title,
              style: TextStyle(
                color: AppColors.kGreen,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),

          Expanded(
            child: Text(text, style: const TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }

  Widget _header() {
    final role = widget.job.jobRoles?.isNotEmpty == true
        ? widget.job.jobRoles!.first
        : widget.job.jobTitle ?? "Job";

    final company = widget.job.companyName?.isNotEmpty == true
        ? widget.job.companyName!
        : widget.job.companyPosted?.companyDetails?.companyName ?? "Company";

    final location = (widget.job.location?.isNotEmpty ?? false)
        ? widget.job.location!.join(", ")
        : "—";

    final mode = (widget.job.workMode?.isNotEmpty ?? false)
        ? widget.job.workMode!.join(", ")
        : "—";

    final package = widget.job.packageDetails?.totalCTC != null
        ? "₹${widget.job.packageDetails!.totalCTC} LPA"
        : "Not Disclosed";

    final experience = widget.job.yearsOfExperience != null
        ? "${widget.job.yearsOfExperience} Years"
        : "Fresher";

    final deadline = widget.job.expireAt != null
        ? DateFormat("dd MMM yyyy").format(widget.job.expireAt!)
        : "Not Mentioned";

    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColors.kCard,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: Colors.white.withOpacity(.06)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// Company + Role
          Row(
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
                  children: [
                    Text(
                      role,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 17,
                        fontWeight: FontWeight.w700,
                      ),
                    ),

                    const SizedBox(height: 2),

                    Row(
                      children: [
                        Flexible(
                          child: Text(
                            company,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              color: Colors.grey,
                              fontSize: 13,
                            ),
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

          /// Location | Mode | Deadline
          Row(
            children: [
              const Icon(
                Icons.location_on_outlined,
                size: 13,
                color: Colors.grey,
              ),

              const SizedBox(width: 2),

              Flexible(
                child: Text(
                  location,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(color: Colors.grey, fontSize: 11),
                ),
              ),

              _vDivider(),

              const Icon(Icons.work_outline, size: 13, color: Colors.grey),

              const SizedBox(width: 2),

              Flexible(
                child: Text(
                  mode,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(color: Colors.grey, fontSize: 11),
                ),
              ),

              _vDivider(),

              const Icon(
                Icons.calendar_today_outlined,
                size: 13,
                color: Colors.grey,
              ),

              const SizedBox(width: 4),

              Flexible(
                flex: 2,
                child: Text(
                  deadline,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: AppColors.kGreen,
                    fontSize: 11,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 12),

          Container(
            padding: const EdgeInsets.symmetric(vertical: 12),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(.03),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.white.withOpacity(.05)),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    children: [
                      Text(
                        package,
                        style: TextStyle(
                          color: AppColors.kGreen,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),

                      const SizedBox(height: 3),

                      const Text(
                        "PACKAGE",
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 10,
                          letterSpacing: .6,
                        ),
                      ),
                    ],
                  ),
                ),

                Container(
                  width: 1,
                  height: 30,
                  color: Colors.white.withOpacity(.08),
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

                      const SizedBox(height: 3),

                      const Text(
                        "EXPERIENCE",
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 10,
                          letterSpacing: .6,
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

  /// 🔥 LIST
  Widget _sectionList(String title, List<String>? items) {
    if (items == null || items.isEmpty) return const SizedBox();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 10),
        ...items.map(
          (e) => Row(
            children: [
              const Text("• ", style: TextStyle(color: Colors.green)),
              Expanded(
                child: Text(e, style: const TextStyle(color: Colors.grey)),
              ),
            ],
          ),
        ),
        const SizedBox(height: 20),
      ],
    );
  }

  Widget _responsibilitySection() {
    final items = widget.job.workAchievements ?? [];

    return _containerSection(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: const [
              Icon(Icons.task_alt, color: Colors.orange, size: 18),
              SizedBox(width: 8),
              Text(
                "Responsibilities",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 15,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          ...items.map(
            (e) => Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(Icons.check_circle, size: 16, color: AppColors.kGreen),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      e,
                      style: const TextStyle(color: Colors.grey, height: 1.5),
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

  Widget _packageSection() {
    final pkg = widget.job.packageDetails;

    return _containerSection(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: const [
              Icon(Icons.payments_outlined, color: Colors.green, size: 18),
              SizedBox(width: 8),
              Text(
                "Package Details",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 15,
                ),
              ),
            ],
          ),

          const SizedBox(height: 16),

          _highlightInfo(
            "Total CTC",
            pkg?.totalCTC != null ? "₹${pkg!.totalCTC} LPA" : "-",
          ),

          _highlightInfo(
            "Fixed Pay",
            pkg?.fixedPay != null ? "₹${pkg!.fixedPay} LPA" : "-",
          ),

          _highlightInfo(
            "Joining Bonus",
            pkg?.joiningBonus != null ? "₹${pkg!.joiningBonus}" : "-",
          ),
        ],
      ),
    );
  }

  Widget _vDivider() {
    return Container(
      height: 12,
      width: 1,
      margin: const EdgeInsets.symmetric(horizontal: 4),
      color: Colors.white.withOpacity(.15),
    );
  }

  Widget _matchInsightsSection() {
    final openings = widget.job.numberOfOpenings?.toString() ?? "—";

    final duration = widget.job.yearsOfExperience != null
        ? "${widget.job.yearsOfExperience}"
        : "Internship";

    final process = (widget.job.selectionProcess?.isNotEmpty ?? false)
        ? widget.job.selectionProcess!.join(" → ")
        : "Not Specified";

    final score = (widget.job.matchScore ?? 0).clamp(0, 100);

    return _containerSection(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: const [
              Icon(Icons.track_changes, size: 18, color: Colors.purpleAccent),
              SizedBox(width: 8),
              Text(
                "Job Insights",
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
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _insightRow(Icons.work_outline, "Openings", openings),

                    const SizedBox(height: 10),

                    _insightRow(Icons.schedule, "Duration", duration),

                    const SizedBox(height: 10),

                    _insightRow(
                      Icons.payments_outlined,
                      "Stipend",
                      widget.job.packageDetails?.totalCTC != null
                          ? "₹${widget.job.packageDetails!.totalCTC}"
                          : "Not Disclosed",
                    ),
                  ],
                ),
              ),

              const SizedBox(width: 16),

              AnimatedMatchScore(score: score),
            ],
          ),

          const SizedBox(height: 18),

          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(.03),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.white.withOpacity(.05)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: const [
                    Icon(
                      Icons.account_tree_outlined,
                      size: 16,
                      color: Colors.orangeAccent,
                    ),
                    SizedBox(width: 8),
                    Text(
                      "Selection Process",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 12),

                Text(
                  process,
                  style: const TextStyle(
                    color: Colors.grey,
                    fontSize: 13,
                    height: 1.5,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _importantDatesSection() {
    String format(DateTime? date) {
      if (date == null) return "-";
      return DateFormat("dd MMM yyyy").format(date);
    }

    final interview = widget.job.interviewWindow;

    return _containerSection(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: const [
              Icon(Icons.event, color: Colors.orangeAccent, size: 18),
              SizedBox(width: 8),
              Text(
                "Important Dates",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 15,
                ),
              ),
            ],
          ),

          const SizedBox(height: 16),

          _highlightInfo(
            "Start Date",
            widget.job.startDate == null ? null : format(widget.job.startDate),
          ),

          _highlightInfo(
            "End Date",
            widget.job.endDate == null ? null : format(widget.job.endDate),
          ),

          _highlightInfo(
            "Online Test",
            widget.job.onlineTestDate == null
                ? null
                : format(widget.job.onlineTestDate),
          ),

          _highlightInfo(
            "Offer Rollout",
            widget.job.offerRolloutDate == null
                ? null
                : format(widget.job.offerRolloutDate),
          ),

          // if (interview != null) ...[
          //   _highlightInfo(
          //     "Interview Start",
          //     interview.startDate == null ? null : format(interview.startDate),
          //   ),

          //   _highlightInfo(
          //     "Interview End",
          //     interview.endDate == null ? null : format(interview.endDate),
          //   ),
          // ],
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
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 12,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }

  Widget _skillsSection() {
    final skills = widget.job.skills ?? [];

    return _containerSection(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: const [
              Icon(Icons.psychology, color: Colors.lightBlueAccent, size: 18),
              SizedBox(width: 8),
              Text(
                "Skills Required",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: skills.map((e) {
              return Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 14,
                  vertical: 8,
                ),
                decoration: BoxDecoration(
                  color: AppColors.kGreen.withOpacity(.12),
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: AppColors.kGreen.withOpacity(.3)),
                ),
                child: Text(
                  e,
                  style: TextStyle(
                    color: AppColors.kGreen,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }

  Widget _roleOverviewSection() {
    final raw = widget.job.description ?? "";

    List<String> bullets = [];

    if (raw.isNotEmpty) {
      bullets = raw
          .split(RegExp(r'[\n•]'))
          .map((e) => e.trim())
          .where((e) => e.isNotEmpty)
          .toList();
    }

    if (bullets.isEmpty) {
      bullets = ["No description available."];
    }

    return _containerSection(
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

          const SizedBox(height: 14),

          ...bullets.map(
            (item) => Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(top: 6, right: 8),
                    child: Icon(Icons.circle, size: 5, color: Colors.grey),
                  ),

                  Expanded(
                    child: Text(
                      item,
                      style: const TextStyle(
                        color: Colors.grey,
                        fontSize: 13,
                        height: 1.5,
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

  Widget _toolsSection() {
    final tools = widget.job.toolsAndPlatforms ?? [];

    return _containerSection(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: const [
              Icon(Icons.build_outlined, color: Colors.amber, size: 18),
              SizedBox(width: 8),
              Text(
                "Tools & Platforms",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: tools.map((e) {
              return Chip(
                backgroundColor: AppColors.kGreen,
                label: Text(e, style: const TextStyle(color: Colors.black)),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }

  Widget _benefitsSection() {
    final items = widget.job.benefits ?? [];

    return _containerSection(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: const [
              Icon(Icons.card_giftcard, color: Colors.pinkAccent, size: 18),
              SizedBox(width: 8),
              Text(
                "Benefits",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          ...items.map(
            (e) => Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Row(
                children: [
                  Icon(Icons.check, color: AppColors.kGreen, size: 18),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Text(e, style: const TextStyle(color: Colors.grey)),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
