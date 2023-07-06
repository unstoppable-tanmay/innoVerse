import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:slide_drawer/slide_drawer.dart';

class Appbar extends StatelessWidget implements PreferredSizeWidget {
  const Appbar(
      {super.key,
      required this.title,
      required this.appBar,
      required this.action});

  final String title;
  final AppBar appBar;
  final bool action;

  @override
  Size get preferredSize => Size.fromHeight(appBar.preferredSize.height);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      automaticallyImplyLeading: false,
              expandedHeight:50,
              floating: true,
              snap: true,
      title: Text(
        title,
        style: const TextStyle(fontWeight: FontWeight.w500),
      ),
      centerTitle: true,
      backgroundColor: const Color(0xfff1f5f7),
      // surfaceTintColor: const Color(0xfff1f5f7),
      // elevation: 10,
      actions: [
        if (action == true)
          Builder(
              builder: (context) => InkWell(
                  onTap: () {
                    SlideDrawer.of(context)?.toggle();
                  },
                  child: const Icon(FontAwesomeIcons.barsStaggered)))
        else
          const SizedBox(),
        if (action == true)
          const SizedBox(
            width: 20,
          )
        else
          const SizedBox()
      ],
    );
  }
}
