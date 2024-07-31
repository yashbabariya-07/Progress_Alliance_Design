// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:intl/intl.dart';
// import 'package:table_calendar/table_calendar.dart';

// class Event {
//   final String title;
//   Event(this.title);

//   @override
//   String toString() => title;
// }

// class Calender extends StatefulWidget {
//   const Calender({super.key});

//   @override
//   State<Calender> createState() => _CalenderState();
// }

// class _CalenderState extends State<Calender> {
//   DateTime today = DateTime.now();
//   Map<DateTime, List<Event>> selectedEvents = {};

//   void _onDaySelected(DateTime day, DateTime focusedDay) {
//     setState(() {
//       today = day;
//     });
//   } 

//   List<Event> _getEventsForDay(DateTime day) {
//     return selectedEvents[day] ?? [];
//   }

//   void _addEvent() {
//     final eventController = TextEditingController();
//     showDialog(
//       context: context,
//       builder: (context) => AlertDialog(
//         title: Text('Add Event'),
//         content: TextField(
//           controller: eventController,
//         ),
//         actions: [
//           TextButton(
//             child: Text('Cancel'),
//             onPressed: () => Navigator.pop(context),
//           ),
//           TextButton(
//             child: Text('Add'),
//             onPressed: () {
//               if (eventController.text.isEmpty) return;
//               setState(() {
//                 if (selectedEvents[today] != null) {
//                   selectedEvents[today]!.add(Event(eventController.text));
//                 } else {
//                   selectedEvents[today] = [Event(eventController.text)];
//                 }
//               });
//               Navigator.pop(context);
//             },
//           ),
//         ],
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         centerTitle: true,
//         leading: GestureDetector(
//             onTap: () {
//               Navigator.pop(context);
//             },
//             child: Icon(Icons.arrow_back_ios_rounded)),
//         title: Text(
//           "PA Calendar",
//           style: TextStyle(
//             fontFamily: 'Inter',
//             fontSize: 18.sp,
//           ),
//         ),
//         actions: [
//           IconButton(
//             icon: Icon(Icons.filter_alt),
//             onPressed: () {},
//           ),
//           IconButton(
//             icon: Icon(Icons.refresh),
//             onPressed: () {},
//           ),
//           // IconButton(
//           //   icon: Icon(Icons.add),
//           //   onPressed: _addEvent,
//           // ),
//         ],
//       ),
//       body: content(),
//     );
//   }

//   Widget content() {
//     return Column(
//       children: [
//         TableCalendar(
//           locale: "en_US",
//           rowHeight: 43,
//           headerStyle: HeaderStyle(
//             formatButtonVisible: false,
//             titleCentered: true,
//             titleTextStyle: TextStyle(
//                 color: Colors.black, fontFamily: 'Lexend_w', fontSize: 15.sp),
//             leftChevronIcon: Icon(Icons.arrow_circle_left_rounded),
//             rightChevronIcon: Icon(Icons.arrow_circle_right_rounded),
//           ),
//           daysOfWeekStyle: DaysOfWeekStyle(
//             weekdayStyle: TextStyle(color: Colors.black, fontFamily: 'Lexend'),
//             weekendStyle: TextStyle(color: Colors.black, fontFamily: 'Lexend'),
//           ),
//           availableGestures: AvailableGestures.all,
//           selectedDayPredicate: (day) => isSameDay(day, today),
//           focusedDay: today,
//           firstDay: DateTime.utc(2020, 1, 1),
//           lastDay: DateTime.utc(2050, 12, 31),
//           onDaySelected: _onDaySelected,
//           eventLoader: _getEventsForDay,
//           calendarBuilders: CalendarBuilders(
//             dowBuilder: (context, day) {
//               final text = DateFormat.E().format(day);
//               final color =
//                   day.weekday == DateTime.sunday ? Colors.red : Colors.black;
//               return Center(
//                 child: Text(
//                   text,
//                   style: TextStyle(color: color, fontFamily: 'Lexend'),
//                 ),
//               );
//             },
//             defaultBuilder: (context, date, _) {
//               if (date.weekday == DateTime.sunday) {
//                 return Center(
//                   child: Text(
//                     '${date.day}',
//                     style: TextStyle(color: Colors.red, fontFamily: 'Lexend'),
//                   ),
//                 );
//               }
//               return null;
//             },
//             todayBuilder: (context, date, _) {
//               if (date.weekday == DateTime.sunday) {
//                 return Container(
//                   decoration: BoxDecoration(
//                     shape: BoxShape.circle,
//                     color: Colors.red.withOpacity(0.3),
//                   ),
//                   margin: const EdgeInsets.all(6.0),
//                   alignment: Alignment.center,
//                   child: Text(
//                     '${date.day}',
//                     style: TextStyle(
//                         color: Colors.red,
//                         fontWeight: FontWeight.bold,
//                         fontFamily: 'Lexend'),
//                   ),
//                 );
//               }
//               return Container(
//                 decoration: BoxDecoration(
//                   shape: BoxShape.circle,
//                   color: Colors.blue,
//                 ),
//                 margin: const EdgeInsets.all(6.0),
//                 alignment: Alignment.center,
//                 child: Text(
//                   '${date.day}',
//                   style: TextStyle(color: Colors.white, fontFamily: 'Lexend'),
//                 ),
//               );
//             },
//             selectedBuilder: (context, date, _) {
//               return Container(
//                 decoration: BoxDecoration(
//                   shape: BoxShape.circle,
//                   color: Colors.black,
//                 ),
//                 margin: const EdgeInsets.all(6.0),
//                 alignment: Alignment.center,
//                 child: Text(
//                   '${date.day}',
//                   style: TextStyle(color: Colors.white, fontFamily: 'Lexend'),
//                 ),
//               );
//             },
//             // markerBuilder: (context, date, events) {
//             //   if (events.isNotEmpty) {
//             //     return Positioned(
//             //       right: 1,
//             //       bottom: 1,
//             //       child: _buildEventsMarker(date, events.cast<Event>()),
//             //     );
//             //   }
//             //   return Container();
//             // },
//           ),
//         ),
//         Divider(thickness: 1, height: 10, color: Colors.grey),
//         const SizedBox(height: 8.0),
//         Expanded(
//           child: _buildEventList(),
//         ),
//       ],
//     );
//   }

//   // Widget _buildEventsMarker(DateTime date, List<Event> events) {
//   //   return Container(
//   //     decoration: BoxDecoration(
//   //       shape: BoxShape.circle,
//   //       color: Colors.blue,
//   //     ),
//   //     width: 16.0,
//   //     height: 16.0,
//   //     child: Center(
//   //       child: Text(
//   //         '${events.length}',
//   //         style: TextStyle().copyWith(
//   //           color: Colors.white,
//   //           fontSize: 12.0,
//   //         ),
//   //       ),
//   //     ),
//   //   );
//   // }

//   Widget _buildEventList() {
//     return ListView(
//       children: _getEventsForDay(today)
//           .map((event) => ListTile(
//                 title: Text(event.toString()),
//               ))
//           .toList(),
//     );
//   }
// }
