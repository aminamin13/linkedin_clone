import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:linked_in/data/post_entity.dart';
import 'package:linked_in/theme/styles.dart';

class SinglePostCardWidget extends StatefulWidget {
  const SinglePostCardWidget({super.key, required this.post});
  final PostEntity post;

  @override
  State<SinglePostCardWidget> createState() => _SinglePostCardWidgetState();
}

class _SinglePostCardWidgetState extends State<SinglePostCardWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          color: linkedInWhiteFFFFFF,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                spacing: 10,
                children: [
                  SizedBox(
                    width: 70,
                    height: 70,
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(50),
                        child: Image.asset(
                          "assets/${widget.post.userProfile}",
                        )),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "${widget.post.username}",
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            GestureDetector(
                                onTap: () {
                                  _openBottomModelSheet();
                                },
                                child: Icon(Icons.more_vert))
                          ],
                        ),
                        Text(
                          "${widget.post.userBio}",
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              color: linkedInMediumGrey86888A, fontSize: 12),
                        ),
                        Row(
                          children: [
                            Text(
                              "${widget.post.createAt} • ",
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  color: linkedInMediumGrey86888A,
                                  fontSize: 12),
                            ),
                            Icon(FontAwesomeIcons.earthAmericas, size: 14)
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Text("${widget.post.description}",
                  style: TextStyle(fontSize: 14, color: linkedInBlack000000)),
              SizedBox(
                height: 10,
              ),
              Wrap(
                  children: widget.post.tags!.map((tag) {
                return Text(tag,
                    style: TextStyle(fontSize: 14, color: linkedInBlue0077B5));
              }).toList()),
              SizedBox(
                height: 8,
              ),
            ],
          ),
        ),
        widget.post.postImages!.isEmpty
            ? Container(
                width: double.infinity,
                color: linkedInMediumGrey86888A,
                child: Image.asset("assets/${widget.post.postImage}"))
            : SizedBox(
                height: 400,
                child: Stack(
                  children: [
                    PageView(
                      children: widget.post.postImages!.map((image) {
                        return Image.asset("assets/$image", fit: BoxFit.cover);
                      }).toList(),
                    ),
                    Positioned(
                      right: 10,
                      top: 10,
                      child: Container(
                        width: 35,
                        height: 35,
                        padding: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            color: linkedInWhiteFFFFFF,
                            borderRadius: BorderRadius.circular(10)),
                        child: Center(child: Icon(FontAwesomeIcons.images)),
                      ),
                    )
                  ],
                ),
              ),
        const SizedBox(
          height: 10,
        ),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Stack(
            alignment: Alignment.centerLeft,
            children: [
              Positioned(
                child: _singleReactItemWidget(
                    bgColor: Colors.blue.shade200, image: "thumbs_up.png"),
              ),
              Positioned(
                left: 16,
                child: _singleReactItemWidget(
                    bgColor: Colors.red.shade200, image: "love.png"),
              ),
              Positioned(
                left: 34,
                child: _singleReactItemWidget(
                    bgColor: Colors.amber.shade200, image: "insightful.png"),
              ),
              Positioned(
                left: 70,
                child: Text("${widget.post.totalReacts}"),
              ),
              Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                Text(
                  "${widget.post.totalComments} comments - ",
                  style: const TextStyle(
                      color: linkedInMediumGrey86888A, fontSize: 15),
                ),
                Text(
                  "${widget.post.totalReposts} reposts",
                  style: const TextStyle(
                      color: linkedInMediumGrey86888A, fontSize: 15),
                )
              ])
            ],
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        Container(
          width: double.infinity,
          height: 1,
          color: linkedInLightGreyCACCCE,
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _singleActionButton(
              icon: FontAwesomeIcons.thumbsUp,
              title: "Like",
            ),
            _singleActionButton(
              icon: FontAwesomeIcons.commentDots,
              title: "Comment",
            ),
            _singleActionButton(
              icon: FontAwesomeIcons.retweet,
              title: "Repost",
            ),
            _singleActionButton(
              icon: FontAwesomeIcons.paperPlane,
              title: "Send",
            ),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        Container(
          width: double.infinity,
          height: 8,
          color: linkedInLightGreyCACCCE,
        ),
      ],
    );
  }

  _openBottomModelSheet() {
    return showModalBottomSheet(
      enableDrag: true,
      context: context,
      builder: (context) {
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          decoration: const BoxDecoration(
            color: linkedInWhiteFFFFFF,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            child: Column(
              children: [
                const SizedBox(
                  height: 40,
                ),
                _bottomNavigationItem(
                    title: "Save", iconData: Icons.bookmark_border),
                const SizedBox(
                  height: 30,
                ),
                _bottomNavigationItem(
                    title: "Share via", iconData: Icons.share),
                const SizedBox(
                  height: 30,
                ),
                _bottomNavigationItem(
                    title: "Unfollow", iconData: Icons.cancel),
                const SizedBox(
                  height: 30,
                ),
                _bottomNavigationItem(
                    title: "Remove connection with Username",
                    iconData: Icons.person_remove),
                const SizedBox(
                  height: 30,
                ),
                _bottomNavigationItem(
                    title: "Mute Username",
                    iconData: FontAwesomeIcons.soundcloud),
                const SizedBox(
                  height: 30,
                ),
                _bottomNavigationItem(
                    title: "Report post", iconData: Icons.flag),
                const SizedBox(
                  height: 30,
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Row _bottomNavigationItem({IconData? iconData, String? title}) {
    return Row(
      children: [
        Icon(iconData, size: 25, color: linkedInMediumGrey86888A),
        SizedBox(width: 10),
        Text(title!,
            style: TextStyle(color: linkedInMediumGrey86888A, fontSize: 16))
      ],
    );
  }

  Column _singleActionButton({IconData? icon, String? title}) {
    return Column(
      children: [
        Icon(
          icon,
          color: linkedInMediumGrey86888A,
        ),
        Text(
          title!,
          style: TextStyle(color: linkedInMediumGrey86888A),
        )
      ],
    );
  }

  _singleReactItemWidget({String? image, Color? bgColor}) {
    return Container(
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
          color: bgColor,
          shape: BoxShape.circle,
          border: Border.all(width: 2, color: linkedInWhiteFFFFFF)),
      child: Image.asset(
        "assets/$image",
        width: 10,
        height: 10,
      ),
    );
  }
}
