import 'package:flutter/material.dart';
import 'package:image_picker_login/pages/profile_page.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({super.key});

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

TextEditingController usernameController = TextEditingController();
TextEditingController emailIdController = TextEditingController();
TextEditingController phoneController = TextEditingController();
TextEditingController passwordController = TextEditingController();

class _EditProfilePageState extends State<EditProfilePage> {
  final GlobalKey<FormState> globalKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DecoratedBox(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: Image.asset(
              "assets/images/img_8.png",
              fit: BoxFit.contain,
            ).image,
          ),
        ),
        child: Form(
          key: globalKey,
          child: Column(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 50),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                        size: 30,
                      ),
                    ),
                    Text(
                      "Edit Profile",
                      style: TextStyle(
                        color: Color(0xffFFFFFF),
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Icon(
                      Icons.share,
                      color: Colors.white,
                      size: 30,
                    ),
                  ],
                ),
              ),
              CircleAvatar(
                radius: 70,
                backgroundColor: Colors.black,
              ),
              TextButton(
                onPressed: () {},
                child: Text(
                  "Change Picture",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              Row(
                children: [
                  SizedBox(width: 20),
                  Text(
                    "Username",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: SizedBox(
                  height: 50,
                  child: TextFormField(
                    controller: usernameController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(8),
                        ),
                      ),
                    ),
                    validator: (value) {
                      if (usernameController.text.isNotEmpty) {
                        return null;
                      } else {
                        return "Please enter your username";
                      }
                    },
                    onChanged: (value) {
                      if (globalKey.currentState!.validate()) {
                        setState(() {});
                      }
                    },
                  ),
                ),
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  SizedBox(width: 20),
                  Text(
                    "Email I’d",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: SizedBox(
                  height: 50,
                  child: TextFormField(
                    controller: emailIdController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(8),
                        ),
                      ),
                    ),
                    validator: (value) {
                      RegExp regex = RegExp(r"\b\d{2}\b");
                      if (value != null &&
                          value.isNotEmpty &&
                          value.contains(regex)) {
                        return null;
                      } else {
                        return "Please enter your id";
                      }
                    },
                  ),
                ),
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  SizedBox(width: 20),
                  Text(
                    "Phone Number",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: SizedBox(
                  height: 50,
                  child: TextFormField(
                    controller: phoneController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(8),
                        ),
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
                      if (globalKey.currentState!.validate() &&
                          value.isNotEmpty) {
                        setState(() {});
                      }
                    },
                  ),
                ),
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  SizedBox(width: 20),
                  Text(
                    "Password",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: SizedBox(
                  height: 50,
                  child: TextFormField(
                    controller: passwordController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(8),
                        ),
                      ),
                    ),
                    validator: (value) {
                      RegExp regex = RegExp(r'^(?=.*?[a-z])(?=.*?[0-9]).{8,}$');
                      if (value != null && value.contains(regex)) {
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
                ),
              ),
              SizedBox(height: 40),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(330, 50),
                  backgroundColor: Color(0xff171F1D),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                onPressed: () {
                  var result = globalKey.currentState!.validate();
                  if (result) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ProfilePage(),
                      ),
                    );
                  }
                },
                child: Text(
                  "Upadate",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                    fontSize: 17,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
