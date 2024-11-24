import 'package:equatable/equatable.dart';
import 'package:intl/intl.dart';

class EventsPageVerticalListItemEntity extends Equatable {
  const EventsPageVerticalListItemEntity({
    required this.id,
    required this.imageUrl,
    required this.title,
    required this.place,
    required this.liked,
    required this.startDate,
    this.endDate,
  });

  final String id;
  final String imageUrl;
  final String title;
  final String place;
  final bool liked;
  final DateTime startDate;
  final DateTime? endDate;

  String get startEndDateFormatted {
    if (endDate == null) {
      return DateFormat('d.MM.yyyy').format(startDate);
    }

    if (endDate!.year == startDate.year) {
      return '${DateFormat('d.MM').format(startDate)}-${DateFormat('d.MM.yyyy').format(endDate!)}';
    }

    return '${DateFormat('d.MM.yyyy').format(startDate)}-${DateFormat('d.MM.yyyy').format(endDate!)}';
  }

  @override
  List<Object?> get props => [
        id,
        imageUrl,
        title,
        place,
        liked,
        startDate,
        endDate,
      ];
}
