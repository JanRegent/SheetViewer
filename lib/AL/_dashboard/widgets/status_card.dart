import 'package:flutter/material.dart';
import '../constaints.dart';
import '../../pages/model.dart';

class StatusCard extends StatefulWidget {
  final BussinessStatus data;

  // ignore: use_key_in_widget_constructors
  const StatusCard(this.data);

  @override
  _StatusCardState createState() => _StatusCardState();
}

class _StatusCardState extends State<StatusCard> {
  bool _isHover = false;
  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (e) {
        setState(() {
          _isHover = true;
        });
      },
      onExit: (e) {
        setState(() {
          _isHover = false;
        });
      },
      child: Container(
        // height: 200,
        decoration: BoxDecoration(
            boxShadow: const [
              BoxShadow(
                  color: Color.fromRGBO(137, 181, 162, 0.56),
                  blurRadius: 16,
                  spreadRadius: 0,
                  offset: Offset(0, -2))
            ],
            borderRadius: BorderRadius.circular(16),
            color: _isHover ? primary : Colors.white),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                child: Icon(
                  widget.data.icon,
                  color: _isHover ? primary : Colors.white,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: _isHover ? Colors.white : primary,
                ),
                width: 56,
                height: 56,
              ),
              const SizedBox(
                height: 6,
              ),
              Text(
                widget.data.value.toString(),
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: _isHover ? Colors.white : primary),
              ),
              const SizedBox(
                height: 4,
              ),
              Text(
                widget.data.name,
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: _isHover ? Colors.white : primary),
              )
            ],
          ),
        ),
      ),
    );
  }
}
