import 'package:flutter/material.dart';
// import 'package:randomwords/pages/words/words_page.dart';
import '../../../helper/model/word_Item.dart';
import '../../../helper/notifier/storage.dart';

class UIFavBody extends StatelessWidget {
  final NotifierValueStorage notifierWord;
  final ValueChanged<int> onDeleteClick;
  const UIFavBody({
    Key? key,
    required this.notifierWord,
    required this.onDeleteClick,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: notifierWord.storage,
      builder: (BuildContext context, dynamic value, Widget? child) {
        final List<WordItem> arrWord = value as List<WordItem>;
        return ListView.builder(
          itemCount:
              arrWord.isNotEmpty ? arrWord.length + (arrWord.length - 1) : 0,
          itemBuilder: (context, i) {
            if (i.isOdd) return const Divider();
            final index = i ~/ 2;
            return ListTile(
              title: Text(arrWord[index].stName),
              trailing: const Icon(Icons.delete_outlined),
              onTap: () => onDeleteClick(index),
            );
          },
        );
      },
    );
  }
}
