import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:rawrecruit/src/common/index.dart';
import 'package:rawrecruit/src/core/index.dart';
import 'package:rawrecruit/src/features/onboarding/presentation/view_model/my_profile_view_model.dart';
import 'package:url_launcher/url_launcher.dart';

class MyProfileView extends StatefulWidget {
  const MyProfileView({super.key});

  @override
  State<MyProfileView> createState() => _MyProfileViewState();
}

class _MyProfileViewState extends State<MyProfileView> {
  MyProfileViewModel myProfileViewModel = MyProfileViewModel();

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      final failure = await myProfileViewModel.getUserProfile();
      failure?.showError(context);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: myProfileViewModel,
      child: Scaffold(
        body: Consumer<MyProfileViewModel>(
          builder: (vmContext, vm, _) {
            if (vm.isLoading) {
              return AppLoadingIndicator();
            }

            return SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                spacing: 20,
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 20),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.shadow,
                          spreadRadius: 1,
                          blurRadius: 1,
                        ),
                      ],
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      spacing: 16,
                      children: [
                        Container(
                          padding: EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: AppColors.card,
                          ),
                          child: Icon(Icons.person),
                        ),
                        Expanded(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                vm.userProfile?.name ?? '-',
                                style: AppTextStyles.s18W600,
                              ),
                              Text(
                                vm.userProfile?.email ?? '-',
                                style: AppTextStyles.s16W400,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),

                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 20),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.shadow,
                          spreadRadius: 1,
                          blurRadius: 1,
                        ),
                      ],
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      spacing: 4,
                      children: [
                        Text('College Detail', style: AppTextStyles.s16W600),
                        const SizedBox(height: 4),
                        Row(
                          children: [
                            Text(
                              'Name : ',
                              style: AppTextStyles.s14W600.copyWith(
                                color: AppColors.chipText,
                              ),
                            ),
                            Text(
                              vm.userProfile?.college ?? '',
                              style: AppTextStyles.s14W600.copyWith(
                                color: AppColors.chipText,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Text(
                              'Degree : ',
                              style: AppTextStyles.s14W600.copyWith(
                                color: AppColors.chipText,
                              ),
                            ),
                            Text(
                              vm.userProfile?.degree ?? '',
                              style: AppTextStyles.s14W600.copyWith(
                                color: AppColors.chipText,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Text(
                              'CGPA : ',
                              style: AppTextStyles.s14W600.copyWith(
                                color: AppColors.chipText,
                              ),
                            ),
                            Text(
                              vm.userProfile?.cgpa ?? '-',
                              style: AppTextStyles.s14W600.copyWith(
                                color: AppColors.chipText,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),

                  if ((vm.userProfile?.skills ?? []).isNotEmpty)
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 20,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: AppColors.shadow,
                            spreadRadius: 1,
                            blurRadius: 1,
                          ),
                        ],
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        spacing: 16,
                        children: [
                          Text('Skills', style: AppTextStyles.s16W600),
                          Wrap(
                            spacing: 8,
                            runSpacing: 8,
                            children: [
                              ...(vm.userProfile?.skills ?? []).map((skill) {
                                return Container(
                                  padding: EdgeInsets.symmetric(
                                    vertical: 8,
                                    horizontal: 12,
                                  ),
                                  decoration: BoxDecoration(
                                    color: AppColors.card,
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Text(
                                    skill,
                                    style: AppTextStyles.s14W600.copyWith(
                                      color: AppColors.chipText,
                                    ),
                                  ),
                                );
                              }),
                            ],
                          ),
                        ],
                      ),
                    ),

                  if ((vm.userProfile?.toolsAndPlatforms ?? []).isNotEmpty)
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 20,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: AppColors.shadow,
                            spreadRadius: 1,
                            blurRadius: 1,
                          ),
                        ],
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        spacing: 16,
                        children: [
                          Text(
                            'Tools & Platforms',
                            style: AppTextStyles.s16W600,
                          ),
                          Wrap(
                            spacing: 8,
                            runSpacing: 8,
                            children: [
                              ...(vm.userProfile?.toolsAndPlatforms ?? []).map((
                                skill,
                              ) {
                                return Container(
                                  padding: EdgeInsets.symmetric(
                                    vertical: 8,
                                    horizontal: 12,
                                  ),
                                  decoration: BoxDecoration(
                                    color: AppColors.card,
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Text(
                                    skill,
                                    style: AppTextStyles.s14W600.copyWith(
                                      color: AppColors.chipText,
                                    ),
                                  ),
                                );
                              }),
                            ],
                          ),
                        ],
                      ),
                    ),

                  if ((vm.userProfile?.languagesKnown ?? []).isNotEmpty)
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 20,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: AppColors.shadow,
                            spreadRadius: 1,
                            blurRadius: 1,
                          ),
                        ],
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        spacing: 16,
                        children: [
                          Text('Languages known', style: AppTextStyles.s16W600),
                          Wrap(
                            spacing: 8,
                            runSpacing: 8,
                            children: [
                              ...(vm.userProfile?.languagesKnown ?? []).map((
                                skill,
                              ) {
                                return Container(
                                  padding: EdgeInsets.symmetric(
                                    vertical: 8,
                                    horizontal: 12,
                                  ),
                                  decoration: BoxDecoration(
                                    color: AppColors.card,
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Text(
                                    skill,
                                    style: AppTextStyles.s14W600.copyWith(
                                      color: AppColors.chipText,
                                    ),
                                  ),
                                );
                              }),
                            ],
                          ),
                        ],
                      ),
                    ),

                  if ((vm.userProfile?.experiences ?? []).isNotEmpty)
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 20,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: AppColors.shadow,
                            spreadRadius: 1,
                            blurRadius: 1,
                          ),
                        ],
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        spacing: 16,
                        children: [
                          Text('Experiences', style: AppTextStyles.s16W600),
                          Wrap(
                            spacing: 8,
                            runSpacing: 8,
                            children: [
                              ...(vm.userProfile?.experiences ?? []).map((
                                skill,
                              ) {
                                return Container(
                                  padding: EdgeInsets.symmetric(
                                    vertical: 8,
                                    horizontal: 12,
                                  ),
                                  decoration: BoxDecoration(
                                    color: AppColors.card,
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Text(
                                    skill,
                                    style: AppTextStyles.s14W600.copyWith(
                                      color: AppColors.chipText,
                                    ),
                                  ),
                                );
                              }),
                            ],
                          ),
                        ],
                      ),
                    ),

                  if ((vm.userProfile?.employmentType ?? []).isNotEmpty)
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 20,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: AppColors.shadow,
                            spreadRadius: 1,
                            blurRadius: 1,
                          ),
                        ],
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        spacing: 16,
                        children: [
                          Text('EmploymentType', style: AppTextStyles.s16W600),
                          Wrap(
                            spacing: 8,
                            runSpacing: 8,
                            children: [
                              ...(vm.userProfile?.employmentType ?? []).map((
                                skill,
                              ) {
                                return Container(
                                  padding: EdgeInsets.symmetric(
                                    vertical: 8,
                                    horizontal: 12,
                                  ),
                                  decoration: BoxDecoration(
                                    color: AppColors.card,
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Text(
                                    skill,
                                    style: AppTextStyles.s14W600.copyWith(
                                      color: AppColors.chipText,
                                    ),
                                  ),
                                );
                              }),
                            ],
                          ),
                        ],
                      ),
                    ),

                  if ((vm.userProfile?.awards ?? []).isNotEmpty)
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 20,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: AppColors.shadow,
                            spreadRadius: 1,
                            blurRadius: 1,
                          ),
                        ],
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        spacing: 4,
                        children: [
                          Text('Awards', style: AppTextStyles.s16W600),
                          const SizedBox(height: 4),
                          ...(vm.userProfile?.awards ?? []).map((p) {
                            return Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      p.title ?? '-',
                                      style: AppTextStyles.s14W600.copyWith(
                                        color: AppColors.chipText,
                                      ),
                                    ),
                                    Text(
                                      '  -  ',
                                      style: AppTextStyles.s14W600.copyWith(
                                        color: AppColors.chipText,
                                      ),
                                    ),
                                    Text(
                                      p.organization ?? '-',
                                      style: AppTextStyles.s14W600.copyWith(
                                        color: AppColors.chipText,
                                      ),
                                    ),
                                  ],
                                ),
                                Text(
                                  p.description ?? '',
                                  style: AppTextStyles.s14W600.copyWith(
                                    color: AppColors.chipText,
                                  ),
                                ),
                              ],
                            );
                          }),
                        ],
                      ),
                    ),

                  if ((vm.userProfile?.publications ?? []).isNotEmpty)
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 20,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: AppColors.shadow,
                            spreadRadius: 1,
                            blurRadius: 1,
                          ),
                        ],
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        spacing: 4,
                        children: [
                          Text('Publications', style: AppTextStyles.s16W600),
                          const SizedBox(height: 4),
                          ...(vm.userProfile?.publications ?? []).map((p) {
                            return Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  p.title ??
                                      'Publication ${(vm.userProfile?.publications ?? []).indexOf(p)}',
                                  style: AppTextStyles.s14W600.copyWith(
                                    color: AppColors.chipText,
                                  ),
                                ),
                                Text(
                                  p.url ?? '',
                                  style: AppTextStyles.s14W600.copyWith(
                                    color: Colors.purple,
                                  ),
                                ),
                              ],
                            );
                          }),
                        ],
                      ),
                    ),
if ((vm.userProfile?.resume ?? '').isNotEmpty)
  Container(
    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
    decoration: BoxDecoration(
      color: Colors.white,
      boxShadow: [
        BoxShadow(color: AppColors.shadow, spreadRadius: 1, blurRadius: 1),
      ],
      borderRadius: BorderRadius.circular(12),
    ),
    child: Row(
      children: [
        Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.red.shade50,
            borderRadius: BorderRadius.circular(8),
          ),
          child: const Icon(Icons.picture_as_pdf, color: Colors.red),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Resume', style: AppTextStyles.s16W600),
              Text(
                'Tap to download',
                style: AppTextStyles.s14W600.copyWith(
                  color: AppColors.chipText,
                ),
              ),
            ],
          ),
        ),
        IconButton(
          icon: const Icon(Icons.download_rounded),
          color: AppColors.chipText,
          onPressed: () async {
            final uri = Uri.parse(vm.userProfile!.resume!);
            if (await canLaunchUrl(uri)) {
              await launchUrl(uri, mode: LaunchMode.externalApplication);
            }
          },
        ),
      ],
    ),
  ),
                  AppButton(
                    onPressed: () async {
                      final result = await context.pushNamed(
                        RouteNames.addEditProfileView,
                        extra: myProfileViewModel.userProfile,
                      );

                      if (result == true) {
                        final failure = await myProfileViewModel
                            .getUserProfile();
                        failure?.showError(context);
                      }
                    },
                    child: Text(
                      'Edit Profile',
                      style: AppTextStyles.s16W600.copyWith(
                        color: AppColors.background,
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
