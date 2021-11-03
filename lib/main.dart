import 'package:flutter/material.dart';
import 'package:app/screens/component_detail_screen.dart';
import 'package:app/screens/components_list_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const ComponentListScreen(),
      routes: {
        ComponentListScreen.routeName: (context) => const ComponentListScreen(),
        ComponentDetailScreen.routeName: (context) =>
            const ComponentDetailScreen()
      },
    );
  }
}
