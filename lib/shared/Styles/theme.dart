import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hexcolor/hexcolor.dart';

ThemeData TheTheme =ThemeData(
                    primarySwatch: Colors.red,
                    scaffoldBackgroundColor:HexColor('EAB16F'),
                    
                    appBarTheme:  AppBarTheme(
                    backwardsCompatibility: false,
                    systemOverlayStyle: SystemUiOverlayStyle(
                    statusBarColor: HexColor('EAB16F'),
                    statusBarIconBrightness: Brightness.light,
                    ),
                    backgroundColor:HexColor('EAB16F'),
                    elevation: 0.0,
                    
                    titleTextStyle: TextStyle(
                    color:Colors.white,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    ),
                    
                    iconTheme: IconThemeData(
                      color: Colors.white,
                    ),
                    
                    ),
                    
                    bottomNavigationBarTheme: BottomNavigationBarThemeData(
                      type: BottomNavigationBarType.fixed,
                      selectedItemColor: HexColor('EAB16F'),
                      unselectedItemColor: Colors.black, 
                      elevation: 80.0,
                      backgroundColor: Colors.white,
                    ),
                    
                    textTheme: TextTheme(
                      bodyText1: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.w600,
                        color:Colors.white,
                      ),
                    ),
                      
                    iconTheme: IconThemeData(
                      color: Colors.white,
                      size: 50.0
                    ), 
                 
                  ) ; 
