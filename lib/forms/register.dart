

import 'package:flutter/material.dart';

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
  @override

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Register / SignUp'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(14.0),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(

              children: [
                TextFormField(
                  controller: name,
                  decoration: InputDecoration(
                    icon: Icon(Icons.account_box),
                    hintText: "Name",
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 25,
                ),
                TextFormField(
                  controller: email,
                  decoration: InputDecoration(
                    icon: Icon(Icons.account_box),
                    hintText: "Email",
                  ),
                  validator: (value) {
                    if (value!.isEmpty || !value.contains('@')) {
                      return 'Invalid email!';
                    }
                  },
                ),
                SizedBox(
                  height: 25,
                ),
                TextFormField(
                  controller: phone,
                  decoration: InputDecoration(
                    icon: Icon(Icons.account_box),
                    hintText: "Phone Number",
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
                TextFormField(
                  controller: password,
                  decoration: InputDecoration(
                    icon: Icon(Icons.account_box),
                    hintText: "Password",
                  ),
                ),
                SizedBox(
                  height: 25,
                ),

                TextFormField(
                  controller: cpassword,
                  decoration: InputDecoration(
                    icon: Icon(Icons.account_box),
                    hintText: "Confirm-Password",
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
                TextFormField(
                  controller: gender,
                  decoration: InputDecoration(
                    icon: Icon(Icons.male),
                    hintText: "Gender",
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
                TextFormField(
                  controller: dateOfBirth,
                  decoration: InputDecoration(
                    icon: Icon(Icons.account_box),
                    hintText: "Date-0f-Birth",
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

      onPressed: (){}
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
