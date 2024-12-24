import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:linked_in/pages/main/create/create_page.dart';
import 'package:linked_in/pages/main/home/home_page.dart';
import 'package:linked_in/pages/main/jobs/jobs_page.dart';
import 'package:linked_in/pages/main/network/network_page.dart';
import 'package:linked_in/pages/main/notification/notification_page.dart';
import 'package:linked_in/pages/main/widgets/app_bar_widget.dart';
import 'package:linked_in/theme/styles.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int currentPageIndex = 0;
  final GlobalKey<ScaffoldState> _scaffoldState = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldState,
      appBar: appBarWidget(
        context,
        title: currentPageIndex == 4 ? "Search Jobs" : "Search",
        isJobsTab: false,
        onLeadingTabClickListner: () {
          setState(() {
            _scaffoldState.currentState!.openDrawer();
          });
        },
      ),
      drawer: _DrawerWidget(),
      bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: linkedInBlue0077B5,
          selectedLabelStyle: const TextStyle(color: linkedInBlue0077B5),
          unselectedItemColor: linkedInMediumGrey86888A,
          unselectedLabelStyle:
              const TextStyle(color: linkedInMediumGrey86888A),
          onTap: (index) {
            setState(() {
              currentPageIndex = index;
            });
          },
          currentIndex: currentPageIndex,
          type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.house_fill),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.people),
              label: "Network",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.add_box_rounded),
              label: "Post",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.notifications),
              label: "Notification",
            ),
            BottomNavigationBarItem(
              icon: Icon(FontAwesomeIcons.briefcase),
              label: "Jobs",
            ),
          ]),
      body: _switchPages(currentPageIndex),
    );
  }

  Drawer _DrawerWidget() {
    return Drawer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: double.infinity,
            height: 220,
            child: DrawerHeader(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  radius: 40,
                  backgroundImage: AssetImage("assets/profile_1.jpeg"),
                ),
                Text("John Doe",
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                Text("View Profile",
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
              ],
            )),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Text("Groups",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Text("Events",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
          ),
          Spacer(),
          Divider(),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Row(
              spacing: 20,
              children: [
                Icon(Icons.settings),
                Text("Settings",
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }

  _switchPages(int index) {
    switch (index) {
      case 0:
        return HomePage();
      case 1:
        return NetworkPage();

      case 2:
        return CreatePage();
      case 3:
        return NotificationPage();
      case 4:
        return JobsPage();
      default:
        return HomePage();
    }
  }
}
