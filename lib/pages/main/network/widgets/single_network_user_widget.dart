// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:linked_in/data/network_entity.dart';
import 'package:linked_in/theme/styles.dart';

class SingleNetworkUserWidget extends StatefulWidget {
  const SingleNetworkUserWidget({
    super.key,
    required this.networkData,
  });

  final NetworkEntity networkData;

  @override
  State<SingleNetworkUserWidget> createState() =>
      _SingleNetworkUserWidgetState();
}

class _SingleNetworkUserWidgetState extends State<SingleNetworkUserWidget> {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Column(
            children: [
              Container(
                width: double.infinity,
                height: 80,
                decoration: const BoxDecoration(color: linkedInLightGreyCACCCE),
                child: Image.asset("assets/${widget.networkData.userBgImage!}",
                    height: 80, width: double.infinity, fit: BoxFit.cover),
              ),
              const SizedBox(
                height: 60,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(
                  "${widget.networkData.username}",
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(
                  "${widget.networkData.userBio}",
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      color: linkedInMediumGrey86888A),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.group),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                        child: Text(
                      "${widget.networkData.mutualConnections} mutual connections",
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(color: linkedInMediumGrey86888A),
                    ))
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 10),
                width: double.infinity,
                height: 40,
                decoration: BoxDecoration(
                  border: Border.all(width: 1, color: linkedInBlue0077B5),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Center(
                  child: Text(
                    "Connect",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: linkedInBlue0077B5),
                  ),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
            ],
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              margin: const EdgeInsets.only(top: 20),
              width: 110,
              height: 110,
              decoration: const BoxDecoration(
                  color: linkedInMediumGrey86888A, shape: BoxShape.circle),
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(60),
                  child: Image.asset(
                    "assets/${widget.networkData.userProfileImage}",
                    fit: BoxFit.cover,
                  )),
            ),
          )
        ],
      ),
    );
  }
}
