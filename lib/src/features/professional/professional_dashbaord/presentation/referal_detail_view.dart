import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rawrecruit/src/core/index.dart';
import 'package:rawrecruit/src/feature/revamp_alumni/presentation/widgets/alumni_hiring_card.dart';
import 'package:rawrecruit/src/feature/revamp_application/presentation/view_model/application_view_model.dart';
import 'package:rawrecruit/src/feature/revamp_dashboard/presentation/view_model/dashboard_view_model.dart';
import 'package:rawrecruit/src/features/professional/professional_dashbaord/data/entities/referral_job_model.dart';
import 'package:rawrecruit/src/features/shortlist/presentation/view_model/shortlist_view_model.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../common/index.dart';
import 'view_model/prof_dashboard_view_model.dart';

class ReferralDetailView extends StatefulWidget {
  final String jobId;

  const ReferralDetailView({super.key, required this.jobId});

  @override
  State<ReferralDetailView> createState() => _ReferralDetailViewState();
}

class _ReferralDetailViewState extends State<ReferralDetailView> {
  final viewModel = ProfessionalViewModel();
  final shortlistVm = getIt<ShortlistViewModel>();

  @override
  void initState() {
    super.initState();
    viewModel.fetchReferralJobDetails(widget.jobId);
    shortlistVm.fetchSaved();
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

            /// 🔥 APPLY BAR
            bottomNavigationBar: Padding(
              padding: const EdgeInsets.fromLTRB(16, 12, 16, 28),
              child: Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () => shortlistVM.toggleSave(
                        jobId: jobId,
                        jobType: "Referral",
                        isSaved: isSaved,
                      ),
                      child: Text(
                        isSaved ? "Saved" : "Save",
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
                              jobType: "Referral",
                            ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: isApplied
                            ? Colors.grey
                            : AppColors.kGreen,
                      ),
                      child: Text(isApplied ? "Applied" : "Apply Now"),
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
                  _header(job),

                  const SizedBox(height: 20),

                  _sectionText("Description", job.description),

                  _sectionInfo("Job Overview", [
                    _info("Job Title", job.jobTitle),
                    // _info("Job Type", job.jobType),
                    _info("Status", job.jobStatus),
                    _info("Approval", job.approvalStatus),
                  ]),

                  _sectionInfo("Basic Info", [
                    _info("Experience", job.yearsOfExperience),
                    _info("Education", job.minEducation),
                    _info("Openings", job.numberOfOpenings),
                    _info("CGPA", job.cgpa),
                  ]),

                  _sectionInfo("Location & Work", [
                    _info("Location", job.location),
                    _info("Work Mode", job.workMode),
                    _info("Employment Type", job.employmentType),
                  ]),

                  _sectionInfo("Package", [
                    _info("Currency", job.packageDetails?.currency),
                    _info("CTC", job.packageDetails?.totalCTC),
                    _info("Fixed Pay", job.packageDetails?.fixedPay),
                    _info("Joining Bonus", job.packageDetails?.joiningBonus),
                  ]),

                  _sectionList("Skills", job.skills),
                  _sectionList("Tools", job.toolsAndPlatforms),
                  _sectionList("Certifications", job.certifications),
                  _sectionList("Benefits", job.benefits),
                  _sectionList("Selection Process", job.selectionProcess),

                  _sectionInfo("Other", [
                    _info("Views", job.views),
                    _info("Status", job.status),
                  ]),
                  const SizedBox(height: 24),

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

  Widget _header(Job job) {
    final role = job.jobTitle ?? "Backend Developer";
final company = job.companyName?.isNotEmpty == true
    ? job.companyName!
    : (job.candidatePosted?.currentCompany ?? "Company");
    final location = job.location?.join(", ") ?? "Hyderabad";
    final mode = job.workMode?.join(", ") ?? "Hybrid";
    final type = job.jobType ?? "Full-time";

    final salary = job.packageDetails?.totalCTC != null
        ? "₹${job.packageDetails!.totalCTC} LPA"
        : "₹15-22 LPA";

    final experience = job.yearsOfExperience != null
        ? "${job.yearsOfExperience} years"
        : "0-1 years";

    final deadline = job.expireAt != null
        ? "${job.expireAt!.day} Jan ${job.expireAt!.year}"
        : "20 Jan 2025";

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF0B0F14),
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: Colors.white.withOpacity(0.06)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// 🔥 TOP ROW (LOGO + TEXT)
          Row(
            children: [
              /// LOGO BOX
              Container(
                height: 52,
                width: 52,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.08),
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Center(
                  child: Text(
                    company.isNotEmpty ? company[0] : "M",
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),

              const SizedBox(width: 12),

              /// TITLE + COMPANY
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    role,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    company,
                    style: const TextStyle(color: Colors.grey, fontSize: 14),
                  ),
                ],
              ),
            ],
          ),

          const SizedBox(height: 14),

          /// 🔥 TAG CHIPS
          Wrap(
            spacing: 4,
            runSpacing: 4,
            children: [
              _tag("📍 $location"),
              _tag("👜 $mode"),
              // _tag("⏱ $type"),
              _tag("📅 Deadline: $deadline"),
            ],
          ),

          const SizedBox(height: 16),

          /// 🔥 SALARY + EXPERIENCE BAR
          Container(
            padding: const EdgeInsets.symmetric(vertical: 14),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.04),
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: Colors.white.withOpacity(0.05)),
            ),
            child: Row(
              children: [
                /// SALARY
                Expanded(
                  child: Column(
                    children: [
                      Text(
                        salary,
                        style: const TextStyle(
                          color: Colors.green,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(height: 4),
                      const Text(
                        "Salary",
                        style: TextStyle(color: Colors.grey, fontSize: 12),
                      ),
                    ],
                  ),
                ),

                /// DIVIDER
                Container(
                  height: 32,
                  width: 1,
                  color: Colors.white.withOpacity(0.08),
                ),

                /// EXPERIENCE
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
                      const SizedBox(height: 4),
                      const Text(
                        "Experience",
                        style: TextStyle(color: Colors.grey, fontSize: 12),
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

  Widget _tag(String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.08),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        text,
        style: const TextStyle(color: Colors.grey, fontSize: 11),
      ),
    );
  }

  Widget _infoBox(String value, String label) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.05),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Text(
            value,
            style: const TextStyle(
              color: Colors.green,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 4),
          Text(label, style: const TextStyle(color: Colors.grey)),
        ],
      ),
    );
  }

  Widget _alumniSection() {
    return Consumer<DashboardViewModel>(
      builder: (context, vm, _) {
        if (vm.groupedAlumni.isEmpty) {
          return const Text(
            "No alumni available",
            style: TextStyle(color: Colors.grey),
          );
        }

        final list = vm.groupedAlumni.values.toList();

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Alumni Who Can Help",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 12),

            ...list.take(3).map((e) => AlumniHiringCard(jobs: e)),
          ],
        );
      },
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
        Text(
          content?.isNotEmpty == true ? content! : "-",
          style: const TextStyle(color: Colors.grey),
        ),
        const SizedBox(height: 20),
      ],
    );
  }

  /// 🔥 LIST
  Widget _sectionList(String title, List<String>? items) {
    final list = items ?? [];

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
        list.isEmpty
            ? const Text("-", style: TextStyle(color: Colors.grey))
            : Column(
                children: list
                    .map(
                      (e) => Row(
                        children: [
                          const Text(
                            "• ",
                            style: TextStyle(color: Colors.green),
                          ),
                          Expanded(
                            child: Text(
                              e,
                              style: const TextStyle(color: Colors.grey),
                            ),
                          ),
                        ],
                      ),
                    )
                    .toList(),
              ),
        const SizedBox(height: 20),
      ],
    );
  }

  /// 🔥 INFO
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

  Widget _info(String title, dynamic value) {
    String display;

    if (value == null) {
      display = "-";
    } else if (value is List) {
      display = value.isEmpty ? "-" : value.join(", ");
    } else if (value.toString().isEmpty) {
      display = "-";
    } else {
      display = value.toString();
    }

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
              display,
              style: TextStyle(
                color: display == "-" ? Colors.grey : Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// 🔥 MODEL CONVERTER
  Job mapReferralToJob(ReferralJobModel r) {
    return Job(
      id: r.id,
      jobTitle: r.jobTitle,
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
        name: r.candidatePosted?.name,
        college: r.candidatePosted?.college,
          currentCompany: r.candidatePosted?.currentCompany, // ✅ ADD THIS

      ),
    );
  }
}
