import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:rawrecruit/src/common/theme/theme_controller.dart';
import 'package:rawrecruit/src/core/index.dart';
import 'package:rawrecruit/src/core/navigation/routes_index.dart';
import 'package:rawrecruit/src/features/application/index.dart'
    show ApplicationViewModel;
import 'package:rawrecruit/src/features/dashboard/presentation/view_model/dashboard_view_model.dart';
import 'package:rawrecruit/src/features/dashboard/presentation/view_model/internship_detail_view_model.dart';
import 'package:rawrecruit/src/features/shortlist/presentation/view_model/shortlist_view_model.dart';

import '../../../common/index.dart';
import '../../alumni/presentation/widgets/alumni_hiring_card.dart';

class InternshipDetailView extends StatefulWidget {
  final Job internship;
  final bool hideApplyButton;

  const InternshipDetailView({
    super.key,
    required this.internship,
    this.hideApplyButton = false,
  });

  @override
  State<InternshipDetailView> createState() => _InternshipDetailViewState();
}

class _InternshipDetailViewState extends State<InternshipDetailView> {
  String _fmt(DateTime? date) {
    if (date == null) return '-';
    return "${date.day}/${date.month}/${date.year}";
  }

  InternshipDetailViewModel internshipDetailViewModel =
      InternshipDetailViewModel();
  final ShortlistViewModel shortlistViewModel = getIt<ShortlistViewModel>();
  final ApplicationViewModel applicationViewModel =
      getIt<ApplicationViewModel>();
  final DashboardViewModel dashboardViewModel = getIt<DashboardViewModel>();
  bool _isAppliedLocal = false;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      shortlistViewModel.fetchSaved();
      dashboardViewModel.getAlumniData();
      await internshipDetailViewModel.fetchCompanyAlumni(
        companyName: widget.internship.companyName ?? '',
        userId: widget.internship.postedByUser ?? '',
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final pkg = widget.internship.packageDetails;
    final contact = widget.internship.contactPerson;
    final company = widget.internship.companyPosted?.companyDetails;
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

          final jobId = widget.internship.id ?? '';

          final isSaved =
              widget.hideApplyButton || shortlistVM.savedJobIds.contains(jobId);

          // ✅ local flag is sticky — once true it stays true regardless of VM
          final isApplied =
              widget.hideApplyButton ||
              _isAppliedLocal ||
              applicationVM.isApplied(jobId);
          return Scaffold(
            backgroundColor: AppColors.secBorders,

            appBar: AppBar(
              backgroundColor: AppColors.kCard,
              iconTheme: IconThemeData(color: AppColors.white),
              title: Text(
                widget.internship.jobRoles?.first ?? 'Internship Detail',
                style: TextStyle(color: AppColors.white),
              ),
            ),

            /// 🔻 BUTTONS
            bottomNavigationBar: SafeArea(
              top: false,
              child: Container(
                padding: const EdgeInsets.fromLTRB(16, 12, 16, 16),
                decoration: BoxDecoration(
                  color: AppColors.kCard,
                  border: Border(top: BorderSide(color: AppColors.kBorder)),
                ),
                child: Row(
                  children: [
                    /// 🔻 Hide Save once applied
                    if (!isApplied) ...[
                      Expanded(
                        child: OutlinedButton.icon(
                          onPressed: () {
                            shortlistVM.toggleSave(
                              jobId: jobId,
                              jobType: "Internship",
                              isSaved: isSaved,
                            );
                          },
                          icon: Icon(
                            isSaved ? Icons.bookmark : Icons.bookmark_border,
                            color: AppColors.kGreen,
                            size: 18,
                          ),
                          label: Text(
                            isSaved ? 'Saved' : 'Save',
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
                    ],
                    Expanded(
                      flex: 2,
                      child: ElevatedButton.icon(
                        onPressed: isApplied
                            ? null
                            : () async {
                                await applicationVM.apply(
                                  jobId: jobId,
                                  jobType: "Internship",
                                  companyName:
                                      widget.internship.companyName ?? '',
                                );

                                // ✅ mark applied locally & immediately
                                if (mounted) {
                                  setState(() {
                                    _isAppliedLocal = true;
                                  });
                                }

                                // 🔄 sync in background
                                applicationVM.fetchApplications();
                              },
                        icon: Icon(
                          isApplied ? Icons.check_circle : Icons.send_rounded,
                          size: 18,
                        ),
                        label: Text(
                          isApplied ? 'Applied' : 'Apply Now',
                          style: const TextStyle(fontWeight: FontWeight.w600),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: isApplied
                              ? AppColors.secText
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
                  _header(),
                  const SizedBox(height: 20),
                  _roleOverviewSection(),
                  _matchInsightsSection(),
                  if (widget.internship.startDate != null ||
                      widget.internship.endDate != null ||
                      widget.internship.onlineTestDate != null ||
                      widget.internship.offerRolloutDate != null ||
                      widget.internship.interviewWindow != null)
                    _importantDatesSection(),
                  if ((widget.internship.workAchievements ?? []).isNotEmpty)
                    _responsibilitySection(),
                  if ((widget.internship.skills ?? []).isNotEmpty)
                    _skillsSection(),
                  if ((widget.internship.toolsAndPlatforms ?? []).isNotEmpty)
                    _toolsSection(),
                  if ((widget.internship.benefits ?? []).isNotEmpty)
                    _benefitsSection(),
                  if (contact != null) _recruiterSection(),

                  _containerSection(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        if (company != null) ...[
                          Text(
                            "Company Details",
                            style: TextStyle(
                              color: AppColors.white,
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
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Alumni Who Can Help",
                        style: TextStyle(
                          color: AppColors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          context.goNamed(RouteNames.shortlist);
                        },
                        child: Text(
                          "View All",
                          style: TextStyle(color: AppColors.kGreen),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 12),

                  Consumer<InternshipDetailViewModel>(
                    builder: (context, vm, _) {
                      if (vm.companyAlumni.isEmpty) {
                        return Text(
                          "No alumni available",
                          style: TextStyle(color: AppColors.secText),
                        );
                      }

                      final alumniList = vm.companyAlumni.values.toList();

                      return ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: alumniList.length.clamp(0, 3),
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

  Widget _skillsSection() {
    final skills = widget.internship.skills ?? [];

    return _containerSection(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(
                Icons.psychology,
                color: Colors.lightBlueAccent,
                size: 18,
              ),
              const SizedBox(width: 8),
              Text(
                "Skills Required",
                style: TextStyle(
                  color: AppColors.white,
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

  Widget _header() {
    final role = widget.internship.jobRoles?.isNotEmpty == true
        ? widget.internship.jobRoles!.first
        : widget.internship.jobTitle ?? "Internship";

    final company = widget.internship.companyName ?? "Company";

    final location = (widget.internship.location?.isNotEmpty ?? false)
        ? widget.internship.location!.join(", ")
        : "—";

    final mode = (widget.internship.workMode?.isNotEmpty ?? false)
        ? widget.internship.workMode!.join(", ")
        : "—";

    final stipend = widget.internship.packageDetails?.totalCTC != null
        ? "₹${widget.internship.packageDetails!.totalCTC}"
        : "Not Disclosed";

    final duration = widget.internship.yearsOfExperience != null
        ? "${widget.internship.yearsOfExperience}"
        : "NA";

    final deadline = widget.internship.endDate != null
        ? DateFormat("dd MMM yyyy").format(widget.internship.endDate!)
        : "Not Mentioned";

    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColors.kCard,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(
          color: ThemeController.instance.isDark
              ? AppColors.kBorder
              : const Color(0xFFE5E7EB),
        ),
        boxShadow: ThemeController.instance.isDark
            ? []
            : [
                BoxShadow(
                  color: AppColors.shadow,
                  blurRadius: 12,
                  offset: const Offset(0, 4),
                ),
              ],
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
                      style: TextStyle(
                        color: AppColors.white,
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
                            style: TextStyle(
                              color: AppColors.secText,
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

          /// Location | Work Mode | Deadline
          Row(
            children: [
              Icon(
                Icons.location_on_outlined,
                size: 13,
                color: AppColors.secText,
              ),

              const SizedBox(width: 2),

              Flexible(
                flex: 2,
                child: Text(
                  location,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(color: AppColors.secText, fontSize: 11),
                ),
              ),

              _vDivider(),

              Icon(
                Icons.business_center_outlined,
                size: 13,
                color: AppColors.secText,
              ),

              const SizedBox(width: 2),

              Flexible(
                flex: 2,
                child: Text(
                  mode,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(color: AppColors.secText, fontSize: 11),
                ),
              ),

              _vDivider(),

              Image.asset("assets/images/calendar.png", width: 15, height: 15),

              const SizedBox(width: 4),

              Flexible(
                flex: 4,
                child: Text(
                  "Deadline: $deadline",
                  maxLines: 1,
                  overflow: TextOverflow.fade,
                  softWrap: false,
                  style: TextStyle(
                    color: AppColors.kGreen,
                    fontSize: 11,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 10),

          /// Bottom Stats
          Container(
            padding: const EdgeInsets.symmetric(vertical: 12),
            decoration: BoxDecoration(
              color: AppColors.text.withOpacity(0.03),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: AppColors.kBorder),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    children: [
                      Text(
                        stipend,
                        style: TextStyle(
                          color: AppColors.kGreen,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),

                      const SizedBox(height: 2),

                      Text(
                        "STIPEND",
                        style: TextStyle(
                          color: AppColors.secText,
                          fontSize: 10,
                          letterSpacing: .5,
                        ),
                      ),
                    ],
                  ),
                ),

                Container(width: 1, height: 30, color: AppColors.kBorder),

                Expanded(
                  child: Column(
                    children: [
                      Text(
                        duration,
                        style: TextStyle(
                          color: AppColors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),

                      const SizedBox(height: 2),

                      Text(
                        "EXPERIENCE",
                        style: TextStyle(
                          color: AppColors.secText,
                          fontSize: 10,
                          letterSpacing: .5,
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
      margin: const EdgeInsets.symmetric(horizontal: 4),
      color: AppColors.kBorder,
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
        border: Border.all(
          color: ThemeController.instance.isDark
              ? AppColors.kBorder
              : const Color(0xFFE5E7EB),
        ),
        boxShadow: ThemeController.instance.isDark
            ? []
            : [
                BoxShadow(
                  color: AppColors.shadow,
                  blurRadius: 12,
                  offset: const Offset(0, 4),
                ),
              ],
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
            child: Text(text, style: TextStyle(color: AppColors.white)),
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

    final interview = widget.internship.interviewWindow;

    return _containerSection(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(Icons.event, color: Colors.orangeAccent, size: 18),
              const SizedBox(width: 8),
              Text(
                "Important Dates",
                style: TextStyle(
                  color: AppColors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),

          const SizedBox(height: 16),

          _highlightInfo(
            "Start Date",
            widget.internship.startDate == null
                ? null
                : format(widget.internship.startDate),
          ),

          _highlightInfo(
            "End Date",
            widget.internship.endDate == null
                ? null
                : format(widget.internship.endDate),
          ),

          _highlightInfo(
            "Online Test",
            widget.internship.onlineTestDate == null
                ? null
                : format(widget.internship.onlineTestDate),
          ),

          _highlightInfo(
            "Offer Rollout",
            widget.internship.offerRolloutDate == null
                ? null
                : format(widget.internship.offerRolloutDate),
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

  Widget _responsibilitySection() {
    final items = widget.internship.workAchievements ?? [];

    return _containerSection(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(Icons.task_alt, color: Colors.orange, size: 18),
              const SizedBox(width: 8),
              Text(
                "Responsibilities",
                style: TextStyle(
                  color: AppColors.white,
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
                      style: TextStyle(color: AppColors.secText, height: 1.5),
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

  Widget _matchInsightsSection() {
    final openings = widget.internship.numberOfOpenings?.toString() ?? "—";

    final duration = widget.internship.yearsOfExperience != null
        ? "${widget.internship.yearsOfExperience}"
        : "Internship";

    final process = (widget.internship.selectionProcess?.isNotEmpty ?? false)
        ? widget.internship.selectionProcess!.join(" → ")
        : "Not Specified";

    final score = (widget.internship.matchScore ?? 0).clamp(0, 100);

    return _containerSection(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(
                Icons.track_changes,
                size: 18,
                color: Colors.purpleAccent,
              ),
              const SizedBox(width: 8),
              Text(
                "Internship Insights",
                style: TextStyle(
                  color: AppColors.white,
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
                      widget.internship.packageDetails?.totalCTC != null
                          ? "₹${widget.internship.packageDetails!.totalCTC}"
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
              color: AppColors.text.withOpacity(.03),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: AppColors.kBorder),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Icon(
                      Icons.account_tree_outlined,
                      size: 16,
                      color: Colors.orangeAccent,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      "Selection Process",
                      style: TextStyle(
                        color: AppColors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 12),

                Text(
                  process,
                  style: TextStyle(
                    color: AppColors.secText,
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

  Widget _insightRow(IconData icon, String label, String value) {
    return Row(
      children: [
        Icon(icon, size: 14, color: AppColors.kGreen),

        const SizedBox(width: 8),

        Text(
          "$label: ",
          style: TextStyle(color: AppColors.secText, fontSize: 12),
        ),

        Flexible(
          child: Text(
            value,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              color: AppColors.white,
              fontSize: 12,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }

  Widget _roleOverviewSection() {
    final raw = widget.internship.description ?? "";

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
            children: [
              const Icon(
                Icons.description_outlined,
                size: 18,
                color: Colors.lightBlueAccent,
              ),
              const SizedBox(width: 8),
              Text(
                "Role Overview",
                style: TextStyle(
                  color: AppColors.white,
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
                  Padding(
                    padding: const EdgeInsets.only(top: 6, right: 8),
                    child: Icon(
                      Icons.circle,
                      size: 5,
                      color: AppColors.secText,
                    ),
                  ),

                  Expanded(
                    child: Text(
                      item,
                      style: TextStyle(
                        color: AppColors.secText,
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
    final tools = widget.internship.toolsAndPlatforms ?? [];

    return _containerSection(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(Icons.build_outlined, color: Colors.amber, size: 18),
              const SizedBox(width: 8),
              Text(
                "Tools & Platforms",
                style: TextStyle(
                  color: AppColors.white,
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
                backgroundColor: AppColors.chip,
                label: Text(e, style: TextStyle(color: AppColors.chipText)),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }

  Widget _recruiterSection() {
    final contact = widget.internship.contactPerson;

    if (contact == null) return const SizedBox();

    final name = contact.name?.trim().isNotEmpty == true
        ? contact.name!
        : "Recruiter";

    final company = widget.internship.companyName ?? "Company";

    final role = widget.internship.jobRoles?.isNotEmpty == true
        ? widget.internship.jobRoles!.first
        : "Recruiter";

    return _containerSection(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Recruiter",
                style: TextStyle(
                  color: AppColors.white,
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
                    "Hiring",
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
                    backgroundColor: AppColors.kGreen,
                    child: Text(
                      name
                          .split(' ')
                          .where((e) => e.isNotEmpty)
                          .take(2)
                          .map((e) => e[0])
                          .join()
                          .toUpperCase(),
                      style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  ),

                  Positioned(
                    right: 0,
                    bottom: 0,
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
                      style: TextStyle(
                        color: AppColors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 15,
                      ),
                    ),

                    const SizedBox(height: 2),

                    Text(
                      role,
                      style: TextStyle(color: AppColors.secText, fontSize: 12),
                    ),

                    const SizedBox(height: 6),

                    Text(
                      company,
                      style: TextStyle(color: AppColors.secText, fontSize: 11),
                    ),

                    if ((contact.email ?? '').isNotEmpty) ...[
                      const SizedBox(height: 6),

                      Text(
                        contact.email!,
                        style: TextStyle(color: AppColors.kGreen, fontSize: 11),
                      ),
                    ],
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
                final userId = widget.internship.postedByUser;

                if (userId == null || userId.isEmpty) return;

                context.pushNamed(RouteNames.chatUser, extra: userId);
              },
              icon: const Icon(Icons.message_outlined, size: 18),
              label: const Text(
                "Message Recruiter",
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

          if ((contact.mobile ?? '').isNotEmpty)
            SizedBox(
              width: double.infinity,
              child: OutlinedButton.icon(
                onPressed: () {},

                icon: Icon(
                  Icons.phone_outlined,
                  color: AppColors.kGreen,
                  size: 18,
                ),

                label: Text(
                  contact.mobile!,
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

  Widget _benefitsSection() {
    final items = widget.internship.benefits ?? [];

    return _containerSection(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(
                Icons.card_giftcard,
                color: Colors.pinkAccent,
                size: 18,
              ),
              const SizedBox(width: 8),
              Text(
                "Benefits",
                style: TextStyle(
                  color: AppColors.white,
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
                    child: Text(e, style: TextStyle(color: AppColors.secText)),
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
