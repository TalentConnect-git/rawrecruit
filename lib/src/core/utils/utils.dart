import 'package:dartz/dartz.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:rawrecruit/src/core/index.dart';

class AppUtils {
  static ResultFuture<String> downloadResume({
    required String url,
    required void Function(int progress) onDownloadProgress,
  }) async {
    try {
      final fileName = 'resume_${DateTime.now().millisecond}.pdf';
      final taskId = await FlutterDownloader.enqueue(
        url: url,
        savedDir: '/storage/emulated/0/Download',
        fileName: fileName,
        saveInPublicStorage: true,
        showNotification: true,
        openFileFromNotification: true,
      );

      // final directory = await Exter(type: StorageDirectory.downloads);
      //
      // final uri = Uri.parse(url);
      //
      // final fileName = uri.pathSegments.isNotEmpty
      //     ? uri.pathSegments.last
      //     : 'resume_${DateTime.now().millisecondsSinceEpoch}.pdf';
      //
      // final filePath = '${directory?.firstOrNull?.path}/$fileName';
      //
      // final response = await _dio.download(
      //   url,
      //   filePath,
      //   onReceiveProgress: (received, total) {
      //     if (total > 0) {
      //       final progress = ((received / total) * 100).round();
      //
      //       onDownloadProgress(progress);
      //     }
      //   },
      // );

      if (taskId != null) {
        return Right(fileName);
      }

      return Left(
        APIException(message: 'Failed to download resume', statusCode: 500),
      );
    } catch (e) {
      return Left(APIException.from(e));
    }
  }
}
