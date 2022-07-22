import 'package:flutter/material.dart';

class TaskAppBar extends SliverAppBar {
  TaskAppBar({
    List<Widget> actions = const [],
    pinned = false,
    snap = false,
    floating = false,
    title = '',
  }) : super(
    pinned: pinned,
    snap: snap,
    floating: floating,
    expandedHeight: 140.0,
    flexibleSpace: FlexibleSpaceBar(
      title: Text(title),
      background: const Image(
         image: AssetImage('assets/appbar_assets/check_list_image.png'),
      )
    )
  );
}