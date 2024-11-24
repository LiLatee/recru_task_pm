import 'package:equatable/equatable.dart';

class EventsPageHorizontalListItemEntity extends Equatable {
  const EventsPageHorizontalListItemEntity({
    required this.id,
    required this.imageUrl,
  });

  final String id;
  final String imageUrl;

  @override
  List<Object?> get props => [
        id,
        imageUrl,
      ];
}
