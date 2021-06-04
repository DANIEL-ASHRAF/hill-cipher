import 'package:flutter/material.dart';

class UpperTabItem extends StatelessWidget {
  const UpperTabItem({Key? key,
    this.textIconData:Icons.error ,
    required this.text ,
    required this.color,
    this.keyTextData,
    required this.backgroundColor,
    this.textData,
    this.keyIconData:Icons.error }) : super(key: key);
  final String? textData;
  final IconData? textIconData;
  final String? keyTextData;
  final IconData?keyIconData;
  final String text;
  final Color color;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(10),
//        border: Border.all(
//        color: color,
//            width: 5
//        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(width: 3,),
              Text("Text",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold, color: color,),),
              Icon(Icons.arrow_forward,color: color,),
              Container(
                  height: 30,width: 30,
                  child: Center(child:textData!=null? Text(textData!,style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold, color: color,),)
                      :Icon(textIconData,color: color,size: 30,),
                  ),
               ),
              SizedBox(width: 3,),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(width: 3,),
              Text("Key",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold, color: color,),),
              Icon(Icons.arrow_forward,color: color,),
              Container(
                height: 30,width: 30,
                child: Center(child:keyTextData!=null? Text(keyTextData!,style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold, color: color,),)
                    :Icon(keyIconData,color: color,size: 30,),
                ),
              ),
              SizedBox(width: 3,),
            ],
          ),
        ],
      ),
    );
  }
}
