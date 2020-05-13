import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:xlo/blocs/drawer_bloc.dart';
import 'package:xlo/common/custom_drawer/widgets/icon_title.dart';

class IconSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //busca o provider
    final DrawerBloc _drawerBloc = Provider.of<DrawerBloc>(context);
    //
    void _setPage(int page) {
      Navigator.of(context).pop();
      _drawerBloc.setPage(page);
    }

    return StreamBuilder<int>(
        stream: _drawerBloc.outPage,
        builder: (context, snapshot) {
          return Column(
            children: <Widget>[
              IconTitle(
                label: 'Anúncios',
                iconData: Icons.list,
                onTap: () {
                  _setPage(0);
                },
                highlihted: snapshot.data == 0,
              ),
              IconTitle(
                label: 'Inserir Anúncio',
                iconData: Icons.edit,
                onTap: () {
                  _setPage(1);
                },
                highlihted: snapshot.data == 1,
              ),
              IconTitle(
                label: 'Chat',
                iconData: Icons.chat,
                onTap: () {
                  _setPage(2);
                },
                highlihted: snapshot.data == 2,
              ),
              IconTitle(
                label: 'Favorito',
                iconData: Icons.favorite,
                onTap: () {
                  _setPage(3);
                },
                highlihted: snapshot.data == 3,
              ),
              IconTitle(
                label: 'Minha Conta',
                iconData: Icons.person,
                onTap: () {
                  _setPage(4);
                },
                highlihted: snapshot.data == 4,
              ),
            ],
          );
        });
  }
}
