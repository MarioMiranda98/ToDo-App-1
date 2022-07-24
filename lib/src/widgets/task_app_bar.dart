import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TaskAppBar extends SliverAppBar {
  TaskAppBar({
    List<Widget> actions = const [],
    pinned = false,
    snap = false,
    floating = false,
    title = '',
    leading,
    Key? key
  }) : super(
    key: key,
    pinned: pinned,
    snap: snap,
    floating: floating,
    expandedHeight: 140.0,
    leading: leading,
    flexibleSpace: FlexibleSpaceBar(
      title: Text(
        title, 
        style: TextStyle(
          color: Theme.of(Get.context!).colorScheme.secondary,
          fontWeight: FontWeight.bold
        )
      ),
      background: const Image(
         image: AssetImage('assets/appbar_assets/check_list_image.png'),
      )
    )
  );
}