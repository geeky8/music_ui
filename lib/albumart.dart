import 'package:flutter/material.dart';
import 'package:music/constants.dart';

class AlbumArt extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 260,
      width: 220,
      padding: EdgeInsets.all(12),
      margin: EdgeInsets.symmetric(horizontal: 50.0,vertical: 40.0),
      child: ClipRRect(child: Image.asset('images/album.jpg',fit: BoxFit.fill,),borderRadius: BorderRadius.circular(20),),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        color: primary,
        boxShadow: [
          BoxShadow(
            color: DarkPrimary,
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
    );
  }
}
