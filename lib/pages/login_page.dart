import 'package:flutter/material.dart';
import 'package:image_picker_login/pages/profile_page.dart';
import 'package:image_picker_login/pages/register_page.dart';

import '../main.dart';
import '../models/model.dart';
import 'edit_profile.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

TextEditingController loginEmailController = TextEditingController();
TextEditingController loginPasswordController = TextEditingController();

bool errorText = true;
bool isnima = true;

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> globalKey = GlobalKey<FormState>();

  int index = 0;
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
                "assets/images/img_2.png",
                height: 50,
              ),
              onPressed: () {
                showModalBottomSheet(
                  barrierColor: Colors.transparent,
                  scrollControlDisabledMaxHeightRatio: 0.7,
                  context: context,
                  builder: (context) {
                    return Container(
                      width: double.infinity,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Form(
                          key: globalKey,
                          child: Column(
                            children: [
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
                                controller: loginEmailController,
                                decoration: InputDecoration(
                                  hintText: "Enter your email",
                                  hintStyle: TextStyle(
                                    fontWeight: FontWeight.w300,
                                    fontSize: 15,
                                  ),
                                ),
                                validator: (value) {
                                  if (value != null &&
                                      value.contains("@gmail.com") &&
                                      value.isNotEmpty) {
                                    return null;
                                  } else {
                                    return 'Please enter your email address\nExample => (example@gmail.com)';
                                  }
                                },
                                onChanged: (value) {
                                  if (globalKey.currentState!.validate()) {
                                    setState(() {});
                                  }
                                },
                              ),
                              SizedBox(height: 20),
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
                                controller: loginPasswordController,
                                obscureText: isnima,
                                decoration: InputDecoration(
                                  hintText: "Enter your password",
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
                                      value.contains(regex) &&
                                      value.isNotEmpty) {
                                    return null;
                                  } else {
                                    return 'Must be 8 or more characters  and contain at least 1\nnumber or special character';
                                  }
                                },
                                onChanged: (value) {
                                  if (globalKey.currentState!.validate()) {
                                    setState(() {});
                                  }
                                },
                              ),
                              SizedBox(height: 10),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text(
                                    "Forgot Password?",
                                    style: TextStyle(
                                      color: Color(0xff707070),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 20),
                              // ElevatedButton(
                              //   style: ElevatedButton.styleFrom(
                              //     backgroundColor: const Color(0xff454B60),
                              //     shape: RoundedRectangleBorder(
                              //       borderRadius: BorderRadius.circular(14),
                              //     ),
                              //     fixedSize: const Size(double.maxFinite, 55),
                              //   ),
                              //   onPressed: () async {
                              //     List<String> email = [];
                              //     List<String> password = [];
                              //     if (loginEmailController.text.isNotEmpty &&
                              //         loginPasswordController.text.isNotEmpty) {
                              //       setState(() {
                              //         errorText = true;
                              //       });
                              //       List<String> xotirada = prefs.getStringList('users') ?? [];
                              //       for (var o in xotirada) {
                              //         int slashindex = o.indexOf('/');
                              //         email.add(o.substring(0, slashindex));
                              //         password.add(o.substring(slashindex + 1));
                              //       }
                              //
                              //       debugPrint(email.toString());
                              //       debugPrint(password.toString());
                              //
                              //       int emailindex = email.indexOf(emailController.text);
                              //       int passwordindex =
                              //       password.indexOf(passwordController.text);
                              //
                              //       if (email.contains(emailController.text) &&
                              //           password.contains(passwordController.text) &&
                              //           emailindex == passwordindex) {
                              //         Navigator.push(
                              //           context,
                              //           MaterialPageRoute(
                              //             builder: (context) => ProfilePage(
                              //               index: emailindex,
                              //             ),
                              //           ),
                              //         );
                              //       } else {
                              //         ScaffoldMessenger.of(context).showSnackBar(
                              //           const SnackBar(
                              //             content:
                              //             Text("Kiritilgan Email yoki Password noto'g'ri"),
                              //           ),
                              //         );
                              //       }
                              //     } else {
                              //       setState(() {});
                              //       errorText = false;
                              //     }
                              //   },
                              //   child: const Text(
                              //     "Login",
                              //     style: TextStyle(
                              //       color: Colors.white,
                              //       fontSize: 16,
                              //       fontWeight: FontWeight.w700,
                              //     ),
                              //   ),
                              // ),
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Color(0xffF9A826),
                                  fixedSize: Size(400, 55),
                                ),
                                onPressed: () async {
                                  var result =
                                      globalKey.currentState!.validate();
                                  if (result) {
                                    RegisterModel info = RegisterModel(
                                        email: loginEmailController.text,
                                        password: loginPasswordController.text);
                                    await Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => ProfilePage(),
                                        settings:
                                            RouteSettings(arguments: info),
                                      ),
                                    );
                                    setState(() {});
                                  } else {
                                    SnackBar(content: Text("ERROR"));
                                  }
                                  // var result =
                                  //     globalKey.currentState!.validate();
                                  // if (result) {
                                  //   setState(
                                  //     () {
                                  //       // list.addAll(box.get("user"));
                                  //       // for (var i = 0;
                                  //       //     i < box.values.length;
                                  //       //     i++) {
                                  //       //   if (list[i].title ==
                                  //       //           loginEmailController.text &&
                                  //       //       list[i].text ==
                                  //       //           loginPasswordController
                                  //       //               .text) {
                                  //       //     Navigator.push(
                                  //       //       context,
                                  //       //       MaterialPageRoute(
                                  //       //         builder: (context) =>
                                  //       //             const ProfilePage(),
                                  //       //       ),
                                  //       //     );
                                  //       //   }
                                  //       // }
                                  //     },
                                  //   );
                                  // } else {
                                  //   SnackBar(
                                  //     content: Text("ERROR"),
                                  //   );
                                  // }
                                },
                                child: Text(
                                  "Login",
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              SizedBox(height: 10),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "Don’t have an account yet? Register",
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              const RegisterPage(),
                                        ),
                                      );
                                    },
                                    child: Text(
                                      "here",
                                      style: TextStyle(
                                        color: Color(0xffF9A826),
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 10),
                              Stack(
                                children: [
                                  Divider(
                                    height: 22,
                                    color: Color(0xff707070),
                                    endIndent: 240,
                                  ),
                                  Align(
                                    child: Text(
                                      "Or Login with",
                                      style: TextStyle(
                                        color: Color(0xff707070),
                                      ),
                                    ),
                                  ),
                                  Divider(
                                    height: 22,
                                    indent: 240,
                                    color: Color(0xff707070),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 20),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  CircleAvatar(
                                    radius: 30,
                                    backgroundColor: Color(0xffFFFFFF),
                                    child: Image.asset(
                                      "assets/images/0a045d00273bb73b87801cfaecf1768f.png",
                                      height: 30,
                                      width: 30,
                                    ),
                                  ),
                                  const SizedBox(width: 50),
                                  CircleAvatar(
                                    radius: 30,
                                    backgroundColor: Color(0xffFFFFFF),
                                    child: Image.asset(
                                      "assets/images/03e60a5e0b3a95b3a79bc01ce7875352.png",
                                      height: 30,
                                      width: 30,
                                    ),
                                  ),
                                ],
                              ),
                              // MaterialButton(
                              //   onPressed: () {
                              //     Navigator.push(
                              //       context,
                              //       MaterialPageRoute(
                              //         builder: (context) => const ProfilePage(),
                              //       ),
                              //     );
                              //   },
                              //   child: Text(
                              //     "Profile",
                              //     style: TextStyle(
                              //       fontWeight: FontWeight.w700,
                              //       fontSize: 24,
                              //     ),
                              //   ),
                              // )
                            ],
                          ),
                        ),
                      ),
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
