import 'package:flutter/material.dart';
import 'package:rawrecruit/src/common/index.dart';
import 'package:rawrecruit/src/core/index.dart';
import 'package:rawrecruit/src/features/professional/job_postng/presentation/entities/referral_post_model.dart';

import 'received_application_list.dart';
class ReferralPostDetailView extends StatelessWidget {
  final ReferralPostModel job;

  const ReferralPostDetailView({super.key, required this.job});

  @override
  Widget build(BuildContext context) {
    final pkg = job.packageDetails;

    return Scaffold(
      backgroundColor: AppColors.secBorder,

      appBar: AppBar(
        backgroundColor: AppColors.kCard,
        iconTheme: const IconThemeData(color: Colors.white),
        title: Text(
          job.jobTitle ?? 'Job Detail',
          style: const TextStyle(color: Colors.white),
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

            /// 🔥 ABOUT
            if ((job.description ?? '').isNotEmpty)
              _sectionText("About the Role", job.description),

            /// 🔥 SKILLS
            if ((job.skills ?? []).isNotEmpty)
              _sectionList("Requirements", job.skills),

            /// 🔥 CERTIFICATIONS
            if ((job.certifications ?? []).isNotEmpty)
              _sectionList("Certifications", job.certifications),

            /// 🔥 ELIGIBILITY
            if ((job.eligibilityCriteria ?? '').isNotEmpty)
              _sectionText("Eligibility", job.eligibilityCriteria),

            /// 🔥 BENEFITS
            if ((job.benefits ?? []).isNotEmpty)
              _sectionList("Benefits", job.benefits),

            /// 🔥 JOB INFO
            _sectionInfo("Job Info", [
              _info("Experience", job.yearsOfExperience),
              _info("Min Education", job.minEducation),
              _info("Work Authorization", job.workAuthorization),
              _info("Openings", job.numberOfOpenings?.toString()),
              _info("Status", job.approvalStatus),
            ]),

            /// 🔥 PACKAGE
            _sectionInfo("Package Details", [
              _info("Currency", pkg?.currency),
              _info("CTC", pkg?.totalCTC?.toString()),
              _info("Fixed Pay", pkg?.fixedPay?.toString()),
              _info("Joining Bonus", pkg?.joiningBonus?.toString()),
            ]),
const SizedBox(height: 20),

SizedBox(
  width: double.infinity,
  height: 48,
  child: ElevatedButton(
    style: ElevatedButton.styleFrom(
      backgroundColor: AppColors.kGreen,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
    ),
    onPressed: () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => ReferralApplicationsView(
            jobId: job.id ?? "",
          ),
        ),
      );
    },
    child:  Text("View Applications",style: TextStyle(color: AppColors.white),),
  ),
),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  /// 🔥 HEADER (LIKE JOB DETAIL VIEW)
  Widget _header() {
    final title = job.jobTitle ?? "-";
    final location = job.location?.join(', ') ?? "-";

    final workMode = job.workMode ?? "-";

    final salary = job.packageDetails?.totalCTC != null
        ? "₹${job.packageDetails!.totalCTC} LPA"
        : null;

    final experience = job.yearsOfExperience;

    return Container(
      padding:  EdgeInsets.all(16),
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

          /// 🔥 SUB INFO
          Text(
            "$location • $workMode",
            style: const TextStyle(color: Colors.grey),
          ),

          const SizedBox(height: 12),

          /// 🔥 ICON ROW
          Wrap(
            spacing: 12,
            runSpacing: 8,
            children: [
              _iconText(Icons.location_on, location),

              if (salary != null)
                _iconText(Icons.currency_rupee, salary),

              if (experience != null)
                _iconText(Icons.access_time, "$experience years"),
            ],
          ),

          const SizedBox(height: 12),

          /// 🔥 STATUS
          Row(
            children: [
              Text(
                job.approvalStatus ?? "-",
                style: TextStyle(
                  color: job.approvalStatus == "Approved"
                      ? Colors.green
                      : Colors.orange,
                  fontWeight: FontWeight.w600,
                ),
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
        Text(
          text,
          style: const TextStyle(color: Colors.grey),
        ),
      ],
    );
  }

  /// 🔥 TEXT SECTION
  Widget _sectionText(String title, String? content) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title,
            style: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold)),
        const SizedBox(height: 10),
        Text(content ?? "-",
            style: const TextStyle(color: Colors.grey)),
        const SizedBox(height: 20),
      ],
    );
  }

  /// 🔥 LIST SECTION
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
                  child: Text(e,
                      style: const TextStyle(color: Colors.grey)),
                ),
              ],
            )),
        const SizedBox(height: 20),
      ],
    );
  }

  /// 🔥 INFO SECTION
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