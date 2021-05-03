import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:music/constants.dart';
import 'package:music/models/myaudio.dart';
import 'package:provider/provider.dart';

class PlayerControl extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Controls(
            icon: Icons.repeat,
          ),
          Controls(
            icon: Icons.skip_previous,

          ),
          Play(),
          Controls(
            icon: Icons.skip_next,
          ),
          Controls(
            icon: Icons.shuffle,
          ),
        ],
      ),
    );
  }
}

class Play extends StatelessWidget {
  final IconData icon;

  Play({this.icon});

  @override
  Widget build(BuildContext context) {
    return Consumer<MyAudio>(
      builder: (_, myAudioModel, child) =>
      GestureDetector(
        onTap: ()async{
          await myAudioModel.audioState=='Playing'?myAudioModel.pauseAudio():myAudioModel.playAudio();
        },
        child: Container(
          height: 100,
          width: 100,
          child: Stack(
            children: [
              Center(
                child: Container(
                  margin: EdgeInsets.all(6),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: DarkPrimary,
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
                ),
              ),
              Center(
                child: Container(
                  margin: EdgeInsets.all(12),
                  child: Center(
                      child: Icon(
                   myAudioModel.audioState == 'Playing' ? Icons.pause : Icons.play_arrow,
                    size: 50,
                    color: DarkPrimary,
                  )),
                  decoration:
                      BoxDecoration(shape: BoxShape.circle, color: primary),
                ),
              ),
            ],
          ),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
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
            color: primary,
          ),
        ),
      ),
    );
  }
}

class Controls extends StatelessWidget {
  final IconData icon;

  Controls({this.icon});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){},
      child: Container(
        child: Stack(
          children: [
            Center(
              child: Container(
                margin: EdgeInsets.all(6),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: DarkPrimary.withOpacity(0.6),
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
              ),
            ),
            Center(
              child: Container(
                margin: EdgeInsets.all(10),
                child: Center(
                    child: Icon(
                  icon,
                  size: 30,
                  color: DarkPrimary,
                )),
                decoration:
                    BoxDecoration(shape: BoxShape.circle, color: primary),
              ),
            ),
          ],
        ),
        height: 60,
        width: 60,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
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
          color: primary,
        ),
      ),
    );
  }
}
