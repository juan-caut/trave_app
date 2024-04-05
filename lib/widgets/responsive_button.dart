import 'package:flutter/material.dart';
import 'package:trave_app/misc/colors.dart';
import 'package:trave_app/widgets/app_text.dart';

class ResponsiveButton extends StatelessWidget {
  bool? isResponsive;
  double? width;
  ResponsiveButton({Key? key, this.width, this.isResponsive = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flexible(
        child: Container(
      width: isResponsive == true ? double.maxFinite : width,
      height: 60,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: AppColors.mainColor,
      ),
      child: Row(
          mainAxisAlignment: isResponsive == true
              ? MainAxisAlignment.center
              : MainAxisAlignment.center,
          children: [
            isResponsive == true
                ? AppText(text: "book trip now", color: Colors.white)
                : Text(
                    "Next",
                    style: TextStyle(
                        color: Colors.white60,
                        fontSize: 15,
                        fontWeight: FontWeight.bold),
                  ),
            /*
            Text(
              "Next",
              style: TextStyle(
                  color: Colors.white60,
                  fontSize: 15,
                  fontWeight: FontWeight.bold),
            ),*/
            //Image.asset("img/button-one.png")
          ]),
    ));
  }
}
