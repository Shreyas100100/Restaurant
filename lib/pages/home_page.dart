// home_page.dart

import 'package:flutter/material.dart';
import 'add_customer_page.dart';
import 'view_customer_page.dart';
import 'add_menu_item_page.dart';
import 'view_menu_item_page.dart';

class Customer {
  String name;
  String phoneNumber;

  Customer({required this.name, required this.phoneNumber});
}

class MenuItem {
  String itemName;
  double price;

  MenuItem({required this.itemName, required this.price});
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;
  final List<Customer> customers = [];
  final List<MenuItem> menuItems = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Management App'),
      ),
      body: _buildPage(),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.person_add),
            backgroundColor: Colors.black,
            label: 'Add Customer',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.people),
            backgroundColor: Colors.black,
            label: 'View Customers',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.restaurant_menu),
            backgroundColor: Colors.black,
            label: 'Add Menu Item',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.food_bank),
            backgroundColor: Colors.black,
            label: 'View Menu Items',
          ),
        ],
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }

  Widget _buildPage() {
    if (_currentIndex == 0) {
      return AddCustomerPage(onCustomerAdded: _addCustomer);
    } else if (_currentIndex == 1) {
      return ViewCustomerPage(customers: customers);
    } else if (_currentIndex == 2) {
      return AddMenuItemPage(onMenuItemAdded: _addMenuItem);
    } else {
      return ViewMenuItemPage(menuItems: menuItems);
    }
  }

  void _addCustomer(Customer customer) {
    setState(() {
      customers.add(customer);
    });
  }

  void _addMenuItem(MenuItem menuItem) {
    setState(() {
      menuItems.add(menuItem);
    });
  }
}
