import 'package:flutter/material.dart';
import 'package:store/presentation/resources/color_manager.dart';
import 'package:store/presentation/resources/font_manager.dart';
import 'package:store/presentation/resources/styles_manager.dart';
import 'package:store/presentation/resources/values_manager.dart';

ThemeData getAppTheme(){
  return ThemeData(
    //main color of the app
    primaryColor:ColorManager.primary,
    primaryColorLight: ColorManager.primaryOpacity,
    primaryColorDark: ColorManager.primaryDark,
    disabledColor: ColorManager.grey1,
    accentColor: ColorManager.grey,
    //card view theme
    cardTheme: CardTheme(
      color: ColorManager.white,
      shadowColor: ColorManager.grey,
      elevation: AppSize.s4,
    ),
    //appBar theme
    appBarTheme: AppBarTheme(
      centerTitle: true,
      elevation: AppSize.s4,
      color: ColorManager.primary,
      shadowColor: ColorManager.primaryOpacity,
      titleTextStyle: getRegularStyle(color: ColorManager.white,fontSize: FontSize.s16)
    ),
    //button theme
    buttonTheme: ButtonThemeData(
      shape: const StadiumBorder(),
      disabledColor: ColorManager.grey,
      buttonColor: ColorManager.primary,
      splashColor: ColorManager.primaryOpacity,
    ),
    //elevated button theme
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        textStyle: getRegularStyle(color: ColorManager.white),
        primary: ColorManager.primary,
        shape:  RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppSize.s12)),

      )
    ),
    //text theme
    textTheme: TextTheme(
      headline1:getSemiBoldStyle(color: ColorManager.darkGrey,fontSize: FontSize.s16) ,
      subtitle1:getMediumStyle(color: ColorManager.lightGrey,fontSize: FontSize.s14) ,
      subtitle2:getMediumStyle(color: ColorManager.primary,fontSize: FontSize.s16) ,
      caption: getRegularStyle(color: ColorManager.grey1),
      bodyText1:getRegularStyle(color: ColorManager.grey),
    ),
    //input decoration theme
    inputDecorationTheme: InputDecorationTheme(
      contentPadding:const EdgeInsets.all(AppSize.s8) ,
      //label style
      labelStyle: getMediumStyle(color:ColorManager.darkGrey),
      //hint style
      hintStyle:  getRegularStyle(color: ColorManager.grey1),
      //error style
      errorStyle: getRegularStyle(color: ColorManager.error),

      //enable border style
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color:ColorManager.grey ,width: AppSize.s1_5),
        borderRadius: BorderRadius.all(Radius.circular(AppSize.s8)),
      ),

      //focus border style
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color:ColorManager.primary ,width: AppSize.s1_5),
        borderRadius: BorderRadius.all(Radius.circular(AppSize.s8)),
      ),

      //error border
      errorBorder: OutlineInputBorder(
        borderSide: BorderSide(color:ColorManager.error ,width: AppSize.s1_5),
        borderRadius: BorderRadius.all(Radius.circular(AppSize.s8)),
      ),

      //error focused border
      focusedErrorBorder: OutlineInputBorder(
        borderSide: BorderSide(color:ColorManager.primary ,width: AppSize.s1_5),
        borderRadius: BorderRadius.all(Radius.circular(AppSize.s8)),
      ),

    )
  );
}