import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:recru_task_pm/features/events/presentation/events_page/events_page.dart';
import 'package:recru_task_pm/features/explore/presentation/explore_page/explore_page.dart';
import 'package:recru_task_pm/features/home/presentation/home_page/home_page.dart';
import 'package:recru_task_pm/features/news/presentation/news_page/news_page.dart';
import 'package:recru_task_pm/l10n/l10n.dart';
import 'package:recru_task_pm/core/widgets/pm_annotated_region.dart';
import 'package:recru_task_pm/core/assets.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _shellNavigatorKeyHome = GlobalKey<NavigatorState>(debugLabel: 'shellFirstTab');
final _shellNavigatorKeyNews = GlobalKey<NavigatorState>(debugLabel: 'shellNews');
final _shellNavigatorKeyEvents = GlobalKey<NavigatorState>(debugLabel: 'shellEvents');
final _shellNavigatorKeyExplore = GlobalKey<NavigatorState>(debugLabel: 'shellExplore');

final goRouter = GoRouter(
  initialLocation: EventsPage.routeToPush,
  navigatorKey: _rootNavigatorKey,
  routes: [
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) {
        return ScaffoldWithNestedNavigation(navigationShell: navigationShell);
      },
      branches: [
        StatefulShellBranch(
          navigatorKey: _shellNavigatorKeyHome,
          routes: [
            GoRoute(
              path: HomePage.routeToPush,
              pageBuilder: (context, state) => const NoTransitionPage(
                child: HomePage(),
              ),
              routes: const [],
            ),
          ],
        ),
        StatefulShellBranch(
          navigatorKey: _shellNavigatorKeyNews,
          routes: [
            GoRoute(
              path: NewsPage.routeToPush,
              pageBuilder: (context, state) => const NoTransitionPage(
                child: NewsPage(),
              ),
              routes: const [],
            ),
          ],
        ),
        StatefulShellBranch(
          navigatorKey: _shellNavigatorKeyEvents,
          routes: [
            GoRoute(
              path: EventsPage.routeToPush,
              pageBuilder: (context, state) => const NoTransitionPage(
                child: EventsPage(),
              ),
              routes: const [],
            ),
          ],
        ),
        StatefulShellBranch(
          navigatorKey: _shellNavigatorKeyExplore,
          routes: [
            GoRoute(
              path: ExplorePage.routeToPush,
              pageBuilder: (context, state) => const NoTransitionPage(
                child: ExplorePage(),
              ),
              routes: const [],
            ),
          ],
        ),
      ],
    ),
  ],
);

class ScaffoldWithNestedNavigation extends StatelessWidget {
  const ScaffoldWithNestedNavigation({
    required this.navigationShell,
    Key? key,
  }) : super(key: key ?? const ValueKey('ScaffoldWithNestedNavigation'));
  final StatefulNavigationShell navigationShell;

  void _goBranch(int index) {
    navigationShell.goBranch(
      index,
      // A common pattern when using bottom navigation bars is to support
      // navigating to the initial location when tapping the item that is
      // already active. This example demonstrates how to support this behavior,
      // using the initialLocation parameter of goBranch.
      initialLocation: index == navigationShell.currentIndex,
    );
  }

  @override
  Widget build(BuildContext context) {
    return PMAnnotatedRegion(
      child: Scaffold(
        body: navigationShell,
        bottomNavigationBar: NavigationBar(
          selectedIndex: navigationShell.currentIndex,
          indicatorColor: Colors.transparent,
          destinations: [
            NavigationDestination(
              label: context.l10n.homeTabName,
              icon: const _TabIcon(iconPath: Assets.homeTab),
              selectedIcon: const _TabIcon(iconPath: Assets.homeTabSelected),
            ),
            NavigationDestination(
              label: context.l10n.newsTabName,
              icon: const _TabIcon(iconPath: Assets.newsTab),
              selectedIcon: const _TabIcon(iconPath: Assets.newsTabSelected),
            ),
            NavigationDestination(
              label: context.l10n.eventsTabName,
              icon: const _TabIcon(iconPath: Assets.eventsTab),
              selectedIcon: const _TabIcon(iconPath: Assets.eventsTabSelected),
            ),
            NavigationDestination(
              label: context.l10n.exploreTabName,
              icon: const _TabIcon(iconPath: Assets.exploreTab),
              selectedIcon: const _TabIcon(iconPath: Assets.exploreTabSelected),
            ),
          ],
          onDestinationSelected: _goBranch,
        ),
      ),
    );
  }
}

class _TabIcon extends StatelessWidget {
  const _TabIcon({
    required this.iconPath,
  });

  final String iconPath;

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      iconPath,
      colorFilter: const ColorFilter.mode(
        Color(0xff4D4C4C),
        BlendMode.srcIn,
      ),
      width: 24,
      height: 24,
    );
  }
}
