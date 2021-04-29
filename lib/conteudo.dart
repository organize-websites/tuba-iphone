import 'dart:async';

import 'package:animate_do/animate_do.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:radiotuba2/contato.dart';
import 'package:radiotuba2/local.dart';
import 'package:radiotuba2/prog.dart';
import 'package:radiotuba2/promo.dart';
import 'package:radiotuba2/site.dart';
import 'package:radiotuba2/tv2.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:radio_player/radio_player.dart';
import 'dart:io';
import 'sobre.dart';
import 'politica.dart';
import 'homescreen.dart';

class Conteudo extends StatefulWidget {

  var volume = 0.8;
  

  @override
  _ConteudoState createState() => _ConteudoState();
}

class _ConteudoState extends State<Conteudo> {
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
                      padding: const EdgeInsets.only(top: 45.0, bottom: 60.0, left: 60.0, right: 60.0),
                      child: Image.asset('imagens/logo.png'),
                    ),
                  )
                ],
              ),
            ),
            SliverGrid(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
              delegate: 
              SliverChildListDelegate(
                [
                  FadeInUp(
                    delay: Duration(milliseconds: 300),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextButton(
                        onPressed: () {
                        _radioPlayer.pause();
                        Navigator.push(context, MaterialPageRoute(builder: (context) => Tv2()));
                        },
                        child:
                        Column(
                          children: <Widget>[
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Image.asset('imagens/live.png'),
                                Text('Ao Vivo', style: TextStyle(color: Colors.white), textAlign: TextAlign.center,)
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
                        onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => Prog()));
                        },
                        child:
                        Column(
                          children: <Widget>[
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Image.asset('imagens/prog.png'),
                                Text('Programação', style: TextStyle(color: Colors.white), textAlign: TextAlign.center,)
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
                        onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => Site()));
                        },
                        child:
                        Column(
                          children: <Widget>[
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Image.asset('imagens/site.png'),
                                Text('Website', style: TextStyle(color: Colors.white), textAlign: TextAlign.center,)
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
                        onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => Local()));
                        },
                        child:
                        Column(
                          children: <Widget>[
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Image.asset('imagens/local.png'),
                                Text('Localização', style: TextStyle(color: Colors.white), textAlign: TextAlign.center,)
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
                        onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => Promo()));
                        },
                        child:
                        Column(
                          children: <Widget>[
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Image.asset('imagens/promo.png'),
                                Text('Promoções', style: TextStyle(color: Colors.white), textAlign: TextAlign.center,)
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  FadeInUp(
                    delay: Duration(milliseconds: 1800),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextButton(
                        onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => Contato()));
                        },
                        child:
                        Column(
                          children: <Widget>[
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Image.asset('imagens/mail.png'),
                                Text('Contato', style: TextStyle(color: Colors.white), textAlign: TextAlign.center,)
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