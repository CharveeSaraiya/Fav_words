import 'package:flutter/material.dart';
import 'package:randomwords/helper/model/word_Item.dart';
// import 'package:randomwords/pages/favourite_words/favourite_words_page.dart';

import '../../../helper/notifier/storage.dart';

class UIWordsBody extends StatelessWidget {
  final NotifierValueStorage notifierWord;
  final VoidCallback onLoadMore;
  final ValueChanged<int> onFavouriteClick;
  final VoidCallback onDoneClick;
  const UIWordsBody({
    Key? key,
    required this.notifierWord,
    required this.onLoadMore,
    required this.onFavouriteClick,
    required this.onDoneClick,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: notifierWord.storage,
      builder: (BuildContext context, dynamic value, Widget? child) {
        final List<WordItem> arrWord = value as List<WordItem>;
        return NotificationListener<ScrollNotification>(
          onNotification: (ScrollNotification notification) {
            if (notification.metrics.pixels >=
                notification.metrics.maxScrollExtent) {
              onLoadMore();
            }
            return true;
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: ListView.builder(
                  padding: const EdgeInsets.all(16.0),
                  itemCount: arrWord.isNotEmpty
                      ? arrWord.length + (arrWord.length - 1)
                      : 0,
                  itemBuilder: (context, i) {
                    if (i.isOdd) return const Divider();

                    final index = i ~/ 2;
                    final WordItem objWordItem = arrWord[index];
                    return ListTile(
                      title: Text(
                        objWordItem.stName,
                        style: const TextStyle(fontSize: 18),
                      ),
                      trailing: Icon(
                        objWordItem.isFavourite
                            ? Icons.favorite
                            : Icons.favorite_border,
                        color: objWordItem.isFavourite ? Colors.red : null,
                        semanticLabel: objWordItem.isFavourite
                            ? 'Remove from saved'
                            : 'Save',
                      ),
                      onTap: () => onFavouriteClick(index),
                    );
                  },
                ),
              ),
              SizedBox(
                height: 50,
                child: Padding(
                  padding: const EdgeInsets.all(1.0),
                  child: TextButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.blue),
                    ),
                    child: const Text(
                      "Done >> ",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                      ),
                    ),
                    onPressed: () => onDoneClick(),
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
