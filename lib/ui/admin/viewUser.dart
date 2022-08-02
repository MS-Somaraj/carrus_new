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
                    leading: Icon(Icons.verified_user),
                    title: Text('User 1'),
                    // onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>ViewUser()));},
                  ),
                ),
                Card(
                  shape: RoundedRectangleBorder(
                    side: BorderSide(color: Colors.white70, width: 1),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: ListTile(
                    leading: Icon(Icons.verified_user),
                    title: Text('User 2'),
                    // onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>ViewUser()));},
                  ),
                ),
                Card(
                  shape: RoundedRectangleBorder(
                    side: BorderSide(color: Colors.white70, width: 1),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: ListTile(
                    leading: Icon(Icons.verified_user),
                    title: Text('User 3'),
                    // onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>ViewUser()));},
                  ),
                ),
                Card(
                  shape: RoundedRectangleBorder(
                    side: BorderSide(color: Colors.white70, width: 1),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: ListTile(
                    leading: Icon(Icons.verified_user),
                    title: Text('User 4'),
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
