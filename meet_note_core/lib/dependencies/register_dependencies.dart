import 'package:injector/injector.dart';
import 'package:meet_note_core/service/task_service.dart';
import 'package:meet_note_core/view_model/task_list_view_model.dart';

final _injector = Injector.appInstance;

void registerDependencies() {
  _injector.registerDependency<TaskService>((_) {
    return TaskServiceImpl();
  });

  _injector.registerDependency<TaskListViewModel>((iInjector) {
    var taskService = iInjector.getDependency<TaskService>();
    return TaskListViewModel(taskService);
  });
}
