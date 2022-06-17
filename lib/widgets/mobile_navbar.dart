import 'package:flutter/material.dart';

import '../helpers/style.dart';

Widget mobileTopBar(GlobalKey<ScaffoldState> key) => AppBar(
      leading: IconButton(
        icon: Icon(
          Icons.menu,
          color: active,
        ),
        onPressed: () {
          key.currentState?.openDrawer();
        },
      ),
      title: Icon(
        Icons.note,
        size: 30,
        color: Colors.blue,
      ),
      centerTitle: true,
      elevation: 0,
      backgroundColor: bgColor,
    );
