import 'package:carrus_new/ui/admin/upload.dart';
import 'package:flutter/material.dart';

class EditCar extends StatefulWidget {
  const EditCar({Key? key}) : super(key: key);

  @override
  State<EditCar> createState() => _EditCarState();
}

class _EditCarState extends State<EditCar> {
  bool _isEnabled = false;
  Color _colorContainer = Colors.black;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Edit Car"),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: SingleChildScrollView(
          child: Column(
              children:[
                ListTile(
                  title: TextField(
                    enabled: _isEnabled,
                    decoration: InputDecoration(
                        label: Text("Car Name"),
                        hintText: 'Car Name',
                        icon: Icon(Icons.shop)
                    ),
                  ),
                  // The icon button which will notify list item to change
                  trailing: GestureDetector(
                    child: new Icon(
                      Icons.edit,
                      color: Colors.deepPurple,
                    ),
                    onTap: () {
                      _colorContainer = _colorContainer == Colors.purple ?
                      Colors.black :
                      Colors.deepPurple;
                      setState((){
                        _isEnabled = !_isEnabled;
                      });
                    },
                  ),
                ), //car name

                ListTile(
                  title: TextField(
                    enabled: _isEnabled,
                    decoration: InputDecoration(
                        label: Text("Car Type"),
                        hintText: 'Car Type',
                        icon: Icon(Icons.person)
                    ),
                  ),
                  // The icon button which will notify list item to change
                  trailing: GestureDetector(
                    child: new Icon(
                      Icons.edit,
                      color: Colors.deepPurple,
                    ),
                    onTap: () {
                      setState((){
                        _isEnabled = !_isEnabled;
                      });
                    },
                  ),
                ), //car type
                
                //TextButton(child: Text("Upload Docs"),onPressed: Navigator.push(context, MaterialPageRoute(builder: (context)=>UploadScreen()),),



                SizedBox(height: 30,),

                MaterialButton(
                  onPressed: (){},
                  color: Colors.deepPurple,
                  child: Text("Save",style: TextStyle(color: Colors.white)),)
              ]
          ),
        ),
      ),
    );
  }
}
