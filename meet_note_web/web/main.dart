import 'package:angular/angular.dart';
import 'package:meet_note_core/dependencies/register_dependencies.dart';
import 'package:meet_note_web/app_component.template.dart' as ng;

void main() {
  registerDependencies();

  runApp(ng.AppComponentNgFactory);
}
