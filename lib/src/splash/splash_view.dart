import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});
  @override
  Widget build(final BuildContext context) => Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: SizedBox(
            height: 200,
            width: 200,
            child: Column(
              children: [
                SvgPicture.asset(
                  'assets/icons/splash.svg',
                  height: 100,
                  width: 100,
                ),
                const Text(
                  "Groceries",
                  style: TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.w400,
                    fontFamily: "BeVietnam",
                    color: Colors.black45,
                  ),
                ),
              ],
            ),
          ),
        ),
      );
}
