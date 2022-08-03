import 'package:flutter/material.dart';

class ViewAllCars extends StatefulWidget {

   String title="hello";


  @override
  State<ViewAllCars> createState() => _ViewAllCarsState();
}

class _ViewAllCarsState extends State<ViewAllCars> {


  bool _searchBoolean = false;
List<int> _searchIndexList = [];

List<String> _list = ['English Textbook', 'Japanese Textbook', 'English Vocabulary', 'Japanese Vocabulary'];

Widget _searchTextField() {
  return TextField(
    onChanged: (String s) {
      setState(() {
        _searchIndexList = [];
        for (int i = 0; i < _list.length; i++) {
          if (_list[i].contains(s)) {
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

Widget _searchListView() {
  return ListView.builder(
      itemCount: _searchIndexList.length,
      itemBuilder: (context, index) {
        index = _searchIndexList[index];
        return Card(
            child: ListTile(
                title: Text(_list[index])
            )
        );
      }
  );
}

Widget _defaultListView() {
  return ListView.builder(
      itemCount: _list.length,
      itemBuilder: (context, index) {
        return Card(
            child: ListTile(
                title: Text(_list[index])
            )
        );
      }
  );
}

@override
Widget build(BuildContext context) {
  return Scaffold(
      appBar: AppBar(
          title: !_searchBoolean ? Text(widget.title) : _searchTextField(),
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
