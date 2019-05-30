import 'dart:async';

import 'package:angular/di.dart';

@Component(
    selector: "text-field",
    templateUrl: "text_field_component.html",
    styleUrls: ["text_field_component.css"])
class TextFieldComponent {
  final _onInputChangedController = StreamController<String>();

  @Input()
  String label;

  @Output("input")
  Stream<String> get onInputChanged => _onInputChangedController.stream;

  void onInputChange(String newInput) =>
      _onInputChangedController.add(newInput);
}
