import 'package:flutter/material.dart';
import 'package:linked_in/data/network_entity.dart';
import 'package:linked_in/pages/main/network/widgets/single_network_user_widget.dart';
import 'package:linked_in/theme/styles.dart';

class NetworkPage extends StatefulWidget {
  const NetworkPage({super.key});

  @override
  State<NetworkPage> createState() => _HomePageState();
}

class _HomePageState extends State<NetworkPage> {
  List<NetworkEntity> networkData = NetworkEntity.networkData;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Manage my network',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: linkedInBlue0077B5)),
                  Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.black,
                  )
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              color: linkedInLightGreyCACCCE,
              height: 7,
              width: double.infinity,
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Invitations',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: linkedInBlue0077B5)),
                  Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.black,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              color: linkedInLightGreyCACCCE,
              height: 7,
              width: double.infinity,
            ),
            SizedBox(
              height: 10,
            ),
            GridView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                itemCount: networkData.length,
                shrinkWrap: true,
                physics: const ScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 6,
                    crossAxisSpacing: 6,
                    childAspectRatio: 0.6),
                itemBuilder: (context, index) {
                  return SingleNetworkUserWidget(
                      networkData: networkData[index]);
                })
          ],
        ),
      ),
    );
  }
}
