import 'package:flutter/material.dart';

class SimpleDrawer extends StatelessWidget {
  final List<Map<String, dynamic>> menuItems;

  const SimpleDrawer({Key key, @required this.menuItems}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          AppBar(
            automaticallyImplyLeading: false,
            title: Text('Menu'),
          ),
          Column(
            children: [
              ...menuItems.map((e) {
                return ListTile(
                  leading: Icon(e["icon"]),
                  title: Text(e["label"]),
                  onTap: () {
                    Navigator.pushReplacement(context, e["route"]);
                  },
                );
              }).toList()
            ],
          )
        ],
      ),
    );
  }
}
