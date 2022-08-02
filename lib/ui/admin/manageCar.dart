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
            child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  childAspectRatio: 0.75,
                  crossAxisCount: 3,
                ),
                itemCount: 5,
                shrinkWrap: true,
                itemBuilder: (BuildContext context, int index) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      InkWell(
                        onTap: () {},
                        child: Card(
                          child: Image.asset('assets/1.png',height: MediaQuery.of(context).size.height,
                            width: MediaQuery.of(context).size.width,),
                        ),
                      ),
                      Text(
                        'Car 1',
                        style: TextStyle(fontSize: 10, color: Colors.white,fontWeight: FontWeight.bold),
                      ),SizedBox(height: 5),
                      Text('Booking Available',
                          style: TextStyle(fontSize: 7, color: Colors.green,fontWeight: FontWeight.bold),
                          textAlign: TextAlign.left)
                    ],
                  );
                }),
          ),
        ),
      ),
    );
  }
}
