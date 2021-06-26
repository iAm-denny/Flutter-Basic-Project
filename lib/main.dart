import 'package:flutodo/constant/quote_card.dart';
import 'package:flutodo/model/app_state.dart';
import 'package:flutodo/project/ReduxstateManagement.dart';
import 'package:flutodo/project/fetchData.dart';
import 'package:flutodo/project/todo.dart';
import 'package:flutodo/quote/quote.dart';
import 'package:flutter/material.dart';

// redux
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'redux/reducers.dart';

void main() {
  final _initialState = AppState(sliderFontSize: 0.5);
  // same name as reducer.dart so only one
  final Store<AppState> _store =
      Store<AppState>(reducer, initialState: _initialState);

  runApp(StoreProvider<AppState>(
    store: _store,
    child: MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => QuoteList(),
        '/about': (context) => About(),
        // '/settings': (context) => Settings(),
      },
    ),
  ));
}

class QuoteList extends StatefulWidget {
  @override
  _QuoteListState createState() => _QuoteListState();
}

class _QuoteListState extends State<QuoteList> {
  @override
  Widget build(BuildContext context) {
    return ReduxStateScreen();
    // return FetchData();
    // return ToDoList();
  }
}
