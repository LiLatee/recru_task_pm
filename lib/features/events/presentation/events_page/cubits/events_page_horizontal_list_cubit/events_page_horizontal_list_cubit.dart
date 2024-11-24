import 'package:either_dart/either.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recru_task_pm/features/events/data/repositories/events_repository.dart';
import 'package:recru_task_pm/features/events/presentation/events_page/cubits/events_page_horizontal_list_cubit/events_page_horizontal_list_cubit_state.dart';

class EventsPageHorizontalListCubit extends Cubit<EventsPageHorizontalListCubitState> {
  EventsPageHorizontalListCubit({required EventsRepository eventsRepository})
      : _eventsRepository = eventsRepository,
        super(EventsPageHorizontalListCubitLoadingState()) {
    _load();
  }

  final EventsRepository _eventsRepository;

  Future<void> _load() async {
    final Either resOrFailure = await _eventsRepository.getHorizontalListItems();

    resOrFailure.fold(
      (failure) => emit(EventsPageHorizontalListCubitErrorState(failure: failure)),
      (items) => emit(EventsPageHorizontalListCubitDataState(items: items)),
    );
  }
}
