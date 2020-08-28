import 'package:flutter/material.dart';
import 'package:inventory/utils/size_config.dart';
import 'package:inventory/widgets/drawers.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import 'product_create.dart';
import 'product_list.dart';

class Dashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    final List<Map<String, dynamic>> views = [
      { "label": "Create Product", "icon": Icons.edit, 
        "screen": ProductCreate()},
      { "label": "Products", "icon": Icons.list, "screen": ProductList()}
    ];

    final List<Map<String, dynamic>> menuItems = [
      { "label": "Profile", "icon": Icons.person, "route": "profile" },
      { "label": "Orders", "icon": Icons.list, "route": "profile" },
      { "label": "Users", "icon": Icons.people, "route": "profile" },
      { "label": "Audit", "icon": Icons.security, "route": "profile" },
      { "label": "Messages", "icon": Icons.message, "route": "profile"},
      { "label": "Settings", "icon": Icons.settings, "route": "profile" }
    ];
    
    return DefaultTabController(
      length: views.length,
      initialIndex: 0, // This is the default, so you dont need to specify this
      child: Scaffold(
        appBar: AppBar(
          title: Text('Inventory'),
          bottom: TabBar(
            tabs: views.map((e) => Tab(
              text: e["label"] as String,
              icon: Icon(e["icon"] as IconData),
            )).toList()
          ),
        ),
        body: TabBarView(
          children: views.map((e) => e["screen"] as Widget).toList()
        ),
        drawer: SimpleDrawer(menuItems: menuItems),
      ),
    );
  }
}