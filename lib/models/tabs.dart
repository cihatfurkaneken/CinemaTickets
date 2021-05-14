import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:sinemabilet/views/anaekran.dart';
import 'package:sinemabilet/views/giris.dart';
import 'package:sinemabilet/views/sinema.dart';

class TabNavigationItem {
  final Widget page;
  final String title;
  final Icon icon;

  TabNavigationItem({
    @required this.page,
    @required this.title,
    @required this.icon,
  });

  static List<TabNavigationItem> get items => [
        TabNavigationItem(
          page: anaekran(),
          icon: Icon(Icons.home),
          title: "Home",
        ),
        TabNavigationItem(
          page: sinema(),
          icon: Icon(Icons.shopping_basket),
          title: "Shop",
        ),
        TabNavigationItem(
          page: giris(),
          icon: Icon(Icons.search),
          title: "Search",
        ),
      ];
}
