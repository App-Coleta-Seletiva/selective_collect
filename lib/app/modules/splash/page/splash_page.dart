import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width / 100;
    final height = MediaQuery.of(context).size.height / 100;
    return Scaffold(
      body: Column(children: [
        Container(
          width: width * 100,
          height:  height * 100,
          child: const Icon(Icons.label, color: Colors.white),
          color: Colors.green,
        )
      ]),
    );
  }
}
