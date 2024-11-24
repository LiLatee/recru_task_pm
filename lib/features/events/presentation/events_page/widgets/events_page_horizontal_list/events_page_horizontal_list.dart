import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recru_task_pm/core/widgets/pm_network_image.dart';
import 'package:recru_task_pm/features/events/data/entities/events_page_horizontal_list_item_entity.dart';
import 'package:recru_task_pm/features/events/presentation/events_page/cubits/events_page_horizontal_list_cubit/events_page_horizontal_list_cubit.dart';
import 'package:recru_task_pm/features/events/presentation/events_page/cubits/events_page_horizontal_list_cubit/events_page_horizontal_list_cubit_state.dart';
import 'package:recru_task_pm/features/events/presentation/events_page/widgets/events_page_horizontal_list/events_page_horizontal_list_loading.dart';

class EventsPageHorizontalList extends StatefulWidget {
  const EventsPageHorizontalList({
    required this.eventsPageHorizontalListCubit,
    super.key,
  });

  final EventsPageHorizontalListCubit eventsPageHorizontalListCubit;

  static const double heightOfElement = 244;

  @override
  State<EventsPageHorizontalList> createState() => _CinemaArticlesListState();
}

class _CinemaArticlesListState extends State<EventsPageHorizontalList> {
  final CarouselController carouselController = CarouselController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => widget.eventsPageHorizontalListCubit,
      child: BlocBuilder<EventsPageHorizontalListCubit, EventsPageHorizontalListCubitState>(
        builder: (context, state) {
          return switch (state) {
            EventsPageHorizontalListCubitErrorState() => const SizedBox.shrink(),
            EventsPageHorizontalListCubitLoadingState() => const EventsPageHorizontalListLoading(),
            EventsPageHorizontalListCubitDataState(items: final List<EventsPageHorizontalListItemEntity> items) =>
              Builder(
                builder: (context) {
                  const double horizontalPadding = 16;
                  final double widthOfASingleElement = items.length == 1
                      ? MediaQuery.sizeOf(context).width - horizontalPadding * 2
                      : MediaQuery.sizeOf(context).width * 0.75;

                  return Container(
                    height: EventsPageHorizontalList.heightOfElement,
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: CarouselView(
                      itemSnapping: true,
                      itemExtent: widthOfASingleElement,
                      controller: carouselController,
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                      children: items
                          .map(
                            (item) => PMNetworkImage(
                              url: item.imageUrl,
                              imageBuilder: (context, imageProvider) => Image(
                                image: imageProvider,
                                fit: BoxFit.cover,
                                alignment: Alignment.center,
                              ),
                            ),
                          )
                          .toList(growable: false),
                    ),
                  );
                },
              ),
          };
        },
      ),
    );
  }
}
