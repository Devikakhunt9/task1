import 'package:flutter/material.dart';
import 'package:task1/admin/mqttHandler.dart';

class HomePage_Customer extends StatefulWidget {
  const HomePage_Customer({super.key});

  @override
  State<HomePage_Customer> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage_Customer> {
  List<String> myDevicecList = [
    'light-1',
    'light-2',
    'light-3',
    'fan-1',
    'fan-2',
  ];
  List<bool> deviceStatus = [
    false,
    false,
    false,
    false,
    false,
  ];

  late MqttHandler mqttHandler = new MqttHandler();

  @override
  void initState(){
    super.initState();
    mqttHandler.connect();
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          leading: InkWell(
            onTap: () => Navigator.of(context).pop(),
          ),
          title: Text("Home"),
          backgroundColor: Colors.blue,
        ),
        body: Column(
          children: [
            Expanded(
              flex: 2,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Representing Electricity"),
                  Text("Representing Water Lelvel"),
                ],
              ),
            ),

            ValueListenableBuilder(
              valueListenable: mqttHandler.data,
              builder: (context, value, child) {
                return Text(value.toString());
              },
            ),

            Expanded(
              flex: 8,
              child: GridView.builder(
                scrollDirection: Axis.vertical,
                itemCount: 5,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3),
                itemBuilder: (context, index) {
                  // print("Count of Index in GridView ::::${snapshot.data!['data'].length}");
                  return Card(
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          deviceStatus[index] = !deviceStatus[index];
                          mqttHandler.publishMessage('dk9/led', convertBoolListToString(deviceStatus));
                          // print('String: ${convertBoolListToString(deviceStatus)}');
                        });
                      },
                      child: Center(
                        child: Text(
                          "${myDevicecList[index]}",
                          style: TextStyle(
                            fontSize: 25,
                            color: deviceStatus[index] == false
                                ? Colors.black
                                : Colors.yellow,
                          ),
                        ),
                      ),
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

  String convertBoolListToString(List<bool> list) {
    return list.map((b) => b ? '1' : '0').join('');
  }
}
