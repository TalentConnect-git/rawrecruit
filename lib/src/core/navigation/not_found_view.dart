import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:rawrecruit/src/common/index.dart';
import 'package:rawrecruit/src/core/index.dart';

class NotFoundView extends StatelessWidget {
  const NotFoundView({this.isSchool = false, super.key});
  final bool isSchool;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: RAppBar(
        leading: IconButton(
          icon: Icon(Icons.keyboard_arrow_left),
          onPressed: () {
            context.pushReplacementNamed(RouteNames.dashboard);
          },
        ),
        actions: [],
        // title: 'Go to HomePage',
      ),

      extendBodyBehindAppBar: true,

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Lottie.asset(Assets.animations.noFoundPage, width: 250),
            Text(
              '${isSchool ? 'College' : 'Page'} Not Found',
              style: AppTextStyles.s20W600.copyWith(color: AppColors.secText),
            ),
          ],
        ),
      ),
    );
  }
}
