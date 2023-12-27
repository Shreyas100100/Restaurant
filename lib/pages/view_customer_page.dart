// view_customer_page.dart

import 'package:flutter/material.dart';
import 'package:restaurant/pages/home_page.dart';

class ViewCustomerPage extends StatelessWidget {
  final List<Customer> customers;

  ViewCustomerPage({required this.customers});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Customers:'),
          SizedBox(height: 16.0),
          if (customers.isNotEmpty)
            for (var customer in customers)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Name: ${customer.name}'),
                  Text('Phone Number: ${customer.phoneNumber}'),
                  SizedBox(height: 16.0),
                ],
              )
          else
            Text('No customers available.'),
        ],
      ),
    );
  }
}
