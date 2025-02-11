import 'package:get_it/get_it.dart';
import 'package:todo_app/data/repositories/event_repository.dart';
import 'package:todo_app/data/repositories/event_repository_impl.dart';
import 'package:todo_app/data/repositories/task_repository.dart';
import 'package:todo_app/data/repositories/task_repository_impl.dart';
import 'package:todo_app/domain/usecases/delete_task_usecase.dart';
import 'package:todo_app/domain/usecases/get_events_usecase.dart';
import 'package:todo_app/domain/usecases/get_tasks_usecase.dart';
import 'package:todo_app/domain/usecases/insert_event_usecase.dart';
import 'package:todo_app/domain/usecases/delete_event_usecase.dart';
import 'package:todo_app/domain/usecases/insert_task_usecase.dart';
import 'package:todo_app/domain/usecases/update_event_usecase.dart';
import 'package:todo_app/domain/usecases/update_task_usecase.dart';

final locator = GetIt.instance;

void setupServiceLocator() {
  // Register repositories
  locator.registerLazySingleton<EventRepository>(() => EventRepositoryImpl());
  locator.registerLazySingleton<TaskRepository>(() => TaskRepositoryImpl());

  // Register use cases
  locator.registerLazySingleton(() => GetEventsUseCase(locator()));
  locator.registerLazySingleton(() => InsertEventUseCase(locator()));
  locator.registerLazySingleton(() => DeleteEventUseCase(locator()));
  locator.registerLazySingleton(() => UpdateEventUseCase(locator()));

  locator.registerLazySingleton(() => GetTasksUseCase(locator()));
  locator.registerLazySingleton(() => InsertTaskUseCase(locator()));
  locator.registerLazySingleton(() => DeleteTaskUseCase(locator()));
  locator.registerLazySingleton(() => UpdateTaskUseCase(locator()));
}
