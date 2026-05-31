import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:rawrecruit/src/core/index.dart';
import 'package:rawrecruit/src/features/application/index.dart'
    show ApplicationViewModel;
import 'package:rawrecruit/src/features/dashboard/presentation/view_model/dashboard_view_model.dart';
import 'package:rawrecruit/src/features/dashboard/presentation/view_model/internship_detail_view_model.dart';
import 'package:rawrecruit/src/features/shortlist/presentation/view_model/shortlist_view_model.dart';

import '../../../common/index.dart';
import '../../alumni/presentation/widgets/alumni_hiring_card.dart';

class InternshipDetailView extends StatefulWidget {
  final Job internship;

  const InternshipDetailView({super.key, required this.internship});

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

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      shortlistViewModel.fetchSaved();
      applicationViewModel.fetchApplications();
      dashboardViewModel.getAlumniData();
      await internshipDetailViewModel.fetchCompanyAlumni(
        companyName: widget.internship.candidatePosted?.currentCompany ?? '',
        userId: widget.internship.candidatePosted?.userId ?? '',
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final jobId = widget.internship.id ?? '';

    final isSaved = shortlistViewModel.savedJobIds.contains(jobId);
    final isApplied = applicationViewModel.isApplied(jobId);

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
      child: Scaffold(
        backgroundColor: AppColors.secBorder,

        appBar: AppBar(
          backgroundColor: AppColors.kCard,
          iconTheme: const IconThemeData(color: Colors.white),
          title: Text(
            widget.internship.jobRoles?.first ?? 'Internship Detail',
            style: const TextStyle(color: Colors.white),
          ),
        ),

        /// 🔻 BUTTONS
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.fromLTRB(16, 12, 16, 28),
          child: Row(
            children: [
              Expanded(
                child: OutlinedButton(
                  onPressed: () => shortlistViewModel.toggleSave(
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
              Expanded(
                flex: 2,
                child: ElevatedButton(
                  onPressed: isApplied
                      ? null
                      : () => applicationViewModel.apply(
                          jobId: jobId,
                          jobType: "Internship",
                          companyName: widget.internship.companyName ?? '',
                        ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: isApplied ? Colors.grey : AppColors.kGreen,
                  ),
                  child: Text(isApplied ? 'Applied' : 'Apply Now'),
                ),
              ),
            ],
          ),
        ),

        /// 🔥 BODY
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// 🔥 HEADER
              _header(),

              const SizedBox(height: 20),

              /// 🔥 HIGHLIGHTED COMPANY SECTION

              /// 🔥 ABOUT
              if ((widget.internship.description ?? '').isNotEmpty)
                _sectionText("About the Role", widget.internship.description),

              /// 🔥 RESPONSIBILITIES
              if ((widget.internship.workAchievements ?? []).isNotEmpty)
                _sectionList(
                  "Responsibilities",
                  widget.internship.workAchievements,
                ),

              /// 🔥 REQUIREMENTS
              if ((widget.internship.skills ?? []).isNotEmpty)
                _sectionList("Requirements", widget.internship.skills),

              /// 🔥 IMPORTANT DATES
              _sectionInfo("Important Dates", [
                _info("Start Date", _fmt(widget.internship.startDate)),
                _info("End Date", _fmt(widget.internship.endDate)),
                _info("Posted", _fmt(widget.internship.createdAt)),
              ]),

              /// 🔥 STIPEND
              _sectionInfo("Stipend", [
                _info("CTC", pkg?.totalCTC?.toString()),
                _info("Fixed Pay", pkg?.fixedPay?.toString()),
                _info("Bonus", pkg?.joiningBonus?.toString()),
              ]),

              /// 🔥 SELECTION PROCESS
              if ((widget.internship.selectionProcess ?? []).isNotEmpty)
                _sectionList(
                  "Selection Process",
                  widget.internship.selectionProcess,
                ),

              /// 🔥 TOOLS
              if ((widget.internship.toolsAndPlatforms ?? []).isNotEmpty)
                _sectionList(
                  "Tools & Platforms",
                  widget.internship.toolsAndPlatforms,
                ),

              /// 🔥 BENEFITS
              if ((widget.internship.benefits ?? []).isNotEmpty)
                _sectionList("Benefits", widget.internship.benefits),

              /// 🔥 CONTACT
              if (contact != null)
                _sectionInfo("Contact Person", [
                  _info("Name", contact.name),
                  _info("Email", contact.email),
                  _info("Mobile", contact.mobile),
                ]),

              /// 🔥 COMPANY
              if (company != null)
                _sectionInfo("Company Details", [
                  _info("Name", company.companyName),
                  _info("Industry", company.industryType),
                  _info("City", company.city),
                ]),
              _containerSection(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    /// COMPANY
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

                      _highlightInfo("Employees", company.numberOfEmployees),

                      const SizedBox(height: 20),
                    ],

                    /// EMPLOYER
                    /// MESSAGE RECRUITER
                    const Text(
                      "Connect",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 14),

                    GestureDetector(
                      onTap: () {
                        final userId = widget.internship.postedByUser;

                        if (userId == null || userId.isEmpty) return;

                        final user = User(id: userId);

                        context.pushNamed(RouteNames.chatUser, extra: user);
                      },

                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 10,
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.kGreen.withOpacity(.15),
                          borderRadius: BorderRadius.circular(30),
                          border: Border.all(
                            color: AppColors.kGreen.withOpacity(.4),
                          ),
                        ),

                        child: const Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(Icons.message, size: 18, color: Colors.green),

                            SizedBox(width: 8),

                            Text(
                              "Message Recruiter",
                              style: TextStyle(
                                color: Colors.green,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
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
                      color: Colors.white,
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

              /// 🔥 ALUMNI LIST
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
      ),
    );
  }

  /// 🔥 HEADER (FULL LIKE JOB)
  Widget _header() {
    final title = widget.internship.jobRoles?.isNotEmpty == true
        ? widget.internship.jobRoles!.first
        : widget.internship.jobTitle ?? "-";

    final company = widget.internship.companyName ?? "-";
    final location = widget.internship.location?.join(', ') ?? "-";
    final workMode = widget.internship.workMode?.join(', ');
    final salary = widget.internship.packageDetails?.totalCTC != null
        ? "₹${widget.internship.packageDetails!.totalCTC}"
        : null;

    final match = widget.internship.matchScore ?? 0;
    final referrers = widget.internship.views ?? 0;
    final alumni = widget.internship.numberOfStudent ?? 0;

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.kCard,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.kBorder),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 6),

          Text(company, style: const TextStyle(color: Colors.grey)),

          const SizedBox(height: 10),

          Wrap(
            spacing: 12,
            runSpacing: 8,
            children: [
              _iconText(Icons.location_on, location),
              if (workMode != null) _iconText(Icons.work_outline, workMode),
              if (salary != null) _iconText(Icons.currency_rupee, salary),
            ],
          ),

          const SizedBox(height: 12),

          Row(
            children: [
              Text(
                "$match% match",
                style: const TextStyle(color: Colors.green),
              ),

              const SizedBox(width: 12),

              Text(
                "$referrers referrers",
                style: const TextStyle(color: Colors.grey),
              ),

              const SizedBox(width: 12),

              Text(
                "$alumni alumni",
                style: const TextStyle(color: Colors.green),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _iconText(IconData icon, String text) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, size: 14, color: Colors.grey),
        const SizedBox(width: 4),
        Text(text, style: const TextStyle(color: Colors.grey)),
      ],
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

  Widget _sectionText(String title, String? content) {
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
        Text(content ?? "-", style: const TextStyle(color: Colors.grey)),
        const SizedBox(height: 20),
      ],
    );
  }

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

  Widget _sectionInfo(String title, List<Widget> children) {
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
        ...children,
        const SizedBox(height: 20),
      ],
    );
  }

  Widget _info(String title, String? value) {
    if ((value ?? '').isEmpty) return const SizedBox();
    return Padding(
      padding: const EdgeInsets.only(bottom: 6),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Text(title, style: const TextStyle(color: Colors.grey)),
          ),
          Expanded(
            flex: 3,
            child: Text(
              value ?? '',
              style: const TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
