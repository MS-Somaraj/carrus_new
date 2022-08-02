import 'dart:io';

import 'package:flutter/material.dart';
import 'package:group_radio_button/group_radio_button.dart';
import 'package:image_picker/image_picker.dart';


class AddCar extends StatefulWidget {
  const AddCar({Key? key}) : super(key: key);

  @override
  State<AddCar> createState() => _AddCarState();
}

class _AddCarState extends State<AddCar> {
  var _carname = TextEditingController();
  var _price = TextEditingController();
  var _enginetype = TextEditingController();
  List _cartype = ['SUV', 'Sedan', 'MPV', 'Hatchback', 'Crossover', 'Coupe'];
  String? selectedType = 'Sedan';
  String _verticalGroupValue = "Petrol";
  List<String> _status = ["Petrol", "Diesel"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Add Car"),
        ),
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: SingleChildScrollView(
            child: Column(
              children: [

                Padding(
                  padding: const EdgeInsets.only(top:8.0),
                  child: Container(
                    width: MediaQuery.of(context).size.width*0.9,
                    child: TextField(
                      controller: _carname,
                      style: TextStyle(color: Colors.deepPurple),
                      decoration: new InputDecoration(
                        label: Text('Car Name'),

                        border: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.black, width: 1.2),
                          borderRadius : const BorderRadius.all(Radius.circular(15.0)),
                          gapPadding :4.0,
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.black, width: 1.2),
                          borderRadius : const BorderRadius.all(Radius.circular(15.0)),
                          gapPadding :4.0,
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.deepPurple,width: 1.2 ),
                          borderRadius : const BorderRadius.all(Radius.circular(15.0)),
                          gapPadding :4.0,
                        ),
                      ),
                    ),
                  ),
                ),  //car name
                Padding(
                  padding: const EdgeInsets.only(top:8.0),
                  child: Container(
                    width: MediaQuery.of(context).size.width*0.9,
                    child: TextField(
                      controller: _price,
                      style: TextStyle(color: Colors.deepPurple),
                      decoration: new InputDecoration(
                        label: Text('Car Price'),
                        border: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.black, width: 1.2),
                          borderRadius : const BorderRadius.all(Radius.circular(15.0)),
                          gapPadding :4.0,
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.black, width: 1.2),
                          borderRadius : const BorderRadius.all(Radius.circular(15.0)),
                          gapPadding :4.0,
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.black,width: 1.2 ),
                          borderRadius : const BorderRadius.all(Radius.circular(15.0)),
                          gapPadding :4.0,
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(23,8,23,8),
                  child: DropdownButton(
                    elevation: 20,
                    focusColor: Colors.deepPurple,
                    iconEnabledColor: Colors.deepPurple,
                    iconDisabledColor: Colors.black,
                    value: selectedType,
                    items: _cartype
                        .map((item) =>
                        DropdownMenuItem(value: item, child: Padding(
                          padding: const EdgeInsets.only(left:12.0),
                          child: Text(item),
                        )))
                        .toList(),
                    onChanged: (item) {
                      setState(() => selectedType = item as String?);
                      print(item);
                    },
                    isExpanded: true,
                  ),
                ),

                RadioGroup<String>.builder(
                  direction: Axis.horizontal,
                  groupValue: _verticalGroupValue,
                  horizontalAlignment: MainAxisAlignment.center,
                  onChanged: (value) => setState(() {
                    _verticalGroupValue = value!;
                  }),
                  items: _status,
                  textStyle: TextStyle(
                      fontSize: 15,
                      color: Colors.deepPurple
                  ),
                  itemBuilder: (item) => RadioButtonBuilder(
                    item,
                  ),
                ),
                SizedBox(
                  height: 12,
                ),
                RaisedButton(
                  color: Colors.deepPurple,
                  onPressed: () {
                    _getFromGallery();
                  },
                  child: Text("PICK FROM GALLERY",style: TextStyle(color: Colors.white),),
                ),
                SizedBox(
                  height: 12,
                ),
                RaisedButton(
                  color: Colors.deepPurple,
                  onPressed: () {
                    _getFromCamera();
                  },
                  child: Text("PICK FROM CAMERA",style: TextStyle(color: Colors.white),)

                )


              ],
            ),
          ),
        ));
  }
}
_getFromGallery() async {
  PickedFile? pickedFile = await ImagePicker().getImage(
    source: ImageSource.gallery,
    maxWidth: 1800,
    maxHeight: 1800,
  );
  if (pickedFile != null) {
    File imageFile = File(pickedFile.path);
  }
}
_getFromCamera() async {
  PickedFile? pickedFile = await ImagePicker().getImage(
    source: ImageSource.camera,
    maxWidth: 1800,
    maxHeight: 1800,
  );
  if (pickedFile != null) {
    File imageFile = File(pickedFile.path);
  }
}
