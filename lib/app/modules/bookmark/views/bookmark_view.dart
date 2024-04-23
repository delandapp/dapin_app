import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sota/app/data/models/response_bookmark_book.dart';

import '../controllers/bookmark_controller.dart';

class BookmarkView extends GetView<BookmarkController> {
  const BookmarkView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final myAppBar = AppBar(
      backgroundColor: const Color(0xFFFFFFFF),
      title: const Text(
        'Favorit',
        style: TextStyle(color: Colors.black),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset(
            "assets/logo.png",
            width: 50,
            height: 20,
          ),
        )
      ],
    );

    final heightFullBody =
        MediaQuery.of(context).size.height - myAppBar.preferredSize.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: myAppBar,
      body: controller.obx(
        (state) => SafeArea(
          child: Container(
            padding: const EdgeInsets.all(10),
            decoration: const BoxDecoration(
           color:  Color(0xFFF7DCB9)),
            child: Obx(
              () => controller.dataBookmark.value
                  ? const Center(
                      child: Text("Tidak Ada Data"),
                    )
                  : ListView.builder(
                      itemCount: controller.listKoleksi.length,
                      itemBuilder: (context, index) {
                        return Dismissible(
                          onDismissed: (direction) async {
                            await controller.deleteKoleksi(
                                controller.listKoleksi[index].bukuID!.toInt());
                            if (controller.jumlahData.value == 0) {
                              await controller.getDataKoleksi();
                            }
                          },
                          confirmDismiss: (direction) {
                            return showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    title: Text('Confirm'),
                                    content: Text('Are you sure to delete ?'),
                                    actions: [
                                      Obx(
                                        () => ElevatedButton(
                                            onPressed: () {
                                              Navigator.of(context).pop(true);
                                            },
                                            child: controller.loading.value
                                                ? const CircularProgressIndicator()
                                                : const Text("Yes")),
                                      ),
                                      ElevatedButton(
                                          onPressed: () {
                                            Navigator.of(context).pop(false);
                                          },
                                          child: Text('No')),
                                    ],
                                  );
                                });
                          },
                          background: Container(
                            color: Colors.red,
                            child: Icon(
                              Icons.delete,
                              color: Colors.amber,
                              size: 25,
                            ),
                            alignment: Alignment.centerRight,
                            padding: EdgeInsets.only(right: 10),
                          ),
                          key: Key(index.toString()),
                          // Mengatur geser dari kanan ke kiri saja
                          direction: DismissDirection.endToStart,
                          child: ContentKoleksi(
                            width: width,
                            heightFullBody: heightFullBody,
                            data: controller.listKoleksi[index],
                          ),
                        );
                      },
                    ),
            ),
          ),
        ),
      ),
    );
  }
}

class ContentKoleksi extends StatelessWidget {
  const ContentKoleksi({
    super.key,
    required this.width,
    required this.data,
    required this.heightFullBody,
  });

  final double width;
  final DataBookmark data;
  final double heightFullBody;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      width: width,
      height: heightFullBody * 0.17,
      margin: EdgeInsets.only(bottom: heightFullBody * 0.02),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(10)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: SizedBox(
              width: width * 0.24,
              height: heightFullBody * 0.17,
              child: Image.network(
                data.coverBuku.toString(),
                fit: BoxFit.fill,
              ),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Expanded(
            flex: 10,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  children: [
                    const FaIcon(
                      FontAwesomeIcons.solidStar,
                      size: 20,
                      color: Colors.yellow,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      data.rating!.toStringAsFixed(1),
                      style: TextStyle(
                          fontFamily:
                              GoogleFonts.poppins(fontWeight: FontWeight.w700)
                                  .fontFamily,
                          fontSize: 20),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.justify,
                    ),
                  ],
                ),
                Text(
                  data.judul.toString(),
                  style: TextStyle(
                      fontFamily:
                          GoogleFonts.poppins(fontWeight: FontWeight.w700)
                              .fontFamily,
                      fontSize: 20),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.justify,
                ),
                Text(
                  data.penulis.toString(),
                  style: TextStyle(
                      fontFamily:
                          GoogleFonts.poppins(fontWeight: FontWeight.w400)
                              .fontFamily,
                      fontSize: 20),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.justify,
                ),
              ],
            ),
          ),
          Expanded(
            flex: 2,
            child: Column(
              children: [
                IconButton(
                  alignment: Alignment.topRight,
                  iconSize: 20,
                  onPressed: () {},
                  icon: const FaIcon(FontAwesomeIcons.solidBookmark),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
