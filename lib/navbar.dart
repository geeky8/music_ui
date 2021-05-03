import 'package:flutter/material.dart';
import 'package:music/constants.dart';

class NavigationBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90.0,
      alignment: Alignment.bottomCenter,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          NavBarItem(
            icon: Icons.arrow_back_ios,
          ),
          Text('Playing Now', style: kprimary),
          NavBarItem(
            icon: Icons.list_sharp,
          ),
        ],
      ),
    );
  }
}

class NavBarItem extends StatelessWidget {
  final IconData icon;

  NavBarItem({this.icon});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40.0,
      width: 40.0,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: primary,
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: [
          BoxShadow(
            color: DarkPrimary.withOpacity(0.5),
            offset: Offset(5, 10),
            spreadRadius: 3.0,
            blurRadius: 10.0,
          ),
          BoxShadow(
            color: Colors.white,
            offset: Offset(-3, -4),
            spreadRadius: -2,
            blurRadius: 20,
          ),
        ],
      ),
      child: Icon(
        icon,
        color: DarkPrimary,
      ),
    );
  }
}
