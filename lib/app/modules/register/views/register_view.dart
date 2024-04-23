import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sota/app/component/myAppBar.dart';
import 'package:sota/app/component/myButton.dart';
import 'package:sota/app/component/myInput.dart';
import 'package:sota/app/routes/app_pages.dart';

import '../controllers/register_controller.dart';
import '../../../data/constans/validation.dart';

import 'package:form_validator/form_validator.dart';

extension CustomValidationBuilder on ValidationBuilder {
  custom() => add((value) {
        if (!EmailValidator.isValidEmail(value)) {
          return 'Enter a valid email address with @smk.belajar.id';
        }
        return null;
      });
  password() => add((value) {
        if (!PasswordValidator.isValidPasswordUpper(password: value)) {
          return 'Password must contain at least 1 uppercase letter';
        }
        if (!PasswordValidator.isValidPasswordSymbol(password: value)) {
          return 'Password must contain at least 1 Sysmbol';
        }
        return null;
      });
}

final validatorPassword = ValidationBuilder()
    .minLength(8, 'Password must be at least 8 characters')
    .password()
    .build();
final validator = ValidationBuilder().email().custom().build();

class RegisterView extends GetView<RegisterController> {
  const RegisterView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final widthFullBody = MediaQuery.of(context).size.width;
    final myAppBar = MyAppBar(widthFullBody: widthFullBody, title: "PERPUSTAKAAN \n DIGITAL",titleCenter: true);
    final heightFullBody = MediaQuery.of(context).size.height - myAppBar.height;
    return Scaffold(
        appBar: myAppBar,
        body: Form(
          key: controller.formKey,
          child: Container(
            decoration: const BoxDecoration(
           color:  Color(0xFFF7DCB9)),
            height: heightFullBody,
            width: widthFullBody,
            child: LayoutBuilder(
              builder: (context, constraints) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Expanded(
                      flex: 6,
                      child: Image(
                        image: AssetImage("assets/logo.png"),
                      ),
                    ),
                    AutoSizeText(
                      'Register',
                      style: TextStyle(fontSize: constraints.minWidth * 0.06,fontFamily: GoogleFonts.inika().fontFamily,fontWeight: FontWeight.bold),
                      maxLines: 2,
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: constraints.maxWidth * 0.04,),
                    SizedBox(
                        width: constraints.maxWidth * 0.8,
                        child: myInput(controller: controller, controllerField: controller.username, prefixIcon: FontAwesomeIcons.users, hintText: "Username",autoFocus: true,validator: ValidationBuilder().minLength(5).build(),)
                    ),SizedBox(height: constraints.maxWidth * 0.04,),
                    SizedBox(
                        width: constraints.maxWidth * 0.8,
                        child: myInput(controller: controller, controllerField: controller.email, prefixIcon: FontAwesomeIcons.envelope, hintText: "Email",validator: validator,)
                    ),
                    SizedBox(height: constraints.maxWidth * 0.04,),
                    SizedBox(
                        width: constraints.maxWidth * 0.8,
                        child: myInput(controller: controller, controllerField: controller.password, isPassword: true, hintText: "Password",validator: validatorPassword,)
                    ),
                    SizedBox(height: constraints.maxWidth * 0.04,),
                    const Expanded(flex: 2,child: SizedBox()),
                    MyButton(widthFullBody: widthFullBody, label: "Daftar", width: constraints.maxWidth * 0.2, height: constraints.maxHeight * 0.06, onTap: () => controller.postRegister(),controller: controller,),
                    SizedBox(height: constraints.maxWidth * 0.04,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        AutoSizeText(
                          "Sudah punya akun?",
                          style: TextStyle(fontSize: constraints.minWidth * 0.04,fontFamily: GoogleFonts.inika().fontFamily,fontWeight: FontWeight.bold),
                          maxLines: 1,
                        ),
                        GestureDetector(
                          onTap: (){Get.offAllNamed(Routes.LOGIN);},
                          child: AutoSizeText(
                            "Login",
                            style: TextStyle(fontSize: constraints.minWidth * 0.04,fontFamily: GoogleFonts.inika().fontFamily,fontWeight: FontWeight.bold,color: const Color(0xff0E32EF)),
                            maxLines: 1,
                          ),
                        )
                      ],
                    )
                  ],
                );
              },
            ),
          ),
        )
    );
  }
}
