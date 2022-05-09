import 'package:flutter/material.dart';

import '../../interests/controlers_interests.dart';
import '../constaints.dart';
import '../../pages/model.dart';
import '../widgets/sidebar_menu_item.dart';

IconButton byRows() {
  return IconButton(
      onPressed: () {
        dashboardPageCurrent.value = 'LastNew1Page';
      },
      icon: const Icon(Icons.table_rows));
}

class SideBar extends StatelessWidget {
  const SideBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<MenuItem> menuItems = [
      MenuItem('By rows', Icons.table_rows, byRows()),
      MenuItem('By values', Icons.dashboard_outlined, byRows()),
      MenuItem('Select1', Icons.filter_alt, byRows()),
      MenuItem('Contact', Icons.contact_mail, byRows()),
    ];

    final Size _size = MediaQuery.of(context).size;
    final bool _isDesktop = _size.width >= screenLg;
    return Container(
      decoration: const BoxDecoration(color: primary),
      width: _isDesktop ? sideBarDesktopWidth : sideBarMobileWidth,
      padding:
          EdgeInsets.symmetric(vertical: 24, horizontal: _isDesktop ? 24 : 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8), color: primaryAncient),
            //width: 45,
            height: 45,
            child: Center(
              child: Text(
                interestTitles[0],
                style: const TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ),
          ),
          const SizedBox(
            height: 24,
          ),
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children:
                menuItems.map((e) => SideBarMenuItem(e, _isDesktop)).toList(),
          ))
        ],
      ),
    );
  }
}
