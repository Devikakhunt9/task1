import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:task1/admin/services_by_customer_page.dart';

class HomePage_Admin extends StatelessWidget {
  const HomePage_Admin({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("Home"),
          backgroundColor: Colors.blue,
          leading: InkWell(
            onTap: () => Navigator.of(context).pop(),
          ),
        ),
        body: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: 10,
                itemBuilder: (context, index) {
                  return Card(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: InkWell(
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => ServicesByCustomerPage(customerID: index),
                              ),
                            );
                          },
                          child: Text("Customer - ${index + 1}")),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
