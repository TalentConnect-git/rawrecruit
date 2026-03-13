import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rawrecruit/src/core/index.dart';
import 'package:rawrecruit/src/features/application/presentation/view_model/application_view_model.dart';
import 'package:rawrecruit/src/features/shortlist/presentation/view_model/shortlist_view_model.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../common/index.dart';
import '../entities/internship_model.dart';

class InternshipDetailView extends StatelessWidget {
  final InternshipModel internship;

  const InternshipDetailView({super.key, required this.internship});

  String _fmt(DateTime? date) {
    if (date == null) return '-';
    return "${date.day.toString().padLeft(2, '0')}/${date.month.toString().padLeft(2, '0')}/${date.year}";
  }

  @override
  Widget build(BuildContext context) {
    final jobId = internship.id ?? '';
    final shortlistVM = context.watch<ShortlistViewModel>();
    final applicationVM = context.watch<ApplicationViewModel>();

    final isSaved = shortlistVM.savedJobIds.contains(jobId);
    final isApplied = applicationVM.isApplied(jobId);

    final company = internship.companyPosted?.companyDetails;
    final employer = internship.companyPosted?.employerDetails;
    final contact = internship.contactPerson;
    final pkg = internship.packageDetails;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          internship.jobRoles?.isNotEmpty == true
              ? internship.jobRoles!.first
              : 'Internship Detail',
        ),
        actions: [
          GestureDetector(
            onTap: () => shortlistVM.toggleSave(
              jobId: jobId,
              jobType: 'Internship',
              isSaved: isSaved,
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: AnimatedSwitcher(
                duration: const Duration(milliseconds: 200),
                child: Icon(
                  isSaved ? Icons.bookmark : Icons.bookmark_border,
                  key: ValueKey(isSaved),
                  color: isSaved
                      ? AppColors.primary
                      : AppColors.text.withOpacity(0.6),
                ),
              ),
            ),
          ),

          GestureDetector(
            onTap: () async {
              final url = Uri.tryParse(
                'https://rawrecruit.in/student-dashboard/Internship/',
              );
              if (url != null) {
                final canLaunch = await canLaunchUrl(url);
                try {
                  await launchUrl(url);
                } catch (e) {
                  Toasts.showErrorToast(
                    context,
                    message: 'Something went wrong, Try again later.',
                  );
                }
              }
            },
            child: Padding(
              padding: const EdgeInsets.only(right: 16),
              child: Icon(Icons.share, color: AppColors.primary),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.fromLTRB(16, 12, 16, 28),
        child: Row(
          children: [
            Expanded(
              child: OutlinedButton.icon(
                onPressed: () => shortlistVM.toggleSave(
                  jobId: jobId,
                  jobType: 'Internship',
                  isSaved: isSaved,
                ),
                icon: Icon(
                  isSaved ? Icons.bookmark : Icons.bookmark_border,
                  size: 18,
                ),
                label: Text(isSaved ? 'Saved' : 'Save'),
                style: OutlinedButton.styleFrom(
                  foregroundColor: isSaved ? AppColors.primary : AppColors.text,
                  side: BorderSide(
                    color: isSaved ? AppColors.primary : AppColors.border,
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 14),
                ),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              flex: 2,
              child: ElevatedButton(
                onPressed: isApplied ? null : () => applicationVM.apply(jobId),
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 14),
                ),
                child: Text(
                  isApplied ? 'Applied' : 'Apply Now',
                  style: const TextStyle(fontSize: 15),
                ),
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
            // ── COMPANY HEADER ────────────────────────────────────────────
            if ((internship.companyPosted?.profileImageUrl ?? '').isNotEmpty)
              Center(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.network(
                    internship.companyPosted!.profileImageUrl!,
                    height: 70,
                    width: 70,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            Text(company?.companyName ?? '', style: AppTextStyles.s18W600),
            if ((company?.industryType ?? '').isNotEmpty)
              Text(
                '${company!.industryType}  •  ${company.companyType ?? ''}',
                style: AppTextStyles.s12W400,
              ),
            const SizedBox(height: 16),

            // ── INTERNSHIP OVERVIEW ───────────────────────────────────────
            _sectionHeader('Internship Overview'),
            _row('Job Roles', internship.jobRoles?.join(', ')),
            _row('Job Type', internship.jobType),
            _row('Job Status', internship.jobStatus),
            _row('Approval Status', internship.approvalStatus),
            _row('Description', internship.description),
            _row('Duration', internship.internshipDuration),
            _row('Eligibility Criteria', internship.eligibilityCriteria),
            _row('Min Education', internship.minEducation),
            _row('Degree', internship.degree?.join(', ')),
            _row('Student Streams', internship.studentStreams?.join(', ')),
            _row(
              'CGPA Required',
              internship.cgpa != null && internship.cgpa != 0
                  ? internship.cgpa.toString()
                  : null,
            ),
            _row('Number of Openings', internship.numberOfOpenings?.toString()),
            _row('Minimum Students', internship.minimumStudents),
            _row('Views', internship.views?.toString()),
            _row(
              'Match Score',
              internship.matchScore != null
                  ? '${internship.matchScore}%'
                  : null,
            ),
            const SizedBox(height: 16),

            // ── LOCATION & WORK ───────────────────────────────────────────
            _sectionHeader('Location & Work'),
            _row('Location', internship.location?.join(', ')),
            _row('Venue', internship.venue),
            _row('Work Mode', internship.workMode?.join(', ')),
            _row('Work Location', internship.workLocation?.join(', ')),
            _row('Employment Type', internship.employmentType?.join(', ')),
            const SizedBox(height: 16),

            // ── IMPORTANT DATES ───────────────────────────────────────────
            _sectionHeader('Important Dates'),
            _row('Start Date', _fmt(internship.startDate)),
            _row('End Date', _fmt(internship.endDate)),
            _row('Online Test Date', _fmt(internship.onlineTestDate)),
            _row('Expires At', _fmt(internship.expireAt)),
            _row('Posted At', _fmt(internship.createdAt)),
            const SizedBox(height: 16),

            // ── PACKAGE ───────────────────────────────────────────────────
            _sectionHeader('Package / Stipend'),
            _row('Currency', pkg?.currency),
            _row('Total CTC', pkg?.totalCTC?.toString()),
            _row('Fixed Pay', pkg?.fixedPay?.toString()),
            _row('Joining Bonus', pkg?.joiningBonus?.toString()),
            const SizedBox(height: 16),

            // ── SELECTION PROCESS ─────────────────────────────────────────
            _sectionHeader('Selection Process'),
            _row('Rounds', internship.rounds?.join(', ')),
            _row('Selection Process', internship.selectionProcess?.join(', ')),
            const SizedBox(height: 16),

            // ── SKILLS & TOOLS ────────────────────────────────────────────
            if ((internship.skills ?? []).isNotEmpty) ...[
              _sectionHeader('Skills Required'),
              _chipWrap(internship.skills!),
              const SizedBox(height: 16),
            ],
            if ((internship.toolsAndPlatforms ?? []).isNotEmpty) ...[
              _sectionHeader('Tools & Platforms'),
              _chipWrap(internship.toolsAndPlatforms!),
              const SizedBox(height: 16),
            ],
            if ((internship.certifications ?? []).isNotEmpty) ...[
              _sectionHeader('Certifications'),
              _chipWrap(internship.certifications!),
              const SizedBox(height: 16),
            ],

            // ── BENEFITS & TAGS ───────────────────────────────────────────
            _sectionHeader('Benefits & Tags'),
            _row('Benefits', internship.benefits?.join(', ')),
            _row('Tags', internship.tags?.join(', ')),
            _row(
              'Amenities Required',
              internship.amenitiesRequired?.join(', '),
            ),
            const SizedBox(height: 16),

            // ── CONTACT PERSON ────────────────────────────────────────────
            if (contact != null) ...[
              _sectionHeader('Contact Person'),
              _row('Name', contact.name),
              _row('Designation', contact.designation),
              _row('Email', contact.email),
              _row('Mobile', contact.mobile),
              if ((contact.linkedin ?? '').isNotEmpty)
                _linkRow('LinkedIn', contact.linkedin!),
              const SizedBox(height: 16),
            ],

            // ── COMPANY DETAILS ───────────────────────────────────────────
            if (company != null) ...[
              _sectionHeader('Company Details'),
              _row('Company Name', company.companyName),
              _row('Description', company.description),
              _row('Type', company.companyType),
              _row('Industry', company.industryType),
              _row('Employees', company.numberOfEmployees),
              _row('Established', company.establishedYear),
              _row('City', company.city),
              _row('State', company.state),
              _row('Country', company.country),
              _row('Pincode', company.pincode),
              if ((company.websiteUrl ?? '').isNotEmpty)
                _linkRow('Website', company.websiteUrl!),
              if ((company.companyLinkedin ?? '').isNotEmpty)
                _linkRow('LinkedIn', company.companyLinkedin!),
              const SizedBox(height: 16),
            ],

            // ── EMPLOYER ─────────────────────────────────────────────────
            if (employer != null) ...[
              _sectionHeader('Employer'),
              _row('Name', employer.name),
              _row('Designation', employer.designation),
              _row('Email', employer.workEmail),
              _row('Mobile', employer.mobile),
              const SizedBox(height: 16),
            ],

            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  Widget _sectionHeader(String title) => Padding(
    padding: const EdgeInsets.only(bottom: 10),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        const Divider(height: 8),
      ],
    ),
  );

  Widget _row(String label, String? value) {
    if ((value ?? '').trim().isEmpty || value == '0') {
      return const SizedBox.shrink();
    }
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 160,
            child: Text(
              '$label:',
              style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 13),
            ),
          ),
          Expanded(child: Text(value!, style: const TextStyle(fontSize: 13))),
        ],
      ),
    );
  }

  Widget _linkRow(String label, String url) => Padding(
    padding: const EdgeInsets.only(bottom: 8),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 160,
          child: Text(
            '$label:',
            style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 13),
          ),
        ),
        Expanded(
          child: GestureDetector(
            onTap: () async {
              final uri = Uri.parse(url);
              if (await canLaunchUrl(uri)) {
                await launchUrl(uri, mode: LaunchMode.externalApplication);
              }
            },
            child: Text(
              url,
              style: const TextStyle(
                fontSize: 13,
                color: Colors.blue,
                decoration: TextDecoration.underline,
              ),
            ),
          ),
        ),
      ],
    ),
  );

  Widget _chipWrap(List<String> items) => Wrap(
    spacing: 8,
    runSpacing: 6,
    children: items
        .map(
          (e) => Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
            decoration: BoxDecoration(
              color: AppColors.primary.withOpacity(0.1),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              e,
              style: AppTextStyles.s12W600.copyWith(color: AppColors.primary),
            ),
          ),
        )
        .toList(),
  );
}
