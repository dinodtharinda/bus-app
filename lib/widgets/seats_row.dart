import 'package:flutter/material.dart';
import '../model/seat.dart';
import 'seat_column.dart';

class SeatRow extends StatelessWidget {
 const SeatRow(
      {super.key,
      required this.row,
      required this.seats,
      required this.selected});
  final List row;
  final List<Seat> seats;
  final List<Seat> selected;

  @override
  Widget build(BuildContext context) {
    var list = row.reversed.toList();
    return GridView.builder(
      primary: false,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 6, crossAxisSpacing: 10),
      itemCount: 6,
      itemBuilder: (context, index) {
        return list[index] != 'null'
            ? SeatColumn(
                seat: seats.firstWhere(
                  (element) => element.seatNo == list[index],
                ),
                selected: selected,
              )
            : Container();
      },
    );
  }
}
