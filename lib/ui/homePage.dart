import 'package:carousel_slider/carousel_slider.dart';
import 'package:carrus_new/bloc/logoutbloc.dart';
import 'package:carrus_new/helper/sharedpreferences.dart';

import 'package:carrus_new/ui/booking.dart';
import 'package:carrus_new/ui/login.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'booking.dart';
import 'loadingscreen.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final List<String> imageList = [
      'https://images.unsplash.com/photo-1542362567-b07e54358753?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80',
      'https://images.unsplash.com/photo-1619405399517-d7fce0f13302?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80',
      'https://images.unsplash.com/photo-1525609004556-c46c7d6cf023?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=752&q=80',
      'https://images.unsplash.com/photo-1514316454349-750a7fd3da3a?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80',
      'https://images.unsplash.com/photo-1577372794873-e6b8efa7dcc3?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=715&q=80',
      'https://images.unsplash.com/photo-1616422285623-13ff0162193c?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=731&q=80'
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text("Cars For Rent"),
        actions: [
          InkWell(
            onTap: () {
              BlocProvider.of<LogBloc>(context).add(CheckLOGOUT());
            },
            child: BlocConsumer<LogBloc, LogState>(
              builder: (context, state) {
                return Icon(Icons.logout_outlined);
              },
              listener: (context, state) {
                if (state is LogoutChecked) {
                  TempStorage.removeToken();
                  Navigator.pop(context);
                  Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(builder: (context) => LoginPage()),
                      (Route<dynamic> route) => false);
                } else if (state is LogoutError) {
                 // Navigator.pop(context);
                  Fluttertoast.showToast(
                    msg: state.error,
                  );
                } else if (state is CheckingLogout) {
                  Loading.showLoading(context);
                }
              },
            ),
          ),
          SizedBox(
            width: 20,
          ),
        ],
      ),
      body: SingleChildScrollView(
          child: Column(
        children: [
          SizedBox(
            height: 30,
          ),
          CarouselSlider(
            options: CarouselOptions(
              height: 400,
              aspectRatio: 16 / 9,
              viewportFraction: 0.8,
              initialPage: 0,
              enableInfiniteScroll: true,
              reverse: false,
              autoPlay: true,
              autoPlayInterval: Duration(seconds: 3),
              autoPlayAnimationDuration: Duration(milliseconds: 800),
              autoPlayCurve: Curves.fastOutSlowIn,
              enlargeCenterPage: true,
              // onPageChanged: callbackFunction,
              scrollDirection: Axis.horizontal,
            ),
            items: [1, 2, 3, 4, 5].map((i) {
              return Builder(
                builder: (BuildContext context) {
                  return Container(
                    width: MediaQuery.of(context).size.width,
                    margin: EdgeInsets.symmetric(horizontal: 5.0),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.amber),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Image.network(
                        imageList[i],
                        width: 500,
                        fit: BoxFit.cover,
                      ),
                    ),
                  );
                },
              );
            }).toList(),
          ),
          SizedBox(
            height: 30,
          ),
          Text(
            "CARRUS – Trusted Car Rental Services ",
            style: TextStyle(fontWeight: FontWeight.w800, fontSize: 20),
          ),
          SizedBox(
            height: 15,
          ),
          Text(
            "CARRUS is one of the most trusted car rental services as it is promoted by TATA Motors. The rent-a-car service provider offers an outstanding model and a wide variety of vehicle options at the most competitive rates. With CARRUS’s commitment to providing a hassle-free service, you will have the best rent-a-car experience. This means that you can carry out all your plans without any hamper. At CARRUS, we provide cars that can meet your every need. Also, we allow you to enjoy flexibility with respect to start and endpoints. You can book cars on an hourly, daily, or weekly basis without any security deposit. We provide door-step delivery and we believe in complete transparency and adhere strictly to business ethics. This means that you need not worry about any hidden charges when renting cars from us.",
            style: TextStyle(
              fontStyle: FontStyle.italic,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 20,
          ),
          TextButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Booking()));
              },
              child: Text("Book Car"))
        ],
      )),
    );
  }
}
