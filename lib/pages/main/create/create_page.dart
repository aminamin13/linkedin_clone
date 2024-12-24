import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:linked_in/theme/styles.dart';

class CreatePage extends StatefulWidget {
  const CreatePage({super.key});

  @override
  State<CreatePage> createState() => _HomePageState();
}

class _HomePageState extends State<CreatePage> {
  final TextEditingController _textEditingController = TextEditingController();
  bool isShowBottomModelSheet = false;

  final FocusScopeNode _subPostBottomModalSheetFocusNode = FocusScopeNode();
  final FocusScopeNode _superPostBottomModalSheetFocusNode = FocusScopeNode();

  @override
  void dispose() {
    // TODO: implement dispose
    _textEditingController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (isShowBottomModelSheet == false) {
      WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
        _openFirstBottomModelSheet();
        _createSubPostBottomModalSheet();
      });
      setState(() {
        isShowBottomModelSheet = true;
      });
    }
    return Scaffold();
  }

  _openFirstBottomModelSheet() {
    showModalBottomSheet(
      isScrollControlled: true,
      enableDrag: false,
      isDismissible: false,
      context: context,
      builder: (context) {
        return StatefulBuilder(builder: (context, setState) {
          return FocusScope(
            node: _superPostBottomModalSheetFocusNode,
            child: Column(
              children: [
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  width: double.infinity,
                  height: 110,
                  decoration: const BoxDecoration(
                      color: linkedInWhiteFFFFFF,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                      ),
                      boxShadow: [
                        BoxShadow(
                            offset: Offset(0, 2),
                            color: linkedInLightGreyCACCCE,
                            blurRadius: 5,
                            spreadRadius: 0.1)
                      ]),
                  child: Padding(
                    padding: EdgeInsets.only(bottom: 15),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          spacing: 10,
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: Icon(Icons.close, size: 30),
                            ),
                            Text("Share Post",
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold))
                          ],
                        ),
                        Text("Post",
                            style: TextStyle(
                                fontSize: 20,
                                color: _textEditingController.text.isEmpty
                                    ? linkedInLightGreyCACCCE
                                    : linkedInBlue0077B5))
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 10),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(120),
                              child: Image.asset(
                                "assets/profile_1.jpeg",
                                width: 60,
                                height: 60,
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                _switchWidget(
                                    title: "Amine Amine",
                                    prefixIcon: Icons.account_circle_rounded,
                                    suffixIcon: Icons.arrow_drop_down_outlined),
                                SizedBox(
                                  height: 5,
                                ),
                                _switchWidget(
                                    title: "Anyone",
                                    prefixIcon: FontAwesomeIcons.earth,
                                    suffixIcon: Icons.arrow_drop_down_outlined),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          onTap: () {
                            _textEditingController.addListener(() {
                              setState(() {});
                            });
                          },
                          controller: _textEditingController,
                          style: TextStyle(fontSize: 22),
                          maxLines: 15,
                          decoration: InputDecoration(
                              hintText: "What do you want to talk about?",
                              border: InputBorder.none),
                        )
                      ],
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          const Icon(
                            Icons.camera_alt,
                            color: linkedInMediumGrey86888A,
                          ),
                          const SizedBox(
                            width: 15,
                          ),
                          const Icon(
                            Icons.video_call,
                            color: linkedInMediumGrey86888A,
                          ),
                          const SizedBox(
                            width: 15,
                          ),
                          const Icon(
                            Icons.image,
                            color: linkedInMediumGrey86888A,
                          ),
                          const SizedBox(
                            width: 25,
                          ),
                          GestureDetector(
                              onTap: () {
                                _createSubPostBottomModalSheet();
                              },
                              child: const Icon(
                                Icons.more_horiz,
                                color: linkedInMediumGrey86888A,
                              )),
                        ],
                      ),
                      const Row(
                        children: [
                          Icon(
                            Icons.message_outlined,
                            color: linkedInMediumGrey86888A,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            "Anyone",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: linkedInMediumGrey86888A),
                          )
                        ],
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
              ],
            ),
          );
        });
      },
    ).then((value) {
      _superPostBottomModalSheetFocusNode.unfocus();
    });
  }

  _switchWidget({String? title, IconData? prefixIcon, IconData? suffixIcon}) {
    return Container(
      height: 30,
      padding: EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(width: 1, color: linkedInBlack000000),
      ),
      child: Row(
        children: [
          Icon(
            prefixIcon,
            size: 18,
          ),
          SizedBox(
            width: 5,
          ),
          Text(title!,
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
          SizedBox(
            width: 10,
          ),
          Icon(suffixIcon, size: 30),
        ],
      ),
    );
  }

  _createSubPostBottomModalSheet() {
    showModalBottomSheet(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      barrierColor: Colors.transparent,
      context: context,
      builder: (context) {
        return FocusScope(
          node: _subPostBottomModalSheetFocusNode,
          child: Container(
            decoration: BoxDecoration(color: linkedInWhiteFFFFFF, boxShadow: [
              BoxShadow(
                  offset: const Offset(5, 0),
                  blurRadius: 1,
                  color: linkedInLightGreyCACCCE.withOpacity(.6),
                  spreadRadius: 0.5)
            ]),
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Container(
                        width: 80,
                        height: 6,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: linkedInMediumGrey86888A),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    _createSubPostNavigationItem(
                        title: "Add a photo", iconData: Icons.image),
                    const SizedBox(
                      height: 25,
                    ),
                    _createSubPostNavigationItem(
                        title: "Take a video", iconData: Icons.video_call),
                    const SizedBox(
                      height: 25,
                    ),
                    _createSubPostNavigationItem(
                        title: "Use a template",
                        iconData: Icons.temple_buddhist),
                    const SizedBox(
                      height: 25,
                    ),
                    _createSubPostNavigationItem(
                        title: "Celebrate an occasion",
                        iconData: Icons.celebration),
                    const SizedBox(
                      height: 25,
                    ),
                    _createSubPostNavigationItem(
                        title: "Add a document",
                        iconData: Icons.document_scanner),
                    const SizedBox(
                      height: 25,
                    ),
                    _createSubPostNavigationItem(
                        title: "Share that you're hiring",
                        iconData: Icons.work),
                    const SizedBox(
                      height: 25,
                    ),
                    _createSubPostNavigationItem(
                        title: "Find an expert",
                        iconData: Icons.account_circle_rounded),
                    const SizedBox(
                      height: 25,
                    ),
                    _createSubPostNavigationItem(
                        title: "Create a poll", iconData: Icons.bar_chart),
                    const SizedBox(
                      height: 25,
                    ),
                    _createSubPostNavigationItem(
                        title: "Create an event", iconData: Icons.event),
                    const SizedBox(
                      height: 25,
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    ).then((value) {
      _subPostBottomModalSheetFocusNode.unfocus();
    });
  }

  _createSubPostNavigationItem({IconData? iconData, String? title}) {
    return Row(
      children: [
        Icon(
          iconData,
          size: 25,
          color: linkedInMediumGrey86888A,
        ),
        const SizedBox(
          width: 10,
        ),
        Text(
          "$title",
          style: const TextStyle(
              fontSize: 16,
              color: linkedInMediumGrey86888A,
              fontWeight: FontWeight.bold),
        )
      ],
    );
  }
}
