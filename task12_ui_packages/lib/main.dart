import 'package:flutter/material.dart';
import 'package:task12_ui_packages/dropdown_pack.dart';
import 'package:task12_ui_packages/get_widget_pack.dart';

import 'calendar_view_pack.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    ),
  );
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('UI Packages')),
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => GetWidgetDemo(),
                  ),
                );
              },
              child: Text('Get Widget Package'),
            ),


            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CalenderViewDemo(),
                  ),
                );
              },
              child: Text('Get Calendar View Package'),
            ),

            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MyHomePage(),
                  ),
                );
              },
              child: Text('Dropdown Package'),
            ),

          ],

        ),
      ),
    );
  }
}
