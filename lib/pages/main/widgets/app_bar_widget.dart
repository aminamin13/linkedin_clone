import 'package:flutter/material.dart';
import 'package:linked_in/res/assets_res.dart';
import 'package:linked_in/theme/styles.dart';

PreferredSizeWidget appBarWidget(BuildContext context,
    {VoidCallback? onLeadingTabClickListner, String? title, bool? isJobsTab}) {
  return AppBar(
    backgroundColor: linkedInWhiteFFFFFF,
    elevation: 0,
    leading: GestureDetector(
      onTap: onLeadingTabClickListner,
      child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(30),
            child: Image.asset(
              AssetsRes.PROFILE_1,
              width: 40,
              height: 40,
              fit: BoxFit.cover,
            ),
          )),
    ),
    title: Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: linkedInLightGreyCACCCE.withOpacity(.5),
        borderRadius: BorderRadius.circular(10),
      ),
      child: TextFormField(
          decoration: InputDecoration(
        hintText: title,
        prefixIcon: Icon(Icons.search),
        border: InputBorder.none,
      )),
    ),
    actions: [
      isJobsTab == true
          ? GestureDetector(
              onTap: () {},
              child: Icon(Icons.message_outlined,
                  size: 35, color: linkedInMediumGrey86888A),
            )
          : Row(
              children: [
                Icon(Icons.more_vert,
                    size: 35, color: linkedInMediumGrey86888A),
                SizedBox(
                  width: 10,
                ),
                Icon(Icons.message_outlined,
                    size: 35, color: linkedInMediumGrey86888A),
              ],
            ),
      SizedBox(
        width: 10,
      )
    ],
  );
}
