import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sota/app/data/models/response_history_peminjaman.dart';
import 'package:sota/app/modules/history/controllers/history_controller.dart';
import 'package:sota/app/routes/app_pages.dart';

class HistoryView extends GetView<HistoryController> {
  const HistoryView ({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final heightFullBody =
        MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: controller.obx(
        (state) => SafeArea(
          child: Container(
            padding: const EdgeInsets.all(10),
            color: const Color(0xFFF7DCB9),
            child: Obx(
              () => controller.dataHistoryPeminjaman.value
                  ? const Center(
                      child: Text("Tidak Ada History Koleksi"),
                    )
                  : ListView.builder(
                      itemCount: controller.listHistory.length,
                      itemBuilder: (context, index) {
                        return Dismissible(
                          onDismissed: (direction) async {
                            await controller.deleteHistory(
                                controller.listHistory[index].peminjamanID!.toInt());
                            if (controller.jumlahData.value == 0) {
                              await controller.getDataHistory();
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
                            color: Colors.grey,
                            alignment: Alignment.centerRight,
                            padding: const EdgeInsets.only(right: 10),
                            child: const Icon(
                              Icons.delete,
                              color: Colors.amber,
                              size: 25,
                            ),
                          ),
                          key: Key(index.toString()),
                          // Mengatur geser dari kanan ke kiri saja
                          direction: DismissDirection.endToStart,
                          child: ContentKoleksi(
                            width: width,
                            heightFullBody: heightFullBody,
                            data: controller.listHistory[index],
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
  final DataHistoryPeminjaman data;
  final double heightFullBody;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      width: width,
      height: heightFullBody * 0.18,
      margin: EdgeInsets.only(bottom: heightFullBody * 0.02),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
      child: GestureDetector(
        onTap: () => Get.toNamed(Routes.PINJAM, parameters: {"idPinjam" : data.peminjamanID.toString()}),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(30),
              child: SizedBox(
                width: width * 0.24,
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
                  Text(
                    data.judulBuku.toString(),
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
                    data.penulisBuku.toString(),
                    style: TextStyle(
                        fontFamily:
                            GoogleFonts.poppins(fontWeight: FontWeight.w400)
                                .fontFamily,
                        fontSize: 20,color: const Color(0xFFFFFFFF)),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.justify,
                  ),
                  Text(
                    data.penerbitBuku.toString(),
                    style: TextStyle(
                        fontFamily:
                            GoogleFonts.poppins(fontWeight: FontWeight.w400)
                                .fontFamily,
                        fontSize: 20,color: const Color(0xFFD99267)),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.justify,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
