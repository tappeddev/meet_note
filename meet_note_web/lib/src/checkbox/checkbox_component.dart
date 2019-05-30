import 'dart:async';

import 'package:angular/core.dart';
import 'package:angular/di.dart';

@Component(
    selector: "checkbox",
    templateUrl: "checkbox_component.html",
    styleUrls: ["checkbox_component.css"])
class CheckboxComponent {
  final _onIsCheckedChangedController = StreamController<void>();

  @Input()
  bool isChecked = false;

  @Output("isCheckedChange")
  Stream<void> get onIsCheckedChanged => _onIsCheckedChangedController.stream;

  @HostBinding("class.checked")
  bool get checkedClass => isChecked;

  @HostListener("click")
  void onClick() => _onIsCheckedChangedController.add(null);
}
