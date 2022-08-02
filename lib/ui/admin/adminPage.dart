import 'package:carrus_new/bloc/editshopbloc.dart';
import 'package:carrus_new/bloc/shopdetailsbloc.dart';
import 'package:carrus_new/ui/admin/manageCar/manageCar.dart';
import 'package:carrus_new/ui/admin/shopDetails.dart';
import 'package:carrus_new/ui/admin/viewBookings.dart';
import 'package:carrus_new/ui/admin/viewUser.dart';
import 'package:carrus_new/ui/user/booking.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../loadingscreen.dart';

class Admin extends StatefulWidget {
  const Admin({Key? key}) : super(key: key);

  @override
  State<Admin> createState() => _AdminState();
}

class _AdminState extends State<Admin> {
  void initState(){

    super.initState();
    BlocProvider.of<ShopDetailsBloc>(context).add(CheckDETAILS());

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Admin"),

      ),

      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: SingleChildScrollView(

      child: Column(
        children: [
          Container(
            decoration: new BoxDecoration(
              color: Color(0xFFFFFFFF),
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
                        title: Text('Manage Shop'),
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

    BlocBuilder<ShopDetailsBloc,ShopDetailsState>(
    builder:(context,state) {
      if (state is CheckDETAILS) {
        return Center(
          child: CircularProgressIndicator(),
        );
      }
      else if(state is DetailsChecked) {
        return
        Padding(

          padding: const EdgeInsets.only(top: 48.0),
          child: Card(
            color: Colors.white38,
            child: ListTile(

              title: SingleChildScrollView(
                physics: NeverScrollableScrollPhysics(),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(0,18,18,18),
                  child: Column(
                    children: [
                      Text("Shop details",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                      Row(
                        children: [
                          Text("Shop name:",style: TextStyle(fontWeight: FontWeight.bold),),
                          Text(" ${state.shopDetailsModel.data![0].shopname.toString()}",style: TextStyle(fontSize: 20),),
                        ],
                      ),
                      SizedBox(height: 10,),
                      Row(
                        children: [
                          Text("Owner name:",style: TextStyle(fontWeight: FontWeight.bold),),
                          Text(" ${state.shopDetailsModel.data![0].ownername.toString()}",style: TextStyle(fontSize: 20),),
                        ],
                      ),
                      SizedBox(height: 10,),
                      Row(
                        children: [
                          Text("Phone:",style: TextStyle(fontWeight: FontWeight.bold),),
                          Text(" ${state.shopDetailsModel.data![0].phone.toString()}",style: TextStyle(fontSize: 20),),
                        ],
                      ),
                      SizedBox(height: 10,),
                      Row(
                        children: [
                          Text("Email:",style: TextStyle(fontWeight: FontWeight.bold),),
                          Text(" ${state.shopDetailsModel.data![0].email.toString()}",style: TextStyle(fontSize: 20),),
                        ],
                      ),
                      SizedBox(height: 10,),
                      Row(
                        children: [
                          Text("Place:",style: TextStyle(fontWeight: FontWeight.bold),),
                          Text(" ${state.shopDetailsModel.data![0].place.toString()}",style: TextStyle(fontSize: 20),),
                        ],
                      ),
                      SizedBox(height: 10,),

                      SingleChildScrollView(
                        child: Row(
                          children: [
                            Text("Location:",style: TextStyle(fontWeight: FontWeight.bold),),
                            Text(" ${state.shopDetailsModel.data![0].location.toString()}",style: TextStyle(fontSize: MediaQuery.of(context).size.width*.020,fontWeight: FontWeight.w800),),
                          ],
                        ),
                      ),
                      SizedBox(height: 10,),

                    ],
                  ),
                ),
              ),
              onTap: () {},
            ),
          ),
        );
      }
      else
        return Container();
    }
    ),


                  ],
                ),
              ),
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

