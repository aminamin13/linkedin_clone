import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:linked_in/pages/auth/sign_up_page.dart';
import 'package:linked_in/pages/main/main_page.dart';
import 'package:linked_in/res/assets_res.dart';
import 'package:linked_in/theme/styles.dart';
import 'package:linked_in/widgets/button_widget.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
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
                        "Sign in",
                        style: TextStyle(
                            fontSize: 40, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      const Text(
                        "Stay updated on your professional world",
                        style: TextStyle(fontSize: 14),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                          hintText: "Email or Phone number",
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                          hintText: "Password",
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text("Forget Password?",
                          style: TextStyle(
                              color: linkedInBlue0077B5,
                              fontWeight: FontWeight.bold,
                              fontSize: 15)),
                      SizedBox(
                        height: 10,
                      ),
                      ButtonWidget(title: "Sign in", withBackground: true,
                      
                      onPress:  () {
                         Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => MainPage()), (route) => false);
                          
                      },),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        spacing: 5,
                        children: [
                          Expanded(
                              child: Divider(
                            thickness: 1,
                            color: Colors.black,
                          )),
                          Text(
                            "Or",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Expanded(
                              child: Divider(
                            thickness: 1,
                            color: Colors.black,
                          )),
                        ],
                      ),
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
                              text: "New to LinkedIn? ",
                              style: TextStyle(color: linkedInMediumGrey86888A),
                              children: [
                                TextSpan(
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    SignUpPage()));
                                        // Handle tap
                                      },
                                    text: "Join Now",
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
