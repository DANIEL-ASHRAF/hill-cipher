import 'package:flutter/material.dart';
import 'package:hill_cipher_app/helper/constants/app_colors.dart';
import '../ui_helpers.dart';

class CustomButton extends StatelessWidget {
  CustomButton({
    required this.onTap,
    this.text,
    this.color:brownColor,
    this.iconColor:Colors.white,
    this.iconData,
    this.isLoading:false});
  final VoidCallback onTap;
  final bool isLoading;
  final String? text;
  final Color color;
  final iconColor;
  final IconData? iconData;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: MediaQuery.of(context).size.width / 2,
        height: MediaQuery.of(context).size.width / 7,
        child: Center(
            child:!isLoading?iconData!=null?
            Icon(iconData,color: iconColor,size:screenWidth(context)*.095,):
            Text(text!,
                maxLines: 1,textScaleFactor: 1,
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontStyle: FontStyle.normal,
                  fontSize: screenWidth(context)*.066,
                )):CircularProgressIndicator()),
        decoration: BoxDecoration(
          color: color,
            boxShadow: [
              BoxShadow(
                color: Color.fromRGBO(0, 0, 0, 0.16),
                offset: Offset(0, 5),
                blurRadius: 10.0,
              )
            ],
            borderRadius: BorderRadius.circular(10.0)),
      ),
    );
  }
}
