import 'dart:async';

import 'model/word_Item.dart';

class AppSubscription {
  final StreamController<WordItem> scOnWordDelete =
      StreamController.broadcast();
}
