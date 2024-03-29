import 'package:carrus_new/bloc/loginbloc.dart';
import 'package:carrus_new/ui/admin/adminPage.dart';
import 'package:carrus_new/ui/customer.dart';
import 'package:carrus_new/ui/user/register.dart';
import 'package:carrus_new/ui/user/homePage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../admin/adminPage.dart';
import 'homePage.dart';
import '../loadingscreen.dart';
import 'register.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var _pass = TextEditingController();
  var _email = TextEditingController();

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
                padding: const EdgeInsets.fromLTRB(0, 100, 0, 0),
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
              _loginButton(),
              SizedBox(
                height: 60,
              ),
              InkWell(
                child: _bottomText(),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Register()));
                },
              ),
              SizedBox(
                height: 30,
              ),
              TextButton(onPressed:(){ Navigator.push(context, MaterialPageRoute(builder: (context)=>Admin()));}, child: Text("Admin Page")),
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
    return MaterialButton(
        color: Colors.deepPurple,
        textColor: Colors.white,
        onPressed: () {
          BlocProvider.of<LoginBloc>(context)
              .add(CheckOTP(phone: _email.text, otpNumber: _pass.text));
        },
        child: BlocConsumer<LoginBloc, LoginState>(
          builder: (context, state) {
            return Text(
              "Log in",
              style: TextStyle(color: Colors.white),
            );
          },
          listener: (context, state) {
            if (state is OtpChecked) {
              Navigator.pop(context);
              if (state.role == "admin") {
                {
                  Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(builder: (context) => Admin()),
                      (Route<dynamic> route) => false);
                }
              } else if (state.role == "customer") {
                {
                  Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(builder: (context) => HomePage()),
                      (Route<dynamic> route) => false);
                }
              }
            } else if (state is OtpError) {
              Navigator.pop(context);
              Fluttertoast.showToast(
                msg: state.error,
              );
            } else if (state is CheckingOtp) {
              Loading.showLoading(context);
            }
          },
        )
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
