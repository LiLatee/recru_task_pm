import 'package:flutter/material.dart';
import 'package:recru_task_pm/core/widgets/pm_network_image.dart';
import 'package:recru_task_pm/core/widgets/pm_skeletonizer.dart';
import 'package:recru_task_pm/features/events/data/entities/events_page_horizontal_list_item_entity.dart';
import 'package:recru_task_pm/features/events/presentation/events_page/widgets/events_page_horizontal_list/events_page_horizontal_list.dart';
import 'package:skeletonizer/skeletonizer.dart';

class EventsPageHorizontalListLoading extends StatelessWidget {
  const EventsPageHorizontalListLoading({super.key});

  @override
  Widget build(BuildContext context) {
    final List<EventsPageHorizontalListItemEntity> items = List.generate(
      2,
      (index) => const EventsPageHorizontalListItemEntity(
        id: 'id1',
        imageUrl:
            'https://s3-alpha-sig.figma.com/img/b15d/ab1c/8da833b667ec41b42c94d1198244f210?Expires=1733097600&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=YDtMZ5KjiJX9oJIYw2gTkoWOgwRrfTg8uCU3IGFtsOJRBTC3~ZRUnhqe4DOS-gZNJqw0ArTiBgyFlBzJk0AHfF~tM3UPImDuXoK5EdXI6a3DnndZKWd-N-Z4gWrJwaZisN4NjqS2Ja4q2c0NepB~NJUDuCmz0ribA0ACNaCzDH~SHqifO8za29Yqe2jODPTNqcum-RcrMTAFXzTAAUV3RaqZP62lA9cxBZMvFigTv-4d31AIQJ5qL9gKfvAvq8eaWC3MtGSEYKBP-yP3BwWs3o864cembiqHrw2WplO~m0OE6WX1-g~amzrZON2ER21CaIUWgkmWty0kTkmHbW7HpA__',
      ),
    );

    return PmSkeletonizer(
      child: Container(
        height: EventsPageHorizontalList.heightOfElement,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: CarouselView(
          itemSnapping: true,
          itemExtent: MediaQuery.sizeOf(context).width * 0.75,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          children: items
              .map(
                (e) => Skeleton.replace(
                  height: double.infinity,
                  width: double.infinity,
                  child: PMNetworkImage(
                    url: e.imageUrl,
                    imageBuilder: (context, imageProvider) => Image(
                      image: imageProvider,
                      fit: BoxFit.cover,
                      alignment: Alignment.center,
                    ),
                  ),
                ),
              )
              .toList(growable: false),
        ),
      ),
    );
  }
}
