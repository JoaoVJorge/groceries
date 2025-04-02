import 'package:app_congonhas/theme/colours.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class PasswordInput extends StatefulWidget {
  const PasswordInput({
    super.key,
    required this.name,
    required this.onChanged,
  });

  final String name;
  final Function(String) onChanged;

  @override
  State<PasswordInput> createState() => _Password();
}

class _Password extends State<PasswordInput> {
  bool passwordState = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 60,
      padding: const EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
        color: AppColours.undetectColour,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: SvgPicture.asset(
              "assets/icons/lock.svg",
              height: 40, // Adjusted size
              colorFilter: const ColorFilter.mode(
                Colors.grey,
                BlendMode.srcIn,
              ),
            ),
          ),
          Expanded(
            child: TextFormField(
              obscureText: !passwordState,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: widget.name,
                hintStyle: const TextStyle(color: Colors.grey),
              ),
              onChanged: widget.onChanged,
            ),
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                passwordState = !passwordState;
              });
            },
            child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 150),
              transitionBuilder: (Widget child, Animation<double> animation) {
                return FadeTransition(
                  opacity: animation,
                  child: child,
                );
              },
              child: SvgPicture.asset(
                passwordState
                    ? "assets/icons/eye.svg"
                    : "assets/icons/eye-crossed.svg",
                key: ValueKey<bool>(
                    passwordState), // Unique key to trigger animation
                height: 30,
                colorFilter: const ColorFilter.mode(
                  Colors.grey,
                  BlendMode.srcIn,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
