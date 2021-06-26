import 'package:flutodo/model/app_state.dart';
import 'action.dart';

AppState reducer(AppState prevState, dynamic action) {
  AppState newState = AppState.fromAppState(prevState);
  print('action $action');
  if (action is FontSize) {
    newState.sliderFontSize = action.payload;
  } else if (action is Bold) {
    newState.bold = action.payload;
  } else if (action is Italic) {
    newState.italic = action.payload;
  }
  return newState;
}
