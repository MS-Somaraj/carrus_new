import 'package:flutter/material.dart';

class ViewBookings extends StatefulWidget {
  const ViewBookings({Key? key}) : super(key: key);

  @override
  State<ViewBookings> createState() => _ViewBookingsState();
}

class _ViewBookingsState extends State<ViewBookings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("View Bookings"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: SingleChildScrollView(),
        ),
      ),
    );
  }
}
