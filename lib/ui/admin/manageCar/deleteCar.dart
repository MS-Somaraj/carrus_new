import 'package:flutter/material.dart';

class DeleteCar extends StatefulWidget {
  const DeleteCar({Key? key}) : super(key: key);

  @override
  State<DeleteCar> createState() => _DeleteCarState();
}

class _DeleteCarState extends State<DeleteCar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Delete Car"),
      ),
      body: Container(
        child: SingleChildScrollView(

        ),
      ),
    );
  }
}
