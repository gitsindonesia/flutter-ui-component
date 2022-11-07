import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gits_flutter_ui_component/constants/gits_images.dart';
import 'package:gits_flutter_ui_component/cubit/global_cubit.dart';
import 'package:gits_flutter_ui_component/widgets/navigation_menu.dart';

import 'routes.dart';

class MainPage extends StatelessWidget {
  const MainPage({
    Key? key,
    required this.child,
  }) : super(key: key);

  final Widget child;

  Widget sideMenu(BuildContext context, bool isDark) => NavigationMenu(
        selected: 0,
        header: Image.asset(
          isDark ? GitsImages.gitsLight : GitsImages.gitsDark,
          width: 150,
          fit: BoxFit.contain,
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
            const SizedBox(height: 16),
            const Text('GITS Indonesia, 2022'),
          ],
        ),
        items: Routes.navigation
            .map((e) => CategoryNavigationItemMenu(
                category: e.category,
                items: e.navigations
                    .map((e) => NavigationItemMenu(
                          path: e.path,
                          label: e.label,
                          icon: e.icon,
                        ))
                    .toList()))
            .toList(),
      );

  @override
  Widget build(BuildContext context) {
    final isSmall = MediaQuery.of(context).size.width < 600;
    final isDark = context.select((GlobalCubit bloc) => bloc.state.themeMode) ==
        ThemeMode.dark;

    return Scaffold(
      appBar: isSmall
          ? AppBar(title: const Text('GITS Flutter UI Component'))
          : null,
      drawer: isSmall ? sideMenu(context, isDark) : null,
      body: Row(
        children: [
          if (!isSmall) sideMenu(context, isDark),
          const VerticalDivider(thickness: 1, width: 1),
          Expanded(child: child),
        ],
      ),
    );
  }
}
