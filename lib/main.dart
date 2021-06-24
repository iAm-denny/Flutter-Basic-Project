import 'package:flutodo/constant/quote_card.dart';
import 'package:flutodo/project/fetchData.dart';
import 'package:flutodo/project/todo.dart';
import 'package:flutodo/quote/quote.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';

void main() {
  runApp(MaterialApp(
    home: QuoteList(),
  ));
}

class QuoteList extends StatefulWidget {
  @override
  _QuoteListState createState() => _QuoteListState();
}

class _QuoteListState extends State<QuoteList> {
  @override
  Widget build(BuildContext context) {
    return FetchData();
    // return ToDoList();
  }
}
