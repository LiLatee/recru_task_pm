import 'package:either_dart/either.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:recru_task_pm/core/failure.dart';
import 'package:recru_task_pm/features/events/data/repositories/events_repository.dart';
import 'package:recru_task_pm/features/events/presentation/events_page/cubits/events_page_vertical_list_cubit/events_page_vertical_list_cubit.dart';
import 'package:recru_task_pm/features/events/presentation/events_page/cubits/events_page_vertical_list_cubit/events_page_vertical_list_cubit_state.dart';
import 'package:mocktail/mocktail.dart';

class MockEventsRepository extends Mock implements EventsRepository {}

void main() {
  group(
    '$EventsPageVerticalListCubit -',
    () {
      late EventsRepository mockEventsRepository;

      setUp(() {
        mockEventsRepository = MockEventsRepository();
        when(() => mockEventsRepository.streamVerticalListItems()).thenAnswer((_) => Stream.value(const Right([])));
      });

      EventsPageVerticalListCubit createCubit() => EventsPageVerticalListCubit(eventsRepository: mockEventsRepository);

      test(
        'on start state is $EventsPageVerticalListCubitLoadingState',
        () async {
          expect(createCubit().state, EventsPageVerticalListCubitLoadingState());
        },
      );

      test(
        'on loaded data state is $EventsPageVerticalListCubitDataState',
        () async {
          final cubit = createCubit();

          await pumpEventQueue(times: 200000);

          expect(cubit.state, EventsPageVerticalListCubitDataState(items: const []));
        },
      );

      test(
        'on failure state is $EventsPageVerticalListCubitErrorState',
        () async {
          const Failure mockFailure = FailureWithMessage('message');
          when(() => mockEventsRepository.streamVerticalListItems())
              .thenAnswer((_) => Stream.value(const Left(mockFailure)));

          final cubit = createCubit();

          await pumpEventQueue(times: 200000);

          expect(cubit.state, EventsPageVerticalListCubitErrorState(failure: mockFailure));
        },
      );
    },
  );
}
