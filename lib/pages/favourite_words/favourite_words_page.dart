import 'package:flutter/material.dart';
import 'package:randomwords/helper/model/word_Item.dart';
import 'package:randomwords/pages/favourite_words/favourite_words_helper.dart';
import 'widgets/favourite_words_appbar.dart';
import 'widgets/favourite_words_body.dart';

class FavouriteWordsPage extends StatefulWidget {
  final List<WordItem> arrSelectedWord;
  const FavouriteWordsPage({
    Key? key,
    required this.arrSelectedWord,
  }) : super(key: key);

  @override
  State<FavouriteWordsPage> createState() => _FavouriteWordsPageState();
}

class _FavouriteWordsPageState extends State<FavouriteWordsPage> {
  FavHelper? _pageHelper;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _initPageHelper();

    return Scaffold(
      appBar: UIFavAppBar(),
      body: UIFavBody(
        notifierWord: _pageHelper!.notifierWord,
        onDeleteClick: (int index) => _pageHelper!.onDeleteClick(index),
      ),
    );
  }

  void _initPageHelper() {
    if (_pageHelper == null) {
      _pageHelper = FavHelper();
      _pageHelper!.onPageLoad(
        context: context,
        arrWord: widget.arrSelectedWord,
      );
    }
  }
}
