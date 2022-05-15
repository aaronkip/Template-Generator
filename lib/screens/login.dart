import 'package:flutter/material.dart';
import 'package:tempgen/main.dart';
import 'package:tempgen/screens/signup.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
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
                    color: Colors.blue,
                    size: 40,
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                children: const [
                  Text("Login",
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
                      text: "Welcome back.",
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
                  const CustomText(
                    text: "Forgot password?",
                    color: Colors.green,
                    weight: FontWeight.normal,
                    size: 16,
                  )
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
                  /*if (_passwordEditingController.text.isNotEmpty &&
                      _emailEditingController.text.isNotEmpty) {
                    FirebaseHelper()
                        .signInWithEmailPassword(_emailEditingController.text,
                            _passwordEditingController.text)
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
                                'Login failed. Please check your credentials and try again.',
                                style: TextStyle(
                                    color: Colors.red,
                                    fontWeight: FontWeight.bold),
                              ),
                            ));
                      }
                    });
                  }*/
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const MyHomePage()));
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
                          text: "Login",
                          color: Colors.white,
                          weight: FontWeight.normal,
                          size: 16),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const RegistrationPage()));
                },
                child: RichText(
                    text: const TextSpan(children: [
                  TextSpan(text: "Do not have login credentials? "),
                  TextSpan(
                      text: "Sign Up! ", style: TextStyle(color: Colors.green))
                ])),
              )
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
