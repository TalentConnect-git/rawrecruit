import 'package:rawrecruit/src/core/index.dart';
import 'package:rawrecruit/src/features/chat/index.dart';

class ChatProvider extends ViewStateProvider {
  bool _newChatsAvailable = false;

  bool get hasNewChats => _newChatsAvailable;

  void setNewChatsAvailable() {
    _newChatsAvailable = true;
    notifyListeners();
  }

  void clearNewChatsAvailable() {
    _newChatsAvailable = false;
    notifyListeners();
  }

  Future<Failure?> checkForNewChats() async {
    Failure? failure;

    final result = await getIt<ChatRepository>().getUnreadCounts();

    result.fold((e) => failure = APIFailure.fromException(exception: e), (r) {
      if (r.isNotEmpty) {
        setNewChatsAvailable();
      } else {
        clearNewChatsAvailable();
      }
    });

    return failure;
  }
}
