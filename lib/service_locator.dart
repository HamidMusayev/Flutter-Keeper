import 'package:get_it/get_it.dart';
import 'package:todo_app/data/repositories/event_repository.dart';
import 'package:todo_app/data/repositories/event_repository_impl.dart';
import 'package:todo_app/domain/usecases/get_events_usecase.dart';
import 'package:todo_app/domain/usecases/insert_event_usecase.dart';
import 'package:todo_app/domain/usecases/delete_event_usecase.dart';
import 'package:todo_app/domain/usecases/update_event_usecase.dart';

final sl = GetIt.instance;

void setupServiceLocator() {
  // Register repositories
  sl.registerLazySingleton<EventRepository>(() => EventRepositoryImpl());

  // Register use cases
  sl.registerLazySingleton(() => GetEventsUseCase(sl()));
  sl.registerLazySingleton(() => InsertEventUseCase(sl()));
  sl.registerLazySingleton(() => DeleteEventUseCase(sl()));
  sl.registerLazySingleton(() => UpdateEventUseCase(sl()));
}