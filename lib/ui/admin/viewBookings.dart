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
          child: SingleChildScrollView(
            child: ListView(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              children:[
                Card(
                  shape: RoundedRectangleBorder(
                    side: BorderSide(color: Colors.white70, width: 1),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: ListTile(
                    leading: Icon(Icons.book_online_rounded),
                    title: Text('Booking 1'),
                   // onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>ViewUser()));},
                  ),
                ),
                Card(
                  shape: RoundedRectangleBorder(
                    side: BorderSide(color: Colors.white70, width: 1),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: ListTile(
                    leading: Icon(Icons.book_online_rounded),
                    title: Text('Booking 1'),
                    // onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>ViewUser()));},
                  ),
                ),
                Card(
                  shape: RoundedRectangleBorder(
                    side: BorderSide(color: Colors.white70, width: 1),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: ListTile(
                    leading: Icon(Icons.book_online_rounded),
                    title: Text('Booking 1'),
                    // onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>ViewUser()));},
                  ),
                ),
                Card(
                  shape: RoundedRectangleBorder(
                    side: BorderSide(color: Colors.white70, width: 1),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: ListTile(
                    leading: Icon(Icons.book_online_rounded),
                    title: Text('Booking 1'),
                    // onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>ViewUser()));},
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
