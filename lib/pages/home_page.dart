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

  List<Contact> contacts = <Contact>[];


  @override
  void initState(){
    super.initState();

    helper.getAllContacts().then((list){
contacts = list;
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
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.red,
        child: Icon(
          Icons.add,
        ),
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(20.0),
        itemCount:
        itemBuilder: (context, index){

        },
      ),
    );
  }
}
