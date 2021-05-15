import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:sinemabilet/views/anaekran.dart';
import 'package:sinemabilet/views/ayarlar.dart';
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
          icon: Icon(Icons.movie),
          title: "Satın Al",
        ),
        TabNavigationItem(
          page: sinema(),
          icon: Icon(Icons.theaters),
          title: "Sinemalar",
        ),
        TabNavigationItem(
          page: ayarlar(),
          icon: Icon(Icons.account_circle),
          title: "Kullanıcı",
        ),
      ];
}
