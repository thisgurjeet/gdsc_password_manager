import 'package:flutter/material.dart';

class NewList extends StatefulWidget {
  final addTx;
  const NewList(this.addTx, {super.key});

  @override
  State<NewList> createState() => _NewListState();
}

class _NewListState extends State<NewList> {
  void _submitData() {
    final enteredWebsite = websiteController.text;
    final enteredUsername = usernameController.text;
    final enteredPassword = passwordController.text;

    if (enteredWebsite.isEmpty ||
        enteredUsername.isEmpty ||
        enteredPassword.isEmpty) {
      return;
    }

    widget.addTx(enteredWebsite, enteredUsername, enteredPassword);
    Navigator.of(context).pop();
  }

  final TextEditingController websiteController = TextEditingController();

  final TextEditingController usernameController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(children: [
        Container(
          height: 40,
          width: 250,
          margin: const EdgeInsets.only(top: 30),
          decoration: BoxDecoration(
              color: const Color.fromARGB(255, 131, 74, 210),
              borderRadius: BorderRadius.circular(30)),
          child: const Center(
            child: Text(
              'New Password Screen',
              style: TextStyle(fontSize: 18, color: Colors.white),
            ),
          ),
        ),
        Card(
          elevation: 5,
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.all(10),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              TextField(
                decoration: const InputDecoration(labelText: 'website'),
                controller: websiteController,
              ),
              TextField(
                decoration: const InputDecoration(labelText: 'username'),
                controller: usernameController,
              ),
              TextField(
                decoration: const InputDecoration(
                  labelText: 'password',
                ),
                controller: passwordController,
                obscureText: true,
              ),
              const SizedBox(
                height: 40,
              ),
              Container(
                height: 45,
                width: 200,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(70),
                    ),
                    side: const BorderSide(color: Colors.white, width: 1),
                    primary: Color.fromARGB(255, 114, 61, 188),
                  ),
                  child: const Text(
                    'Add New Password',
                  ),
                  onPressed: () {
                    _submitData();
                  },
                ),
              )
            ]),
          ),
        ),
      ]),
    );
  }
}
