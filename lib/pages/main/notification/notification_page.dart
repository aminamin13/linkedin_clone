import 'package:flutter/material.dart';
import 'package:linked_in/theme/styles.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({super.key});

  @override
  State<NotificationPage> createState() => _HomePageState();
}

class _HomePageState extends State<NotificationPage> {
  int filterButtonIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Row(
              spacing: 15,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                _NotificationFilterButtons(
                    width: 60,
                    color: filterButtonIndex == 0 ? linkedInBlue0077B5 : null,
                    textColor:
                        filterButtonIndex == 0 ? linkedInWhiteFFFFFF : null,
                    borderColor: filterButtonIndex == 0
                        ? linkedInBlue0077B5
                        : linkedInLightGreyCACCCE,
                    title: 'All',
                    onTap: () {
                      setState(() {
                        filterButtonIndex = 0;
                      });
                    }),
                _NotificationFilterButtons(
                    width: 90,
                    title: 'My Posts',
                    color: filterButtonIndex == 1 ? linkedInBlue0077B5 : null,
                    textColor:
                        filterButtonIndex == 1 ? linkedInWhiteFFFFFF : null,
                    borderColor: filterButtonIndex == 1
                        ? linkedInBlue0077B5
                        : linkedInLightGreyCACCCE,
                    onTap: () {
                      setState(() {
                        filterButtonIndex = 1;
                      });
                    }),
                _NotificationFilterButtons(
                    width: 90,
                    title: 'Mentions',
                    color: filterButtonIndex == 2 ? linkedInBlue0077B5 : null,
                    textColor:
                        filterButtonIndex == 02 ? linkedInWhiteFFFFFF : null,
                    borderColor: filterButtonIndex == 2
                        ? linkedInBlue0077B5
                        : linkedInLightGreyCACCCE,
                    onTap: () {
                      setState(() {
                        filterButtonIndex = 2;
                      });
                    }),
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            width: double.infinity,
            height: 7,
            color: linkedInLightGreyCACCCE,
          ),
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              itemCount: 10,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return _singleNotificationWidget();
              },
            ),
          )
        ],
      ),
    );
  }

  _singleNotificationWidget() {
    return Container(
      height: 80,
      width: double.infinity,
      margin: EdgeInsets.only(bottom: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: 70,
            height: 70,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(30),
              child: Image.asset(
                'assets/profile_2.jpeg',
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Amine Amine",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              SizedBox(
                height: 2,
              ),
              Text("Comment on your post",
                  style: TextStyle(
                    fontSize: 13,
                  )),
            ],
          ),
          Spacer(),
          Column(
            spacing: 4,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("2m",
                  style: TextStyle(
                      fontSize: 13,
                      color: linkedInLightGreyCACCCE,
                      fontWeight: FontWeight.bold)),
              Icon(
                Icons.more_vert,
              )
            ],
          )
        ],
      ),
    );
  }

  _NotificationFilterButtons(
      {double? width,
      String? title,
      Function()? onTap,
      Color? color,
      Color? textColor,
      Color? borderColor}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
          height: 30,
          width: width,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: borderColor!),
          ),
          child: Center(
              child: Text(
            title!,
            style: TextStyle(
                color: textColor, fontSize: 16, fontWeight: FontWeight.bold),
          ))),
    );
  }
}
