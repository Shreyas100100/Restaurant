// add_customer_page.dart

import 'package:flutter/material.dart';
import 'package:restaurant/pages/home_page.dart';

class AddCustomerPage extends StatelessWidget {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final Function(Customer) onCustomerAdded;

  AddCustomerPage({required this.onCustomerAdded});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TextField(
            controller: nameController,
            decoration: InputDecoration(labelText: 'Customer Name'),
          ),
          SizedBox(height: 16.0),
          TextField(
            controller: phoneController,
            decoration: InputDecoration(labelText: 'Phone Number'),
            keyboardType: TextInputType.phone,
          ),
          SizedBox(height: 16.0),
          ElevatedButton(
            onPressed: () {
              _addCustomer(context);
            },
            child: Text('Add Customer'),
          ),
        ],
      ),
    );
  }

  void _addCustomer(BuildContext context) {
    String name = nameController.text;
    String phoneNumber = phoneController.text;

    if (name.isNotEmpty && phoneNumber.isNotEmpty) {
      Customer newCustomer = Customer(name: name, phoneNumber: phoneNumber);
      onCustomerAdded(newCustomer);

      // Clear the input fields
      nameController.clear();
      phoneController.clear();

      // Show a success message
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Customer added successfully!'),
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
