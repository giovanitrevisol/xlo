import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:xlo/blocs/home_bloc.dart';
import 'package:xlo/models/ad.dart';
import 'package:xlo/screens/home/widgets/product_tile.dart';
import 'package:xlo/screens/home/widgets/top_bar.dart';

import '../../common/custom_drawer/custom_drawer.dart';
import 'widgets/search_dialog.dart';

class HomeScreem extends StatefulWidget {
  @override
  _HomeScreemState createState() => _HomeScreemState();
}

class _HomeScreemState extends State<HomeScreem> {
  HomeBLoc _homeBLoc;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final HomeBLoc homeBLoc = Provider.of<HomeBLoc>(context);
    if (homeBLoc != _homeBLoc) {
      _homeBLoc = homeBLoc;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: StreamBuilder<String>(
            stream: _homeBLoc.outSearch,
            initialData: '',
            builder: (context, snapshot) {
              if (snapshot.data.isEmpty) {
                return Container();
              } else {
                return GestureDetector(
                  onTap: () => _openSearch(snapshot.data),
                  child: LayoutBuilder(builder: (context, constraints) {
                    return Container(
                      child: Text(snapshot.data),
                      width: constraints.biggest.width,
                    );
                  }),
                );
              }
            }),
        actions: <Widget>[
          StreamBuilder<String>(
            stream: _homeBLoc.outSearch,
            initialData: '',
            builder: (context, snapshot) {
              if (snapshot.data.isEmpty) {
                return IconButton(
                    icon: Icon(Icons.search),
                    onPressed: () {
                      _openSearch('');
                    });
              } else {
                return IconButton(
                    icon: Icon(Icons.close),
                    onPressed: () {
                      _homeBLoc.setSearch('');
                    });
              }
            },
          )
        ],
      ),
      drawer: CustomDrawer(),
      body: Column(
        children: <Widget>[
          TopBar(),
          Expanded(
            child: StreamBuilder<List<Ad>>(
                stream: _homeBLoc.outAd,
                builder: (contex, snapshot) {
                  if (snapshot.data == null) return Container();
                  return ListView.builder(
                      itemCount: snapshot.data.length,
                      itemBuilder: (context, index) {
                        return ProductTile(snapshot.data[index]);
                      });
                }),
          ),
        ],
      ),
    );
  }

  _openSearch(String currentSearch) async {
    final String search = await showDialog(
      context: context,
      builder: (context) => SearchDialog(currentSearch),
    );
    if (search != null) {
      _homeBLoc.setSearch(search);
    }
  }
}
