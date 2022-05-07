// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import '../constaints.dart';
import '../model.dart';

class SideBarMenuItem extends StatefulWidget {
  final MenuItem item;
  final bool isDesktop;
  const SideBarMenuItem(this.item, [this.isDesktop = false]);

  @override
  _MenuItemState createState() => _MenuItemState();
}

class _MenuItemState extends State<SideBarMenuItem> {
  var _bgColor = Colors.transparent;
  var _iconColor = Colors.white;
  @override
  Widget build(BuildContext context) {
    return MouseRegion(
        onEnter: (e) {
          setState(() {
            _bgColor = Colors.white;
            _iconColor = primary;
          });
        },
        onExit: (e) {
          setState(() {
            _bgColor = Colors.transparent;
            _iconColor = Colors.white;
          });
        },
        child: Container(
          width: widget.isDesktop ? null : 44,
          height: 44,
          padding: const EdgeInsets.symmetric(horizontal: 8),
          margin: const EdgeInsets.symmetric(vertical: 8),
          decoration: BoxDecoration(
              color: _bgColor, borderRadius: BorderRadius.circular(8)),
          child: Row(
            mainAxisAlignment: widget.isDesktop
                ? MainAxisAlignment.start
                : MainAxisAlignment.center,
            children: [
              Icon(
                widget.item.icon,
                size: 20,
                color: _iconColor,
              ),
              if (widget.isDesktop) ...[
                const SizedBox(
                  width: 16,
                ),
                Text(
                  widget.item.name,
                  style: TextStyle(
                    color: _iconColor,
                  ),
                )
              ] else
                const SizedBox.shrink(),
            ],
          ),
        ));
  }
}
