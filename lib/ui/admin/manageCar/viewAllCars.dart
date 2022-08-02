import 'package:flutter/material.dart';

class ViewAllCars extends StatefulWidget {
  const ViewAllCars({Key? key}) : super(key: key);

  @override
  State<ViewAllCars> createState() => _ViewAllCarsState();
}

class _ViewAllCarsState extends State<ViewAllCars> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("View All Cars"),
      ),
    );
  }
}
