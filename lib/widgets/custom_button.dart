import 'package:flutter/material.dart';
import 'package:hiking_design_app/constants.dart';

class CustomButton extends StatefulWidget {

  bool? isResponsive;
  //double height;
  double? width;

  CustomButton({Key? key,
    this.isResponsive,
    this.width = 120}) : super(key: key);

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Container(
        height: 60,
        width: widget.isResponsive! ? double.infinity : widget.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: AppColors.mainColor
        ),
        child: Row(
          mainAxisAlignment: widget.isResponsive! ? MainAxisAlignment.spaceEvenly : MainAxisAlignment.center,
          children: [
            Text(widget.isResponsive! ? 'Book your trip' : '', style: const TextStyle(fontSize: 20, fontStyle: FontStyle.italic, color: Colors.white),
            ),
            Image.network(
              'https://d29fhpw069ctt2.cloudfront.net/icon/image/39097/preview.png',
              color: Colors.white,
              height: 30,
            ),
          ],
        ),
      ),
    );
  }
}
