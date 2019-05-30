import 'package:injector/injector.dart';
import 'package:meet_note_core/service/task_service.dart';
import 'package:meet_note_core/view_model/task_list_view_model.dart';

final injector = Injector.appInstance;

void registerDependencies() {
  injector.registerDependency<TaskService>((innerInjector) {
    return TaskServiceImpl();
  });

  injector.registerDependency<TaskListViewModel>((innerInjector) {
    var taskService = innerInjector.getDependency<TaskService>();
    return TaskListViewModel(taskService);
  });
}
