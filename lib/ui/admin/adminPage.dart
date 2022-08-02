import 'package:carrus_new/ui/admin/manageCar.dart';
import 'package:carrus_new/ui/admin/shopDetails.dart';
import 'package:carrus_new/ui/admin/viewBookings.dart';
import 'package:carrus_new/ui/admin/viewUser.dart';
import 'package:carrus_new/ui/booking.dart';
import 'package:flutter/material.dart';

class Admin extends StatefulWidget {
  const Admin({Key? key}) : super(key: key);

  @override
  State<Admin> createState() => _AdminState();
}

class _AdminState extends State<Admin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Admin"),

      ),
      body: Container(
        decoration: new BoxDecoration(
          color: Color(0xD8D3C2F3),
        ),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(18.0),
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
                    leading: Icon(Icons.verified_user),
                    title: Text('View User'),
                    onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>ViewUser()));},
                  ),
                ),
                Card(
                  child: ListTile(
                    leading: Icon(Icons.car_rental),
                    title: Text('Manage Car'),
                    onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>ManageCar()));},
                  ),
                ),
                Card(
                  child: ListTile(
                    leading: Icon(Icons.shop),
                    title: Text('Shop Details'),
                    onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>ShopDetails()));},
                  ),
                ),
                Card(
                  child: ListTile(
                    leading: Icon(Icons.book_online),
                    title: Text('View Bookings'),
                    onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>ViewBookings()));},
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
