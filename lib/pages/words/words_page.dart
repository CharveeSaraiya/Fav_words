// import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:randomwords/pages/words/words_helper.dart';

import 'widgets/words_appbar.dart';
import 'widgets/words_body.dart';

class WordsPage extends StatefulWidget {
  const WordsPage({Key? key}) : super(key: key);

  @override
  State<WordsPage> createState() => _WordsPageState();
}

class _WordsPageState extends State<WordsPage> {
  WordHelper? _pageHelper;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _pageHelper!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _initPageHelper();

    return Scaffold(
      appBar: UIWordsAppBar(),
      body: UIWordsBody(
        notifierWord: _pageHelper!.notifierWord,
        onLoadMore: () => _pageHelper!.onLoadMore(),
        onFavouriteClick: (int index) => _pageHelper!.onFavouriteClick(index),
        onDoneClick: () => _pageHelper!.onDoneClick(),
      ),
    );
  }

  void _initPageHelper() {
    if (_pageHelper == null) {
      _pageHelper = WordHelper();
      _pageHelper!.onPageLoad(context: context);
    }
  }
}
