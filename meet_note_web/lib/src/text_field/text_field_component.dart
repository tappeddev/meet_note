import 'dart:async';

import 'package:angular/di.dart';

@Component(
    selector: "text-field",
    templateUrl: "text_field_component.html",
    styleUrls: ["text_field_component.css"])
class TextFieldComponent {
  final _onInputChangedController = StreamController<String>();
  final _onButtonClickedController = StreamController<String>();

  @Input()
  String label;

  @Input()
  String value;

  @Input()
  bool buttonIsDisabled = false;

  @Output("input")
  Stream<String> get onInputChanged => _onInputChangedController.stream;

  @Output("buttonClick")
  Stream<void> get onButtonClicked => _onButtonClickedController.stream;

  void onInputChange(String newInput) => _onInputChangedController.add(newInput);

  void onButtonClick() => _onButtonClickedController.add(null);
}
