import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:recru_task_pm/core/tests_manager.dart';
import 'package:recru_task_pm/features/events/data/repositories/events_repository.dart';
import 'package:recru_task_pm/navigation/go_router.dart';

final sl = GetIt.instance;

Future<void> setupDependencies() async {
  sl.registerLazySingleton<TestsManager>(TestsManager.new);
  sl.registerLazySingleton<GoRouter>(() => goRouter);

  sl.registerLazySingleton<EventsRepository>(() => EventsRepository());
}
