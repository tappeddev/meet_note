import 'package:angular/di.dart';

@Component(
    selector: "date-component",
    templateUrl: "date_component.html",
    styleUrls: ["date_component.css"])
class DateComponent {
  @Input()
  String day;

  @Input()
  String month;

  @Input()
  String year;
}
