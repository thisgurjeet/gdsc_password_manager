import 'package:flutter/material.dart';

import 'package:password_manage_gdsc/model/my_data.dart';
import 'package:password_manage_gdsc/view/new_list.dart';

class SavedPasswordScreen extends StatefulWidget {
  const SavedPasswordScreen({super.key});

  @override
  State<SavedPasswordScreen> createState() => _SavedPasswordScreenState();
}

class _SavedPasswordScreenState extends State<SavedPasswordScreen> {
  final List<MyData> userData = [
    // MyData(
    //     id: DateTime.now().toString(),
    //     website: 'instagram',
    //     username: 'thisgurjeet',
    //     password: 'jumanji2@'),
    // MyData(
    //     id: DateTime.now().toString(),
    //     website: 'Leetcode',
    //     username: 'thisgurjeet',
    //     password: 'jumanji2@')
  ];

  void _addNewData(String website, String username, String password) {
    final newData = MyData(
        website: website,
        username: username,
        password: password,
        id: DateTime.now().toString());

    setState(() {
      userData.add(newData);
    });
  }

  void _editData(String website, String username, String password) {
    final newData = MyData(
        website: website,
        username: username,
        password: password,
        id: DateTime.now().toString());

    setState(() {
      userData.replaceRange(0, userData.length, []);
    });
  }

  void startAddNewData(BuildContext ctx) {
    showModalBottomSheet(
        context: ctx,
        builder: (bctx) {
          return GestureDetector(
            onTap: () {},
            behavior: HitTestBehavior.opaque,
            child: NewList(_addNewData),
          );
        });
  }

  void _deleteData(String id) {
    setState(() {
      userData.removeWhere((data) {
        return data.id == id;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 87, 70, 138),
          title: const Text(
            'Your saved passwords',
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              Container(
                height: 550,
                child: userData.isEmpty
                    ? Column(
                        children: [
                          const SizedBox(
                            height: 20,
                          ),
                          const Text(
                            'No Passwords added yet',
                            style: TextStyle(
                                color: Colors.purple,
                                fontSize: 25,
                                fontFamily: 'OpenSans'),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Container(
                              height: 300,
                              width: MediaQuery.of(context).size.width,
                              child: const Image(
                                image: AssetImage(
                                    'assets/images/no-data-found.png'),
                                fit: BoxFit.cover,
                              ))
                        ],
                      )
                    : ListView.builder(
                        itemCount: userData.length,
                        itemBuilder: (ctx, index) {
                          return Container(
                              height: 150,
                              child: Card(
                                shadowColor: Colors.purple,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(25)),
                                color: Color.fromARGB(255, 171, 146, 245),
                                margin: const EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 10),
                                elevation: 5,
                                child: ListTile(
                                  leading: null,
                                  title: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const SizedBox(
                                        height: 12,
                                      ),
                                      Text(
                                        'a. Website: ${userData[index].website}',
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.w400,
                                            fontSize: 18),
                                      ),
                                      const SizedBox(
                                        height: 4,
                                      ),
                                      const Divider(
                                        thickness: 0.9,
                                        // color: Colors.purple.shade400,
                                      ),
                                      Text(
                                          'b. Username: ${userData[index].username}',
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.w400,
                                              fontSize: 18)),
                                      const SizedBox(
                                        height: 4,
                                      ),
                                      const Divider(
                                        thickness: 0.9,
                                        // color: Colors.purple.shade400,
                                      ),
                                      Text(
                                          'c. Password: ${userData[index].password}',
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.w400,
                                              fontSize: 18))
                                    ],
                                  ),
                                  trailing: Column(children: [
                                    InkWell(
                                      onTap: () {
                                        startAddNewData(context);
                                      },
                                      child: const Icon(
                                        Icons.edit,
                                        color: Colors.deepPurple,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 8,
                                    ),
                                    InkWell(
                                      onTap: () {
                                        _deleteData(userData[index].id);
                                      },
                                      child: const Icon(
                                        Icons.delete,
                                        color: Colors.deepPurple,
                                      ),
                                    )
                                  ]),
                                ),
                              ));
                        },
                      ),
              ),
              FloatingActionButton(
                  backgroundColor: Colors.deepPurple,
                  child: const Icon(Icons.add),
                  onPressed: (() {
                    startAddNewData(context);
                  })),
            ],
          ),
        ));
  }
}
