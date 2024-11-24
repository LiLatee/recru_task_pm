import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:recru_task_pm/core/widgets/pm_skeletonizer.dart';
import 'package:recru_task_pm/dependencies.dart';
import 'package:recru_task_pm/features/events/data/entities/events_page_vertical_list_item_entity.dart';
import 'package:recru_task_pm/features/events/data/repositories/events_repository.dart';
import 'package:recru_task_pm/features/events/presentation/events_page/cubits/events_page_horizontal_list_cubit/events_page_horizontal_list_cubit.dart';
import 'package:recru_task_pm/features/events/presentation/events_page/cubits/events_page_vertical_list_cubit/events_page_vertical_list_cubit.dart';
import 'package:recru_task_pm/features/events/presentation/events_page/cubits/events_page_vertical_list_cubit/events_page_vertical_list_cubit_state.dart';
import 'package:recru_task_pm/features/events/presentation/events_page/widgets/events_page_horizontal_list/events_page_horizontal_list.dart';
import 'package:recru_task_pm/features/events/presentation/events_page/widgets/events_page_vertical_list/events_page_vertical_list_item.dart';
import 'package:recru_task_pm/l10n/l10n.dart';

class EventsPage extends StatefulWidget {
  const EventsPage({
    super.key,
    this.eventsPageHorizontalListCubit,
    this.eventsPageVerticalListCubit,
  });

  static const String route = 'events';
  static const String routeToPush = '/$route';

  @visibleForTesting
  final EventsPageHorizontalListCubit? eventsPageHorizontalListCubit;

  @visibleForTesting
  final EventsPageVerticalListCubit? eventsPageVerticalListCubit;

  @override
  State<EventsPage> createState() => _EventsPageState();
}

class _EventsPageState extends State<EventsPage> {
  late final EventsPageHorizontalListCubit eventsPageHorizontalListCubit;
  late final EventsPageVerticalListCubit eventsPageVerticalListCubit;

  @override
  void initState() {
    super.initState();

    eventsPageHorizontalListCubit =
        widget.eventsPageHorizontalListCubit ?? EventsPageHorizontalListCubit(eventsRepository: sl<EventsRepository>());
    eventsPageVerticalListCubit =
        widget.eventsPageVerticalListCubit ?? EventsPageVerticalListCubit(eventsRepository: sl<EventsRepository>());
  }

  Widget _verticalList(BuildContext context) {
    final EventsPageVerticalListCubitState state = context.watch<EventsPageVerticalListCubit>().state;
    final List<EventsPageVerticalListItemEntity> items = List.generate(
        5,
        (index) => EventsPageVerticalListItemEntity(
              id: 'id1',
              imageUrl:
                  'https://s3-alpha-sig.figma.com/img/ae19/c24a/a08680e3cc55d9d937a3490b188eef3c?Expires=1733097600&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=ZwBwRerlvOUi4~HygC5K5b~XvK9nvu29~Y6j5Rj3Im1LRf6i~E~3oGsM19BsdmohUsBJiXOdAsLrAQ7j2skVgursn73TD0MEGYm3c-Nwi9xcCugZpf~NkBrwTNkRR1PB0DRlH8DbcEgvyJcrCmqmw6LRrBCYtg9Qw91kv1TpL73AMm7-CJWmj0c16htw87GJBp1Dt57WWxPLkFGlz1dqqhOKNDtSFEJ-3hgROL9BbeJ41nzg2ulVs6yNNrdJB7FGY4y2WjZBRxqZH2ZzyePslQgsNCA7HXfaK4aVceqhHE-0DN9NNcJYVXVyf~xtigCyBOb7UTXwfh2mNVtQH9Kdug__',
              title: 'Loading state loading',
              place: 'Loading state loading',
              liked: true,
              startDate: DateTime(2024, 9, 3),
              endDate: null,
            ));

    final Widget loadingWidget = SliverToBoxAdapter(
      child: PmSkeletonizer(
        child: Column(
          children: List.generate(
            items.length,
            (index) => EventsPageVerticalListItem(item: items[index]),
          ),
        ),
      ),
    );

    return switch (state) {
      EventsPageVerticalListCubitErrorState() =>
        const SliverToBoxAdapter(child: SizedBox.shrink()), // TODO brak desingu.
      EventsPageVerticalListCubitLoadingState() => loadingWidget,
      EventsPageVerticalListCubitDataState(items: final List<EventsPageVerticalListItemEntity> items) => Builder(
          builder: (context) {
            return SliverList.builder(
              itemCount: items.length,
              itemBuilder: (context, index) {
                return EventsPageVerticalListItem(item: items[index]);
              },
            );
          },
        ),
    };
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => eventsPageVerticalListCubit,
      child: Builder(builder: (context) {
        return Scaffold(
          appBar: AppBar(
            title: Text(context.l10n.eventsTabName),
            actions: [
              IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
              IconButton(onPressed: () {}, icon: const Icon(Icons.tune)),
            ],
          ),
          body: RefreshIndicator(
            onRefresh: () async {},
            child: CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: EventsPageHorizontalList(eventsPageHorizontalListCubit: eventsPageHorizontalListCubit),
                ),
                _verticalList(context),
                const SliverGap(10),
              ],
            ),
          ),
        );
      }),
    );
  }
}
