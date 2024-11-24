import 'package:either_dart/either.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:recru_task_pm/core/failure.dart';
import 'package:recru_task_pm/features/events/data/repositories/events_repository.dart';
import 'package:recru_task_pm/features/events/presentation/events_page/cubits/events_page_horizontal_list_cubit/events_page_horizontal_list_cubit.dart';
import 'package:recru_task_pm/features/events/presentation/events_page/cubits/events_page_horizontal_list_cubit/events_page_horizontal_list_cubit_state.dart';

class MockEventsRepository extends Mock implements EventsRepository {}

void main() {
  group(
    '$EventsPageHorizontalListCubit -',
    () {
      late EventsRepository mockEventsRepository;

      setUp(() {
        mockEventsRepository = MockEventsRepository();
        when(() => mockEventsRepository.getHorizontalListItems()).thenAnswer((_) async => const Right([]));
      });

      EventsPageHorizontalListCubit createCubit() =>
          EventsPageHorizontalListCubit(eventsRepository: mockEventsRepository);

      test(
        'on start state is $EventsPageHorizontalListCubitLoadingState',
        () async {
          expect(createCubit().state, EventsPageHorizontalListCubitLoadingState());
        },
      );

      test(
        'on loaded data state is $EventsPageHorizontalListCubitDataState',
        () async {
          final cubit = createCubit();

          await pumpEventQueue(times: 200000);

          expect(cubit.state, EventsPageHorizontalListCubitDataState(items: const []));
        },
      );

      test(
        'on failure state is $EventsPageHorizontalListCubitErrorState',
        () async {
          const Failure mockFailure = FailureWithMessage('message');
          when(() => mockEventsRepository.getHorizontalListItems()).thenAnswer((_) async => const Left(mockFailure));

          final cubit = createCubit();

          await pumpEventQueue(times: 200000);

          expect(cubit.state, EventsPageHorizontalListCubitErrorState(failure: mockFailure));
        },
      );
    },
  );
}
