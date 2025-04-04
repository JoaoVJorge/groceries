import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../../theme/colours.dart';
import '../password_input.dart';
import 'enter_account_controller.dart';

class EnterAccountView extends StatelessWidget {
  const EnterAccountView({super.key});

  @override
  Widget build(final BuildContext context) {
    final EnterAccountController controller = Get.find();
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InkWell(
              onTap: controller.goToWelcome,
              borderRadius: const BorderRadius.all(
                Radius.circular(30),
              ),
              child: Container(
                width: 70,
                height: 70,
                decoration: const BoxDecoration(
                  color: AppColours.undetectColour,
                  borderRadius: BorderRadius.all(
                    Radius.circular(30),
                  ),
                ),
                child: Center(
                  child: SvgPicture.asset(
                    "assets/icons/arrow-left.svg",
                    height: 40,
                    colorFilter:
                        const ColorFilter.mode(Colors.black45, BlendMode.srcIn),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 30),
            const Text(
              "Welcome Back",
              style: TextStyle(
                color: AppColours.primaryColour,
                fontSize: 40,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Text(
              controller.registerText,
              style: const TextStyle(
                color: AppColours.primaryColour,
                fontSize: 20,
                fontWeight: FontWeight.w300,
              ),
            ),
            const SizedBox(height: 70),
            Container(
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
                      "assets/icons/envelope.svg",
                      height: 40, // Adjusted size
                      colorFilter: const ColorFilter.mode(
                        Colors.grey,
                        BlendMode.srcIn,
                      ),
                    ),
                  ),
                  Expanded(
                    child: TextFormField(
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintText: "Email Address",
                        hintStyle: TextStyle(color: Colors.grey),
                      ),
                      onChanged: controller.setEmail,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),
            PasswordInput(
              name: "Password",
              onChanged: controller.setPassword,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20.0, left: 5),
              child: Row(
                children: [
                  const StayConnected(),
                  const SizedBox(
                    width: 4,
                  ),
                  const Text(
                    "Stay Connected",
                    style: TextStyle(color: Colors.grey, fontSize: 16),
                  ),
                  const SizedBox(
                    width: 190,
                  ),
                  InkWell(
                    onTap: () {},
                    child: const Text(
                      "Forgot Password?",
                      style:
                          TextStyle(color: Colors.orangeAccent, fontSize: 18),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.only(top: 8),
              child: Obx(
                () => Text(
                  controller.errorText.value,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Colors.red,
                    fontSize: 17,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 18),
            Center(
              child: InkWell(
                onTap: controller.checkCredentials,
                borderRadius: const BorderRadius.all(Radius.circular(30)),
                child: Container(
                  width: 400,
                  height: 60,
                  decoration: const BoxDecoration(
                    color: AppColours.primaryColour,
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                  ),
                  child: const Center(
                    child: Text(
                      "Continue",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 120,
                  color: Colors.grey,
                  height: 2,
                ),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    "Or Continue With",
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                Container(
                  width: 120,
                  color: Colors.grey,
                  height: 2,
                ),
              ],
            ),
            const SizedBox(height: 30),
            Center(
              child: InkWell(
                onTap: () {},
                borderRadius: const BorderRadius.all(
                  Radius.circular(30),
                ),
                child: Container(
                  width: 400,
                  height: 60,
                  decoration: const BoxDecoration(
                    color: AppColours.undetectColour,
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        "assets/icons/google-icon-logo-svgrepo-com.svg",
                        width: 30,
                      ),
                      const SizedBox(width: 15),
                      const Text(
                        "Continue with Google",
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Center(
              child: InkWell(
                onTap: () {},
                borderRadius: const BorderRadius.all(
                  Radius.circular(30),
                ),
                child: Container(
                  width: 400,
                  height: 60,
                  decoration: const BoxDecoration(
                    color: AppColours.undetectColour,
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        "assets/icons/apple-black-logo-svgrepo-com.svg",
                        width: 30,
                      ),
                      const SizedBox(width: 15),
                      const Text(
                        "Continue with Apple",
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Dont have an account. ",
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
                InkWell(
                  onTap: controller.goToMakeAccount,
                  child: const Text(
                    "Sign Up",
                    style: TextStyle(
                      color: Colors.blue,
                      fontSize: 18,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class StayConnected extends StatefulWidget {
  const StayConnected({super.key});

  @override
  State<StayConnected> createState() => _StayConnectedState();
}

class _StayConnectedState extends State<StayConnected> {
  bool stateConnection = false;
  @override
  Widget build(final BuildContext context) => Container(
        alignment: Alignment.centerLeft,
        height: 35,
        width: 35,
        child: GestureDetector(
          onTap: () => {setState(() => stateConnection = !stateConnection)},
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Positioned.fill(
                child: Center(
                  child: Container(
                    height: 20,
                    width: 20,
                    decoration: const BoxDecoration(
                      color: Color.fromARGB(87, 158, 158, 158),
                      borderRadius: BorderRadius.all(Radius.circular(4)),
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: 8,
                left: 10,
                child: stateConnection == true
                    ? Center(
                        child: SvgPicture.asset(
                          "assets/icons/check.svg",
                          height: 25,
                          colorFilter: const ColorFilter.mode(
                            Colors.blueAccent,
                            BlendMode.srcIn,
                          ),
                        ),
                      )
                    : Container(),
              ),
            ],
          ),
        ),
      );
}
