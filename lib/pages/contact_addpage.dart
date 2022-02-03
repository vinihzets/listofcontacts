import 'dart:io';

import 'package:agendadetarefas/helpers/contact_helper.dart';
import 'package:flutter/material.dart';

class NewContact extends StatefulWidget {
  final Contact contact;

  NewContact({this.contact});

  @override
  _NewContactState createState() => _NewContactState();
}

class _NewContactState extends State<NewContact> {
  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _emailController = TextEditingController();

  final _nameFocus = FocusNode();

  bool _userEdited = false;

  Contact _editedContact;

  @override
  void initState() {
    super.initState();

    if (widget.contact == null) {
      _editedContact = Contact();
    } else {
      _editedContact = Contact.fromMap(widget.contact.toMap());

      _nameController.text = _editedContact.name;
      _emailController.text = _editedContact.email;
      _phoneController.text = _editedContact.phone;
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: _requestPop,
        child: Scaffold(
            appBar: AppBar(
              title: Text(_editedContact.name ?? "Novo Contato!"),
              centerTitle: true,
              backgroundColor: Colors.red,
            ),
            body: SingleChildScrollView(
              child: Center(
                child: Column(
                  children: [
                    Container(
                      width: 150.0,
                      height: 150.0,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              image: _editedContact.img != null
                                  ? FileImage(File(_editedContact.img))
                                  : NetworkImage(
                                      'https://i.dlpng.com/static/png/6950136_preview.png'))),
                    ),
                    TextField(
                      decoration: InputDecoration(labelText: 'Nome'),
                      focusNode: _nameFocus,
                      onChanged: (text) {
                        _userEdited = true;
                        setState(() {
                          _editedContact.name = text;
                        });
                      },
                      controller: _nameController,
                    ),
                    TextField(
                      decoration: InputDecoration(labelText: 'E-mail'),
                      onChanged: (text) {
                        _userEdited = true;
                        _editedContact.email = text;
                      },
                      keyboardType: TextInputType.emailAddress,
                      controller: _emailController,
                    ),
                    TextField(
                      decoration: InputDecoration(labelText: 'phone'),
                      onChanged: (text) {
                        _userEdited = true;
                        _editedContact.phone = text;
                      },
                      keyboardType: TextInputType.phone,
                      controller: _phoneController,
                    ),
                  ],
                ),
              ),
            ),
            floatingActionButton: FloatingActionButton(
                onPressed: () {
                  if (_editedContact.name != null &&
                      _editedContact.name.isNotEmpty) {
                    Navigator.pop(context, _editedContact);
                  } else {
                    FocusScope.of(context).requestFocus(_nameFocus);
                  }
                },
                child: Icon(Icons.save),
                backgroundColor: Colors.red)));
  }

  Future<bool> _requestPop() {
    if (_userEdited) {
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text('Descartar Alterações'),
              content: Text('Se sair as alterações serao perdidas!'),
              actions: <Widget>[
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('Cancelar!'),
                ),
                ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                      Navigator.pop(context);
                    },
                    child: Text('Sim!'))
              ],
            );
          });
      return Future.value(false);
    } else {
      return Future.value(true);
    }
  }
}
