import 'package:agendadetarefas/helpers/contact_helper.dart';
import 'package:agendadetarefas/pages/contact_addpage.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ContactHelper helper = ContactHelper();

  @override
  void initState() {
    super.initState();

    // Contact c = Contact();
    // c.name = "Vinicius Almeida";
    // c.email = "viniciusdaarky@outlook.com";
    // c.phone = "62984208666";
    // c.img = "teste";

    // helper.saveContact(c);

    helper.getAllContacts().then((list) {
      print(list);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contatos'),
        backgroundColor: Colors.red,
        centerTitle: true,
        actions: [IconButton(icon: Icon(Icons.settings), onPressed: () {})],
      ),
      floatingActionButton: const FloatingActionButton(
        backgroundColor: Colors.red,
        child: const Icon(
          Icons.add,
        ),
      ),
    );
  }
}
