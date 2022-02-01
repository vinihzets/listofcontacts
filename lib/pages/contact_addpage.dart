import 'package:agendadetarefas/helpers/contact_helper.dart';
import 'package:flutter/material.dart';

class NewContact extends StatefulWidget {
  final Contact contact;

  NewContact({this.contact});

  @override
  _NewContactState createState() => _NewContactState();
}

class _NewContactState extends State<NewContact> {
  Contact _editedContact;

  @override
  void initState() {
    super.initState();

    if (widget.contact == null) {
      _editedContact = Contact();
    } else {
      _editedContact = Contact.fromMap(widget.contact.toMap());
    }
  }

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
