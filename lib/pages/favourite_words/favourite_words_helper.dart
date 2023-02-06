import 'package:flutter/material.dart';
import '../../helper/app_globals.dart' as app_globals;

import '../../helper/model/word_Item.dart';
import '../../helper/notifier/storage.dart';

class FavHelper {
  //****************** Variable ******************
  late BuildContext contextPage;

  //****************** Notifier Refresh Word List ******************
  NotifierValueStorage notifierWord = NotifierValueStorage(
    data: List<WordItem>.from([]),
  );

  void setNotifierWord({
    required List<WordItem> arrNewWord,
  }) {
    final List<WordItem> arrWord =
        notifierWord.getValueStorage() as List<WordItem>;
    arrWord.addAll(arrNewWord);

    notifierWord.setValueStorage(
      data: List<WordItem>.from(arrWord),
    );
  }

  //****************** General Method ******************
  void onPageLoad({
    required BuildContext context,
    required List<WordItem> arrWord,
  }) {
    contextPage = context;

    setNotifierWord(
      arrNewWord: arrWord,
    );
  }

//****************** UI Action ******************
  void onDeleteClick(int index) {
    final List<WordItem> arrWord =
        notifierWord.getValueStorage() as List<WordItem>;

    final WordItem objWordItem = arrWord[index];
    arrWord.removeAt(index);
    notifierWord.setValueStorage(
      data: List<WordItem>.from(arrWord),
    );

    // Pass objWord into sink
    debugPrint("deleting....");
    debugPrint(objWordItem.stName);
    app_globals.objAppSubscription.scOnWordDelete.sink.add(objWordItem);
    if (arrWord.isEmpty) {
      debugPrint("Empty");
      //Navigator.of(contextPage).pop();
      Navigator.pop(contextPage);
    }
  }
}
