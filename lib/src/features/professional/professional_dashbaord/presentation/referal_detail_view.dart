import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rawrecruit/src/core/index.dart';
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
      ],
      child: Consumer<ProfessionalViewModel>(
        builder: (context, vm, _) {
          if (vm.viewState == ViewState.busy) {
            return const Scaffold(
              body: Center(child: CircularProgressIndicator()),
            );
          }

          final job = vm.selectedReferralJob;

          if (job == null) {
            return const Scaffold(body: Center(child: Text("No Data")));
          }

          final poster = job.candidatePosted;

          return Scaffold(
            appBar: AppBar(
              title: Text(job.jobTitle ?? ''),
              actions: [
                Selector<ShortlistViewModel, bool>(
                  selector: (_, vm) => vm.savedJobIds.contains(job.id),
                  builder: (_, isSaved, __) => GestureDetector(
                    onTap: () => shortlistVm.toggleSave(
                      jobId: job.id ?? '',
                      jobType: "Off-campus",
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
                              : AppColors.text.withValues(alpha: 0.6),
                        ),
                      ),
                    ),
                  ),
                ),

                GestureDetector(
                  onTap: () async {
                    final url = Uri.tryParse(
                      'https://rawrecruit.in/professional-dashboard/Referral/',
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
            body: SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // ── JOB OVERVIEW ──────────────────────────────────────────
                  _sectionHeader('Job Overview'),
                  _row('Job Title', job.jobTitle),
                  _row('Job Type', job.jobType),
                  _row('Job Status', job.jobStatus),
                  // _row('Approval Status', job.approvalStatus),
                  _row('Description', job.description),
                  _row('Eligibility Criteria', job.eligibilityCriteria),
                  _row('Min Education', job.minEducation),
                  _row('Years of Experience', job.yearsOfExperience),
                  _row('Work Authorization', job.workAuthorization),
                  _row('Number of Openings', job.numberOfOpenings?.toString()),
                  _row(
                    'CGPA Required',
                    job.cgpa == 0 ? '-' : job.cgpa?.toString(),
                  ),
                  // _row('Views', job.views?.toString()),
                  _row('Expires At', _formatDate(job.expireAt)),
                  _row('Posted At', _formatDate(job.createdAt)),

                  const SizedBox(height: 16),

                  // ── LOCATION & WORK ───────────────────────────────────────
                  _sectionHeader('Location & Work'),
                  _row(
                    'Location',
                    job.location?.isNotEmpty == true
                        ? job.location!.join(', ')
                        : null,
                  ),
                  _row(
                    'Work Mode',
                    job.workMode?.isNotEmpty == true
                        ? job.workMode!.join(', ')
                        : null,
                  ),
                  _row(
                    'Work Location',
                    job.workLocation?.isNotEmpty == true
                        ? job.workLocation!.join(', ')
                        : null,
                  ),
                  _row(
                    'Employment Type',
                    job.employmentType?.isNotEmpty == true
                        ? job.employmentType!.join(', ')
                        : null,
                  ),

                  const SizedBox(height: 16),

                  // ── PACKAGE DETAILS ───────────────────────────────────────
                  _sectionHeader('Package Details'),
                  _row('Currency', job.packageDetails?.currency),
                  _row('Total CTC', job.packageDetails?.totalCTC?.toString()),
                  _row('Fixed Pay', job.packageDetails?.fixedPay?.toString()),
                  _row(
                    'Joining Bonus',
                    job.packageDetails?.joiningBonus?.toString(),
                  ),

                  const SizedBox(height: 16),

                  // ── ELIGIBILITY ───────────────────────────────────────────
                  _sectionHeader('Eligibility'),
                  _row(
                    'Degree',
                    job.degree?.isNotEmpty == true
                        ? job.degree!.join(', ')
                        : null,
                  ),
                  _row(
                    'Student Streams',
                    job.studentStreams?.isNotEmpty == true
                        ? job.studentStreams!.join(', ')
                        : null,
                  ),
                  _row(
                    'College Types',
                    job.collegeTypes?.isNotEmpty == true
                        ? job.collegeTypes!.join(', ')
                        : null,
                  ),
                  _row(
                    'College Categories',
                    job.collegeCategories?.isNotEmpty == true
                        ? job.collegeCategories!.join(', ')
                        : null,
                  ),
                  _row(
                    'Company Type',
                    job.companyType?.isNotEmpty == true
                        ? job.companyType!.join(', ')
                        : null,
                  ),

                  const SizedBox(height: 16),

                  // ── SKILLS & TOOLS ────────────────────────────────────────
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

                  // ── SELECTION PROCESS ─────────────────────────────────────
                  _sectionHeader('Selection Process'),
                  _row(
                    'Rounds',
                    job.rounds?.isNotEmpty == true
                        ? job.rounds!.join(', ')
                        : null,
                  ),
                  _row(
                    'Selection Process',
                    job.selectionProcess?.isNotEmpty == true
                        ? job.selectionProcess!.join(', ')
                        : null,
                  ),

                  const SizedBox(height: 16),

                  // ── BENEFITS & TAGS ───────────────────────────────────────
                  _sectionHeader('Benefits & Tags'),
                  _row(
                    'Benefits',
                    job.benefits?.isNotEmpty == true
                        ? job.benefits!.join(', ')
                        : null,
                  ),
                  _row(
                    'Tags',
                    job.tags?.isNotEmpty == true ? job.tags!.join(', ') : null,
                  ),
                  _row(
                    'Amenities Required',
                    job.amenitiesRequired?.isNotEmpty == true
                        ? job.amenitiesRequired!.join(', ')
                        : null,
                  ),

                  const SizedBox(height: 24),

                  // ── POSTED BY ─────────────────────────────────────────────
                  const SizedBox(height: 40),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  // ── Helpers ──────────────────────────────────────────────────────────────────

  String _formatDate(DateTime? date) {
    if (date == null) return '-';
    return "${date.day.toString().padLeft(2, '0')}/${date.month.toString().padLeft(2, '0')}/${date.year}";
  }

  Widget _sectionHeader(String title) {
    return Padding(
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
  }

  Widget _rowLabel(String label) {
    return Text(
      label,
      style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
    );
  }

  Widget _row(String label, String? value) {
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
          Expanded(
            child: Text(
              (value != null && value.isNotEmpty) ? value : '-',
              style: const TextStyle(fontSize: 13),
            ),
          ),
        ],
      ),
    );
  }

  Widget _linkRow(String label, String url) {
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
  }

  Widget _chipWrap(List<String> items) {
    return Wrap(
      spacing: 8,
      runSpacing: 6,
      children: items
          .map(
            (e) => Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
              decoration: BoxDecoration(
                color: Colors.blue.shade50,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                e,
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          )
          .toList(),
    );
  }
}
