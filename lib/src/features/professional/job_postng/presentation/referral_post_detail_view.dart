import 'package:flutter/material.dart';
import 'package:rawrecruit/src/common/index.dart';
import 'package:rawrecruit/src/core/index.dart';
import 'package:rawrecruit/src/features/professional/job_postng/presentation/entities/referral_post_model.dart';
import 'package:rawrecruit/src/features/professional/job_postng/presentation/entities/referral_application.dart';
import 'package:rawrecruit/src/features/professional/job_postng/data/repository/job_posting_repo.dart';

import 'widgets/applicant_card.dart';

class ReferralPostDetailView extends StatefulWidget {
  final ReferralPostModel job;

  const ReferralPostDetailView({super.key, required this.job});

  @override
  State<ReferralPostDetailView> createState() =>
      _ReferralPostDetailViewState();
}

class _ReferralPostDetailViewState
    extends State<ReferralPostDetailView> {
  int selectedTab = 0;

  List<ReferralApplication> applications = [];
  bool isLoadingApps = true;

  @override
  void initState() {
    super.initState();
    _fetchApplications();
  }

  Future<void> _fetchApplications() async {
    final result = await getIt<ReferralPostRepository>()
        .getApplicationByReferralJobId(jobId: widget.job.id ?? "");

    result.fold(
      (_) {},
      (data) => applications = data,
    );

    if (mounted) {
      setState(() => isLoadingApps = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final job = widget.job;

    return Scaffold(
      backgroundColor: AppColors.secBorder,
      appBar: AppBar(
        backgroundColor: AppColors.kCard,
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Text(
          "Posted Job",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            _header(),

            const SizedBox(height: 16),

            _actions(),

            const SizedBox(height: 16),

            _tabs(),

            const SizedBox(height: 16),

            selectedTab == 0 ? _overview(job) : _candidates(),

            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  /// 🔥 HEADER
  Widget _header() {
    final job = widget.job;

    final title = job.jobTitle ?? "Frontend Engineer";
    final company =  "pGoogle";
    final location = job.location?.first ?? "Bangalore";
final metrics = job.metrics;

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF111827),
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: Colors.white.withOpacity(0.06)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// TOP
          Row(
            children: [
              Container(
                height: 48,
                width: 48,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.08),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Center(
                  child: Text(
                    company.isNotEmpty ? company[0] : "G",
                    style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title,
                      style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold)),
                  Text("$company • $location",
                      style: const TextStyle(color: Colors.grey)),
                ],
              ),
            ],
          ),

          const SizedBox(height: 10),

          /// LIVE
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
            decoration: BoxDecoration(
              color: Colors.green.withOpacity(0.2),
              borderRadius: BorderRadius.circular(20),
            ),
            child: const Text("live",
                style: TextStyle(color: Colors.green, fontSize: 12)),
          ),

          const SizedBox(height: 16),

          /// STATS
        Row(
  children: [
    Expanded(
      child: _stat(
        "${metrics?.totalApplicationsReceived ?? 0}",
        "Candidates",
      ),
    ),
    Expanded(
      child: _stat(
        "${metrics?.responseRate ?? 0} %",
        "Response",
      ),
    ),
    Expanded(
      child: _stat(
        "${metrics?.totalReferredToCompany ?? 0}",
        "Referred",
      ),
    ),
    Expanded(
      child: _stat(
        "${metrics?.totalAcceptedByCompany ?? 0}",
        "Interviews",
      ),
    ),
    Expanded(
      child: _stat(
        "${metrics?.referralSuccessRate ?? 0} %",
        "Success",
      ),
    ),
  ],
),
        ],
      ),
    );
  }

  Widget _stat(String value, String label) {
    return Column(
      children: [
        Text(value,
            style: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold)),
        const SizedBox(height: 4),
        Text(label,
            style: const TextStyle(color: Colors.grey, fontSize: 10)),
      ],
    );
  }

  /// 🔥 ACTIONS
  Widget _actions() {
    return Row(
      children: [
        Expanded(child: _btn(Icons.pause, "Pause")),
        const SizedBox(width: 12),
        Expanded(child: _btn(Icons.delete, "Delete")),
      ],
    );
  }

  Widget _btn(IconData icon, String text) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12),
      decoration: BoxDecoration(
        color: const Color(0xFF1F2937),
        borderRadius: BorderRadius.circular(14),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: Colors.white, size: 18),
          const SizedBox(width: 6),
          Text(text, style: const TextStyle(color: Colors.white)),
        ],
      ),
    );
  }

  /// 🔥 TABS
 Widget _tabs() {
  final tabs = ["Overview", "Candidates"];

  return Container(
    padding: const EdgeInsets.all(4),
    decoration: BoxDecoration(
      color: const Color(0xFF1F2937),
      borderRadius: BorderRadius.circular(30),
    ),
    child: Row(
      children: List.generate(tabs.length, (index) {
        final isSelected = selectedTab == index;

        return Expanded(
          child: GestureDetector(
            onTap: () {
              setState(() => selectedTab = index);
            },
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 250),
              curve: Curves.easeInOut,
              padding: const EdgeInsets.symmetric(vertical: 10),
              decoration: BoxDecoration(
                color: isSelected ? AppColors.kGreen : Colors.transparent,
                borderRadius: BorderRadius.circular(25),
              ),
              child: Center(
                child: Text(
                  tabs[index],
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                    color: isSelected ? Colors.black : Colors.grey,
                  ),
                ),
              ),
            ),
          ),
        );
      }),
    ),
  );
}
  /// 🔥 OVERVIEW
  Widget _overview(ReferralPostModel job) {
    final pkg = job.packageDetails;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if ((job.description ?? '').isNotEmpty)
          _sectionText("About the Role", job.description),

        if ((job.skills ?? []).isNotEmpty)
          _sectionList("Requirements", job.skills),

        if ((job.certifications ?? []).isNotEmpty)
          _sectionList("Certifications", job.certifications),

        if ((job.eligibilityCriteria ?? '').isNotEmpty)
          _sectionText("Eligibility", job.eligibilityCriteria),

        if ((job.benefits ?? []).isNotEmpty)
          _sectionList("Benefits", job.benefits),

        _sectionInfo("Job Info", [
          _info("Experience", job.yearsOfExperience),
          _info("Min Education", job.minEducation),
          _info("Work Authorization", job.workAuthorization),
          _info("Openings", job.numberOfOpenings?.toString()),
          _info("Status", job.approvalStatus),
        ]),

        _sectionInfo("Package Details", [
          _info("Currency", pkg?.currency),
          _info("CTC", pkg?.totalCTC?.toString()),
          _info("Fixed Pay", pkg?.fixedPay?.toString()),
          _info("Joining Bonus", pkg?.joiningBonus?.toString()),
        ]),
      ],
    );
  }

  /// 🔥 CANDIDATES
  Widget _candidates() {
    if (isLoadingApps) {
      return const Center(child: AppLoadingIndicator());
    }

    if (applications.isEmpty) {
      return const Center(
        child: Text("No applications yet",
            style: TextStyle(color: Colors.grey)),
      );
    }

    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: applications.length,
      itemBuilder: (_, index) {
        return ApplicantCard(application: applications[index]);
      },
    );
  }

  /// 🔥 SECTIONS (unchanged)
  Widget _sectionText(String title, String? content) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title,
            style: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold)),
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
        Text(title,
            style: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold)),
        const SizedBox(height: 10),
        ...items.map((e) => Row(
              children: [
                const Text("• ", style: TextStyle(color: Colors.green)),
                Expanded(
                  child:
                      Text(e, style: const TextStyle(color: Colors.grey)),
                ),
              ],
            )),
        const SizedBox(height: 20),
      ],
    );
  }

  Widget _sectionInfo(String title, List<Widget> children) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title,
            style: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold)),
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
            child: Text(title,
                style: const TextStyle(color: Colors.grey)),
          ),
          Expanded(
            flex: 3,
            child: Text(value ?? '',
                style: const TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }
}