import 'package:carrus_new/ui/admin/manageCar/addCar.dart';
import 'package:carrus_new/ui/admin/manageCar/editCar.dart';
import 'package:carrus_new/ui/admin/manageCar/modifyCar.dart';
import 'package:carrus_new/ui/admin/manageCar/viewAllCars.dart';
import 'package:flutter/material.dart';

class ManageCar extends StatefulWidget {
  const ManageCar({Key? key}) : super(key: key);

  @override
  State<ManageCar> createState() => _ManageCarState();
}

class _ManageCarState extends State<ManageCar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Manage Car"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: SingleChildScrollView(
            child:ListView(
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
                    title: Text('View All Cars'),
                    onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>ViewAllUsers()));},
                  ),
                ),
                Card(
                  child: ListTile(
                    leading: Icon(Icons.car_rental),
                    title: Text('Add Car'),
                    onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>AddCar()));},
                  ),
                ),
                Card(
                  child: ListTile(
                    leading: Icon(Icons.shop),
                    title: Text('Modify'),
                    onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>ModifyCar()));},
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
