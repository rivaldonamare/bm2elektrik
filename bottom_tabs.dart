import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BottomTabs extends StatefulWidget {
  final int selectedtab;
  final Function(int) tabPressed;
  BottomTabs({this.selectedtab, this.tabPressed});

  @override
  _BottomTabsState createState() => _BottomTabsState();
}

class _BottomTabsState extends State<BottomTabs> {

  int _selectedtab = 0;


  @override
  Widget build(BuildContext context) {
    _selectedtab = widget.selectedtab ?? 0;
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(12.0),
          topRight: Radius.circular(12.0),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.5),
            spreadRadius: 1.0,
            blurRadius: 30.0,
          ),
        ]
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          BottomTabBtn(
            imagepath: "assets/images/tab_home.png",
            selected: _selectedtab == 0 ? true : false,
            onPressed: () {
              widget.tabPressed(0);
            },
          ),
          BottomTabBtn(
            imagepath: "assets/images/tab_search.png",
            selected: _selectedtab == 1 ? true : false,
            onPressed: () {
              widget.tabPressed(1);
            },
          ),
          BottomTabBtn(
            imagepath: "assets/images/tab_saved.png",
            selected: _selectedtab == 2 ? true : false,
            onPressed: () {
              widget.tabPressed(2);
            },
          ),
          BottomTabBtn(
            imagepath: "assets/images/tab_logout.png",
            selected: _selectedtab == 3 ? true : false,
            onPressed: () {
              FirebaseAuth.instance.signOut();
            },
          ),
        ],
      ),
    );
  }
}

class BottomTabBtn extends StatelessWidget {
  final String imagepath;
  final bool selected;
  final Function onPressed;
  BottomTabBtn({this.imagepath, this.selected, this.onPressed});

  @override
  Widget build(BuildContext context) {
  bool _selected = selected ?? false;

    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: EdgeInsets.symmetric(
          vertical: 16.0,
          horizontal: 16.0,
        ),
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(
              color:_selected ? Theme.of(context).accentColor : Colors.transparent,
              width: 2.0,
            )
          ),
        ),
        child: Image(
          image: AssetImage(
            imagepath ??"assets/images/tab_home.png"
          ),
          width: 30.0,
          height: 30.0,
          color: _selected ? Theme.of(context).accentColor : Colors.black,
        ),
      ),
    );
  }
}

