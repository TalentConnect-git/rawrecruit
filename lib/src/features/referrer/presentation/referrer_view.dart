import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rawrecruit/src/common/index.dart';
import 'package:rawrecruit/src/features/referrer/presentation/index.dart';

class ReferrerView extends StatefulWidget {
  const ReferrerView({super.key});

  @override
  State<ReferrerView> createState() => _ReferrerViewState();
}

class _ReferrerViewState extends State<ReferrerView> {
  final ReferrerViewViewModel referrerViewViewModel = ReferrerViewViewModel();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: referrerViewViewModel,
      child: Scaffold(
        backgroundColor: AppColors.kBg,

        body: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 24),
          child: Column(
            spacing: 24,
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ReferrerViewHeader(),
              Row(
                spacing: 16,
                children: [
                  Expanded(
                    child: AppButton(
                      onPressed: () {},
                      label: 'Review Requests',
                      foregroundColor: AppColors.kBg,
                      backgroundColor: AppColors.kGreen,
                      circularRadius: 12,
                    ),
                  ),
                  Expanded(
                    child: AppButton.outlined(
                      onPressed: () {},
                      label: 'Post Job',
                      foregroundColor: AppColors.kBg,
                      backgroundColor: AppColors.kGreen,
                      circularRadius: 12,
                    ),
                  ),
                ],
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Pending Requests',
                    style: AppTextStyles.s18W600.copyWith(color: Colors.white),
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

              Text(
                'Your Job Posts',
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
                      'Flutter Developer',
                      style: AppTextStyles.s16W600.copyWith(
                        color: AppColors.white,
                      ),
                    ),
                    subtitle: Text(
                      '12 Candidates',
                      style: AppTextStyles.s16W600.copyWith(
                        color: AppColors.secText,
                      ),
                    ),
                    trailing: Icon(Icons.keyboard_arrow_right),
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
