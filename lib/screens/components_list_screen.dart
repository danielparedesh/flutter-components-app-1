import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:app/models/menu_opts.dart';
import 'dart:convert';
import 'package:app/utils/icono_string_util.dart';

import 'package:app/screens/component_detail_screen.dart';

class ComponentListScreen extends StatefulWidget {
  const ComponentListScreen({Key? key}) : super(key: key);

  static const String routeName = '/component-list';

  @override
  _ComponentListScreenState createState() => _ComponentListScreenState();
}

class _ComponentListScreenState extends State<ComponentListScreen> {
  Future<List<dynamic>> readJsonFile() async {
    final String response = await rootBundle.loadString('menu_opts.json');
    final componentData = json.decode(response);

    var list = componentData["rutas"] as List<dynamic>;

    return list.map((e) => Menu_opts.fromJson(e)).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Componentes"),
        ),
        body: FutureBuilder(
          future: readJsonFile(),
          builder: (context, data) {
            if (data.hasError) {
              return Center(child: Text("${data.error}"));
            } else if (data.hasData) {
              var rutas = data.data as List<Menu_opts>;
              return ListView.builder(
                  itemCount: rutas == null ? 0 : rutas.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(rutas[index].texto),
                      ),
                      leading: getIcon(rutas[index].icon),
                      trailing: Icon(
                        Icons.chevron_right,
                        color: Colors.blue,
                      ),
                      onTap: () {
                        Navigator.of(context).pushNamed(
                            ComponentDetailScreen.routeName,
                            arguments: jsonEncode(rutas[index]));
                      },
                    );
                  });
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ));
  }
}
