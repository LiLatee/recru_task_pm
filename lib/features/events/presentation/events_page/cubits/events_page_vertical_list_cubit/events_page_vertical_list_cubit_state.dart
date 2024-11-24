import 'package:equatable/equatable.dart';
import 'package:recru_task_pm/core/failure.dart';
import 'package:recru_task_pm/features/events/data/entities/events_page_vertical_list_item_entity.dart';

sealed class EventsPageVerticalListCubitState extends Equatable {}

class EventsPageVerticalListCubitLoadingState extends EventsPageVerticalListCubitState {
  @override
  List<Object?> get props => [];
}

class EventsPageVerticalListCubitErrorState extends EventsPageVerticalListCubitState {
  EventsPageVerticalListCubitErrorState({required this.failure});

  final Failure failure;

  @override
  List<Object?> get props => [];
}

class EventsPageVerticalListCubitDataState extends EventsPageVerticalListCubitState {
  EventsPageVerticalListCubitDataState({required this.items});

  final List<EventsPageVerticalListItemEntity> items;

  @override
  List<Object?> get props => [items];
}
