import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../bloc/AllCarBloc.dart';

class ViewAllUsers extends StatefulWidget {
  const ViewAllUsers({Key? key}) : super(key: key);

  @override
  State<ViewAllUsers> createState() => _ViewAllUsersState();
}

class _ViewAllUsersState extends State<ViewAllUsers> {

  void initState(){

    super.initState();
    BlocProvider.of<AllCarBloc>(context).add(CheckALLCAR());

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("View All users"),),
      body: SingleChildScrollView(
        child: _defaultListView(),
      ),
    );
  }
}
Widget _defaultListView() {

  return BlocBuilder<AllCarBloc, AllCarState>(builder: (context,state){
    if(state is AllCarChecked) {
      return
        ListView.builder(
            itemCount: state.allCarModel.data!.length,
            itemBuilder: (context,int index) {
              // index = state.allCarModel.data!.length-1;
              return Card(
                child:
                Column(
                  children: [
                    ListTile(
                      title: Text(state.allCarModel.data![index].carname!),
                    ),
                    ListTile(
                      title: Text(state.allCarModel.data![index].type!.toString()),
                    ),
                    ListTile(
                      title: Text(state.allCarModel.data![index].enginetype.toString()),
                    ),
                    ListTile(
                      title: Text(state.allCarModel.data![index].price!.toString()),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        MaterialButton(onPressed: (){},child: Text("Edit"),),
                        MaterialButton(onPressed: (){},child: Text("Delete"),)
                      ],
                    ),

                  ],
                ),


              );
            }
        );
    }else {return Container();}
  }
  );
}

