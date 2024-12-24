// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:linked_in/pages/auth/sign_in_page.dart';
import 'package:linked_in/pages/auth/sign_up_page.dart';
import 'package:linked_in/pages/onboarding/on_boarding_entity.dart';
import 'package:linked_in/res/assets_res.dart';
import 'package:linked_in/theme/styles.dart';
import 'package:linked_in/widgets/button_widget.dart';

class OnBoardingPage extends StatefulWidget {
  const OnBoardingPage({super.key});

  @override
  State<OnBoardingPage> createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  List onBoardingPages = OnBoardingEntity.onBoardingList;
  int pageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: linkedInWhiteFFFFFF,
        body: Container(
          margin: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SvgPicture.asset(AssetsRes.APP_LOGO_SVG, width: 200),
              SizedBox(
                height: 520,
                child: PageView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: onBoardingPages.length,
                  onPageChanged: (index) {
                    setState(() {
                      pageIndex = index;
                    });
                  },
                  itemBuilder: (context, index) {
                    return Container(
                      child: Column(
                        children: [
                          Image.asset(
                            "${onBoardingPages[index].image}",
                            width: double.infinity,
                          ),
                          Text(
                            "${onBoardingPages[index].title}",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        ],
                      ),
                    );
                  },
                ),
              ),
              Row(
                spacing: 10,
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  3,
                  (index) {
                    return Container(
                      width: index == pageIndex ? 30 : 12,
                      height: 12,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: pageIndex == index
                              ? linkedInDarkGrey313335
                              : Colors.white,
                          border: Border.all(color: linkedInDarkGrey313335)),
                    );
                  },
                ),
              ),
              SizedBox(height: 20),
              ButtonWidget(onPress: () {
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (context) => SignUpPage()),
                        (route) => false);
                  },
                title: "Join Now",
                withBackground: true,
              ),
              SizedBox(height: 20),
              ButtonWidget(
                  
                  title: "Join with Google",
                  withBackground: false,
                  withImage: true,
                  image: AssetsRes.GOOGLE_LOGO_SVG),
              SizedBox(height: 20),
              Center(
                child: GestureDetector(
                  onTap: () {
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (context) => SignInPage()),
                        (route) => false);
                  },
                  child: Text(
                    "Sign In",
                    style: TextStyle(
                        fontSize: 25,
                        color: linkedInBlue0077B5,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
