import 'package:flutter/material.dart';

class NewContact extends StatefulWidget {
  const NewContact({Key key}) : super(key: key);

  @override
  _NewContactState createState() => _NewContactState();
}

class _NewContactState extends State<NewContact> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Novo Contato'),
          centerTitle: true,
          backgroundColor: Colors.red,
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              children: const [
                Icon(
                  Icons.person_add_alt_outlined,
                  size: 130.0,
                ),
                TextField(
                  decoration: InputDecoration(labelText: 'Nome'),
                ),
                TextField(
                  decoration: InputDecoration(labelText: 'E-mail'),
                ),
                TextField(
                  decoration: InputDecoration(labelText: 'phone'),
                ),
              ],
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
            onPressed: () {},
            child: Icon(Icons.store),
            backgroundColor: Colors.red));
  }
}
