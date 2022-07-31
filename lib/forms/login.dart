
import 'package:carrus_new/adminPage.dart';
import 'package:carrus_new/forms/register.dart';
import 'package:carrus_new/homePage.dart';
import 'package:flutter/material.dart';


class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
TextEditingController _pass=TextEditingController(),
_email=TextEditingController();


  @override

  Widget build(BuildContext context) {

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(35.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 200, 0, 0),
                child: Image(
                  image: AssetImage("assets/ctransp.png"),
                  height: 255,
                  width: 255,
                ),
              ),
              SizedBox(
                height: 30,
              ),
              _usernameField(),
              SizedBox(
                height: 20,
              ),
              _passwordField(),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Spacer(),
                  _forgotText(),
                ],
              ),

              SizedBox(
                height: 60,
              ),
              InkWell(child: _bottomText(),onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>Register()));}
                ,),
              InkWell(child: Text("HomePage"),onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>HomePage()));}),
              SizedBox(
                height: 30,
              ),
              TextButton(onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>Admin()));}, child: Text("Admin Page"))
            ],
          ),
        ),
      ),
    );
  }

  Widget _passwordField() {
    return TextFormField(
      controller: _pass,
      obscureText: true,
      decoration: InputDecoration(
        icon: Icon(Icons.security),
        hintText: "password",
      ),
    );
  }

  Widget _usernameField() {
    return TextFormField(
      controller: _email,
      decoration: InputDecoration(
        icon: Icon(Icons.account_box),
        hintText: "Username",
      ),
    );
  }

  Widget _loginButton() {

    return
      ElevatedButton(

        onPressed: (){},
        child: const Text('Log in'),
      );

  }

  Widget _bottomText() {
    return Text(
      "new user? Sign Up now !",
      style: TextStyle(color: Color(0xff7A35DC)),

    );
  }

  Widget _forgotText() {
    return Text(
      "forgot password?",
      style: TextStyle(
          color: Color(0xff7A35DC), fontSize: 12, fontWeight: FontWeight.bold),
    );
  }








}
