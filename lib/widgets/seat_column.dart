import 'package:flutter/material.dart';
import '../model/seat.dart';

// ignore: must_be_immutable
class SeatColumn extends StatefulWidget {
  SeatColumn({super.key, required this.selected, required this.seat});

  List<Seat> selected;

  Seat seat;

  @override
  State<SeatColumn> createState() => _SeatColumnState();
}

class _SeatColumnState extends State<SeatColumn> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          if (widget.seat.status != 'booked' &&
              widget.seat.status != 'pending') {
            if (widget.selected.length < 6) {
              if (widget.selected.contains(widget.seat)) {
                widget.selected.remove(widget.seat);
                // print(widget.selected.map((e) => e.seat_no).toList());
              } else {
                widget.selected.add(widget.seat);
                // print(widget.selected.map((e) => e.seat_no).toList());
              }
            } else {
              if (widget.selected.contains(widget.seat)) {
                widget.selected.remove(widget.seat);
              } else {
                ScaffoldMessenger.of(context).hideCurrentSnackBar();
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text('You can Select only 6 Seats')));
              }
            }
          } else {
            ScaffoldMessenger.of(context).hideCurrentSnackBar();
            ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('this seat is ${widget.seat.status}')));
          }
        });
      },
      child: Stack(alignment: Alignment.center, children: [
        SizedBox(
          height: 40,
          width: 50,
          child: Image.asset(
            widget.seat.status == 'booked'
                ? 'assets/book.png'
                : widget.seat.status == 'pending'
                    ? 'assets/wait.png'
                    : widget.selected.contains(widget.seat)
                        ? 'assets/pros.png'
                        : 'assets/avail.png',
            fit: BoxFit.fill,
          ),
        ),
        if (widget.seat.seatNo != 'null')
          Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: Text(
              widget.seat.seatNo,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
      ]),
    );
  }
}
