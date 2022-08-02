import 'package:carrus_new/bloc/loginbloc.dart';
import 'package:carrus_new/bloc/logoutbloc.dart';
import 'package:carrus_new/helper/sharedpreferences.dart';
import 'package:carrus_new/ui/admin/adminPage.dart';
import 'package:carrus_new/ui/user/homePage.dart';
import 'package:carrus_new/ui/user/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);


  // This widget is the root of your application.
  @override

  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<LoginBloc>(create: (context) => LoginBloc()),
        BlocProvider<LogBloc>(create: (context) => LogBloc()),
      ],
      child: MaterialApp(
        title: 'CARRUS Car Rental',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.deepPurple,
        ),
        home: const NewHome(),
      ),
    );
  }
}




class NewHome extends StatefulWidget {
  const NewHome({Key? key}) : super(key: key);

  @override
  State<NewHome> createState() => _NewHomeState();
}

class _NewHomeState extends State<NewHome> {
  @override
  void initState() {

    BlocProvider.of<LogBloc>(context).add(CheckAuth());

    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: BlocListener<LogBloc,LogState>(
        listener: (context,state){
          if(state is AuthConfirmed){

            if (state.role =="admin") {
              Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>
                  Admin()), (Route<dynamic> route) => false);
            } else if (state.role =="customer") {
              Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>
                  HomePage()), (Route<dynamic> route) => false);
            }

          }
          else  {
            Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>
                LoginPage()), (Route<dynamic> route) => false);
          }
        },
        child: Container(child: Text("ppp"),),
      ),
    );
  }
}
