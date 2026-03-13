import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rawrecruit/src/features/dashboard/entities/job_model.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../common/index.dart';
import '../../../core/index.dart';
import '../../application/presentation/view_model/application_view_model.dart';
import '../../shortlist/presentation/view_model/shortlist_view_model.dart';

class JobDetailView extends StatelessWidget {
  final JobModel job;

  const JobDetailView({super.key, required this.job});

  String _fmt(DateTime? date) {
    if (date == null) return '-';
    return "${date.day.toString().padLeft(2, '0')}/${date.month.toString().padLeft(2, '0')}/${date.year}";
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
      appBar: AppBar(
        title: Text(
          job.jobRoles?.isNotEmpty == true
              ? job.jobRoles!.first
              : job.jobTitle ?? 'Job Detail',
        ),
        actions: [
          GestureDetector(
            onTap: () => shortlistVM.toggleSave(
              jobId: jobId,
              jobType: 'Off-campus',
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
                'https://rawrecruit.in/student-dashboard/Off-campus/',
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
                  jobType: 'Off-campus',
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
            if ((job.companyPosted?.profileImageUrl ?? '').isNotEmpty)
              Center(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.network(
                    job.companyPosted!.profileImageUrl!,
                    height: 70,
                    width: 70,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            Text(
              job.companyName ?? company?.companyName ?? '',
              style: AppTextStyles.s18W600,
            ),
            if ((company?.industryType ?? '').isNotEmpty)
              Text(
                '${company!.industryType}  •  ${company.companyType ?? ''}',
                style: AppTextStyles.s12W400,
              ),
            const SizedBox(height: 16),

            // ── JOB OVERVIEW ──────────────────────────────────────────────
            _sectionHeader('Job Overview'),
            _row('Job Title', job.jobTitle),
            _row('Job Roles', job.jobRoles?.join(', ')),
            _row('Job Type', job.jobType),
            _row('Job Status', job.jobStatus),
            _row('Approval Status', job.approvalStatus),
            _row('Description', job.description),
            _row('Eligibility Criteria', job.eligibilityCriteria),
            _row('Degree', job.degree?.join(', ')),
            _row('Student Streams', job.studentStreams?.join(', ')),
            _row(
              'CGPA Required',
              job.cgpa != null && job.cgpa != 0 ? job.cgpa.toString() : null,
            ),
            _row('Number of Openings', job.numberOfOpenings?.toString()),
            _row('Minimum Students', job.minimumStudents),
            _row('Views', job.views?.toString()),
            _row(
              'Match Score',
              job.matchScore != null ? '${job.matchScore}%' : null,
            ),
            const SizedBox(height: 16),

            // ── LOCATION & WORK ───────────────────────────────────────────
            _sectionHeader('Location & Work'),
            _row('Location', job.location?.join(', ')),
            _row('Venue', job.venue),
            _row('Work Mode', job.workMode?.join(', ')),
            _row('Work Location', job.workLocation?.join(', ')),
            _row('Employment Type', job.employmentType?.join(', ')),
            const SizedBox(height: 16),

            // ── IMPORTANT DATES ───────────────────────────────────────────
            _sectionHeader('Important Dates'),
            _row('Start Date', _fmt(job.startDate)),
            _row('End Date', _fmt(job.endDate)),
            _row('Online Test Date', _fmt(job.onlineTestDate)),
            _row('Interview Start', _fmt(job.interviewWindow?.start)),
            _row('Interview End', _fmt(job.interviewWindow?.end)),
            _row('Offer Rollout Date', _fmt(job.offerRolloutDate)),
            _row('Expires At', _fmt(job.expireAt)),
            _row('Posted At', _fmt(job.createdAt)),
            const SizedBox(height: 16),

            // ── PACKAGE ───────────────────────────────────────────────────
            _sectionHeader('Package Details'),
            _row('Currency', pkg?.currency),
            _row('Total CTC', pkg?.totalCTC?.toString()),
            _row('Fixed Pay', pkg?.fixedPay?.toString()),
            _row('Joining Bonus', pkg?.joiningBonus?.toString()),
            const SizedBox(height: 16),

            // ── SELECTION PROCESS ─────────────────────────────────────────
            _sectionHeader('Selection Process'),
            _row('Rounds', job.rounds?.join(', ')),
            _row('Selection Process', job.selectionProcess?.join(', ')),
            const SizedBox(height: 16),

            // ── SKILLS & TOOLS ────────────────────────────────────────────
            if ((job.skills ?? []).isNotEmpty) ...[
              _sectionHeader('Skills Required'),
              _chipWrap(job.skills!),
              const SizedBox(height: 16),
            ],
            if ((job.toolsAndPlatforms ?? []).isNotEmpty) ...[
              _sectionHeader('Tools & Platforms'),
              _chipWrap(job.toolsAndPlatforms!),
              const SizedBox(height: 16),
            ],
            if ((job.certifications ?? []).isNotEmpty) ...[
              _sectionHeader('Certifications'),
              _chipWrap(job.certifications!),
              const SizedBox(height: 16),
            ],

            // ── BENEFITS & TAGS ───────────────────────────────────────────
            _sectionHeader('Benefits & Tags'),
            _row('Benefits', job.benefits?.join(', ')),
            _row('Tags', job.tags?.join(', ')),
            _row('Amenities Required', job.amenitiesRequired?.join(', ')),
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
