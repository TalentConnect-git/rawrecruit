import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rawrecruit/src/feature/revamp_alumni/presentation/widgets/alumni_hiring_card.dart';
import 'package:rawrecruit/src/features/shortlist/presentation/view_model/shortlist_view_model.dart';
import '../../../common/index.dart';
import '../../../core/index.dart';
import 'package:rawrecruit/src/feature/revamp_application/presentation/view_model/application_view_model.dart';

import 'view_model/dashboard_view_model.dart';

class JobDetailView extends StatelessWidget {
  final Job job;

  const JobDetailView({super.key, required this.job});

  String _fmt(DateTime? date) {
    if (date == null) return '-';
    return "${date.day}/${date.month}/${date.year}";
  }

  @override
  Widget build(BuildContext context) {
    final jobId = job.id ?? '';

    final shortlistVM = context.watch<ShortlistViewModel>();
    final applicationVM = context.watch<ApplicationViewModel>();

    final isSaved = shortlistVM.savedJobIds.contains(jobId);
    final isApplied = applicationVM.isApplied(jobId);

    final pkg = job.packageDetails;
    final company = job.companyPosted?.companyDetails;
    final employer = job.companyPosted?.employerDetails;
    final contact = job.contactPerson;

    return Scaffold(
      backgroundColor: AppColors.secBorder,

      appBar: AppBar(
        backgroundColor: AppColors.kCard,
        iconTheme: const IconThemeData(color: Colors.white),
        title: Text(
          job.jobRoles?.first ?? job.jobTitle ?? 'Job Detail',
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
        ),
                style: ElevatedButton.styleFrom(
                  backgroundColor:
                      isApplied ? Colors.grey : AppColors.kGreen,
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

            /// 🔥 ABOUT
            if ((job.description ?? '').isNotEmpty)
              _sectionText("About the Role", job.description),

            /// 🔥 RESPONSIBILITIES
            if ((job.workAchievements ?? []).isNotEmpty)
              _sectionList("Responsibilities", job.workAchievements),

            /// 🔥 REQUIREMENTS
            if ((job.skills ?? []).isNotEmpty)
              _sectionList("Requirements", job.skills),

            /// 🔥 PREFERRED
            if ((job.certifications ?? []).isNotEmpty)
              _sectionList("Preferred", job.certifications),

            /// 🔥 IMPORTANT DATES
            _sectionInfo("Important Dates", [
              _info("Start Date", _fmt(job.startDate)),
              _info("End Date", _fmt(job.endDate)),
              _info("Test Date", _fmt(job.onlineTestDate)),
              _info("Offer Date", _fmt(job.offerRolloutDate)),
              _info("Expires", _fmt(job.expireAt)),
            ]),

            /// 🔥 PACKAGE
            _sectionInfo("Package Details", [
              _info("CTC", pkg?.totalCTC?.toString()),
              _info("Fixed Pay", pkg?.fixedPay?.toString()),
              _info("Bonus", pkg?.joiningBonus?.toString()),
            ]),

            /// 🔥 SELECTION PROCESS
            if ((job.selectionProcess ?? []).isNotEmpty)
              _sectionList("Selection Process", job.selectionProcess),

            /// 🔥 TOOLS
            if ((job.toolsAndPlatforms ?? []).isNotEmpty)
              _sectionList("Tools & Platforms", job.toolsAndPlatforms),

            /// 🔥 BENEFITS
            _sectionList("Benefits", job.benefits),

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
Consumer<DashboardViewModel>(
  builder: (context, vm, _) {
    if (vm.groupedAlumni.isEmpty) {
      return const Text(
        "No alumni available",
        style: TextStyle(color: Colors.grey),
      );
    }

    final alumniList = vm.groupedAlumni.values.toList();

    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: alumniList.length.clamp(0, 3), // show 3 like UI
      itemBuilder: (context, index) {
        return AlumniHiringCard(
          jobs: alumniList[index],
        );
      },
    );
  },
),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  /// 🔥 HEADER
 Widget _header() {
  final title = job.jobRoles?.isNotEmpty == true
      ? job.jobRoles!.first
      : job.jobTitle ?? "-";

  final company = job.companyName ?? "-";

  final location = job.location?.join(', ') ?? "-";

  final workMode = job.workMode?.isNotEmpty == true
      ? job.workMode!.join(', ')
      : null;

  final salary = job.packageDetails?.totalCTC != null
      ? "₹${job.packageDetails!.totalCTC} LPA"
      : null;

  final experience = job.yearsOfExperience?.toString();

  final match = job.matchScore ?? 0;

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
        Text(
          company,
          style: const TextStyle(color: Colors.grey),
        ),

        const SizedBox(height: 12),

        /// 🔥 LOCATION + MODE + SALARY
        Wrap(
          spacing: 12,
          runSpacing: 8,
          children: [
            _iconText(Icons.location_on, location),

            if (workMode != null)
              _iconText(Icons.work_outline, workMode),

            if (salary != null)
              _iconText(Icons.currency_rupee, salary),
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
              "${job.views ?? 0} referrers",
              style: const TextStyle(color: Colors.grey),
            ),

            const SizedBox(width: 12),

            Text(
              "${job.numberOfStudent ?? 0} alumni",
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
      Text(
        text,
        style: const TextStyle(color: Colors.grey),
      ),
    ],
  );
}
  /// 🔥 TEXT
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

  /// 🔥 LIST
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

  /// 🔥 INFO GRID
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
              child:
                  Text(title, style: const TextStyle(color: Colors.grey))),
          Expanded(
              flex: 3,
              child: Text(value ?? '',
                  style: const TextStyle(color: Colors.white))),
        ],
      ),
    );
  }
}