import 'package:flutter/material.dart';
import '../constaints.dart';
import '../interests/controlers_interests.dart';

class TopBar extends StatelessWidget {
  final bool _showDesktop;
  // ignore: use_key_in_widget_constructors
  const TopBar([this._showDesktop = false]);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: topBarHeight,
      padding: const EdgeInsets.symmetric(horizontal: componentPadding),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Text(
                    interestRowCurrent['interestName'] + ' Dashboard',
                    style: const TextStyle(
                        fontSize: 24, fontWeight: FontWeight.w600),
                  ),
                ),
                Positioned(
                  child: Container(
                    height: 4,
                    width: 60,
                    decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor,
                        borderRadius: BorderRadius.circular(4)),
                  ),
                  bottom: 0,
                  left: 0,
                )
              ],
            ),
          ),
          Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
            IconButton(
              icon: Icon(
                Icons.search,
                color: Theme.of(context).primaryColor,
              ),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(
                Icons.notifications_outlined,
                color: Theme.of(context).primaryColor,
              ),
              onPressed: () {},
            ),
            _showDesktop
                ? const SizedBox.shrink()
                : IconButton(
                    icon: Icon(
                      Icons.article_outlined,
                      color: Theme.of(context).primaryColor,
                    ),
                    onPressed: () {
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //       builder: (context) => const NewsPage()),
                      // );
                    },
                  )
          ])
        ],
      ),
    );
  }
}
