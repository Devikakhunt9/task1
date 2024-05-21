import 'package:flutter/material.dart';

class ServicesByCustomerPage extends StatelessWidget {
  int customerID;
   ServicesByCustomerPage({super.key,required this.customerID});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          leading: InkWell(
            onTap: () => Navigator.of(context).pop(),
          ),
          title: Text("Services"),
          backgroundColor: Colors.blue,
        ),
        body: Column(
          children: [
            Text("${customerID+1}"),
            Expanded(
              child: ListView.builder(
                itemCount: 5,
                itemBuilder: (context, index) {
                  return Card(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("Services Used"),
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
