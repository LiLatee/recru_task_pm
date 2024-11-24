import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recru_task_pm/features/events/data/repositories/events_repository.dart';
import 'package:recru_task_pm/features/events/presentation/events_page/cubits/events_page_vertical_list_cubit/events_page_vertical_list_cubit_state.dart';
import 'package:rxdart/rxdart.dart';

class EventsPageVerticalListCubit extends Cubit<EventsPageVerticalListCubitState> {
  EventsPageVerticalListCubit({required EventsRepository eventsRepository})
      : _eventsRepository = eventsRepository,
        super(EventsPageVerticalListCubitLoadingState()) {
    _load();
  }

  final EventsRepository _eventsRepository;

  Future<void> _load() async {
    _eventsRepository.streamVerticalListItems().delay(const Duration(seconds: 2)).listen((event) {
      event.fold(
        (failure) => emit(EventsPageVerticalListCubitErrorState(failure: failure)),
        (items) => emit(EventsPageVerticalListCubitDataState(items: items)),
      );
    });
  }
}
