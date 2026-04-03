import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rawrecruit/src/common/index.dart';
import 'package:rawrecruit/src/features/referral/presentation/index.dart';

class ReferralHome extends StatefulWidget {
  const ReferralHome({super.key});

  @override
  State<ReferralHome> createState() => _ReferralHomeState();
}

class _ReferralHomeState extends State<ReferralHome> {
  final ReferralHomeViewModel referralHomeViewModel = ReferralHomeViewModel();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: referralHomeViewModel,
      child: Scaffold(
        backgroundColor: AppColors.kBg,

        body: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 24),
          child: Column(
            spacing: 24,
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ReferralHomeHeader(),
              ReferralTile(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Incoming Requests',
                    style: AppTextStyles.s16W600.copyWith(color: Colors.white),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                    decoration: BoxDecoration(
                      color: AppColors.kGreen,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Text(
                      '3 new',
                      style: AppTextStyles.s14W600.copyWith(
                        color: AppColors.kBg,
                      ),
                    ),
                  ),
                ],
              ),
              ListView.separated(
                itemCount: 3,
                separatorBuilder: (_, _) => SizedBox(height: 8),
                itemBuilder: (_, index) {
                  return ListTile(
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 4,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),

                    tileColor: AppColors.kTile,
                    leading: Container(
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: AppColors.kGreen,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        'JD',
                        style: AppTextStyles.s16W600.copyWith(
                          color: AppColors.kBg,
                        ),
                      ),
                    ),
                    title: Text(
                      'John Doe',
                      style: AppTextStyles.s16W600.copyWith(
                        color: AppColors.white,
                      ),
                    ),
                    subtitle: Text(
                      'Java, Flutter',
                      style: AppTextStyles.s16W600.copyWith(
                        color: AppColors.secText,
                      ),
                    ),
                    trailing: Text(
                      'Review',
                      style: AppTextStyles.s16W600.copyWith(
                        color: AppColors.kGreen,
                      ),
                    ),
                  );
                },
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Referrers Who Can Help',
                    style: AppTextStyles.s16W600.copyWith(color: Colors.white),
                  ),
                ],
              ),
              SizedBox(
                height: 230,
                child: ListView.separated(
                  itemCount: 3,
                  separatorBuilder: (_, _) => SizedBox(width: 12),
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (_, index) {
                    return Flexible(
                      child: Container(
                        padding: EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: AppColors.kTile,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Column(
                          spacing: 16,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                              height: 60,
                              width: 60,
                              decoration: BoxDecoration(
                                color: Color(0xff1E2229),
                                shape: BoxShape.circle,
                              ),
                              child: Center(
                                child: Text(
                                  'JD',
                                  style: AppTextStyles.s16W600.copyWith(
                                    color: AppColors.white,
                                  ),
                                ),
                              ),
                            ),
                            Column(
                              spacing: 4,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  'John Doe',
                                  style: AppTextStyles.s16W600.copyWith(
                                    color: AppColors.white,
                                  ),
                                ),
                                Text(
                                  'Java, Flutter',
                                  style: AppTextStyles.s16W600.copyWith(
                                    color: AppColors.secText,
                                  ),
                                ),
                              ],
                            ),
                            AppButton.outlined(
                              onPressed: () {},
                              label: 'Request',
                              foregroundColor: AppColors.kBg,
                              backgroundColor: AppColors.kGreen,
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                  shrinkWrap: true,
                ),
              ),

              Text(
                'Jobs For You',
                style: AppTextStyles.s16W600.copyWith(color: Colors.white),
              ),
              ListView.separated(
                itemCount: 3,
                separatorBuilder: (_, _) => SizedBox(height: 8),
                itemBuilder: (_, index) {
                  return ListTile(
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 4,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),

                    tileColor: AppColors.kTile,
                    title: Text(
                      'John Doe',
                      style: AppTextStyles.s16W600.copyWith(
                        color: AppColors.white,
                      ),
                    ),
                    subtitle: Text(
                      'Java, Flutter',
                      style: AppTextStyles.s16W600.copyWith(
                        color: AppColors.secText,
                      ),
                    ),
                    trailing: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 2,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.kGreen,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Text(
                        '40%',
                        style: AppTextStyles.s14W600.copyWith(
                          color: AppColors.kBg,
                        ),
                      ),
                    ),
                  );
                },
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
