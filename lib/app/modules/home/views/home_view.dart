import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:get/get.dart';
import 'package:sota/app/component/bookNew.dart';
import 'package:sota/app/component/bookRekomendasi.dart';
import 'package:sota/app/component/bookSearch.dart';
import 'package:sota/app/component/buildSection.dart';
import 'package:sota/app/component/kategory.dart';
import 'package:sota/app/component/myInput.dart';
import 'package:sota/app/component/searchInput.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final myAppBar = AppBar(
      backgroundColor: const Color(0xFFFFFFFF),
      title: const Text(
        'Perpustakaan',
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
    final widthFullBody = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: myAppBar,
      body: Container(
        decoration: const BoxDecoration(color: Color(0xFFF7DCB9)),
        width: widthFullBody,
        height: heightFullBody,
        child: controller.obx(
          (state) => SingleChildScrollView(
            child: Container(
              height: heightFullBody,
              width: widthFullBody,
              decoration: const BoxDecoration(color: Color(0xFFF7DCB9)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Obx(
                    () => Expanded(
                      child: Column(
                        children: [
                          SizedBox(height: heightFullBody * 0.02),
                          Center(
                            child: Container(
                                decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.5),
                                      spreadRadius: 2,
                                      blurRadius: 7,
                                      offset: const Offset(
                                          0, 3), // changes position of shadow
                                    ),
                                  ],
                                ),
                                width: widthFullBody * 0.9,
                                child: MyInputSearch(
                                  height: 15,
                                  width: 5,
                                  controller: controller,
                                  controllerField: controller.search,
                                  hintText: "Search Book",
                                  autoFocus: true,
                                  prefixIcon: FontAwesomeIcons.searchengin,
                                )),
                          ),
                          SizedBox(height: heightFullBody * 0.02),
                          Expanded(
                            child: controller.searchLenght.value == 1
                                ? controller.loading.value == false
                                    ? controller.listDataBuku.isEmpty
                                        ? const Center(
                                            child: Text("Tidak Ada Buku"))
                                        : BookSearch(
                                            data: controller.listDataBuku)
                                    : const Center(
                                        child: CircularProgressIndicator())
                                : Column(
                                    children: [
                                      MyKategori(
                                        data: state!.state3!,
                                      ),
                                      SizedBox(height: heightFullBody * 0.02),
                                      Expanded(
                                        child: SingleChildScrollView(
                                          child: Column(
                                            children: [
                                              BookNew(
                                                  dataBookNew: state.state1!),
                                              SizedBox(
                                                  height:
                                                      heightFullBody * 0.05),
                                              BookRekomendasi(
                                                  dataBookPopular:
                                                      state.state2!),
                                              SizedBox(
                                                  height:
                                                      heightFullBody * 0.05),
                                              Column(
                                                children:
                                                    state.state4!.map((data) {
                                                  return SizedBox(
                                                    height:
                                                        heightFullBody * 0.25,
                                                    child: buildSection(
                                                        data: data),
                                                  );
                                                }).toList(),
                                              ),
                                            ],
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
