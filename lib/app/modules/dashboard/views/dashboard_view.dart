import 'package:sota/app/modules/bookmark/views/bookmark_view.dart';
import 'package:sota/app/modules/home/views/home_view.dart';
import 'package:sota/app/modules/profile/views/profile_view.dart';
import 'package:sota/app/modules/history/views/history_view.dart';
import 'package:flutter/material.dart';

import '../../../component/customBarMaterial.dart';
import 'package:get/get.dart';

import '../controllers/dashboard_controller.dart';

class DashboardView extends StatelessWidget {
  const DashboardView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<DashboardController>(
      builder: (controller) {
        return Scaffold(
            body: SafeArea(
              child: SafeArea(
                child: Center(
                    child: IndexedStack(
                  index: controller.tabIndex,
                  children: const [
                    ProfileView(),
                    HistoryView(),
                    HomeView(),
                    BookmarkView(),
                  ],
                )),
              ),
            ),
            bottomNavigationBar: CustomBottomBarMaterial(
              onTap: controller.changeTabIndex,
              currentIndex: controller.tabIndex,
            ));
      },
    );
  }
}
