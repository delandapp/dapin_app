import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sota/app/component/myButton.dart';
import 'package:sota/app/routes/app_pages.dart';

import '../controllers/homescreen_controller.dart';

class HomescreenView extends GetView<HomescreenController> {
  const HomescreenView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final heightFullBody = MediaQuery.of(context).size.height;
    final widthFullBody = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
           color:  Color(0xFFF7DCB9)),
        padding: EdgeInsets.symmetric(vertical: heightFullBody / 10),
        height: heightFullBody,
        width: widthFullBody,
        child: LayoutBuilder(
          builder: (context, constraints) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AutoSizeText(
                    'PERPUSTAKAAN \n DIGITAL',
                    style: TextStyle(fontSize: constraints.minWidth * 0.06,fontFamily: GoogleFonts.inika().fontFamily,fontWeight: FontWeight.bold),
                    maxLines: 2,
                    textAlign: TextAlign.center,
                ),
                SizedBox(height: constraints.maxWidth * 0.065,),
                AutoSizeText(
                  'WELCOME',
                  style: TextStyle(fontSize: constraints.minWidth * 0.05,fontFamily: GoogleFonts.inika().fontFamily,fontWeight: FontWeight.w900),
                  maxLines: 1,
                  textAlign: TextAlign.center,
                ),
                const Expanded(
                  child: Image(
                    image: AssetImage("assets/logo.png"),
                  ),
                ),
                MyButton(widthFullBody: constraints.maxWidth, label: "Login", width: constraints.maxWidth / 2, height: constraints.maxHeight * 0.08,onTap: (){Get.toNamed(Routes.LOGIN);},controller: controller,),
                SizedBox(height: constraints.maxWidth * 0.04,),
                MyButton(widthFullBody: constraints.maxWidth, label: "Register", width: constraints.maxWidth / 2, height: constraints.maxHeight * 0.08,onTap: (){Get.toNamed(Routes.REGISTER);},controller: controller,)
              ],
            );
          },
        ),
      )
    );
  }
}


