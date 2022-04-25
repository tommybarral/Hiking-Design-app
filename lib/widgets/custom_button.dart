import 'package:flutter/material.dart';
import 'package:hiking_design_app/constants.dart';

class CustomButton extends StatelessWidget {

  bool isResponsive;
  double width;

  CustomButton({Key? key, required this.isResponsive, required this.width}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55,
      width: width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: AppColors.mainColor
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(width: 20,),
          Image.network('https://d29fhpw069ctt2.cloudfront.net/icon/image/39097/preview.png', color: Colors.white,),
        ],
      ),
    );
  }
}
