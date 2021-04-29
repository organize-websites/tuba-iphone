import 'dart:async';

import 'package:animate_do/animate_do.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:radio_player/radio_player.dart';
import 'package:volume_regulator/volume_regulator.dart';
import 'dart:io';
import 'conteudo.dart';
import 'sobre.dart';
import 'politica.dart';
import 'tv.dart';

void main() {
  runApp(
  MaterialApp(  
  title: 'Rádio e TV Tubá',
  home: HomePage(),
      )
    );
}

class HomePage extends StatefulWidget {

  var volume = 0.8;
  

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double _volume = 0;
  RadioPlayer _radioPlayer = RadioPlayer();
  bool isPlaying = true;
  List<String>? metadata;

  final GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey<ScaffoldState>();

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();


  @override
  void initState() { 
    initRadioPlayer();  
    strt();
    super.initState();    
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);
    // Init slider.
    VolumeRegulator.getVolume().then((value) {
      setState(() {
        _volume = value.toDouble();
      });
    });

    // Listening to volume change events.
    VolumeRegulator.volumeStream.listen((value) {
      setState(() {
        _volume = value.toDouble();
      });
    });
  } 

  strt() {Future.delayed(Duration(seconds: 1), (){_radioPlayer.play();});}

  void initRadioPlayer() {
    _radioPlayer.init('Rádio e TV Tubá', 'http://player.stream2.com.br/proxy/7106/stream');

    _radioPlayer.stateStream.listen((value) {
      setState(() {
        isPlaying = value;
      });
    });

    _radioPlayer.metadataStream.listen((value) {
      setState(() {
        metadata = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(      
      home: Scaffold(   
        key: _scaffoldKey, 
        floatingActionButtonLocation: FloatingActionButtonLocation.startTop,
        floatingActionButton: Padding(
          padding: const EdgeInsets.only(top: 15),
          child: FloatingActionButton(backgroundColor: Colors.white, onPressed: () => _scaffoldKey.currentState!.openDrawer(), child: Icon(Icons.menu, color: Color.fromRGBO(0, 103, 174, 1.0),),),
        ),
        body: 
        Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(image: DecorationImage(image: AssetImage('imagens/bg.png'), fit: BoxFit.cover)),
          child:
          CustomScrollView(
          slivers: 
          <Widget>[
            SliverList(
              delegate: 
              SliverChildListDelegate(
                [
                  FadeInUp(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 45.0, bottom: 100.0, left: 60.0, right: 60.0),
                      child: Image.asset('imagens/logo.png'),
                    ),
                  )
                ],
              ),
            ),
            SliverGrid(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 5),
              delegate: 
              SliverChildListDelegate(
                [
                  FadeInUp(
                    delay: Duration(milliseconds: 300),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextButton(
                        onPressed: _launchURL3,
                        child:
                        Column(
                          children: <Widget>[
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Image.asset('imagens/insta.png'),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),                    
                  FadeInUp(
                    delay: Duration(milliseconds: 600),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextButton(
                        onPressed: _launchURL2,
                        child:
                        Column(
                          children: <Widget>[
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Image.asset('imagens/face.png'),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  FadeInUp(
                    delay: Duration(milliseconds: 900),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextButton(
                        onPressed: _launchURL,
                        child:
                        Column(
                          children: <Widget>[
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Image.asset('imagens/whats.png'),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  FadeInUp(
                    delay: Duration(milliseconds: 1200),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextButton(
                        onPressed: (){_radioPlayer.pause(); Navigator.push(context, MaterialPageRoute(builder: (context) => Tv()));},
                        child:
                        Column(
                          children: <Widget>[
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Image.asset('imagens/tv.png'),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  FadeInUp(
                    delay: Duration(milliseconds: 1500),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextButton(
                        onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context) => Conteudo()));},
                        child:
                        Column(
                          children: <Widget>[
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Image.asset('imagens/mn.png'),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ]
              ), 
            ),
            SliverList(
              delegate: 
              SliverChildListDelegate(
                [                  
                  Slider(
                    value: _volume,
                    min: 0,
                    max: 100,
                    divisions: 100,
                    label: _volume.round().toString(),
                    onChanged: (double value) {
                      VolumeRegulator.setVolume(value.toInt());
                    },
                  ),
                  Text('Volume: ${_volume.round()}%', textAlign: TextAlign.center,style: TextStyle(color: Colors.white),),
                ],
              ),
            ),
            ],
          ),
        ),
        drawer: Drawer(
        child: ListView(
          children: <Widget>[
            DrawerHeader(
              child: Center(
                child: TextButton(
                  child: Image.asset('imagens/logo.png'),
                  onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
                      },
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('HOME'),
              onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
                      },
            ),
            ListTile(
              leading: Icon(Icons.phone),
              title: Text('LIGUE PRA GENTE'),
              onTap: _launchURL4,
            ),
            ListTile(
              leading: FaIcon(FontAwesomeIcons.whatsapp),
              title: Text('WHATSAPP'),
              onTap: _launchURL,
            ),
            ListTile(
              leading: FaIcon(FontAwesomeIcons.facebook),
              title: Text('FACEBOOK'),
              onTap: _launchURL2,
            ),
            ListTile(
              leading: FaIcon(FontAwesomeIcons.facebook),
              title: Text('FACEBOOK TV'),
              onTap: _launchURL6,
            ),
            ListTile(
              leading: FaIcon(FontAwesomeIcons.facebook),
              title: Text('FACEBOOK DIOCESE'),
              onTap: _launchURL7,
            ),
            ListTile(
              leading: FaIcon(FontAwesomeIcons.instagram),
              title: Text('INSTAGRAM'),
              onTap: _launchURL3,
            ),
            ListTile(
              leading: FaIcon(FontAwesomeIcons.globe),
              title: Text('SITE'),
              onTap: _launchURL5,
            ),
            ListTile(
              leading: Icon(Icons.copyright),
              title: Text('SOBRE O APP'),
              onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => SobreOApp()));
                      },
            ),
            ListTile(
              leading: Icon(Icons.public),
              title: Text('POLÍTICA DE PRIVACIDADE'),
              onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => PoliticaDePrivacidade()));
                      },
            ),
          ],
        ),
      ),
      bottomNavigationBar: 
        ConvexAppBar(
          backgroundColor: Colors.white,
          activeColor: Color.fromRGBO(0, 103, 174, 1.0),
          color: Color.fromRGBO(0, 103, 174, 1.0),
          style: TabStyle.fixedCircle,
          curveSize: 100,
          top: -45,
          items: [
            TabItem(icon: IconButton(padding: EdgeInsets.only(bottom: 150), iconSize: 30, icon: Icon(Icons.home), color: Color.fromRGBO(0, 103, 174, 1.0), onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));},)),
            TabItem(icon: IconButton(iconSize: 40,icon: Icon(isPlaying ? Icons.pause_rounded : Icons.play_arrow_rounded,), color: Colors.white, onPressed: () {isPlaying ? _radioPlayer.pause() : _radioPlayer.play();},)),
            TabItem(icon: IconButton(padding: EdgeInsets.only(bottom: 150), iconSize: 30,icon: Icon(Icons.exit_to_app), color: Color.fromRGBO(0, 103, 174, 1.0), onPressed: (){exit(0);},)),
          ]
        )
      ),
    );
  }
}



_launchURL() async {
  const url = 'http://wa.me/554836265177&text=';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

_launchURL2() async {
  const url = 'fb://page/183031758450675/';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

_launchURL3() async {
  const url = 'instagram://user?username=radiotuba';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

_launchURL4() async {
  const url = 'tel:+554836264633';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

_launchURL5() async {
  const url = 'http://www.radiotuba.com.br/';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

_launchURL6() async {
  const url = 'fb://page/1750122901888972/';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

_launchURL7() async {
  const url = 'fb://page/319935404782164/';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}