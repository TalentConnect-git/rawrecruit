import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:rawrecruit/src/features/alumni/presentation/widgets/alumni_hiring_card.dart';
import 'package:rawrecruit/src/feature/revamp_application/presentation/view_model/application_view_model.dart';
import 'package:rawrecruit/src/feature/revamp_dashboard/presentation/view_model/internship_detail_view_model.dart';
import 'package:rawrecruit/src/features/shortlist/presentation/view_model/shortlist_view_model.dart';

import '../../../common/index.dart';
import '../../../core/index.dart';

class JobDetailView extends StatefulWidget {
  final Job job;

  const JobDetailView({super.key, required this.job});

  @override
  State<JobDetailView> createState() => _JobDetailViewState();
}

class _JobDetailViewState extends State<JobDetailView> {
  String _fmt(DateTime? date) {
    if (date == null) return '-';
    return "${date.day}/${date.month}/${date.year}";
  }

  InternshipDetailViewModel internshipDetailViewModel =
      InternshipDetailViewModel();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await internshipDetailViewModel.fetchCompanyAlumni(
        companyName: widget.job.candidatePosted?.currentCompany ?? '',
        userId: widget.job.candidatePosted?.userId ?? '',
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final jobId = widget.job.id ?? '';

    final shortlistVM = context.watch<ShortlistViewModel>();
    final applicationVM = context.watch<ApplicationViewModel>();

    final isSaved = shortlistVM.savedJobIds.contains(jobId);
    final isApplied = applicationVM.isApplied(jobId);

    final pkg = widget.job.packageDetails;
    final company = widget.job.companyPosted?.companyDetails;
    final employer = widget.job.companyPosted?.employerDetails;
    final contact = widget.job.contactPerson;

    return ChangeNotifierProvider.value(
      value: internshipDetailViewModel,
      child: Scaffold(
        backgroundColor: AppColors.secBorder,

        appBar: AppBar(
          backgroundColor: AppColors.kCard,
          iconTheme: const IconThemeData(color: Colors.white),
          title: Text(
            widget.job.jobRoles?.first ?? widget.job.jobTitle ?? 'Job Detail',
            style: const TextStyle(color: Colors.white),
          ),
        ),

        bottomNavigationBar: Padding(
          padding: const EdgeInsets.fromLTRB(16, 12, 16, 28),
          child: Row(
            children: [
              Expanded(
                child: OutlinedButton(
                  onPressed: () => shortlistVM.toggleSave(
                    jobId: jobId,
                    jobType: 'Off-campus',
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
                      : () => applicationVM.apply(
                          jobId: jobId,
                          jobType: "Off-campus",
                          companyName: widget.job.companyName ?? '',
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

        body: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// 🔥 HEADER
              _header(),

              const SizedBox(height: 20),

              /// 🔥 HIGHLIGHTED COMPANY + POSTED BY SECTION

              /// 🔥 ABOUT
              if ((widget.job.description ?? '').isNotEmpty)
                _sectionText("About the Role", widget.job.description),

              /// 🔥 RESPONSIBILITIES
              if ((widget.job.workAchievements ?? []).isNotEmpty)
                _sectionList("Responsibilities", widget.job.workAchievements),

              /// 🔥 REQUIREMENTS
              if ((widget.job.skills ?? []).isNotEmpty)
                _sectionList("Requirements", widget.job.skills),

              /// 🔥 PREFERRED
              if ((widget.job.certifications ?? []).isNotEmpty)
                _sectionList("Preferred", widget.job.certifications),

              /// 🔥 IMPORTANT DATES
              _sectionInfo("Important Dates", [
                _info("Start Date", _fmt(widget.job.startDate)),
                _info("End Date", _fmt(widget.job.endDate)),
                _info("Test Date", _fmt(widget.job.onlineTestDate)),
                _info("Offer Date", _fmt(widget.job.offerRolloutDate)),
                _info("Expires", _fmt(widget.job.expireAt)),
              ]),

              /// 🔥 PACKAGE
              _sectionInfo("Package Details", [
                _info("CTC", pkg?.totalCTC?.toString()),
                _info("Fixed Pay", pkg?.fixedPay?.toString()),
                _info("Bonus", pkg?.joiningBonus?.toString()),
              ]),

              /// 🔥 SELECTION PROCESS
              if ((widget.job.selectionProcess ?? []).isNotEmpty)
                _sectionList("Selection Process", widget.job.selectionProcess),

              /// 🔥 TOOLS
              if ((widget.job.toolsAndPlatforms ?? []).isNotEmpty)
                _sectionList("Tools & Platforms", widget.job.toolsAndPlatforms),

              /// 🔥 BENEFITS
              _sectionList("Benefits", widget.job.benefits),

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

              /// 🔥 EMPLOYER
              if (employer != null)
                _sectionInfo("Employer", [
                  _info("Name", employer.name),
                  _info("Designation", employer.designation),
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

                    /// CONTACT PERSON
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
                      const SizedBox(height: 16),

                      GestureDetector(
                        onTap: () {
                          final userId = widget.job.companyPosted?.userId;

                          if (userId == null || userId.isEmpty) return;

                          final user = User(
                            id: userId,
                            name: employer?.name,
                            email: employer?.email,
                            phone: employer?.mobile,
                          );

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
                              Icon(
                                Icons.message,
                                size: 18,
                                color: Colors.green,
                              ),

                              SizedBox(width: 8),

                              Text(
                                "Message",
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
                    itemCount: alumniList.length.clamp(0, 3), // show 3 like UI
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

  /// 🔥 HEADER
  Widget _header() {
    final title = widget.job.jobRoles?.isNotEmpty == true
        ? widget.job.jobRoles!.first
        : widget.job.jobTitle ?? "-";

    final company = widget.job.companyName?.isNotEmpty == true
        ? widget.job.companyName!
        : widget.job.companyPosted?.companyDetails?.companyName?.isNotEmpty ==
              true
        ? widget.job.companyPosted!.companyDetails!.companyName!
        : widget.job.candidatePosted?.currentCompany?.isNotEmpty == true
        ? widget.job.candidatePosted!.currentCompany!
        : "-";

    final location = widget.job.location?.join(', ') ?? "-";

    final workMode = widget.job.workMode?.isNotEmpty == true
        ? widget.job.workMode!.join(', ')
        : null;

    final salary = widget.job.packageDetails?.totalCTC != null
        ? "₹${widget.job.packageDetails!.totalCTC} LPA"
        : null;

    final experience = widget.job.yearsOfExperience?.toString();

    final match = widget.job.matchScore ?? 0;

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
          /// 🔥 TITLE
          Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 6),

          /// 🔥 COMPANY
          Text(company, style: const TextStyle(color: Colors.grey)),

          const SizedBox(height: 12),

          /// 🔥 LOCATION + MODE + SALARY
          Wrap(
            spacing: 12,
            runSpacing: 8,
            children: [
              _iconText(Icons.location_on, location),

              if (workMode != null) _iconText(Icons.work_outline, workMode),

              if (salary != null) _iconText(Icons.currency_rupee, salary),
            ],
          ),

          const SizedBox(height: 10),

          /// 🔥 EXPERIENCE
          if (experience != null)
            _iconText(Icons.access_time, "$experience years"),

          const SizedBox(height: 12),

          /// 🔥 MATCH + REFERRERS + ALUMNI
          Row(
            children: [
              Text(
                "$match% match",
                style: const TextStyle(
                  color: Colors.green,
                  fontWeight: FontWeight.w600,
                ),
              ),

              const SizedBox(width: 12),

              Text(
                "${widget.job.views ?? 0} referrers",
                style: const TextStyle(color: Colors.grey),
              ),

              const SizedBox(width: 12),

              Text(
                "${widget.job.numberOfStudent ?? 0} alumni",
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

  /// 🔥 TEXT
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

  /// 🔥 INFO GRID
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
