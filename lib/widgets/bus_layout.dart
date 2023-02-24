import 'package:bus/model/seat.dart';
import 'package:bus/widgets/seats_row.dart';
import 'package:flutter/material.dart';

class BusLayout extends StatelessWidget {
  const BusLayout({
    Key? key,
    required this.seatList,
    required List<Seat> seats,
    required List<Seat> selected,
  })  : _seats = seats,
        _selected = selected,
        super(key: key);

  final List<List<String>> seatList;
  final List<Seat> _seats;
  final List<Seat> _selected;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Container(
          margin: const EdgeInsets.only(
            top: 10,
            right: 20,
            bottom: 2,
          ),
          child: Image.asset(
            'assets/s-wheel.png',
            width: 50,
          ),
        ),
        ListView.builder(
          itemCount: 13,
          primary: false,
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemBuilder: (context, row) {
            return Container(
              margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              child: SeatRow(
                row: seatList[row],
                seats: _seats,
                selected: _selected,
              ),
            );
          },
        ),
      ],
    );
  }
}
