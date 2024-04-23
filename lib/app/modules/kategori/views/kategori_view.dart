import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sota/app/component/kategoriBuild.dart';

import '../controllers/kategori_controller.dart';

class KategoriView extends GetView<KategoriController> {
   const KategoriView({Key? key}) : super(key: key);
   
  @override
  Widget build(BuildContext context) {
    final heightFullBody =
        MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top;
    final widthFullBody = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title:  Text(controller.kategori.toString(),style: TextStyle(color: Colors.black,fontFamily: GoogleFonts.poppins().fontFamily,fontWeight: FontWeight.bold),),
        backgroundColor: const Color(0XFFFFFFFF),
        centerTitle: true,
        iconTheme: const IconThemeData(
          color: Colors.black
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
                  color: Color(0xFFF7DCB9)),
        width: widthFullBody,
        height: heightFullBody,
        child: controller.obx(
          (state) => Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20,),
              Expanded(
                child: BukuKategori(data: state!.state1!)
              ),
            ],
          ),
        ),
      ),
    );
  }
}
