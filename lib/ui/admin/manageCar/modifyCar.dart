import 'package:carrus_new/bloc/AllCarBloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ModifyCar extends StatefulWidget {

  String title="Modify";
  @override
  State<ModifyCar> createState() => _ModifyCarState();
}

class _ModifyCarState extends State<ModifyCar> {

  bool _searchBoolean = false;
  List<int> _searchIndexList = [];

  List<String> _list = ['English Textbook', 'Japanese Textbook', 'English Vocabulary', 'Japanese Vocabulary'];

  void initState(){

    super.initState();
    BlocProvider.of<AllCarBloc>(context).add(CheckALLCAR());

  }
  Widget _searchTextField() {
    return
    BlocBuilder<AllCarBloc, AllCarState>(builder: (context,state){
      if(state is AllCarChecked) {
      return TextField(
        onChanged: (String s) {
          setState(() {
            BlocProvider.of<AllCarBloc>(context).add(CheckALLCAR());
            _searchIndexList = [];
            for (int i = 0; i < state.allCarModel.data!.length; i++) {
              if (state.allCarModel.data![i].carname.toString().contains(s)) {
                _searchIndexList.add(i);
              }
            }
          });
        },
        autofocus: true,
        cursorColor: Colors.white,
        style: TextStyle(
          color: Colors.white,
          fontSize: 20,
        ),
        textInputAction: TextInputAction.search,
        decoration: InputDecoration(
          enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.white)
          ),
          focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.white)
          ),
          hintText: 'Search',
          hintStyle: TextStyle(
            color: Colors.white60,
            fontSize: 20,
          ),
        ),
      );

    }
      else {return Container();}
  }
  );
  }

  Widget _searchListView() {
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

  }
  else {return Container();}
}
);
  }

  Widget _defaultListView() {

    return BlocBuilder<AllCarBloc, AllCarState>(builder: (context,state){
      if(state is AllCarChecked) {
        return Container();

  }else {return ListView.builder(
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
      );}
    }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: !_searchBoolean ? Text(widget.title) : _searchTextField( ),
            actions: !_searchBoolean
                ? [
              IconButton(
                  icon: Icon(Icons.search),
                  onPressed: () {
                    setState(() {
                      _searchBoolean = true;
                      _searchIndexList = [];
                    });
                  })
            ]
                : [
              IconButton(
                  icon: Icon(Icons.clear),
                  onPressed: () {
                    setState(() {
                      _searchBoolean = false;
                    });
                  }
              )
            ]
        ),
        body: !_searchBoolean ? _defaultListView() : _searchListView()
    );
  }
}
