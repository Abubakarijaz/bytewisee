import 'package:getwidget/getwidget.dart';
import 'package:flutter/material.dart';
class GetWidgetDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
        title: 'Get Widget Demo',
        theme: ThemeData(
          primarySwatch: Colors.green,
        ),
        home: Scaffold(
            body: Center(
              child: GFCard(
                boxFit: BoxFit.cover,
                title: GFListTile(
                  avatar: GFAvatar(
                    backgroundImage: AssetImage('imagess/boy.jpg'),
                  ),
                  title: Text('Card Title Here'),
                  subTitle: Text('Card Sub Title Here'),
                ),
                content: Text("This is get widget card demo"),
                buttonBar: GFButtonBar(
                  children: <Widget>[
                    GFButton(
                      text: 'Subscribe',
                      onPressed: () {},
                    ),
                    GFButton(
                      text: 'Cancel',
                      onPressed: () {},
                    ),
                    GFButton(
                      text: 'Go Back',
                      onPressed: (){
                        Navigator.pop(context);


                      },

                    )
                  ],
                ),
              ),
            )));
  }
}