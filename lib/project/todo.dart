import 'package:flutodo/constant/quote_card.dart';
import 'package:flutodo/quote/quote.dart';
import 'package:flutter/material.dart';

class ToDoList extends StatefulWidget {
  @override
  _ToDoListState createState() => _ToDoListState();
}

class _ToDoListState extends State<ToDoList> {
  final TextEditingController _textEditingController = TextEditingController();
  List<Quote> quotes = [];

  quoteAdd(String quote) {
    setState(() {
      quotes.add(Quote(text: quote, author: 'gg', id: quotes.length + 1));
    });

    this._textEditingController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ToDo List"),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            TextField(
              controller: this._textEditingController,
              decoration: InputDecoration(hintText: 'Enter task here'),
            ),
            RaisedButton(
              child: const Text(
                'Add',
                style: TextStyle(color: Colors.white),
              ),
              color: Colors.blueAccent,
              onPressed: () {
                this.quoteAdd(this._textEditingController.text);
                print(quotes.length);
                print(quotes);
              },
            ),
            Column(
              children: quotes
                  .map((quote) => QuoteCard(
                      quote: quote,
                      delete: () {
                        // ----- search
                        var searchQuote =
                            quotes.where((q) => q.id == quote.id).toList();
                        print(searchQuote.map((e) => e.id));

                        // ------ remove
                        // setState(() {
                        //   quotes.remove(quote);
                        // });
                      }))
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }
}
