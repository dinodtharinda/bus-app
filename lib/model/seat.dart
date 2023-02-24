class Seat {
  String seatNo;
  int row;
  int col;
  String status;

  Seat(
      {required this.seatNo,
      required this.row,
      required this.col,
      required this.status});

  @override
  bool operator ==(covariant Seat other) =>
      other.seatNo == seatNo && other.col == col && other.row == row;


  @override
  int get hashCode => seatNo.hashCode;
}
