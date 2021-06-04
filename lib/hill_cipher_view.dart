import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hill_cipher_app/helper/common_widgets/custom_text_form_field.dart';
import 'package:hill_cipher_app/helper/common_widgets/upper_tab_item.dart';
import 'package:hill_cipher_app/hill_cipher_view_model.dart';
import 'package:stacked/stacked.dart';
import 'helper/common_widgets/custom_button.dart';
import 'helper/common_widgets/validators.dart';
import 'helper/constants/app_colors.dart';
import 'helper/ui_helpers.dart';

//enum WidgetMarker { twoText, oneText_oneMatrix, AirConditioner,Blugs }
final _myKey = GlobalKey<FormState>();

class HillCipherView extends HookWidget{
  @override
  Widget build(BuildContext context) {
    final _hillCipherTextEditingController=useTextEditingController();
    final _keyHillCipherTextEditingController=useTextEditingController();
    final _hillCipherFocusNode=useFocusNode();
    final _keyHillCipherFocusNode=useFocusNode();
    final double upperListViewHeight=100;
    final lowerListViewHeight=screenHeight(context)-upperListViewHeight;
    final upperBackgroundColor=Theme.of(context).primaryColor;
    return ViewModelBuilder<HillCipherViewModel>.reactive(
        builder: (context,model,_)=>Scaffold(
          resizeToAvoidBottomInset: false,
          floatingActionButton: FloatingActionButton(
            onPressed:()=> model.changeFlag(),
            backgroundColor: upperBackgroundColor,
            elevation: 0,
            child: Text("?",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color: Theme.of(context).accentColor)),
          ),
          body: SafeArea(
            child: Column(
              children: [
                SizedBox(height: 10,),
               model.flag? Container(
                  height: upperListViewHeight,
                  child: ListView(
                    padding: EdgeInsets.all(10),
                    scrollDirection: Axis.horizontal,
                    children: [
                      GestureDetector(
                          onTap:()=>model.setIndex(0),
                          child: UpperTabItem(textIconData: Icons.short_text, text: "text",
                              color: borderColor, keyIconData: Icons.short_text,backgroundColor: model.index==0?appbarColor:upperBackgroundColor)),
                      SizedBox(width: 10,),
                      GestureDetector(
                        onTap:()=>model.setIndex(1),
                        child: UpperTabItem(textIconData: Icons.short_text, text: "text",
                            color: borderColor, keyTextData: "[ ]",backgroundColor: model.index==1?appbarColor:upperBackgroundColor),
                      ),
                      SizedBox(width: 10,),
                      GestureDetector(
                        onTap:()=>model.setIndex(2),
                        child: UpperTabItem(textData: "[ ]", text: "text",
                            color: borderColor, keyIconData: Icons.short_text,backgroundColor: model.index==2?appbarColor:upperBackgroundColor),
                      ),
                      SizedBox(width: 10,),
                      GestureDetector(
                        onTap:()=>model.setIndex(3),
                        child: UpperTabItem(textData: "[ ]", text: "text",
                            color: borderColor, keyTextData: "[ ]",backgroundColor: model.index==3?appbarColor:upperBackgroundColor),
                      ),

                    ],
                  ),
                ):SizedBox.shrink(),
                Expanded(
                  child: Container(
//                    height:lowerListViewHeight,
                    child: Form(
                      key: _myKey,
                      child: ListView(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        children: [
                          SizedBox(height: 20,),
                          Text("Plain text:",style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold,color: Theme.of(context).primaryColor),),
                          SizedBox(height: 10,),
                          CustomTextFormField(
                            counterTextShow: false,
                            focusBorderColor: Theme.of(context).primaryColor,
                            enableBorderColor: Theme.of(context).textSelectionTheme.selectionColor,
                            validator: plainTextValidator,
                            enabled: true,
                            controller: _hillCipherTextEditingController,
                            focusNode: _hillCipherFocusNode,
                            nextFocusNode: _keyHillCipherFocusNode,
                            onSaved: (value)=>model.setText(value),
                          ),
                          SizedBox(height: 20,),
                          Text("Key in text:",style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold, color: Theme.of(context).primaryColor),),
                          SizedBox(height: 10,),
                          CustomTextFormField(
                            counterTextShow: false,
                            focusBorderColor: Theme.of(context).primaryColor,
                            enableBorderColor: Theme.of(context).textSelectionTheme.selectionColor,
                            validator: keyValidator,
                            enabled: true,
                            controller: _keyHillCipherTextEditingController,
                            focusNode: _keyHillCipherFocusNode,
                            textInputAction: TextInputAction.done,
                            enterPressed: ()=>_keyHillCipherFocusNode.unfocus(),
                            onSaved: (value)=>model.setKey(value),
                          ),
                          SizedBox(height: 20,),
                          CustomButton(
                               color: Theme.of(context).primaryColor,
                              iconColor:Theme.of(context).accentColor ,
                              iconData:Icons.done,
                              onTap: (){
                                if(validateAndSaveForm(_myKey)){
                                model.hillCipher();
                                }
                              }),
                          SizedBox(height: 20,),
                          model.cipherText!=""?
                          Text("Cipher text: ${model.cipherText}",style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold,color: Theme.of(context).primaryColor),)
                          :SizedBox.shrink(),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        viewModelBuilder: ()=>HillCipherViewModel());
  }
}
