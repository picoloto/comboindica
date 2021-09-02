import 'dart:math';

import 'package:flutter/material.dart';

import 'utils/color_utils.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Home(),
    theme: ThemeData(
      backgroundColor: BACKGROUND_COLOR,
      scaffoldBackgroundColor: BACKGROUND_COLOR,
      canvasColor: BACKGROUND_COLOR,
      brightness: Brightness.dark,
    ),
  ));
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var _jogos = [
    'Albion online',
    'Apex Legends',
    'Black Desert Online',
    'Bless Online',
    'Brawhalla',
    'The Crew 2',
    'Cuphead',
    'Cyberpunk 2077',
    'Darksiders',
    'Destiny 2',
    'Devil May Cry 5',
    'Far Cry 5',
    'Hades',
    'Monster Hunter: World',
    'Mortal Kombat 11',
    'Northgard',
    'Resident Evil 2',
    'Resident Evil Village',
    'Sekiro: Shadows Die Twice',
    'SpellForce 3',
    'Tribes of Midgard',
    'Wolcen: Lords of Mayhem',
  ];

  var _jogoIndicado = '';

  @override
  void initState() {
    _indicarJogo();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _getAppBar(),
      body: _getBody(),
    );
  }

  AppBar _getAppBar() {
    return AppBar(
      toolbarHeight: 70,
      automaticallyImplyLeading: false,
      // flexibleSpace: SomeWidget(),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'images/logo.png',
            fit: BoxFit.contain,
            height: 62,
          ),
          Container(
            padding: const EdgeInsets.all(8.0),
            child: Text('INDICA'),
          ),
        ],
      ),
      backgroundColor: BACKGROUND_COLOR,
      elevation: 0,
      centerTitle: true,
    );
  }

  Center _getBody() {
    return Center(
      child: Container(
        color: BACKGROUND_COLOR,
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // TODO: Lista dos meus jogos
            Image.asset(
              'images/control.png',
              fit: BoxFit.contain,
              height: 62,
            ),
            Text(
              _jogoIndicado,
              textAlign: TextAlign.justify,
              style: TextStyle(
                fontSize: 25,
              ),
            ),
            ElevatedButton(
              onPressed: _indicarJogo,
              style: ButtonStyle(
                  padding: MaterialStateProperty.all(EdgeInsets.all(16))),
              child: Text(
                'ME INDICA UM JOGO AE COMBO!',
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _indicarJogo() {
    var random = Random().nextInt(_jogos.length);

    setState(() {
      _jogoIndicado = _jogos[random];
    });
  }
}
