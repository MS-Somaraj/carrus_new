import 'package:flutter/material.dart';

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
            child: Column(
              children:[
                ListTile(
                title: TextField(
                  enabled: _isEnabled,
                  decoration: InputDecoration(
                    label: Text("Shop Name"),
                    hintText: 'Shop Name',
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
              ), //shop name

                ListTile(
                  title: TextField(
                    enabled: _isEnabled1,
                    decoration: InputDecoration(
                        label: Text("Shop Owner"),
                        hintText: 'Shop Owner',
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
                        _isEnabled1 = !_isEnabled1;
                      });
                    },
                  ),
                ), //shop owner

                ListTile(
                  title: TextField(
                    enabled: _isEnabled2,
                    decoration: InputDecoration(
                        label: Text("Email"),
                        hintText: 'Email',
                        icon: Icon(Icons.email)
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
                        _isEnabled2 = !_isEnabled2;
                      });
                    },
                  ),
                ), //email

                ListTile(
                  title: TextField(
                    enabled: _isEnabled3,
                    decoration: InputDecoration(
                        label: Text("Password"),
                        hintText: 'Password',
                        icon: Icon(Icons.password)
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
                        _isEnabled3 = !_isEnabled3;
                      });
                    },
                  ),
                ), //password

                ListTile(
                  title: TextField(
                    enabled: _isEnabled4,
                    decoration: InputDecoration(
                        label: Text("Location Coordinates"),
                        hintText: 'Latitude and Longitude(x,y)',
                        icon: Icon(Icons.location_city)
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
                        _isEnabled4 = !_isEnabled4;
                      });
                    },
                  ),
                ),

                SizedBox(height: 30,),
                
                MaterialButton(
                  onPressed: (){},
                  color: Colors.deepPurple,
                  child: Text("Save",style: TextStyle(color: Colors.white)),)//location
          ]
            ),
          ),
        ),
      ),
    );
  }
}
