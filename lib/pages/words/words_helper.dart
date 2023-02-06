import 'dart:async';

import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:randomwords/helper/app_globals.dart' as app_globals;
import 'package:randomwords/helper/model/word_Item.dart';
import 'package:randomwords/pages/favourite_words/favourite_words_page.dart';

import '../../helper/notifier/storage.dart';

class WordHelper {
  //****************** Variable ******************
  late BuildContext contextPage;
  late StreamSubscription subscribeToOnWordDelete;

  //****************** Notifier Refresh Word List ******************
  NotifierValueStorage notifierWord = NotifierValueStorage(
    data: List<WordItem>.from([]),
  );

  void setNotifierWord({
    required List<WordPair> arrNewWord,
  }) {
    final List<WordItem> arrWord =
        notifierWord.getValueStorage() as List<WordItem>;

    for (final WordPair objWordPair in arrNewWord) {
      arrWord.add(
        WordItem(
          stName: objWordPair.asPascalCase,
          isFavourite: false,
        ),
      );
    }

    notifierWord.setValueStorage(
      data: List<WordItem>.from(arrWord),
    );
  }

  //****************** General Method ******************
  void onPageLoad({
    required BuildContext context,
  }) {
    contextPage = context;
    callGetWordsApi();

    // final WordItem objWordDelete = WordItem(stName: " ", isFavourite: false);
    subscribeToOnWordDelete =
        app_globals.objAppSubscription.scOnWordDelete.stream.listen(
      (WordItem objDeletedWordItem) {
        final List<WordItem> arrWord =
            notifierWord.getValueStorage() as List<WordItem>;
        // arrWord.removeWhere(
        //     (objWordItem) => objWordItem.stName == objDeletedWordItem.stName);
        objDeletedWordItem.isFavourite = !objDeletedWordItem.isFavourite;
        // objDeletedWordItem.isFavourite ? false : true;
        notifierWord.setValueStorage(
          data: List<WordItem>.from(arrWord),
        );
      },
    );
  }

  void dispose() {
    subscribeToOnWordDelete.cancel();
  }

  //****************** UI Action ******************
  void onLoadMore() {
    callGetWordsApi();
  }

  void onFavouriteClick(int index) {
    final List<WordItem> arrWord =
        notifierWord.getValueStorage() as List<WordItem>;
    final WordItem objWordItem = arrWord[index];
    objWordItem.isFavourite = !objWordItem.isFavourite;
    arrWord[index] = objWordItem;
    notifierWord.setValueStorage(
      data: List<WordItem>.from(arrWord),
    );
  }

  void onDoneClick() {
    final List<WordItem> arrWord =
        notifierWord.getValueStorage() as List<WordItem>;

    final List<WordItem> arrSelectedWord =
        arrWord.where((element) => element.isFavourite == true).toList();

    if (arrSelectedWord.isEmpty) {
      showDialog(
        context: contextPage,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Alert!!'),
            content: SingleChildScrollView(
              child: ListBody(
                children: const <Widget>[
                  Text("Please Select atleast a Favourite Word!!"),
                ],
              ),
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(contextPage).pop();
                },
                child: const Text("OK"),
              ),
            ],
          );
        },
      );
    } else {
      Navigator.push(
        contextPage,
        MaterialPageRoute(
          builder: ((context) =>
              FavouriteWordsPage(arrSelectedWord: arrSelectedWord)),
        ),
      );
    }
  }

  //****************** API Call ******************
  void callGetWordsApi() {
    setNotifierWord(
      arrNewWord: generateWordPairs().take(20).toList(),
    );
  }
}
//   if (arrSelectedWord.isEmpty) {
    //     AlertDialog(
    //       title: Text("Alert!"),
    //       content: Text("Select atleast one Word"),
    //       // actions: [
    //       //   FlatButton(
    //       //     onPressed: () {
    //       //       Navigator.of(contextPage).pop();
    //       //     },
    //       //     child: Text("OK"),
    //       //   ),
    //       // ],
    //     );
    //   }