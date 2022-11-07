import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class NavigationMenu extends StatelessWidget {
  const NavigationMenu({
    Key? key,
    required this.selected,
    required this.items,
    this.header,
    this.footer,
  }) : super(key: key);

  final int selected;
  final List<CategoryNavigationItemMenu> items;
  final Widget? header;
  final Widget? footer;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).scaffoldBackgroundColor,
      width: 250,
      child: Column(
        children: [
          if (header != null) ...[
            Padding(
              padding: const EdgeInsets.all(16),
              child: header!,
            ),
          ],
          Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) => items[index],
              itemCount: items.length,
            ),
          ),
          if (footer != null) ...[
            Padding(
              padding: const EdgeInsets.all(16),
              child: footer!,
            ),
          ],
        ],
      ),
    );
  }
}

class CategoryNavigationItemMenu extends StatelessWidget {
  const CategoryNavigationItemMenu({
    Key? key,
    required this.category,
    required this.items,
  }) : super(key: key);

  final String category;
  final List<NavigationItemMenu> items;

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: Text(category),
      initiallyExpanded: true,
      children: items,
    );
  }
}

class NavigationItemMenu extends StatelessWidget {
  const NavigationItemMenu({
    Key? key,
    required this.path,
    required this.label,
    required this.icon,
  }) : super(key: key);

  final String path;
  final String label;
  final Widget icon;

  @override
  Widget build(BuildContext context) {
    final selected = Uri.parse(GoRouter.of(context).location).path == path;

    return ListTile(
      leading: icon,
      title: Text(label),
      horizontalTitleGap: 0,
      dense: true,
      selected: selected,
      onTap: () => context.go(path),
    );
  }
}
