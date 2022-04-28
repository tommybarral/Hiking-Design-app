import 'package:flutter/material.dart';
import '../constants.dart';

class NBPerson extends StatelessWidget {

  final Color color;
  String? text;
  IconData? icon;
  final Color backgroundColor;
  final double size;
  final Color borderColor;
  bool? isIcon;

  NBPerson({Key? key,
    this.isIcon = false,
    required this.color,
    this.text = '1',
    this.icon,
    required this.backgroundColor,
    required this.size,
    required this.borderColor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size,
      width: size,
      decoration: BoxDecoration(
        border: Border.all(color: borderColor, width: 1),
        color: backgroundColor,
        borderRadius: BorderRadius.circular(15),
      ),
      child: isIcon == false ? Center(child: Text(text!, style: TextStyle(color: color),)) : Center(child: Icon(icon, color: color,)),
    );
  }
}
