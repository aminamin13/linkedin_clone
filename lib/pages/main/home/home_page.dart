import 'package:flutter/material.dart';
import 'package:linked_in/data/post_entity.dart';
import 'package:linked_in/pages/main/home/widgets/single_post_card_widget.dart';
import 'package:linked_in/theme/styles.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<PostEntity> postData = PostEntity.postListData;

  final ScrollController _controller = ScrollController();
  bool isShow = true;
  @override
  void initState() {
    // TODO: implement initState

    _controller.addListener(() {
      if (_controller.position.pixels > 3) {
        setState(() {
          isShow = false;
        });
      } else {
        setState(() {
          isShow = true;
        });
      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 5,
        ),
        isShow
            ? Container(
                width: double.infinity,
                height: 3,
                color: linkedInLightGreyCACCCE)
            : Container(),
        Expanded(
            child: ListView.builder(
          controller: _controller,
          itemCount: postData.length,
          itemBuilder: (context, index) {
            return SinglePostCardWidget(post: postData[index]);
          },
        ))
      ],
    );
  }
}
