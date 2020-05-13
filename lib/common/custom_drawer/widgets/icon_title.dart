import 'package:flutter/material.dart';

class IconTitle extends StatelessWidget {
  final String label;
  final IconData iconData;
  final VoidCallback onTap;
  final bool highlihted;

  const IconTitle(
      {Key key, this.label, this.iconData, this.onTap, this.highlihted})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        label,
        style: TextStyle(
            fontWeight: FontWeight.w600,
            letterSpacing: 0.8,
            color: highlihted ? Colors.blue : Colors.black),
      ),
      leading: Icon(
        iconData,
        color: highlihted ? Colors.blue : Colors.black,
      ),
      onTap: onTap,
      contentPadding: const EdgeInsets.fromLTRB(20, 0, 10, 0),
    );
  }
}
