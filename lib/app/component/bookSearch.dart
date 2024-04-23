import 'package:sota/app/component/starRating.dart';
import 'package:sota/app/data/models/response_bookSearch.dart';
import 'package:flutter/material.dart';
import 'package:sota/app/routes/app_pages.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class BookSearch extends StatelessWidget {
  const BookSearch({
    super.key,
    required this.data,
  });

  final List<DataBukuSearch> data;
  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, childAspectRatio: 0.5, mainAxisSpacing: 10, crossAxisSpacing: 20),
        shrinkWrap: true,
        itemCount: data.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () => Get.toNamed(Routes.DETAILBOOK, parameters: {"idbook" : data[index].bukuID.toString()}),
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(image: NetworkImage(data[index].coverBuku.toString()), fit: BoxFit.cover),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    height: 140,
                    width: 100,
                    child: Image.network(data[index].coverBuku.toString(),
                        fit: BoxFit.fill),
                  ),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Text(data[index].judul.toString(),style: TextStyle(fontFamily: GoogleFonts.poppins(fontWeight: FontWeight.bold).fontFamily),maxLines: 1,overflow: TextOverflow.ellipsis,),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Text(data[index].deskripsi.toString(),maxLines: 3,overflow: TextOverflow.ellipsis),
                          ),
                          StarRating(
                            rating: data[index].rating!.toDouble(),
                            starColor: const Color(0xFF1E0342),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}