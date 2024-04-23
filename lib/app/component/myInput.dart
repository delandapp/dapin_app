import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class myInput extends StatelessWidget {
  const myInput(
      {super.key,
      required this.controller,
      required this.controllerField,
      this.prefixIcon,
      required this.hintText,
      this.isPassword = false,
      this.autoFocus = false,
      this.validator});
  final controller;
  final TextEditingController controllerField;
  final validator;
  final IconData? prefixIcon;
  final bool isPassword;
  final bool autoFocus;
  final String hintText;

  @override
  Widget build(BuildContext context) {
    return isPassword
        ? Obx(() => TextFormField(
            validator: validator,
            controller: controllerField,
            obscureText: controller.isObsure.value,
            autofocus: autoFocus,
            textAlign: TextAlign.left,
            textAlignVertical: TextAlignVertical.center,
            style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.bold,
                fontFamily: GoogleFonts.poppins().fontFamily),
            decoration: InputDecoration(
              suffixIcon: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      controller.isObsure.value = !controller.isObsure.value;
                    },
                    child: FaIcon(
                      size: 18,
                      (controller.isObsure.value) == true
                          ? FontAwesomeIcons.eye
                          : FontAwesomeIcons.eyeSlash,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
              hintText: hintText,
              hintStyle: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.normal,
                  fontFamily: GoogleFonts.poppins().fontFamily),
              filled: true,
              fillColor: const Color(0xffFFFFFF),
              errorBorder: OutlineInputBorder(
                  borderSide:
                      BorderSide(color: const Color.fromARGB(255, 255, 17, 0))),
              focusedErrorBorder: OutlineInputBorder(
                  borderSide:
                      BorderSide(color: const Color.fromARGB(255, 255, 17, 0))),
              // border: OutlineInputBorder(),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(7),
                  borderSide:
                      const BorderSide(color: Color(0xff0E32EF), width: 3)),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(7),
                  borderSide: const BorderSide(color: Color(0xffD9D9D9))),
            )))
        : TextFormField(
            validator: validator,
            controller: controllerField,
            autofocus: true,
            textAlign: TextAlign.left,
            textAlignVertical: TextAlignVertical.center,
            style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.bold,
                fontFamily: GoogleFonts.poppins().fontFamily),
            decoration: InputDecoration(
              suffixIcon: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FaIcon(
                    size: 18,
                    prefixIcon,
                    color: Colors.black,
                  ),
                ],
              ),
              hintText: hintText,
              hintStyle: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.normal,
                  fontFamily: GoogleFonts.poppins().fontFamily),
              filled: true,
              fillColor: const Color(0xffFFFFFF),
              errorBorder: OutlineInputBorder(
                  borderSide:
                      BorderSide(color: const Color.fromARGB(255, 255, 17, 0))),
              focusedErrorBorder: OutlineInputBorder(
                  borderSide:
                      BorderSide(color: const Color.fromARGB(255, 255, 17, 0))),
              // border: OutlineInputBorder(),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(7),
                  borderSide:
                      const BorderSide(color: Color(0xff0E32EF), width: 3)),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(7),
                  borderSide: const BorderSide(color: Color(0xffD9D9D9))),
            ));
  }
}
