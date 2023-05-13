import 'package:flutter/material.dart';
import 'package:calendar_view/calendar_view.dart';
class CalenderViewDemo extends StatelessWidget {
  final _eventController = EventController();

  @override
  Widget build(BuildContext context) {
    return CalendarControllerProvider(
      controller: _eventController,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'calendar view demo',
        theme: ThemeData(
          primarySwatch: Colors.orange,
        ),
        home: Scaffold(
          appBar: AppBar(
            actions: [
              Center(
                child: GestureDetector(onTap:(){
                  Navigator.pop(context);
                } ,   child: Padding(
                  padding: const EdgeInsets.only(right: 200.0),
                  child: Text("Go Back",),
                )),
              ),
              SizedBox(height: 20),
            ],
          ),
          body: MonthView(
              controller: _eventController,
              minMonth: DateTime(2000),
              maxMonth: DateTime(2030),
              initialMonth: DateTime(2022),
              cellAspectRatio: 1,
              onPageChange: (DateTime date, int pageIndex) =>
                  print("date, pageIndex"),
              onCellTap: (List < CalendarEventData > events, DateTime date) {
                print(events);
              },
              onEventTap: (CalendarEventData event, DateTime date) =>
                  print(event),
              onDateLongPress: (DateTime date) => print(date)),


        ),
      ),
    );
  }
}
