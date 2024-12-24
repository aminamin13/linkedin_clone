import 'package:linked_in/res/assets_res.dart';

class OnBoardingEntity {
  final String title;
  final String image;

  OnBoardingEntity({required this.title, required this.image});

 static List<OnBoardingEntity> onBoardingList = [
    OnBoardingEntity(
        title: "Find and Land your next Job", image: AssetsRes.ON_BOARDING_1),
    OnBoardingEntity(
        title: "Build your network on the go", image: AssetsRes.ON_BOARDING_2),
    OnBoardingEntity(
        title: "Stay ahead with curated content for \nyour career",
        image: AssetsRes.ON_BOARDING_1)
  ];
}
