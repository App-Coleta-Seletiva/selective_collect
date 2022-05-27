import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Page"),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            const Text("Home Page"),
            ElevatedButton(
              onPressed: () {
                Modular.to.pushNamed("/auth/forgot_password/");
              },
              child: const Text("Forgot Password"),
            )
          ],
        ),
      ),
    );
  }
}
