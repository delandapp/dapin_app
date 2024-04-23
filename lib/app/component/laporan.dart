import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sota/app/data/models/response_laporan.dart';
import 'package:flutter_dash/flutter_dash.dart';

class MyLaporan extends StatelessWidget {
  const MyLaporan({super.key, required this.data});
  final DataLaporan data;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 8,
          child: Stack(
            fit: StackFit.expand,
            children: [
              Positioned.fill(
                top: 20,
                left: 30,
                right: 30,
                bottom: 0,
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.8,
                  height: MediaQuery.of(context).size.height * 0.2,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.black, width: 2),
                  ),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 40,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Laporan Peminjaman",
                                  style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.w600,
                                      color: Colors.black,
                                      fontSize: 14),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Container(
                                  width: 180,
                                  height: 2,
                                  color: Colors.grey,
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  "KODE PEMINJAMAN",
                                  style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.w600,
                                      color: const Color(0xFFA7AEC2),
                                      fontSize: 14),
                                ),
                                const SizedBox(
                                  height: 2,
                                ),
                                Text(
                                  data.kodePeminjaman.toString(),
                                  style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.w600,
                                      color: const Color(0xFF000000),
                                      fontSize: 14),
                                ),
                              ],
                            ),
                            const Expanded(child: SizedBox()),
                            Image.asset(
                              "assets/logo.png",
                              width: 70,
                            )
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Column(
                                children: [
                                  Text(
                                    "TANGGAL PINJAM",
                                    style: GoogleFonts.poppins(
                                        fontWeight: FontWeight.w600,
                                        color: const Color(0xFFA7AEC2),
                                        fontSize: 14),
                                  ),
                                  const SizedBox(
                                    height: 2,
                                  ),
                                  Text(
                                    data.tanggalPinjam.toString(),
                                    style: GoogleFonts.poppins(
                                        fontWeight: FontWeight.w600,
                                        color: const Color(0xFF000000),
                                        fontSize: 12),
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              child: Column(
                                children: [
                                  Text(
                                    "TANGGAL KEMBALI",
                                    style: GoogleFonts.poppins(
                                        fontWeight: FontWeight.w600,
                                        color: const Color(0xFFA7AEC2),
                                        fontSize: 14),
                                  ),
                                  const SizedBox(
                                    height: 2,
                                  ),
                                  Text(
                                    data.tanggalKembali.toString() ==
                                            "Belum dikembalikan"
                                        ? "-"
                                        : data.tanggalKembali.toString(),
                                    style: GoogleFonts.poppins(
                                        fontWeight: FontWeight.w600,
                                        color: const Color(0xFF000000),
                                        fontSize: 12),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                             Image.asset(
                                  "assets/qr.png",
                                  width: 100,
                                  height: 100,
                                ),
                                                            const Expanded(child: SizedBox()),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "ID PEMINJAMAN",
                                  style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.w600,
                                      color: const Color(0xFFA7AEC2),
                                      fontSize: 14),
                                ),
                                const SizedBox(
                                  height: 2,
                                ),
                                Text(
                                  data.peminjamanID.toString(),
                                  style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.w600,
                                      color: const Color(0xFF000000),
                                      fontSize: 14),
                                ),
                                Text(
                                  "STATUS",
                                  style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.w600,
                                      color: const Color(0xFFA7AEC2),
                                      fontSize: 14),
                                ),
                                const SizedBox(
                                  height: 2,
                                ),
                                Text(
                                  data.tanggalKembali.toString() == "Belum dikembalikan" ? "Dipinjam" : "Sudah Kembali",
                                  style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.w600,
                                      color: const Color(0xFF000000),
                                      fontSize: 14),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Dash(
                          direction: Axis.horizontal,
                          length: 255,
                          dashLength: 5,
                          dashColor: Colors.grey.shade400),
                      const SizedBox(
                        height: 15,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "NAMA",
                              style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black,
                                  fontSize: 14),
                            ),
                            Text(
                              data.username.toString(),
                              style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black,
                                  fontSize: 14),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "NAMA BUKU",
                              style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black,
                                  fontSize: 14),
                            ),
                            Text(
                              data.judulBuku.toString(),
                              style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black,
                                  fontSize: 14),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Align(
                alignment: Alignment.topCenter,
                child: Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                      color: const Color(0xFF1E0342),
                      borderRadius: BorderRadius.circular(50),
                      border: Border.all(color: Colors.white)),
                  child: const Icon(
                    Icons.check,
                    size: 30,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
        const Expanded(flex: 1, child: SizedBox())
      ],
    );
  }
}
