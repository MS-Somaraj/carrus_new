import 'dart:ui';

import 'package:carrus_new/bloc/editshopbloc.dart';
import 'package:carrus_new/ui/admin/adminPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../loadingscreen.dart';

class ShopDetails extends StatefulWidget {
  const ShopDetails({Key? key}) : super(key: key);

  @override
  State<ShopDetails> createState() => _ShopDetailsState();
}

class _ShopDetailsState extends State<ShopDetails> {

  bool _isEnabled= false;
  bool _isEnabled1 = false;
  bool _isEnabled2 = false;
  bool _isEnabled3 = false;
  bool _isEnabled4 = false;

  bool _isEnabled5 = false;
  var email = TextEditingController(),
      place = TextEditingController(),
      phone = TextEditingController(),
      shopname = TextEditingController(),
      ownername = TextEditingController(),
      lon = TextEditingController(),
      lat = TextEditingController();


  Color _colorContainer = Colors.black;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Shop Details"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: SingleChildScrollView(
            child: Column(children: [
              ListTile(
                title: TextField(
                  controller: shopname,
                  enabled: _isEnabled,
                  decoration: InputDecoration(
                      label: Text("Shop Name"),
                      hintText: 'Shop Name',
                      icon: Icon(Icons.shop)),
                ),
                // The icon button which will notify list item to change
                trailing: GestureDetector(
                  child: new Icon(
                    Icons.edit,
                    color: Colors.deepPurple,
                  ),
                  onTap: () {
                    _colorContainer = _colorContainer == Colors.purple
                        ? Colors.black
                        : Colors.deepPurple;
                    setState(() {
                      _isEnabled = !_isEnabled;
                    });
                  },
                ),
              ), //shop name

              ListTile(
                title: TextField(
                  controller: ownername,
                  enabled: _isEnabled1,
                  decoration: InputDecoration(
                      label: Text("Shop Owner"),
                      hintText: 'Shop Owner',
                      icon: Icon(Icons.person)),
                ),
                // The icon button which will notify list item to change
                trailing: GestureDetector(
                  child: new Icon(
                    Icons.edit,
                    color: Colors.deepPurple,
                  ),
                  onTap: () {
                    setState(() {
                      _isEnabled1 = !_isEnabled1;
                    });
                  },
                ),
              ), //shop owner

              ListTile(
                title: TextField(
                  controller: email,
                  enabled: _isEnabled2,
                  decoration: InputDecoration(
                      label: Text("Email"),
                      hintText: 'Email',
                      icon: Icon(Icons.email)),
                ),
                // The icon button which will notify list item to change
                trailing: GestureDetector(
                  child: new Icon(
                    Icons.edit,
                    color: Colors.deepPurple,
                  ),
                  onTap: () {
                    setState(() {
                      _isEnabled2 = !_isEnabled2;
                    });
                  },
                ),
              ), //email

              ListTile(
                title: TextField(
                  controller: phone,
                  enabled: _isEnabled3,
                  decoration: InputDecoration(
                      label: Text("phone"),
                      hintText: 'phone',
                      icon: Icon(Icons.phone)),
                ),
                // The icon button which will notify list item to change
                trailing: GestureDetector(
                  child: new Icon(
                    Icons.edit,
                    color: Colors.deepPurple,
                  ),
                  onTap: () {
                    setState(() {
                      _isEnabled3 = !_isEnabled3;
                    });
                  },
                ),
              ), //password

              ListTile(
                title: Column(
                  // mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 220,
                      height: 60,
                      child: TextField(
                        enabled: _isEnabled4,
                        controller: lat,
                        decoration: InputDecoration(
                            label: Text("Location Coordinates"),
                            hintText: 'Latitude(x)',
                            icon: Icon(Icons.place)),
                      ),
                    ),
                    SizedBox(
                      width: 220,
                      height: 70,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 38.0),
                        child: TextField(
                          controller: lon,
                          enabled: _isEnabled4,
                          decoration: InputDecoration(
                            label: Text("Location Coordinates"),
                            hintText: ' Longitude(y)',
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                // The icon button which will notify list item to change
                trailing: GestureDetector(
                  child: new Icon(
                    Icons.edit,
                    color: Colors.deepPurple,
                  ),
                  onTap: () {
                    setState(() {
                      _isEnabled4 = !_isEnabled4;
                    });
                  },
                ),
              ),
              ListTile(
                title: TextField(
                  controller: place,
                  enabled: _isEnabled5,
                  decoration: InputDecoration(
                      label: Text("place"),
                      hintText: 'place',
                      icon: Icon(Icons.location_city_outlined)),
                ),
                // The icon button which will notify list item to change
                trailing: GestureDetector(
                  child: new Icon(
                    Icons.edit,
                    color: Colors.deepPurple,
                  ),
                  onTap: () {
                    setState(() {
                      _isEnabled5 = !_isEnabled5;
                    });
                  },
                ),
              ),

              SizedBox(
                height: 30,
              ),

              MaterialButton(
                  onPressed: () {
                    BlocProvider.of<EditShopBloc>(context).add(CheckEDITSHOP(
                        id: "62e96df8bdbbdce1a733d89e",
                        phone: phone.text,
                        shopname: shopname.text,
                        email: email.text,
                        place: place.text,
                        ownername: ownername.text,
                        lat: lat.text,
                        lon: lon.text));
                  },
                  color: Colors.deepPurple,
                  child: BlocConsumer<EditShopBloc, EditShopState>(
                    builder: (context, state) {
                      return Text(
                        "Save",
                        style: TextStyle(color: Colors.white),
                      );
                    },
                    listener: (context, state) {
                      if (state is EditShopChecked) {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>Admin()));
                      } else if (state is EditShopError) {
                        Navigator.pop(context);
                        Fluttertoast.showToast(
                          msg: state.error,
                        );
                      } else if (state is CheckingEditShop) {
                        Loading.showLoading(context);
                      }
                    },
                  )
              ) //location
            ]
            ),
          ),
        ),
      ),
    );
  }
}
