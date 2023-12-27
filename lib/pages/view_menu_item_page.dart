// view_menu_item_page.dart

import 'package:flutter/material.dart';
import 'package:restaurant/pages/home_page.dart';

class ViewMenuItemPage extends StatelessWidget {
  final List<MenuItem> menuItems;

  ViewMenuItemPage({required this.menuItems});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Menu Items:'),
          SizedBox(height: 16.0),
          if (menuItems.isNotEmpty)
            for (var menuItem in menuItems)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Item Name: ${menuItem.itemName}'),
                  Text('Price: \$${menuItem.price.toStringAsFixed(2)}'),
                  SizedBox(height: 16.0),
                ],
              )
          else
            Text('No menu items available.'),
        ],
      ),
    );
  }
}
