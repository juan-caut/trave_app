import 'package:flutter/material.dart';
import 'package:trave_app/misc/colors.dart';

class ResponsiveButton extends StatelessWidget {
  bool? isResponsive;
  double? width;
  ResponsiveButton({Key? key, this.width, this.isResponsive=false}):super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: 60,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: AppColors.mainColor,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Next",style: TextStyle(
            color:Colors.white60,
            fontSize: 15,
            fontWeight: FontWeight.bold
            ),
            ),
          //Image.asset("img/button-one.png")
        ]),
    );
    
  }
}