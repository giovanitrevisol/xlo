import 'package:flutter/material.dart';
import 'package:xlo/common/custom_drawer/custom_drawer.dart';
import 'package:xlo/screens/home/widgets/search_dialog.dart';

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
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                _openSearch('');
              })
        ],
      ),
      drawer: CustomDrawer(),
    );
  }

  _openSearch(String currentSearch) async {
    final String search = await showDialog(
      context: context,
      builder: (context) => SearchDialog(currentSearch),
    );
  }
}
