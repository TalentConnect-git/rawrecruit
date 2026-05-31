import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:rawrecruit/src/common/index.dart';
import 'package:rawrecruit/src/core/index.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

import '../../../core/utils/utils.dart';

class ResumeViewerPage extends StatelessWidget {
  final String url;

  const ResumeViewerPage({super.key, required this.url});

  @override
  Widget build(BuildContext context) {
    log('Resume Url $url');
    return Scaffold(
      appBar: RAppBar(
        title: Text(
          "Resume",
          style: AppTextStyles.s16W400.copyWith(color: AppColors.white),
        ),
        leading: IconButton(
          onPressed: context.pop,
          icon: Icon(Icons.keyboard_arrow_left, color: AppColors.white),
        ),
      ),
      body: SfPdfViewer.network(url),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final result = await AppUtils.downloadResume(
            url: url,
            onDownloadProgress: (progress) {
              print(progress);
            },
          );

          result.fold(
            (failure) {
              log(failure.message ?? '');
              Toasts.showErrorToast(context, message: failure.message);
            },
            (path) {
              Toasts.showSuccessToast(context, message: 'Downloaded at: $path');
            },
          );
        },
        child: Transform.flip(flipY: true, child: Icon(Icons.upload)),
      ),
    );
  }
}
