import 'package:angular/core.dart';
import 'package:angular/di.dart';

@Component(
    selector: "checkbox",
    templateUrl: "checkbox_component.html",
    styleUrls: ["checkbox_component.css"])
class CheckboxComponent {
  @Input()
  bool isChecked = false;

  @HostBinding("class.checked")
  bool get checkedClass => isChecked;
}
