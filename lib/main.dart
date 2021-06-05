import 'dart:ffi';
import 'package:flutter/material.dart';
import 'package:assets_audio_player/assets_audio_player.dart';

main() {
  runApp(
    Xylophone(),
  );
}

class Xylophone extends StatelessWidget {
  void playSong(int songNumber) {
    final assetsAudioPlayer = AssetsAudioPlayer();
    assetsAudioPlayer.open(
      Audio("assets/note$songNumber.wav"),
    );
  }

  Expanded buildkey({Color? color, int? songNumber}) {
    return Expanded(
      child: TextButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(color!),
        ),
        onPressed: () {
          playSong(songNumber!);
        },
        child: Text(''),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          backgroundColor: Colors.black,
          body: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                buildkey(color: Colors.red, songNumber: 1),
                buildkey(color: Colors.orange, songNumber: 2),
                buildkey(color: Colors.yellow, songNumber: 3),
                buildkey(color: Colors.lightGreen, songNumber: 4),
                buildkey(color: Colors.lightBlue, songNumber: 5),
                buildkey(color: Colors.indigo, songNumber: 6),
                buildkey(color: Colors.deepPurple, songNumber: 7),
              ],
            ),
          )),
    );
  }
}
