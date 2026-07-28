import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:rawrecruit/src/common/index.dart';

import '../../../core/index.dart';
import 'view_models/web_jobs_view_model.dart';
import 'widgets/info_chip_job.dart';

class AskForReferralView extends StatefulWidget {
  const AskForReferralView({super.key});

  @override
  State<AskForReferralView> createState() => _AskForReferralViewState();
}

class _AskForReferralViewState extends State<AskForReferralView> {
  final TextEditingController companyController = TextEditingController();
  final TextEditingController urlController = TextEditingController();

  @override
  void dispose() {
    urlController.dispose();
    companyController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => getIt<WebJobViewModel>(),
      child: Scaffold(
        backgroundColor: AppColors.kBg,
        appBar: AppBar(
          backgroundColor: AppColors.kBg,
          elevation: 0,
          scrolledUnderElevation: 0,
          centerTitle: false,
          title: Text(
            'Ask For Referral',
            style: AppTextStyles.s18W600.copyWith(color: AppColors.white),
          ),
          leading: IconButton(
            onPressed: () => context.pop(),
            icon: Icon(
              Icons.arrow_back_ios_new_rounded,
              color: AppColors.white,
            ),
          ),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: AppColors.heroCard,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Referral Network',
                        style: AppTextStyles.s12W600.copyWith(
                          color: AppColors.kGreen,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Find referrals from alumni and employees',
                        style: AppTextStyles.s20W600.copyWith(
                          color: AppColors.white,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        'Ask for referrals by searching a company. We will fetch matching jobs from the company career page and rank them by alumni count and match score.',
                        style: AppTextStyles.s14W400.copyWith(
                          color: AppColors.secText,
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 16),

                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: const [
                      InfoChip(text: "1.Paste a job URL"),
                      SizedBox(width: 6),
                      InfoChip(text: "2.We find the Alumni"),
                      SizedBox(width: 6),
                      InfoChip(text: "3.Apply for Referrals"),
                    ],
                  ),
                ),

                const SizedBox(height: 20),

                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: AppColors.kCard,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: AppColors.kBorder),
                  ),
                  child: Column(
                    children: [
                      TextFormField(
                        controller: urlController,
                        style: TextStyle(color: AppColors.white),
                        decoration: InputDecoration(
                          hintText: 'Paste Job URL',
                          hintStyle: TextStyle(color: AppColors.secText),
                          prefixIcon: Icon(
                            Icons.link,
                            color: AppColors.secText,
                          ),
                          filled: true,
                          fillColor: AppColors.kInputFill,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide.none,
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),

                      // const SizedBox(height: 20),

                      // Text(
                      //   'OR',
                      //   style: AppTextStyles.s14W600.copyWith(
                      //     color: AppColors.secText,
                      //   ),
                      // ),

                      // const SizedBox(height: 20),

                      // TextFormField(
                      //   controller: companyController,
                      //   style: TextStyle(color: AppColors.white),
                      //   decoration: InputDecoration(
                      //     hintText: 'Enter Company Name',
                      //     hintStyle: TextStyle(color: AppColors.secText),
                      //     prefixIcon: Icon(
                      //       Icons.business,
                      //       color: AppColors.secText,
                      //     ),
                      //     filled: true,
                      //     fillColor: AppColors.kInputFill,
                      //     border: OutlineInputBorder(
                      //       borderRadius: BorderRadius.circular(12),
                      //       borderSide: BorderSide.none,
                      //     ),
                      //     enabledBorder: OutlineInputBorder(
                      //       borderRadius: BorderRadius.circular(12),
                      //       borderSide: BorderSide.none,
                      //     ),
                      //   ),
                      // ),
                      const SizedBox(height: 24),

                      Consumer<WebJobViewModel>(
                        builder: (_, vm, __) {
                          return SizedBox(
                            width: double.infinity,
                            height: 52,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: AppColors.kGreen,
                                elevation: 0,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                              ),
                              onPressed: vm.viewState == ViewState.busy
                                  ? null
                                  : () async {
                                      final url = urlController.text.trim();
                                      final company = companyController.text
                                          .trim();

                                      if (url.isEmpty && company.isEmpty) {
                                        ScaffoldMessenger.of(
                                          context,
                                        ).showSnackBar(
                                          const SnackBar(
                                            content: Text(
                                              'Please enter a Job URL',
                                            ),
                                          ),
                                        );
                                        return;
                                      }

                                      // URL FLOW
                                      // URL FLOW
                                      if (url.isNotEmpty) {
                                        final failure = await vm
                                            .requestCareerPageReferral(
                                              careerPageUrl: url,
                                            );

                                        if (!context.mounted) return;

                                        if (failure != null) {
                                          ScaffoldMessenger.of(
                                            context,
                                          ).showSnackBar(
                                            SnackBar(
                                              content: Text(
                                                failure.message ?? 'error',
                                              ),
                                            ),
                                          );
                                          return;
                                        }

                                        final response =
                                            vm.careerPageReferralResponse;

                                        if (response != null) {
                                          context.pushNamed(
                                            RouteNames.careerPageAlumniList,
                                            extra: {
                                              'careerPageUrl': url,
                                              'response': response,
                                            },
                                          );
                                        }

                                        return;
                                      }

                                      // COMPANY FLOW
                                      final failure = await vm.discoverJobs(
                                        companyName: company,
                                      );

                                      if (failure == null &&
                                          vm.companyJobsDiscovery != null &&
                                          context.mounted) {
                                        context.pushNamed(
                                          RouteNames.webJobsList,
                                          extra: vm.companyJobsDiscovery,
                                        );
                                      }
                                    },
                              child: vm.viewState == ViewState.busy
                                  ? SizedBox(
                                      height: 20,
                                      width: 20,
                                      child: CircularProgressIndicator(
                                        strokeWidth: 2,
                                        color: AppColors.onGreenButton,
                                      ),
                                    )
                                  : Text(
                                      'Apply For Referral',
                                      style: AppTextStyles.s16W600.copyWith(
                                        color: AppColors.onGreenButton,
                                      ),
                                    ),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
