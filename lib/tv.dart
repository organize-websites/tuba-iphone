import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:radiotuba2/homescreen.dart';
import 'package:better_player/better_player.dart';

class Tv extends StatefulWidget {
  const Tv({Key? key}) : super(key: key);

  @override
  _TvState createState() => _TvState();
}

class _TvState extends State<Tv> {
  @override
  void initState() {
    super.initState();    
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
  ]);
  } 

  @override
  void dispose() {
    super.dispose();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
  ]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.startTop,
        floatingActionButton: Padding(
          padding: const EdgeInsets.only(top: 15),
          child: FloatingActionButton(backgroundColor: Colors.transparent, onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));}, child: Icon(Icons.arrow_back, color: Colors.white,),),
        ),
      body: Container(
        color: Colors.black,
        child: Center(
          child: AspectRatio(
            aspectRatio: 16 / 9,
            child: BetterPlayer.network(
              "https://stmv1.voxtvhd.com.br/radiotvtuba/radiotvtuba/playlist.m3u8",
              betterPlayerConfiguration: BetterPlayerConfiguration(
                aspectRatio: 16 / 9,
                autoPlay: true,
                autoDispose: true,
              ),
            ),
          ),
        ),
      ),
    );
  }
}