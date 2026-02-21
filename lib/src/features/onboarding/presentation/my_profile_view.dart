import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:rawrecruit/src/common/index.dart';
import 'package:rawrecruit/src/core/index.dart';
import 'package:rawrecruit/src/features/onboarding/presentation/view_model/my_profile_view_model.dart';

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
