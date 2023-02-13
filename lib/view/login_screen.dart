import 'package:flutter/material.dart';
import 'package:password_manage_gdsc/view/saved_passwords_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Container(
            height: 300,
            child: Stack(children: [
              Positioned(
                  top: -40,
                  height: 300,
                  width: MediaQuery.of(context).size.width,
                  child: Container(
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('assets/images/background.png'),
                            fit: BoxFit.fill)),
                  )),
              Positioned(
                  height: 300,
                  width: MediaQuery.of(context).size.width + 20,
                  child: Container(
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('assets/images/background-2.png'),
                            fit: BoxFit.fill)),
                  )),
            ]),
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              const Text(
                'Login',
                style: TextStyle(
                    color: Color.fromRGBO(39, 49, 79, 1),
                    fontWeight: FontWeight.w500,
                    fontSize: 30),
              ),
              const SizedBox(
                height: 30,
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                  boxShadow: const [
                    BoxShadow(
                      color: Color.fromRGBO(196, 135, 198, .3),
                      blurRadius: 20,
                      offset: Offset(0, 10),
                    ),
                  ],
                ),
                child: Column(children: [
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        border: Border(
                            bottom: BorderSide(
                      color: Colors.grey.shade200,
                    ))),
                    child: const TextField(
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Enter your gmail',
                          hintStyle: TextStyle(color: Colors.grey)),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        border: Border(
                            bottom: BorderSide(
                      color: Colors.grey.shade200,
                    ))),
                    child: const TextField(
                      obscureText: true,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Enter your password',
                          hintStyle: TextStyle(color: Colors.grey)),
                    ),
                  ),
                ]),
              ),
            ]),
          ),
          const SizedBox(
            height: 60,
          ),
          InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: ((context) => const SavedPasswordScreen())));
              },
              child: Container(
                height: 50,
                margin: const EdgeInsets.symmetric(horizontal: 80),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: const Color.fromRGBO(49, 39, 79, 1),
                ),
                child: const Center(
                    child: Text(
                  'Login',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                )),
              )),
          const SizedBox(
            height: 20,
          ),
          const Center(
              child: Text(
            "Forgot Password?",
            style: TextStyle(color: Color.fromRGBO(196, 135, 198, 1)),
          ))
        ]),
      ),
    );
  }
}
