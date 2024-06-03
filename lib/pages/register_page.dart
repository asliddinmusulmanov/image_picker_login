import 'package:flutter/material.dart';
import 'package:image_picker_login/pages/edit_profile.dart';

import '../main.dart';
import 'login_page.dart';

List<String> users = [];

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

TextEditingController emailController = TextEditingController();
TextEditingController confirmPasswordController = TextEditingController();
TextEditingController confirm2PasswordController = TextEditingController();
TextEditingController nameController = TextEditingController();
TextEditingController phoneNumberController = TextEditingController();

bool isnima = true;

class _RegisterPageState extends State<RegisterPage> {
  final GlobalKey<FormState> globalKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF9A826),
      body: Row(
        children: [
          const SizedBox(width: 20),
          Align(
            alignment: const Alignment(0, -0.7),
            child: MaterialButton(
              child: Image.asset(
                "assets/images/img_6.png",
                height: 50,
              ),
              onPressed: () {
                showModalBottomSheet(
                  barrierColor: Colors.transparent,
                  scrollControlDisabledMaxHeightRatio: 0.7,
                  context: context,
                  builder: (context) {
                    return Stack(
                      children: [
                        SingleChildScrollView(
                          child: Container(
                            width: double.infinity,
                            decoration: const BoxDecoration(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20),
                                topRight: Radius.circular(20),
                              ),
                            ),
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              child: Form(
                                key: globalKey,
                                child: Column(
                                  children: [
                                    SizedBox(height: 40),
                                    Row(
                                      children: [
                                        Text(
                                          "Name",
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.w700,
                                            fontSize: 18,
                                          ),
                                        ),
                                      ],
                                    ),
                                    TextFormField(
                                      controller: nameController,
                                      decoration: InputDecoration(
                                        hintText: "Your Name, e.g : John Doe",
                                        hintStyle: TextStyle(
                                          fontWeight: FontWeight.w300,
                                          fontSize: 15,
                                        ),
                                      ),
                                      validator: (value) {
                                        if (nameController.text.isNotEmpty) {
                                          return null;
                                        } else {
                                          return 'Please enter your name';
                                        }
                                      },
                                      onChanged: (value) {
                                        if (globalKey.currentState!
                                            .validate()) {
                                          setState(() {});
                                        }
                                      },
                                    ),
                                    SizedBox(height: 40),
                                    Row(
                                      children: [
                                        Text(
                                          "Email",
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.w700,
                                            fontSize: 18,
                                          ),
                                        ),
                                      ],
                                    ),
                                    TextFormField(
                                      controller: emailController,
                                      decoration: InputDecoration(
                                        hintText:
                                            "Your email, e.g : johndoe@gmail.com",
                                        hintStyle: TextStyle(
                                          fontWeight: FontWeight.w300,
                                          fontSize: 15,
                                        ),
                                      ),
                                      validator: (value) {
                                        if (value != null &&
                                            value.contains("@gmail.com")) {
                                          return null;
                                        } else {
                                          return 'Please enter your email address\nExample => (example@gmail.com)';
                                        }
                                      },
                                      onChanged: (value) {
                                        if (globalKey.currentState!
                                            .validate()) {
                                          setState(() {});
                                        }
                                      },
                                    ),
                                    SizedBox(height: 40),
                                    Row(
                                      children: [
                                        Text(
                                          "Phone Number",
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.w700,
                                            fontSize: 18,
                                          ),
                                        ),
                                      ],
                                    ),
                                    TextFormField(
                                      controller: phoneNumberController,
                                      decoration: InputDecoration(
                                        hintText:
                                            "Your phone number, e.g : +998 (xx) xxx xx xx",
                                        hintStyle: TextStyle(
                                          fontWeight: FontWeight.w300,
                                          fontSize: 15,
                                        ),
                                      ),
                                      validator: (value) {
                                        RegExp regex = RegExp(r"^\+998\d{9}$");
                                        if (value != null &&
                                            value.contains(regex) &&
                                            value.isNotEmpty) {
                                          return null;
                                        } else {
                                          return 'Please enter your phone number\nExample => (+9989)';
                                        }
                                      },
                                      onChanged: (value) {
                                        if (globalKey.currentState!
                                                .validate() &&
                                            value.isNotEmpty) {
                                          setState(() {});
                                        }
                                      },
                                    ),
                                    SizedBox(height: 50),
                                    Row(
                                      children: [
                                        Text(
                                          "Password",
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.w700,
                                            fontSize: 18,
                                          ),
                                        ),
                                      ],
                                    ),
                                    TextFormField(
                                      controller: confirmPasswordController,
                                      obscureText: isnima,
                                      decoration: InputDecoration(
                                        hintText:
                                            "Your password, at least 8 character.",
                                        hintStyle: TextStyle(
                                          fontWeight: FontWeight.w300,
                                          fontSize: 15,
                                        ),
                                        suffixIcon: IconButton(
                                          onPressed: () {
                                            isnima = !isnima;
                                            setState(() {});
                                          },
                                          icon: isnima
                                              ? const Icon(Icons.visibility_off)
                                              : const Icon(Icons.visibility),
                                        ),
                                      ),
                                      validator: (value) {
                                        RegExp regex = RegExp(
                                            r'^(?=.*?[a-z])(?=.*?[0-9]).{8,}$');
                                        if (value != null &&
                                            value.contains(regex)) {
                                          return null;
                                        } else {
                                          return 'Must be 8 or more characters  and contain at least 1\nnumber or special character';
                                        }
                                      },
                                      onChanged: (value) {
                                        if (globalKey.currentState!
                                            .validate()) {
                                          setState(() {});
                                        }
                                      },
                                    ),
                                    SizedBox(height: 40),
                                    Row(
                                      children: [
                                        Text(
                                          "Confirm Password",
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.w700,
                                            fontSize: 18,
                                          ),
                                        ),
                                      ],
                                    ),
                                    TextFormField(
                                      controller: confirm2PasswordController,
                                      obscureText: isnima,
                                      decoration: InputDecoration(
                                        hintText:
                                            "Your password, at least 8 character.",
                                        hintStyle: TextStyle(
                                          fontWeight: FontWeight.w300,
                                          fontSize: 15,
                                        ),
                                        suffixIcon: IconButton(
                                          onPressed: () {
                                            isnima = !isnima;
                                            setState(() {});
                                          },
                                          icon: isnima
                                              ? const Icon(Icons.visibility_off)
                                              : const Icon(Icons.visibility),
                                        ),
                                      ),
                                      validator: (value) {
                                        if (value ==
                                            confirmPasswordController.text) {
                                          return null;
                                        } else {
                                          return "The verification password is incorrect";
                                        }
                                      },
                                      onChanged: (value) {
                                        if (globalKey.currentState!
                                            .validate()) {
                                          setState(() {});
                                        }
                                      },
                                    ),
                                    SizedBox(height: 30),
                                    // ElevatedButton(
                                    //   style: ElevatedButton.styleFrom(
                                    //     backgroundColor:
                                    //         const Color(0xff454B60),
                                    //     shape: RoundedRectangleBorder(
                                    //       borderRadius:
                                    //           BorderRadius.circular(14),
                                    //     ),
                                    //     fixedSize:
                                    //         const Size(double.maxFinite, 55),
                                    //   ),
                                    //   onPressed: () async {
                                    //     var natija =
                                    //         globalKey.currentState!.validate();
                                    //     if (natija &&
                                    //         phoneNumberController.text
                                    //             .toString()
                                    //             .isNotEmpty) {
                                    //       //model
                                    //       String model =
                                    //           '${emailController.text}/${passwordController.text}';
                                    //       //listga qo'shildi
                                    //       users.add(model);
                                    //       //xot olindi
                                    //       List<String> data =
                                    //           prefs.getStringList('users') ??
                                    //               [];
                                    //       //xot o'chirildi
                                    //       prefs.clear();
                                    //       //listga xot joy
                                    //       users.addAll(data);
                                    //       // xot olinga o'chorildi
                                    //       data.clear();
                                    //       await prefs.setStringList(
                                    //           'users', users);
                                    //       users.clear();
                                    //       debugPrint(data.toString());
                                    //       debugPrint(prefs.toString());
                                    //       debugPrint(users.toString());
                                    //
                                    //       Navigator.push(
                                    //         context,
                                    //         MaterialPageRoute(
                                    //           builder: (context) =>
                                    //               const LoginPage(),
                                    //         ),
                                    //       );
                                    //       List<String> oxirgi =
                                    //           prefs.getStringList('users') ??
                                    //               [];
                                    //       debugPrint('Xotirada : $oxirgi');
                                    //     } else {
                                    //       ScaffoldMessenger.of(context)
                                    //           .showSnackBar(
                                    //         const SnackBar(
                                    //           content: Text(
                                    //               "Ma`lumotlarni to'liq to`ldiring"),
                                    //         ),
                                    //       );
                                    //     }
                                    //   },
                                    //   child: const Text(
                                    //     "Next",
                                    //     style: TextStyle(
                                    //       color: Colors.white,
                                    //     ),
                                    //   ),
                                    // ),
                                    ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor:
                                            const Color(0xffF9A826),
                                        fixedSize: const Size(400, 55),
                                      ),
                                      onPressed: () async {
                                        var result =
                                            globalKey.currentState!.validate();
                                        if (result &&
                                            phoneNumberController.text
                                                .toString()
                                                .isNotEmpty) {
                                          String model =
                                              "${emailController.text}/${passwordController.text}";
                                        }
                                      },
                                      // onPressed: () async {
                                      //   // NoteApp model = NoteApp(
                                      //   //     id: Random().nextInt(100),
                                      //   //     title: emailController.text,
                                      //   //     text:
                                      //   //         confirmPasswordController.text,
                                      //   //     createTime:
                                      //   //         DateTime.now().toString());
                                      //   // await box.add(model);
                                      //   // var result =
                                      //   //     globalKey.currentState!.validate();
                                      //   if (globalKey.currentState!
                                      //       .validate()) {
                                      //     Navigator.push(
                                      //       context,
                                      //       MaterialPageRoute(
                                      //         builder: (context) =>
                                      //             const LoginPage(),
                                      //       ),
                                      //     );
                                      //   }
                                      // },
                                      child: const Text(
                                        "Next",
                                        style: TextStyle(
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(height: 10),
                                    // Row(
                                    //   mainAxisAlignment:
                                    //       MainAxisAlignment.center,
                                    //   children: [
                                    //     TextButton(
                                    //       onPressed: () {
                                    //         Navigator.push(
                                    //           context,
                                    //           MaterialPageRoute(
                                    //             builder: (context) =>
                                    //                 const LoginPage(),
                                    //           ),
                                    //         );
                                    //       },
                                    //       child: Text(
                                    //         "Login",
                                    //         style: TextStyle(
                                    //           color: Colors.black,
                                    //           fontSize: 15,
                                    //         ),
                                    //       ),
                                    //     ),
                                    //   ],
                                    // ),
                                    const SizedBox(height: 30),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
