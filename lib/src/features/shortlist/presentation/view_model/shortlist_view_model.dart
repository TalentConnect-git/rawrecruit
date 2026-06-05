import 'package:flutter/material.dart';
import 'package:rawrecruit/src/core/index.dart';
import 'package:rawrecruit/src/features/shortlist/entities/shortlist_model.dart';
import 'package:rawrecruit/src/features/shortlist/repository/shortlist_repository.dart';

enum SavedTab { offCampus, internship }

class ShortlistViewModel extends ViewStateProvider {
  final _repository = getIt<ShortlistRepository>();

  /// 🔥 Saved from API (used in shortlist screen)
  List<ShortlistModel> saved = [];

  /// 🔥 Local jobIds for bookmark detection
  final List<String> savedJobIds = [];

  Future<void> fetchSaved() async {
    setViewState(ViewState.busy);

    final result = await _repository.fetchSavedOpportunities(
      jobType: '', // 🔥 no filtering
    );

  result.fold(
  (failure) {
    debugPrint("FETCH SAVED FAILED: $failure");
  },
  (data) {
    debugPrint("FETCH SAVED SUCCESS");
    debugPrint("PARSED COUNT = ${data.length}");

    saved = data;

    savedJobIds.clear();

    for (final item in data) {
      debugPrint("ITEM JOB = ${item.job}");
      debugPrint("ITEM JOB ID = ${item.job?.id}");

      if (item.job?.id != null) {
        savedJobIds.add(item.job!.id!);
      }
    }
  },
);

    setViewState(ViewState.complete);
  }

  Future<void> toggleSave({
    required String jobId,
    required String jobType,
    required bool isSaved,
  }) async {
    if (isSaved) {
      final result = await _repository.removeOpportunity(jobId: jobId);

      result.fold((_) {}, (_) {
        savedJobIds.remove(jobId);
      });
    } else {
      final result = await _repository.saveOpportunity(
        jobId: jobId,
        jobType: jobType,
      );

      result.fold((_) {}, (_) {
        savedJobIds.add(jobId);
      });
    }

    notifyListeners();
  }
}
