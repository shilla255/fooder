import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../main.dart';

class EnhancedAppBar extends ConsumerWidget implements PreferredSizeWidget {
  final Function onThemeSwitch;

  const EnhancedAppBar({super.key, required this.onThemeSwitch});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(themeProvider);

    return Container(
      decoration: BoxDecoration(
        color: themeMode == ThemeMode.light ? Colors.white : Colors.black,
        borderRadius: const BorderRadius.vertical(
          bottom: Radius.circular(14),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            spreadRadius: 0.4,
            blurRadius: 0,
            offset: const Offset(0, 0), // changes position of shadow
          ),
        ],
      ),
      child: AppBar(
        leading: IconButton(
          icon: Icon(CupertinoIcons.bars, color: themeMode == ThemeMode.light ? Colors.black : Colors.white),
          onPressed: () {
            Scaffold.of(context).openDrawer();
          },
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          IconButton(
            icon: Icon(CupertinoIcons.moon_stars, color: themeMode == ThemeMode.light ? Colors.black : Colors.white),
            onPressed: () {
              onThemeSwitch();
            },
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(60.0);
}