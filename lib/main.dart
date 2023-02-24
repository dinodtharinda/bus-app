// ignore_for_file: avoid_print

import 'dart:convert';
import 'package:bus/model/seat.dart';
import 'package:bus/widgets/bus_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MaterialApp(
    home: HomePage(),
    theme: ThemeData(),
  ));
}

class HomePage extends StatelessWidget {
  HomePage({super.key});
  final List<Seat> _seats = [];
  final List<Seat> _selected = [];
  final seatList = List.generate(
      13, (i) => List.filled(6, 'null', growable: false),
      growable: false);

  Future<List> readjsonData() async {
    //fetching json data
    final jsondata =
        await rootBundle.loadString('lib/json/new_get_seat_status.json');
    final list = await json.decode(jsondata);
    final seatDetials = await list['result']["bus"]["seat_details"] as List;
    for (var element in seatDetials) {
      _seats.add(Seat(
          seatNo: element["seat_no"] as String,
          row: element["row"] as int,
          col: element["col"] as int,
          status: element["seat_status"] as String));
    }
    _seats.toList().forEach((seat) {
      seatList[seat.col][seat.row] = seat.seatNo;
    });
    return seatDetials;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(elevation: 5),
      body: FutureBuilder(
        future: readjsonData(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.done:
              return SingleChildScrollView(
                child: BusLayout(
                  seatList: seatList,
                  seats: _seats,
                  selected: _selected,
                ),
              );
            default:
              return const CircularProgressIndicator();
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        elevation: 10,
        child: const Icon(Icons.save),
        onPressed: () {
          print(_selected.map((e) => e.seatNo).toList());
        },
      ),
    );
  }
}






























// Row(
//       children: [
        
//         TextButton(
//           onPressed: list[0] == ''
//               ? null
//               : () {
//                   print(list[0]);
//                 },
//           child: Text(list[0]),
//         ),
//         TextButton(
//           onPressed: list[1] == ''
//               ? null
//               : () {
//                   print(list[1]);
//                 },
//           child: Text(list[1]),
//         ),
//         TextButton(
//           onPressed: list[2] == ''
//               ? null
//               : () {
//                   print(list[2]);
//                 },
//           child: Text(list[2]),
//         ),
//         TextButton(
//           onPressed: list[3] == ''
//               ? null
//               : () {
//                   print(list[3]);
//                 },
//           child: Text(list[3]),
//         ),
//         TextButton(
//           onPressed: list[4] == ''
//               ? null
//               : () {
//                   print(list[4]);
//                 },
//           child: Text(list[4]),
//         ),
//         TextButton(
//           onPressed: list[5] == ''
//               ? null
//               : () {
//                   print(list[5]);
//                 },
//           child: Text(list[5]),
//         ),
//       ],
//     );