import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rawrecruit/src/feature/revamp_dashboard/entities/job_model.dart';
import 'package:rawrecruit/src/features/shortlist/presentation/view_model/shortlist_view_model.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../common/index.dart';
import '../../../core/index.dart';
import 'package:rawrecruit/src/feature/revamp_application/presentation/view_model/application_view_model.dart';

class JobDetailView extends StatelessWidget {
  final JobModel job;

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

    final company = job.companyPosted?.companyDetails;
    final employer = job.companyPosted?.employerDetails;
    final contact = job.contactPerson;
    final pkg = job.packageDetails;

    return Scaffold(
      backgroundColor: AppColors.secBorder,

      /// 🔹 APPBAR
      appBar: AppBar(
        backgroundColor: AppColors.kCard,
        iconTheme: const IconThemeData(color: Colors.white),
        title: Text(
          job.jobRoles?.first ?? job.jobTitle ?? 'Job Detail',
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

      /// 🔻 BUTTONS
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
                style: OutlinedButton.styleFrom(
                  side: BorderSide(color: AppColors.kBorder),
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
                onPressed:
                    isApplied ? null : () => applicationVM.apply(jobId),
                style: ElevatedButton.styleFrom(
                  backgroundColor: isApplied
                      ? Colors.grey.shade800
                      : AppColors.kGreen,
                  foregroundColor: Colors.white,
                  elevation: 0,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: Text(
                  isApplied ? 'Applied' : 'Apply Now',
                  style: const TextStyle(fontWeight: FontWeight.w600),
                ),
              ),
            ),
          ],
        ),
      ),

      /// 🔹 BODY
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [

            /// 🔹 JOB OVERVIEW
            _section(
              'Job Overview',
              Icons.description_outlined,
              [
                _infoRow('Job Title', job.jobTitle),
                _infoRow('Roles', job.jobRoles?.join(', ')),
                _infoRow('Type', job.jobType),
                _infoRow('Status', job.jobStatus),
                _infoRow('Approval', job.approvalStatus),
                _infoRow('Description', job.description),
                _infoRow('Eligibility', job.eligibilityCriteria),
                _infoRow('Degree', job.degree?.join(', ')),
                _infoRow('Streams', job.studentStreams?.join(', ')),
                _infoRow('CGPA', job.cgpa?.toString()),
                _infoRow('Openings', job.numberOfOpenings?.toString()),
                _infoRow('Min Students', job.minimumStudents),
                _infoRow('Views', job.views?.toString()),
                _infoRow('Match Score', '${job.matchScore ?? ''}%'),
              ],
            ),

            /// 🔹 LOCATION
            _section(
              'Location & Work',
              Icons.location_on_outlined,
              [
                _infoRow('Location', job.location?.join(', ')),
                _infoRow('Venue', job.venue),
                _infoRow('Work Mode', job.workMode?.join(', ')),
                _infoRow('Work Location', job.workLocation?.join(', ')),
                _infoRow(
                    'Employment Type', job.employmentType?.join(', ')),
              ],
            ),

            /// 🔹 DATES
            _section(
              'Important Dates',
              Icons.calendar_today_outlined,
              [
                _infoRow('Start Date', _fmt(job.startDate)),
                _infoRow('End Date', _fmt(job.endDate)),
                _infoRow('Online Test', _fmt(job.onlineTestDate)),
                _infoRow(
                    'Interview Start', _fmt(job.interviewWindow?.start)),
                _infoRow(
                    'Interview End', _fmt(job.interviewWindow?.end)),
                _infoRow('Offer Date', _fmt(job.offerRolloutDate)),
                _infoRow('Expires', _fmt(job.expireAt)),
                _infoRow('Posted', _fmt(job.createdAt)),
              ],
            ),

            /// 🔹 PACKAGE
            _section(
              'Package Details',
              Icons.currency_rupee,
              [
                _infoRow('Currency', pkg?.currency),
                _infoRow('CTC', pkg?.totalCTC?.toString()),
                _infoRow('Fixed Pay', pkg?.fixedPay?.toString()),
                _infoRow('Bonus', pkg?.joiningBonus?.toString()),
              ],
            ),

            /// 🔹 SELECTION PROCESS
            ExpandableSection(
              title: 'Selection Process',
              icon: Icons.groups_outlined,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${job.rounds?.length ?? 0} rounds',
                    style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(height: 12),
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: List.generate(
                      job.selectionProcess?.length ?? 0,
                      (i) => chip(
                        '${i + 1}. ${job.selectionProcess![i]}',
                      ),
                    ),
                  ),
                ],
              ),
            ),

            /// 🔹 SKILLS
            if ((job.skills ?? []).isNotEmpty)
              ExpandableSection(
                title: 'Skills Required',
                icon: Icons.school_outlined,
                child: Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: job.skills!
                      .map((e) => chip(e, isPrimary: true))
                      .toList(),
                ),
              ),

            /// 🔹 TOOLS
            if ((job.toolsAndPlatforms ?? []).isNotEmpty)
              ExpandableSection(
                title: 'Tools & Platforms',
                icon: Icons.handyman_outlined,
                child: Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: job.toolsAndPlatforms!
                      .map((e) => chip(e))
                      .toList(),
                ),
              ),

            /// 🔹 BENEFITS
            _section(
              'Benefits & Tags',
              Icons.card_giftcard,
              [
                _infoRow('Benefits', job.benefits?.join(', ')),
                _infoRow('Tags', job.tags?.join(', ')),
                _infoRow(
                    'Amenities', job.amenitiesRequired?.join(', ')),
              ],
            ),

            /// 🔹 CONTACT
            if (contact != null)
              _section(
                'Contact Person',
                Icons.person_outline,
                [
                  _infoRow('Name', contact.name),
                  _infoRow('Designation', contact.designation),
                  _infoRow('Email', contact.email),
                  _infoRow('Mobile', contact.mobile),
                ],
              ),

            /// 🔹 COMPANY
            if (company != null)
              _section(
                'Company Details',
                Icons.business,
                [
                  _infoRow('Name', company.companyName),
                  _infoRow('Description', company.description),
                  _infoRow('Type', company.companyType),
                  _infoRow('Industry', company.industryType),
                  _infoRow('Employees', company.numberOfEmployees),
                  _infoRow('Established', company.establishedYear),
                  _infoRow('City', company.city),
                  _infoRow('State', company.state),
                  _infoRow('Country', company.country),
                  _infoRow('Pincode', company.pincode),
                ],
              ),

            /// 🔹 EMPLOYER
            if (employer != null)
              _section(
                'Employer',
                Icons.badge_outlined,
                [
                  _infoRow('Name', employer.name),
                  _infoRow('Designation', employer.designation),
                  _infoRow('Email', employer.workEmail),
                  _infoRow('Mobile', employer.mobile),
                ],
              ),

            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  /// 🔹 SECTION WRAPPER
  Widget _section(String title, IconData icon, List<Widget> children) {
    return ExpandableSection(
      title: title,
      icon: icon,
      child: Column(children: children),
    );
  }

  /// 🔹 INFO ROW
  Widget _infoRow(String title, String? value) {
    if ((value ?? '').isEmpty) return const SizedBox();
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child:
                Text(title, style: const TextStyle(color: Colors.grey)),
          ),
          Expanded(
            flex: 3,
            child:
                Text(value ?? '', style: const TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }
}

/// 🔥 EXPANDABLE CARD

class ExpandableSection extends StatefulWidget {
  final String title;
  final IconData icon;
  final Widget child;

  const ExpandableSection(
      {super.key, required this.title, required this.icon, required this.child});

  @override
  State<ExpandableSection> createState() => _ExpandableSectionState();
}

class _ExpandableSectionState extends State<ExpandableSection> {
  bool open = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.kCard,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.kBorder),
      ),
      child: Column(
        children: [
          GestureDetector(
            onTap: () => setState(() => open = !open),
            child: Row(
              children: [
                Icon(widget.icon, color: AppColors.kGreen),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    widget.title,
                    style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600),
                  ),
                ),
                Icon(
                  open
                      ? Icons.keyboard_arrow_up
                      : Icons.keyboard_arrow_down,
                  color: Colors.grey,
                ),
              ],
            ),
          ),
          if (open) ...[
            Divider(color: AppColors.kBorder),
            const SizedBox(height: 10),
            widget.child,
          ]
        ],
      ),
    );
  }
}

/// 🔹 CHIP
Widget chip(String text, {bool isPrimary = false}) {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
    decoration: BoxDecoration(
      color: isPrimary
          ? AppColors.kGreen.withOpacity(0.15)
          : Colors.black.withOpacity(0.2),
      borderRadius: BorderRadius.circular(20),
      border: Border.all(color: AppColors.kBorder),
    ),
    child: Text(
      text,
      style: TextStyle(
        fontSize: 12,
        color: isPrimary ? AppColors.kGreen : Colors.white,
      ),
    ),
  );
}