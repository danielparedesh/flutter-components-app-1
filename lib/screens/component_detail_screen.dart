import 'dart:convert';

import 'package:app/utils/icono_string_util.dart';
import 'package:flutter/material.dart';
import 'package:app/models/menu_opts.dart';

class ComponentDetailScreen extends StatefulWidget {
  const ComponentDetailScreen({Key? key}) : super(key: key);

  static const String routeName = '/menu_opt-detail';

  @override
  _ComponentDetailScreenState createState() => _ComponentDetailScreenState();
}

class _ComponentDetailScreenState extends State<ComponentDetailScreen> {
  var componentName = "";
  Menu_opts? menu_opt;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    var componentString = ModalRoute.of(context)?.settings.arguments as String;
    var componentJson = jsonDecode(componentString);

    setState(() {
      menu_opt = Menu_opts.fromJson(componentJson);
      componentName = menu_opt!.texto;
    });

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(componentName),
      ),
      body: Center(
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                height: 25,
              ),
              Container(
                margin: EdgeInsets.all(5.0),
                child: Text("Ruta : " + (menu_opt!.ruta),
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 25.0)),
              ),
              SizedBox(
                height: 25,
              ),
              Container(
                  margin: EdgeInsets.all(5.0),
                  child: Text("Icon : " + (menu_opt!.icon),
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 25.0))),
              SizedBox(
                height: 25,
              ),
              Container(
                  margin: EdgeInsets.all(5.0),
                  child: Text("Texto : " + (menu_opt!.texto),
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 25.0))),
              Container(
                margin: EdgeInsets.all(5.0),
                child: getIcon(menu_opt!.icon),
              ),
              Container(
                margin: EdgeInsets.all(10.0),
                child: TextButton(
                  style: TextButton.styleFrom(
                    padding: const EdgeInsets.all(16.0),
                    primary: Colors.blue,
                    textStyle: const TextStyle(fontSize: 20),
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('Regresar'),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
