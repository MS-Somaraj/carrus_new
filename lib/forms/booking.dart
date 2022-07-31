import 'package:flutter/material.dart';

class Booking extends StatefulWidget {
  const Booking({Key? key}) : super(key: key);

  @override
  State<Booking> createState() => _BookingState();
}

class _BookingState extends State<Booking> {
  DateTime selectedDate = DateTime.now();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  var _carmodel = TextEditingController();
  // Initial Selected Value
  String dropdownvalue = 'Car Name';

  // List of items in our dropdown menu
  var items = [
    'Item 1',
    'Item 2',
    'Item 3',
    'Item 4',
    'Item 5',
    'Car Name'
  ];

  bool value=false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Booking"),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        // decoration: BoxDecoration(
        //   image: DecorationImage(
        //     image: AssetImage("Assets/img1.png"),
        //     fit: BoxFit.cover,
        //   ),
        // ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 15,
              ),
              SizedBox(
                height: 15,
              ),
              DropdownButton(
                style: TextStyle(color: Colors.purple),
                // Initial Value
                value: dropdownvalue,
                // Down Arrow Icon
                icon: const Icon(Icons.keyboard_arrow_down),
                // Array list of items
                items: items.map((String items) {
                  return DropdownMenuItem(
                    value: items,
                    child: Text(items),
                  );
                }).toList(),
                // After selecting the desired option,it will
                // change button value to selected value
                onChanged: (String? newValue) {
                  setState(() {
                    dropdownvalue = newValue!;
                  });
                },
              ),
              SizedBox(height: 15,),
              Align(alignment:Alignment(-0.75,0),
                  child: Text("Select Date : ",style: TextStyle(color: Colors.purple),)),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  SizedBox(width: 40,),
                  Container(
                      height: 35,
                      width: 40,
                      child: Center(child: Text("From",textAlign: TextAlign.center,style: TextStyle(color: Colors.white),)),
                      decoration: new BoxDecoration(
                          shape: BoxShape.rectangle,
                          color: Colors.purple
                      )),
                  SizedBox(width: 5,),
                  MaterialButton(
                    onPressed: () => _selectDate(context),
                    color: Colors.purple,
                    child: Text(
                      "${selectedDate.toLocal()}".split(' ')[0],
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  SizedBox(
                    width: 20.0,
                  ),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  SizedBox(width: 40,),
                  Container(
                      height: 35,
                      width: 40,
                      child: Center(child: Text("To",textAlign: TextAlign.center,style: TextStyle(color: Colors.white),)),
                      decoration: new BoxDecoration(
                          shape: BoxShape.rectangle,
                          color: Colors.purple
                      )),
                  SizedBox(width: 5,),
                  MaterialButton(
                    onPressed: () => _selectDate(context),
                    color: Colors.purple,
                    child: Text(
                      "${selectedDate.toLocal()}".split(' ')[0],
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  SizedBox(
                    width: 20.0,
                  ),
                ],
              ),
              SizedBox(
                height: 25,
              ),
              Row(
                children: [
                  SizedBox(width: 40,),
                  Icon(Icons.view_agenda_outlined,size: 15,),
                  SizedBox(width: 5,),
                  Text(
                    "View Car Documents",
                    style: TextStyle(color: Colors.purple),
                  ),
                ],
              ),
              SizedBox(
                height: 25,
              ),
              Row(
                children: [
                  SizedBox(width: 40,),
                  // Checkbox(
                  //   value: this.showvalue,
                  //   onChanged: (bool value) {
                  //     setState(() {
                  //       this.showvalue = value;
                  //     });
                  //   },
                  // ),
                  Text(
                    "I have read the terms and conditions",
                    style: TextStyle(color: Colors.purple),
                  ),
                ],
              ),
              SizedBox(height: 15,),
              Row(
                children: [
                  SizedBox(width: 40,),
                  Text("Driver : ",style: TextStyle(color: Colors.purple),),
                  Checkbox(
                    value: this.value,
                    onChanged: (bool? value) {
                      setState(() {
                        this.value = value!;
                      });
                    },
                  ),
                ],
              ),


              SizedBox(height: 40,),
              MaterialButton(onPressed: (){},child: Text("Submit",style: TextStyle(color: Colors.white),),color: Colors.purple,),
              SizedBox(height: 15,),
              Text("Car Available or not")
            ],

          ),
        ),
      ),
    );
  }
}
