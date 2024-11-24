import 'package:equatable/equatable.dart';
import 'package:recru_task_pm/core/failure.dart';
import 'package:recru_task_pm/features/events/data/entities/events_page_horizontal_list_item_entity.dart';

sealed class EventsPageHorizontalListCubitState extends Equatable {}

class EventsPageHorizontalListCubitLoadingState extends EventsPageHorizontalListCubitState {
  @override
  List<Object?> get props => [];
}

class EventsPageHorizontalListCubitErrorState extends EventsPageHorizontalListCubitState {
  EventsPageHorizontalListCubitErrorState({required this.failure});

  final Failure failure;

  @override
  List<Object?> get props => [failure];
}

class EventsPageHorizontalListCubitDataState extends EventsPageHorizontalListCubitState {
  EventsPageHorizontalListCubitDataState({required this.items});

  final List<EventsPageHorizontalListItemEntity> items;

  @override
  List<Object?> get props => [items];
}
