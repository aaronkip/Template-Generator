import 'package:flutter/material.dart';
import 'package:tempgen/helpers/firebase_helper.dart';
import 'package:tempgen/main.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({Key? key}) : super(key: key);

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  final TextEditingController _emailEditingController = TextEditingController();
  final TextEditingController _passwordEditingController =
      TextEditingController();

  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 400),
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Center(
                child: Padding(
                  padding: EdgeInsets.only(right: 12),
                  child: Icon(
                    Icons.verified_user,
                    color: Colors.green,
                    size: 40,
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                children: const [
                  Text("Register",
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: const [
                  CustomText(
                      text: "Create a new account",
                      color: Colors.grey,
                      weight: FontWeight.normal,
                      size: 14),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              TextField(
                controller: _emailEditingController,
                decoration: InputDecoration(
                    labelText: "Email",
                    hintText: "email@domain.com",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20))),
              ),
              const SizedBox(
                height: 15,
              ),
              TextField(
                obscureText: true,
                controller: _passwordEditingController,
                decoration: InputDecoration(
                    labelText: "Password",
                    hintText: "******",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20))),
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Checkbox(value: true, onChanged: (value) {}),
                      const CustomText(
                        text: "Remember Me",
                        weight: FontWeight.normal,
                        color: Colors.black,
                        size: 16,
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              InkWell(
                onTap: () {
                  //Get.offAllNamed(rootRoute);
                  setState(() {
                    _isLoading = true;
                  });
                  if (_passwordEditingController.text.isNotEmpty &&
                      _emailEditingController.text.isNotEmpty) {
                    FirebaseHelper()
                        .registerWithEmailPassword(_emailEditingController.text,
                            _passwordEditingController.text, "user", context)
                        .then((value) {
                      if (value != null) {
                        _isLoading = false;
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const MyHomePage()));
                      } else {
                        showTopSnackBar(
                            context,
                            const Center(
                              child: Text(
                                'Registration failed. Please try again',
                                style: TextStyle(
                                    color: Colors.red,
                                    fontWeight: FontWeight.bold),
                              ),
                            ));
                      }
                    });
                  }
                  setState(() {
                    _isLoading = false;
                  });
                },
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(20)),
                  alignment: Alignment.center,
                  width: double.maxFinite,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  child: _isLoading
                      ? const CircularProgressIndicator()
                      : const CustomText(
                          text: "Sign Up",
                          color: Colors.white,
                          weight: FontWeight.normal,
                          size: 16),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomText extends StatelessWidget {
  final String text;
  final double size;
  final Color color;
  final FontWeight weight;

  const CustomText(
      {Key? key,
      required this.text,
      required this.size,
      required this.color,
      required this.weight})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(fontSize: size, color: color, fontWeight: weight),
    );
  }
}
