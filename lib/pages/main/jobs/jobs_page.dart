import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:linked_in/theme/styles.dart';

class JobsPage extends StatefulWidget {
  const JobsPage({super.key});

  @override
  State<JobsPage> createState() => _HomePageState();
}

class _HomePageState extends State<JobsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _topJobsWidget(title: "My Job", icon: FontAwesomeIcons.bookmark),
              _topJobsWidget(
                  title: "Post a Job", icon: Icons.post_add_outlined),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            width: double.infinity,
            height: 10,
            color: linkedInLightGreyCACCCE,
          ),
          SizedBox(
            height: 15,
          ),
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Recommended for you",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold)),
                    SizedBox(
                      height: 10,
                    ),
                    ListView.builder(
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return _recommendedJobsForYou(
                              jobTitle: "Flutter Developer",
                              companyName: "Google",
                              numberOfApplicants: 10);
                        },
                        itemCount: 3),
                    const SizedBox(
                      height: 5,
                    ),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Show all",
                          style: TextStyle(
                              fontSize: 18,
                              color: linkedInBlue0077B5,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Icon(
                          Icons.arrow_forward,
                          size: 25,
                          color: linkedInBlue0077B5,
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      "More jobs for you",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    _buildMoreJobsForYouList(),
                    const SizedBox(
                      height: 5,
                    ),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Show all",
                          style: TextStyle(
                              fontSize: 18,
                              color: linkedInBlue0077B5,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Icon(
                          Icons.arrow_forward,
                          size: 25,
                          color: linkedInBlue0077B5,
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  _buildMoreJobsForYouList() {
    return ListView.builder(
        shrinkWrap: true,
        physics: ScrollPhysics(),
        itemCount: 10,
        itemBuilder: (context, index) {
          return Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.all(6),
                decoration: BoxDecoration(
                  color: linkedInLightGreyCACCCE.withOpacity(.6),
                ),
                child: const Icon(
                  Icons.home_work,
                  size: 50,
                  color: linkedInMediumGrey86888A,
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Job Title",
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        Icon(
                          Icons.bookmark_border,
                          size: 30,
                          color: linkedInMediumGrey86888A,
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 2,
                    ),
                    const Text(
                      "Company name",
                      style: TextStyle(fontSize: 15),
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    const Row(
                      children: [
                        Icon(
                          FontAwesomeIcons.a,
                          size: 30,
                          color: Colors.green,
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        Text(
                          "Actively recruiting",
                          style: TextStyle(
                              fontSize: 12, color: linkedInMediumGrey86888A),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    RichText(
                      text: const TextSpan(
                          text: "Promoted - ",
                          style: TextStyle(
                              fontSize: 12, color: linkedInMediumGrey86888A),
                          children: [
                            TextSpan(
                                text: "2 applicants",
                                style: TextStyle(
                                    fontSize: 12, color: Colors.green))
                          ]),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    const Divider(
                      color: linkedInMediumGrey86888A,
                    ),
                  ],
                ),
              )
            ],
          );
        });
  }

  _recommendedJobsForYou(
      {String? jobTitle, String? companyName, int? numberOfApplicants}) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.all(6),
          decoration: BoxDecoration(
            color: linkedInLightGreyCACCCE.withOpacity(.6),
          ),
          child: const Icon(
            Icons.home_work,
            size: 50,
            color: linkedInMediumGrey86888A,
          ),
        ),
        SizedBox(
          width: 10,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment:
                    MainAxisAlignment.spaceBetween, // Adjusts spacing
                children: [
                  Text(
                    jobTitle!,
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  Icon(FontAwesomeIcons.bookmark)
                ],
              ),
              Text(
                companyName!,
                style: TextStyle(fontSize: 12),
              ),
              SizedBox(
                height: 4,
              ),
              const Row(
                children: [
                  Icon(
                    FontAwesomeIcons.a,
                    size: 30,
                    color: Colors.green,
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Text(
                    "Actively recruiting",
                    style: TextStyle(
                        fontSize: 12, color: linkedInMediumGrey86888A),
                  ),
                ],
              ),
              SizedBox(
                height: 5,
              ),
              RichText(
                  text: TextSpan(
                      text: "Promoted - ",
                      style: TextStyle(color: linkedInMediumGrey86888A),
                      children: [
                    TextSpan(
                        text: "$numberOfApplicants applicants",
                        style: TextStyle(color: Colors.green[300]))
                  ])),
              const Divider(
                color: linkedInMediumGrey86888A,
              ),
            ],
          ),
        ),
      ],
    );
  }

  _topJobsWidget({String? title, IconData? icon}) {
    return Row(
      spacing: 10,
      children: [
        Icon(icon, size: 25),
        Text(
          title!,
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        )
      ],
    );
  }
}
