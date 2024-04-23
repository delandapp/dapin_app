import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({Key? key}) : super(key: key);
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

    final heightFullBody = MediaQuery.of(context).size.height - myAppBar.preferredSize.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: myAppBar,
      body: const Center(
        child: Text(
          'ProfileView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
