import 'package:better_player/better_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'conteudo.dart';

class Tv2 extends StatefulWidget {
  const Tv2({Key? key}) : super(key: key);

  @override
  _Tv2State createState() => _Tv2State();
}

class _Tv2State extends State<Tv2> {
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
          child: FloatingActionButton(backgroundColor: Colors.transparent, onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context) => Conteudo()));}, child: Icon(Icons.arrow_back, color: Colors.white,),),
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





