import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rawrecruit/src/core/extensions/failure_ext.dart';
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
            return Container(
              padding: EdgeInsets.all(20),
              child: Text(vm.userProfile.toString()),
            );
          },
        ),
      ),
    );
  }
}
