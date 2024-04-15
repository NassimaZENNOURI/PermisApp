import 'package:flutter/material.dart';

import 'appVars.dart';
class Loading extends StatelessWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Center(
        // child: CircularProgressIndicator(
        //   color: PrimaryColor,
        //   backgroundColor: Colors.white.withOpacity(0.3),
        // )
        child: Image.asset('assets/images/dabapermi-loading.gif'),
      ),
    );
  }
}
