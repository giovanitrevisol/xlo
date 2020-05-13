import 'package:flutter/material.dart';
import 'package:xlo/common/custom_drawer/custom_drawer.dart';

class HomeScreem extends StatefulWidget {
  @override
  _HomeScreemState createState() => _HomeScreemState();
}

class _HomeScreemState extends State<HomeScreem> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("XLO"),
      ),
      drawer: CustomDrawer(),
    );
  }
}
