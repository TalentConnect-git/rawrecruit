import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rawrecruit/src/core/index.dart';
import 'package:rawrecruit/src/features/web_jobs/presentation/view_models/web_job_detail_view_model.dart';

import '../../../common/index.dart';
import '../data/entities/company_job.dart';

class WebJobDetailView extends StatefulWidget {
  final CompanyJob job;

  const WebJobDetailView({super.key, required this.job});

  @override
  State<WebJobDetailView> createState() => _WebJobDetailViewState();
}

class _WebJobDetailViewState extends State<WebJobDetailView> {
  WebJobDetailViewModel webJobDetailViewModel = WebJobDetailViewModel();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: webJobDetailViewModel,
      child: Scaffold(
        backgroundColor: AppColors.kBg,
        body: Selector<WebJobDetailViewModel, bool>(
          selector: (_, vm) => vm.isLoading,
          builder: (_, isLoading, _) => isLoading
              ? Center(child: AppLoadingIndicator(color: AppColors.kGreen))
              : SafeArea(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        InkWell(
                          onTap: () => Navigator.pop(context),
                          child: const Icon(
                            Icons.arrow_back,
                            color: Colors.white,
                          ),
                        ),

                        const SizedBox(height: 24),

                        Text(
                          widget.job.title ?? '-',
                          style: AppTextStyles.s24W600.copyWith(
                            color: Colors.white,
                          ),
                        ),

                        const SizedBox(height: 24),

                        _DetailRow(
                          label: 'Company Name',
                          value: widget.job.companyName,
                        ),

                        _DetailRow(label: 'Title', value: widget.job.title),

                        _DetailRow(label: 'Job URL', value: widget.job.jobUrl),

                        _DetailRow(
                          label: 'Apply URL',
                          value: widget.job.applyUrl,
                        ),

                        _DetailRow(
                          label: 'Location',
                          value: widget.job.location,
                        ),

                        _DetailRow(
                          label: 'Work Mode',
                          value: widget.job.workMode,
                        ),

                        _DetailRow(
                          label: 'Department',
                          value: widget.job.department,
                        ),

                        _DetailRow(
                          label: 'JD Snippet',
                          value: widget.job.jdSnippet,
                        ),

                        _DetailRow(
                          label: 'Description',
                          value: widget.job.description,
                        ),

                        _DetailRow(
                          label: 'Required Skills',
                          value: widget.job.requiredSkills?.join(', '),
                        ),

                        _DetailRow(
                          label: 'Matched Skills',
                          value: widget.job.matchedSkills?.join(', '),
                        ),

                        _DetailRow(
                          label: 'Missing Skills',
                          value: widget.job.missingSkills?.join(', '),
                        ),

                        _DetailRow(
                          label: 'Experience Required',
                          value: widget.job.experienceRequired,
                        ),

                        _DetailRow(
                          label: 'Salary Range',
                          value: widget.job.salaryRange,
                        ),

                        _DetailRow(
                          label: 'Posted Date',
                          value: widget.job.postedDate,
                        ),

                        _DetailRow(
                          label: 'ATS Source',
                          value: widget.job.atsSource,
                        ),

                        _DetailRow(
                          label: 'Match Score',
                          value: widget.job.matchScore?.toString(),
                        ),

                        const SizedBox(height: 12),

                        Text(
                          'Score Breakdown',
                          style: AppTextStyles.s18W600.copyWith(
                            color: AppColors.kGreen,
                          ),
                        ),

                        const SizedBox(height: 16),

                        _DetailRow(
                          label: 'Skills Score',
                          value: widget.job.scoreBreakdown?.skills?.toString(),
                        ),

                        _DetailRow(
                          label: 'Role Score',
                          value: widget.job.scoreBreakdown?.role?.toString(),
                        ),

                        _DetailRow(
                          label: 'Experience Score',
                          value: widget.job.scoreBreakdown?.experience
                              ?.toString(),
                        ),

                        _DetailRow(
                          label: 'Location Score',
                          value: widget.job.scoreBreakdown?.location
                              ?.toString(),
                        ),

                        _DetailRow(
                          label: 'Work Mode Score',
                          value: widget.job.scoreBreakdown?.workMode
                              ?.toString(),
                        ),

                        _DetailRow(
                          label: 'Candidate Type Score',
                          value: widget.job.scoreBreakdown?.candidateType
                              ?.toString(),
                        ),

                        _DetailRow(
                          label: 'Alumni Count',
                          value: widget.job.alumniCount?.toString(),
                        ),

                        _DetailRow(
                          label: 'Total Employee Count',
                          value: widget.job.totalEmployeeCount?.toString(),
                        ),

                        const SizedBox(height: 40),
                      ],
                    ),
                  ),
                ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: SizedBox(
          width: MediaQuery.sizeOf(context).width,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: ElevatedButton(
              onPressed: () async {
                final failure = await webJobDetailViewModel.apply(widget.job);
                Toasts.showSuccessOrFailureToast(
                  context,
                  failure: failure,
                  popOnSuccess: true,
                  successMsg: 'Applied Successfully',
                );
              },
              style: ElevatedButton.styleFrom(
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                backgroundColor: AppColors.kGreen,
              ),
              child: Text(
                'Apply',
                style: AppTextStyles.s18W600.copyWith(color: Colors.white),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _DetailRow extends StatelessWidget {
  final String label;
  final String? value;

  const _DetailRow({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    final displayValue = (value?.trim().isNotEmpty ?? false) ? value! : '-';

    return Padding(
      padding: const EdgeInsets.only(bottom: 18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: AppTextStyles.s12W600.copyWith(color: AppColors.kGreen),
          ),
          const SizedBox(height: 6),
          Text(
            displayValue,
            style: AppTextStyles.s14W400.copyWith(color: Colors.white),
          ),
        ],
      ),
    );
  }
}
