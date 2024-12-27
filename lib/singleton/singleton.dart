import 'package:countdown/models/livematch_model.dart';
class SingleTon {
  static final SingleTon instance = SingleTon._internal();
  factory SingleTon() => instance;
SingleTon._internal();
LivematchModel? selectedMatchModel;
}
