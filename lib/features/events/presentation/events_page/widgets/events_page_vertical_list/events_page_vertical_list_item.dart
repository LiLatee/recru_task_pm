import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:recru_task_pm/core/assets.dart';
import 'package:recru_task_pm/core/widgets/pm_network_image.dart';
import 'package:recru_task_pm/features/events/data/entities/events_page_vertical_list_item_entity.dart';
import 'package:skeletonizer/skeletonizer.dart';

class EventsPageVerticalListItem extends StatelessWidget {
  const EventsPageVerticalListItem({
    super.key,
    required this.item,
  });

  static const double height = 114;

  final EventsPageVerticalListItemEntity item;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      margin: const EdgeInsets.only(top: 10),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Card(
        margin: EdgeInsets.zero,
        child: InkWell(
          onTap: () {},
          child: Row(
            children: [
              Skeleton.replace(
                height: height,
                width: height,
                child: PMNetworkImage(
                  url: item.imageUrl,
                  imageBuilder: (context, imageProvider) => ClipRRect(
                    borderRadius:
                        const BorderRadius.only(bottomLeft: Radius.circular(10), topLeft: Radius.circular(10)),
                    child: Image(
                      image: imageProvider,
                      fit: BoxFit.cover,
                      width: height,
                      height: height,
                      alignment: Alignment.center,
                    ),
                  ),
                ),
              ),
              const Gap(7),
              Expanded(
                child: Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 7,
                        bottom: 10,
                        right: 46,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            item.title,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w700,
                              height: 21 / 17,
                            ),
                          ),
                          const Gap(3),
                          Text(
                            item.place,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              height: 16 / 12,
                            ),
                          ),
                          const Spacer(),
                          Text(
                            item.startEndDateFormatted,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              height: 20 / 12,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      top: 8,
                      right: 7,
                      child: InkWell(
                        onTap: () {},
                        child: CircleAvatar(
                          radius: 16,
                          child: Icon(
                            item.liked ? Icons.favorite : Icons.favorite_border,
                            color: item.liked ? null : Colors.white,
                            size: 20,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 10,
                      right: 10,
                      child: SvgPicture.asset(
                        Assets.rightAngle,
                        colorFilter: ColorFilter.mode(
                          Theme.of(context).colorScheme.primaryContainer,
                          BlendMode.srcIn,
                        ),
                        width: 10,
                        height: 10,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
