

import 'package:flutter/material.dart';
import 'package:group_radio_button/group_radio_button.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  var name = TextEditingController();
  var email = TextEditingController();
  var phone = TextEditingController();
  var password = TextEditingController();
  var cpassword = TextEditingController();
  var dateOfBirth = TextEditingController();
  var gender = TextEditingController();
  final _formKey = GlobalKey<FormState>();


  String _verticalGroupValue = "male";
  List<String> _status = ["male", "female"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Register / SignUp'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(14.0),
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: SingleChildScrollView(
            child: Column(

              children: [
                Padding(
                  padding: const EdgeInsets.only(top:8.0),
                  child: Container(
                    width: MediaQuery.of(context).size.width*0.9,
                    child: TextField(
                      controller: name,


                      style: TextStyle(color: Colors.black),
                      decoration: new InputDecoration(
                        label: Text('Name'),

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

                SizedBox(
                  height: 25,
                ),
                Padding(
                  padding: const EdgeInsets.only(top:8.0),
                  child: Container(
                    width: MediaQuery.of(context).size.width*0.9,
                    child: TextField(
                      controller: email,


                      style: TextStyle(color: Colors.black),
                      decoration: new InputDecoration(
                        label: Text('Email'),

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
                SizedBox(
                  height: 25,
                ),
                Padding(
                  padding: const EdgeInsets.only(top:8.0),
                  child: Container(
                    width: MediaQuery.of(context).size.width*0.9,
                    child: TextField(
                      controller: email,


                      style: TextStyle(color: Colors.black),
                      decoration: new InputDecoration(
                        label: Text('Phone Number'),

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
                SizedBox(
                  height: 25,
                ),
                Padding(
                  padding: const EdgeInsets.only(top:8.0),
                  child: Container(
                    width: MediaQuery.of(context).size.width*0.9,
                    child: TextField(
                      controller: email,


                      style: TextStyle(color: Colors.black),
                      decoration: new InputDecoration(
                        label: Text('Place'),

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
                SizedBox(
                  height: 25,
                ),

                Padding(
                  padding: const EdgeInsets.only(top:8.0),
                  child: Container(
                    width: MediaQuery.of(context).size.width*0.9,
                    child: TextField(
                      controller: email,


                      style: TextStyle(color: Colors.black),
                      decoration: new InputDecoration(
                        label: Text('Password '),

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
                SizedBox(
                  height: 25,
                ),
                Column(mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text("Gender"),
                  ],
                ),
                RadioGroup<String>.builder(
                  direction: Axis.horizontal,
                  groupValue: _verticalGroupValue,
                  horizontalAlignment: MainAxisAlignment.end,
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
                  height: 25,
                ),
                Padding(
                  padding: const EdgeInsets.only(top:8.0),
                  child: Container(
                    width: MediaQuery.of(context).size.width*0.9,
                    child: TextField(
                      controller: email,


                      style: TextStyle(color: Colors.black),
                      decoration: new InputDecoration(
                        label: Text('Date-Of_Birth (YYYY-MM-DD'),

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
                SizedBox(
                  height: 25,
                ),

                _signInButton(),
                _okButton()

                //_date(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _signInButton() {
    return ElevatedButton(

      onPressed: () {}
      ,
      child: const Text('Sign in'),
    );
  }

  Widget _okButton() {
    return ElevatedButton(

      onPressed: () {

      },
      child: const Text('ok'),
    );
  }
}
