import 'package:flutter/material.dart';
import 'package:xlo/common/custom_drawer/widgets/icon_title.dart';

class IconSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        IconTitle(
          label: 'Anúncios',
          iconData: Icons.list,
          onTap: () {},
          highlihted: true,
        ),
        IconTitle(
          label: 'Inserir Anúncio',
          iconData: Icons.edit,
          onTap: () {},
          highlihted: false,
        ),
        IconTitle(
          label: 'Chat',
          iconData: Icons.chat,
          onTap: () {},
          highlihted: false,
        ),
        IconTitle(
          label: 'Favorito',
          iconData: Icons.favorite,
          onTap: () {},
          highlihted: false,
        ),
        IconTitle(
          label: 'Minha Conta',
          iconData: Icons.person,
          onTap: () {},
          highlihted: false,
        ),
      ],
    );
  }
}
