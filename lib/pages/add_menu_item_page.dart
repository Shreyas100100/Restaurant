// add_menu_item_page.dart

import 'package:flutter/material.dart';
import 'package:restaurant/pages/home_page.dart';

class AddMenuItemPage extends StatelessWidget {
  final TextEditingController itemNameController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final Function(MenuItem) onMenuItemAdded;

  AddMenuItemPage({required this.onMenuItemAdded});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TextField(
            controller: itemNameController,
            decoration: InputDecoration(labelText: 'Item Name'),
          ),
          SizedBox(height: 16.0),
          TextField(
            controller: priceController,
            decoration: InputDecoration(labelText: 'Price'),
            keyboardType: TextInputType.number,
          ),
          SizedBox(height: 16.0),
          ElevatedButton(
            onPressed: () {
              _addMenuItem(context);
            },
            child: Text('Add Menu Item'),
          ),
        ],
      ),
    );
  }

  void _addMenuItem(BuildContext context) {
    String itemName = itemNameController.text;
    String priceText = priceController.text;

    if (itemName.isNotEmpty && priceText.isNotEmpty) {
      double price = double.tryParse(priceText) ?? 0.0;
      MenuItem newMenuItem = MenuItem(itemName: itemName, price: price);
      onMenuItemAdded(newMenuItem);

      // Clear the input fields
      itemNameController.clear();
      priceController.clear();

      // Show a success message
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Menu Item added successfully!'),
        ),
      );
    } else {
      // Show an error message if any of the required fields is empty
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Please fill in all required fields.'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }
}
