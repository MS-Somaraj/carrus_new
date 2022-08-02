import 'package:flutter/material.dart';

class ViewUser extends StatefulWidget {
  const ViewUser({Key? key}) : super(key: key);

  @override
  State<ViewUser> createState() => _ViewUserState();
}

class _ViewUserState extends State<ViewUser> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("View User"),
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
