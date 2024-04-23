import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sota/app/data/constans/constans.dart';
import 'package:sota/app/data/models/response_kategori.dart';
import 'package:sota/app/routes/app_pages.dart';

class MyKategori extends StatelessWidget {
  const MyKategori({super.key, required this.data});
  final List<DataKategori> data;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: SizedBox(
          height: MediaQuery.of(context).size.height * 0.05,
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: data
                  .map(
                    (e) => Row(
                      children: [
                        GestureDetector(
                          onTap: () => Get.toNamed(Routes.KATEGORI, parameters: {"kategori" : e.namaKategori.toString()}),
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 5),
                            decoration: BoxDecoration(
                              color: kSecondaryColor,
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Text(
                              e.namaKategori.toString(),
                              style: TextStyle(
                                fontFamily:
                                    GoogleFonts.poppins(fontWeight: FontWeight.w500)
                                        .fontFamily,
                                color: kPrimaryColor,
                                fontSize: 18,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: MediaQuery.of(context).size.width * 0.05)
                      ],
                    ),
                  )
                  .toList(),
            ),
          )),
    );
  }
}
