import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:music/albumart.dart';
import 'package:music/models/myaudio.dart';
import 'package:music/navbar.dart';
import 'package:music/constants.dart';
import 'package:music/playercontrol.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MaterialApp(
      theme: ThemeData(
        textTheme: GoogleFonts.rubikTextTheme(),
      ),
      debugShowCheckedModeBanner: false,
      home: ChangeNotifierProvider(
          create: (_)=>MyAudio(),
          child: HomePage()
      ),
    ),
  );
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: primary,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          SizedBox(
            height: 15.0,
          ),
          NavigationBar(),
          Container(
            height: height / 2.5,
            child: ListView.builder(
              itemBuilder: (context, index) {
                return AlbumArt();
              },
              itemCount: 3,
              scrollDirection: Axis.horizontal,
            ),
          ),
          Text(
            'Track',
            style: TextStyle(
                fontWeight: FontWeight.w600, fontSize: 28, color: DarkPrimary),
          ),
          Text(
            'Album Name',
            style: TextStyle(
                fontWeight: FontWeight.w500, fontSize: 20, color: DarkPrimary),
          ),
          Consumer<MyAudio>(
              builder: (_,myAudioModel,child)=>Text('${myAudioModel.position.toString().split('.').first}',style: TextStyle(
                  fontWeight: FontWeight.w600, fontSize: 12, color: DarkPrimary),),
          ),
          SliderTheme(
            data: SliderThemeData(
              trackHeight: 4,
              thumbShape: RoundSliderThumbShape(enabledThumbRadius: 6),
            ),
            child: Consumer<MyAudio>(
              builder:(_,myAudioModel,child)=> Slider(
                value: myAudioModel.position==null?0:myAudioModel.position.inMilliseconds.toDouble(),
                activeColor: DarkPrimary,
                inactiveColor: DarkPrimary.withOpacity(0.3),
                onChanged: (value) {
                  myAudioModel.seekAudio(Duration(milliseconds: value.toInt()));
                },
                min: 0,
                max: myAudioModel.totalDuration==null?1:myAudioModel.totalDuration.inMilliseconds.toDouble(),
              ),
            ),
          ),
          PlayerControl(),
          SizedBox(height: 60,)
        ],
      ),
    );
  }
}
