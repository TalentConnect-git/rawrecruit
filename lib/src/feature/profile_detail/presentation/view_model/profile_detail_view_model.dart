import 'package:flutter/material.dart';
import 'package:rawrecruit/src/core/index.dart';

import '../../data/data_source_impl.dart';
import '../../repository/repo_impl.dart';

class ProfileDetailViewModel
    extends ChangeNotifier {

  final repo =
      ProfileDetailRepositoryImpl(
    profileDetailDataSource:
        ProfileDetailDataSourceImpl(),
  );

  ViewState viewState =
      ViewState.idle;

  User? user;

  Failure? failure;

  Future<void> fetchProfile(
    String userId,
  ) async {

    viewState = ViewState.busy;

    notifyListeners();

    final result =
        await repo.getProfileDetails(
      userId,
    );

    result.fold(
      (l) {
        failure =
            APIFailure.fromException(
          exception: l,
        );
      },

      (r) {
        user = r;
      },
    );

    viewState = ViewState.complete;

    notifyListeners();
  }
}