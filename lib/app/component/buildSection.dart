import 'package:get/get.dart';
import 'package:sota/app/data/models/response_buku.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sota/app/routes/app_pages.dart';
import '../data/constans/constans.dart';

class buildSection extends StatelessWidget {
  const buildSection({
    super.key,
    required this.data,
  });

  final DataBuku data;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                data.kategoriBuku.toString(),
                style: TextStyle(
                  fontWeight: FontWeight.w900,
                  fontFamily: GoogleFonts.poppins(fontWeight: FontWeight.w400)
                      .fontFamily,
                  fontSize: 17.0,
                  color: const Color(0XFF000000),
                ),
              ),
              GestureDetector(
                onTap: () => null,
                child: Text(
                  "View All",
                  style: TextStyle(
                    fontWeight: FontWeight.w900,
                    fontFamily: GoogleFonts.poppins(fontWeight: FontWeight.w400)
                        .fontFamily,
                    fontSize: 17.0,
                    color: const Color(0XFF000000),
                  ),
                ),
              )
            ],
          ),
        ),
        SizedBox(
          width: double.infinity,
          height: MediaQuery.of(context).size.height * 0.15,
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Row(
                children: data.buku!
                    .map((e) => SizedBox(
                          width: MediaQuery.of(context).size.width * 0.52,
                          child: GestureDetector(
                            onTap: () => Get.toNamed(Routes.DETAILBOOK, parameters: {"idbook" : e.bukuID.toString()}),
                            child: Column(
                              children: [
                                Expanded(
                                  flex: 20,
                                  child: Container(
                                    width:
                                        MediaQuery.of(context).size.width * 0.5,
                                    decoration: BoxDecoration(
                                      borderRadius: const BorderRadius.only(topLeft: Radius.circular(10),topRight: Radius.circular(10)),
                                      image: DecorationImage(
                                          image: NetworkImage(
                                              e.coverBuku.toString()),
                                          fit: BoxFit.cover),
                                    ),
                                  ),
                                ),
                                ClipRRect(
                                  borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(10), bottomRight: Radius.circular(10)),
                                  child: ColoredBox(
                                    color: const Color(0xFF000000),
                                    child: SizedBox(
                                      width:
                                          MediaQuery.of(context).size.width * 0.5,
                                      height:
                                          MediaQuery.of(context).size.height * 0.03,
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          const SizedBox(
                                            width: 5,
                                          ),
                                          const Icon(
                                            size: 20.0,
                                            Icons.star_border_outlined,
                                            color: Color(0xFFFFFFFF),
                                          ),
                                          const SizedBox(
                                            width: 5,
                                          ),
                                          Text(
                                            textAlign: TextAlign.center,
                                            maxLines: 1,
                                            e.rating!.toStringAsFixed(1),
                                            style: TextStyle(
                                              height: 1.2,
                                              fontWeight: FontWeight.w900,
                                              fontFamily:
                                                  GoogleFonts.poppins().fontFamily,
                                              fontSize: 15.0,
                                              color: const Color(0xFFFFFFFF),
                                            ),
                                          ),
                                          const SizedBox(
                                            width: 10,
                                          ),
                                          Text(
                                            textAlign: TextAlign.center,
                                            maxLines: 1,
                                            e.judul.toString().length > 10 ? '${e.judul!.substring(0, 10)}...' : e.judul.toString(),
                                            style: TextStyle(
                                              height: 1.2,
                                              fontWeight: FontWeight.w900,
                                              fontFamily:
                                                  GoogleFonts.poppins().fontFamily,
                                              fontSize: 15.0,
                                              color: const Color(0xFFFFFFFF),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ))
                    .toList(),
              ),
            ),
          ),
        )
      ],
    );
  }
}
