import 'package:flutter/material.dart';
import 'package:store/presentation/resources/assets_manager.dart';
import 'package:store/presentation/resources/color_manager.dart';
import 'package:store/presentation/resources/strings_manager.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  _OnBoardingScreenState createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  int currentPage = 0;
  PageController _pageController = PageController(initialPage: 0);
  late final List<SliderObject> _list = _getSliderData();

  List<SliderObject> _getSliderData() => [
        SliderObject(ImageAssets.onboardingLogo1, AppStrings.onBoardingTitle1,
            AppStrings.onBoardingSubTitle1),
        SliderObject(ImageAssets.onboardingLogo2, AppStrings.onBoardingTitle2,
            AppStrings.onBoardingSubTitle2),
        SliderObject(ImageAssets.onboardingLogo3, AppStrings.onBoardingTitle3,
            AppStrings.onBoardingSubTitle3),
        SliderObject(ImageAssets.onboardingLogo4, AppStrings.onBoardingTitle4,
            AppStrings.onBoardingSubTitle4),
      ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.white,
      body: PageView.builder(
        itemCount: _list.length,
        controller: _pageController,
        onPageChanged: (value) {
          setState(() {
            currentPage = value;
          });
        },
        itemBuilder: (context, index) {
          return OnBoarding(_list[index]);
        },
      ),
    );
  }
}
class OnBoarding extends StatelessWidget {
SliderObject _sliderObject;
OnBoarding(this._sliderObject);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(_sliderObject.title),
        SizedBox(height: 20,),
        Text(_sliderObject.subTitle),
        SizedBox(height: 50,),
        Image.asset(_sliderObject.images)
      ],
    );
  }
}

class SliderObject {
  String title;
  String subTitle;
  String images;

  SliderObject(this.images, this.title, this.subTitle);
}