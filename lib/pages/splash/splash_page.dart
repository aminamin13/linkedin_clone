// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:linked_in/res/assets_res.dart';
import 'package:linked_in/theme/styles.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({
    Key? key,
    required this.child,
  }) : super(key: key);

  final Widget child;

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    // TODO: implement initState

    Future.delayed(Duration(seconds: 3)).then((e) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => widget.child));
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: linkedInWhiteFFFFFF,
      body: Center(
        child: Image.asset(AssetsRes.APP_LOGO),
      ),
    );
  }
}
