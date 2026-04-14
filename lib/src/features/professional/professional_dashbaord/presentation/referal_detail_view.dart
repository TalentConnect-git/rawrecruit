import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rawrecruit/src/core/index.dart';
import 'package:rawrecruit/src/feature/revamp_application/presentation/view_model/application_view_model.dart';
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
              title: Text(job.jobTitle ?? '',
                  style: const TextStyle(color: Colors.white)),
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
                        'https://rawrecruit.in/professional-dashboard/Referral/');
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
                        backgroundColor:
                            isApplied ? Colors.grey : AppColors.kGreen,
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
                    _info("Job Type", job.jobType),
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

                  const SizedBox(height: 40),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  /// 🔥 HEADER
  Widget _header(Job job) {
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
          Text(job.jobTitle ?? "-",
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold)),
          const SizedBox(height: 6),
          Text(job.companyName ?? "-",
              style: const TextStyle(color: Colors.grey)),
          const SizedBox(height: 10),
          Text(job.location?.join(', ') ?? "-",
              style: const TextStyle(color: Colors.grey)),
        ],
      ),
    );
  }

  /// 🔥 TEXT
  Widget _sectionText(String title, String? content) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title,
            style:
                const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        const SizedBox(height: 10),
        Text(content?.isNotEmpty == true ? content! : "-",
            style: const TextStyle(color: Colors.grey)),
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
        Text(title,
            style:
                const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        const SizedBox(height: 10),
        list.isEmpty
            ? const Text("-", style: TextStyle(color: Colors.grey))
            : Column(
                children: list
                    .map((e) => Row(
                          children: [
                            const Text("• ",
                                style: TextStyle(color: Colors.green)),
                            Expanded(
                                child: Text(e,
                                    style:
                                        const TextStyle(color: Colors.grey))),
                          ],
                        ))
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
        Text(title,
            style:
                const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
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
              child: Text(title,
                  style: const TextStyle(color: Colors.grey))),
          Expanded(
              flex: 3,
              child: Text(display,
                  style: TextStyle(
                      color: display == "-" ? Colors.grey : Colors.white))),
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
      ),
    );
  }
}