import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:linked_in/pages/auth/sign_in_page.dart';
import 'package:linked_in/pages/main/main_page.dart';
import 'package:linked_in/res/assets_res.dart';
import 'package:linked_in/theme/styles.dart';
import 'package:linked_in/widgets/button_widget.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  bool isContinued = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(top: 60),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SvgPicture.asset(
              AssetsRes.APP_LOGO_SVG,
              width: 50,
              height: 50,
            ),
            SizedBox(height: 10),
            Container(
                margin: const EdgeInsets.only(left: 20, right: 20),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Join LinkedIn",
                        style: TextStyle(
                            fontSize: 40, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                          hintText: "Email or Phone number",
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      isContinued == true
                          ? TextFormField(
                              decoration: InputDecoration(
                                hintText: "Password",
                              ),
                            )
                          : Container(),
                      const SizedBox(
                        height: 10,
                      ),
                      ButtonWidget(
                          onPress: () {
                            if (isContinued == false) {
                              setState(() {
                                isContinued = true;
                              });
                              return;
                            }
                            Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => MainPage()),
                                (route) => false);
                          },
                          title: "Continue",
                          withBackground: true),
                      SizedBox(
                        height: 10,
                      ),
                      ButtonWidget(
                          title: "Join with Google",
                          withBackground: false,
                          withImage: true,
                          image: AssetsRes.GOOGLE_LOGO_SVG),
                      SizedBox(height: 10),
                      ButtonWidget(
                          title: "Join with Apple",
                          withBackground: false,
                          withImage: true,
                          image: AssetsRes.APPLE_LOGO_SVG),
                      SizedBox(
                        height: 20,
                      ),
                      Center(
                        child: Text.rich(
                          TextSpan(
                              text: "Already on LinkedIn? ",
                              style: TextStyle(color: linkedInMediumGrey86888A),
                              children: [
                                TextSpan(
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    SignInPage()));
                                        // Handle tap
                                      },
                                    text: "Sign in",
                                    style: TextStyle(
                                        color: linkedInBlue0077B5,
                                        fontWeight: FontWeight.bold))
                              ]),
                        ),
                      ),
                    ]))
          ],
        ),
      ),
    );
  }
}
