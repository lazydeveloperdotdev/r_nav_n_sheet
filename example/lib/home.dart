import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool loading = false;

  @override
  void initState() {
    Future.delayed(const Duration(milliseconds: 1500), () {
      if (mounted) {
        setState(() {
          loading = true;
        });
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: 200,
          height: 200,
          color: loading ? Colors.red[200] : Colors.green[200],
        ),
      ),
    );
  }
}
