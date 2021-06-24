import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';

class FetchData extends StatefulWidget {
  @override
  _FetchDataState createState() => _FetchDataState();
}

class _FetchDataState extends State<FetchData> {
  List placeholderData = [];
  final TextEditingController _textFeildController = TextEditingController();

  Future<void> getData() async {
    Response res =
        await get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));

    if (res.statusCode == 200) {
      List data = jsonDecode(res.body); // <- import dart:convert file
      print(data);
      setState(() {
        placeholderData = data;
      });
    } else {
      print('fetch failed');
    }
  }

  Future postData() async {
    print('title ${this._textFeildController.text}');
    try {
      Response res =
          await post(Uri.parse('https://jsonplaceholder.typicode.com/posts'),
              body: jsonEncode({
                "title": this._textFeildController.text,
                // "id": 500,
                // "userId": 499,
                // "body": 'nice nice good best went to go'
              }),
              headers: {
            "Content-Type": "application/json",
            "Accept": "application/json",
            // "Authorization": "`Bearer $_token",
          });
      if (res.statusCode == 201) {
        print('success');
      } else {
        print('failed');
      }
    } catch (err) {
      print('err $err');
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    this.getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Fetch Data'),
          centerTitle: true,
          backgroundColor: Colors.greenAccent,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                  padding: EdgeInsets.fromLTRB(20, 0, 0, 15),
                  child: Column(
                    children: [
                      TextField(
                        controller: this._textFeildController,
                        decoration: InputDecoration(hintText: 'Post Data'),
                      ),
                      RaisedButton(
                        child: const Text(
                          'Add Data',
                          style: TextStyle(color: Colors.white),
                        ),
                        color: Colors.blueAccent,
                        onPressed: this.postData,
                      )
                    ],
                  )),
              ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  // scrollDirection: Axis.horizontal,
                  itemCount: this.placeholderData.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(placeholderData[index]['title']),
                    );
                  })
            ],
          ),
        ));
  }
}
