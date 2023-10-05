import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
class Loading extends StatelessWidget {
  const Loading({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        child: Center(
          child: SpinKitRing(
            color: Colors.grey,
            size: 60,
            lineWidth: 6,
          ),
        ),
      ),
    );
  }
}
