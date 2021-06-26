import 'package:flutter/material.dart';
import 'package:flutter_lorem/flutter_lorem.dart';

//reudx
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutodo/model/app_state.dart';
import '../redux/action.dart';
import '../redux/reducers.dart';

class ReduxStateScreen extends StatelessWidget {
  TextStyle getStyle([bool isBold = false, bool isItalic = false]) {
    return TextStyle(
      fontSize: 18,
      fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
      fontStyle: isItalic ? FontStyle.italic : FontStyle.normal,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Redux State Management"),
        backgroundColor: Colors.deepOrange,
        centerTitle: true,
      ),
      body: StoreConnector<AppState, AppState>(
        converter: (store) => store.state,
        builder: (context, state) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(left: 20, top: 20),
                child: Text(
                  'Font Size: ${state.viewFontSize.toInt()}',
                  style: TextStyle(fontSize: 18),
                ),
              ),
              Slider(
                  min: 0.5,
                  value: state.sliderFontSize ?? 10,
                  onChanged: (newValue) {
                    // dipatch action
                    StoreProvider.of<AppState>(context)
                        .dispatch(FontSize(newValue));
                  }),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 8),
                child: Row(
                  children: <Widget>[
                    Checkbox(
                      value: state.bold ?? false,
                      onChanged: (newVal) {
                        StoreProvider.of<AppState>(context)
                            .dispatch(Bold(newVal ?? false));
                      },
                    ),
                    Text(
                      'Bold',
                      style: getStyle(state.bold ?? false, false),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 8),
                child: Row(
                  children: <Widget>[
                    Checkbox(
                        value: state.italic ?? false,
                        onChanged: (newVal) {
                          StoreProvider.of<AppState>(context)
                              .dispatch(Italic(newVal ?? false));
                        }),
                    Text(
                      'Italic',
                      style: getStyle(false, state.italic ?? false),
                    ),
                  ],
                ),
              ),
              RaisedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/about');
                },
                child: Text('Check Font Style'),
              )
            ],
          );
        },
      ),
    );
  }
}

class About extends StatelessWidget {
  String text = lorem(paragraphs: 3, words: 50);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('About'),
        backgroundColor: Colors.teal,
      ),
      body: StoreConnector<AppState, AppState>(
        converter: (store) => store.state,
        builder: (context, state) {
          return Container(
            margin: EdgeInsets.all(10.0),
            child: RichText(
              text: TextSpan(
                text: text,
                style: TextStyle(
                    fontSize: state.viewFontSize,
                    color: Colors.lightBlue,
                    fontWeight: state.bold == true
                        ? FontWeight.bold
                        : FontWeight.normal,
                    fontStyle: state.italic == true
                        ? FontStyle.italic
                        : FontStyle.normal),
              ),
            ),
          );
        },
      ),
    );
  }
}
