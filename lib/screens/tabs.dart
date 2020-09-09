import 'package:flutter/material.dart';

class Tabs extends StatefulWidget {
  @override
  _TabsState createState() => _TabsState();
}

class _TabsState extends State<Tabs> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        child: Scaffold(
          appBar: AppBar(
            title: Text("Meals"),
          ),
        ),
        length: 2);
  }
}