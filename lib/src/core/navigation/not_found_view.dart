// import 'package:flutter/material.dart';
// import 'package:go_router/go_router.dart';
// import 'package:rawrecruit/common/index.dart';
// import 'package:rawrecruit/core/index.dart';
// import 'package:rawrecruit/gen/assets.gen.dart';
//
// class NotFoundView extends StatelessWidget {
//   const NotFoundView({this.isSchool = false, super.key});
//   final bool isSchool;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: SAppBar(
//         leading: SIcon(
//           icon: Icons.keyboard_arrow_left,
//           onTap: () {
//             context.pushReplacementNamed(RouteNames.home);
//           },
//         ),
//         actions: [],
//         title: 'Go to HomePage',
//       ),
//
//       extendBodyBehindAppBar: true,
//
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Lottie.asset(Assets.animations.noFoundPage, width: 250),
//             Text(
//               '${isSchool ? 'College' : 'Page'} Not Found',
//               style: STextStyles.s20W600.copyWith(color: SColor.secTextColor),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
