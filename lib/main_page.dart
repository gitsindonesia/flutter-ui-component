import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gits_flutter_ui_component/constants/gits_images.dart';
import 'package:gits_flutter_ui_component/cubit/global_cubit.dart';
import 'package:gits_flutter_ui_component/widgets/gits_spacing.dart';
import 'package:gits_flutter_ui_component/widgets/navigation_menu.dart';

import 'routes.dart';

class MainPage extends StatefulWidget {
  const MainPage({
    Key? key,
    required this.child,
  }) : super(key: key);

  final Widget child;

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  List<CategoryNavigationItemMenu> _masterCategoryNavigation = [];
  List<CategoryNavigationItemMenu> _searchCategoryNavigation = [];

  @override
  void initState() {
    super.initState();
    _masterCategoryNavigation = Routes.navigation
        .map((e) => CategoryNavigationItemMenu(
            category: e.category,
            items: e.navigations
                .map((e) => NavigationItemMenu(
                      path: e.path,
                      label: e.label,
                      icon: e.icon,
                    ))
                .toList()))
        .toList();
    _searchCategoryNavigation = List.from(_masterCategoryNavigation);
  }

  void onSearchNavigationChanged(String value) {
    setState(() {
      _searchCategoryNavigation = _masterCategoryNavigation
          .map((e) => CategoryNavigationItemMenu(
              category: e.category,
              items: e.items
                  .where((element) =>
                      element.label.toLowerCase().contains(value.toLowerCase()))
                  .toList()))
          .where((element) => element.items.isNotEmpty)
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    final isSmall = MediaQuery.of(context).size.width < 600;

    return Scaffold(
      appBar: isSmall
          ? AppBar(title: const Text('GITS Flutter UI Component'))
          : null,
      drawer: isSmall
          ? SideMenu(
              onSearchNavigationChanged: onSearchNavigationChanged,
              items: _searchCategoryNavigation,
            )
          : null,
      body: Row(
        children: [
          if (!isSmall)
            SideMenu(
              onSearchNavigationChanged: onSearchNavigationChanged,
              items: _searchCategoryNavigation,
            ),
          const VerticalDivider(thickness: 1, width: 1),
          Expanded(child: widget.child),
        ],
      ),
    );
  }
}

class SideMenu extends StatelessWidget {
  const SideMenu({
    Key? key,
    required this.onSearchNavigationChanged,
    required this.items,
  }) : super(key: key);

  final ValueChanged<String> onSearchNavigationChanged;
  final List<CategoryNavigationItemMenu> items;

  @override
  Widget build(BuildContext context) {
    final isDark = context.select((GlobalCubit bloc) => bloc.state.themeMode) ==
        ThemeMode.dark;

    return NavigationMenu(
      selected: 0,
      header: Column(
        children: [
          Image.asset(
            isDark ? GitsImages.gitsLight : GitsImages.gitsDark,
            width: 150,
            fit: BoxFit.contain,
          ),
          const GitsSpacing.vertical16(),
          TextField(
            onChanged: onSearchNavigationChanged,
            decoration: const InputDecoration(
              hintText: 'Search',
              prefixIcon: Icon(Icons.search),
              isDense: true,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(8)),
              ),
            ),
          ),
        ],
      ),
      footer: Column(
        children: [
          Builder(builder: (context) {
            final themeMode =
                context.select((GlobalCubit bloc) => bloc.state.themeMode);

            return SwitchListTile(
              value: themeMode == ThemeMode.dark,
              title: const Text('Dark Mode'),
              onChanged: (value) {
                context.read<GlobalCubit>().toggleDarkMode();
              },
            );
          }),
          const GitsSpacing.vertical16(),
          const Text('GITS Indonesia, 2023'),
        ],
      ),
      items: items,
    );
  }
}
