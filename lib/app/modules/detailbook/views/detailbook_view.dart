import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:sota/app/component/bookDetails.dart';

import '../controllers/detailbook_controller.dart';

class DetailbookView extends GetView<DetailbookController> {
  const DetailbookView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: controller.obx(
      (state) => Container(
        width: double.infinity,
        decoration: const BoxDecoration(
           color:  Color(0xFFF7DCB9)),
        child: SafeArea(
          child: Stack(
            children: [
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                child: GestureDetector(
                  onTap: () => Get.back(),
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.05,
                    width: double.infinity,
                    color: Colors.white,
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Icon(Icons.arrow_back),
                      ],
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 50,
                left: 0,
                right: 0,
                child: SizedBox(
                  height: MediaQuery.of(context).size.height * 0.93,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: MyBookDetails(
                      controller: controller,
                      dataBookDetails: state!.state1!,
                      dataUlasan: state.state2!,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
