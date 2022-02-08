import 'dart:async';
import 'package:store/domain/model/model.dart';
import 'package:store/presentation/base/base_view_model.dart';
import 'package:store/presentation/resources/assets_manager.dart';
import 'package:store/presentation/resources/strings_manager.dart';

class OnBoardingViewModel extends BaseViewModel
    with OnBoardingViewModelInputs, OnBoardingViewModelOutputs {
  //stream controller
  final StreamController _streamController =
      StreamController<SlideViewObject>.broadcast();
  int currentPage = 0;
  late final List<SliderObject> _list ;

  //inputs
  @override
  void dispose() {
    _streamController.close();
  }

  @override
  void start() {
    _list=_getSliderData();
  }

  @override
  int goNext() {
    int nextIndex = currentPage++;
    if (nextIndex == _list.length) {
      currentPage = 0;
    }
    return currentPage;
  }

  @override
  int goPrevious() {
    int previousIndex = currentPage--;
    if (previousIndex == -1) {
      currentPage = _list.length - 1;
    }
    return currentPage;
  }

  @override
  void onPageChanged(int index) {
    currentPage=index;
    _postDataToView();
  }

  @override
  Sink get inputSliderViewObject => _streamController.sink;

  //outputs
  @override
  Stream<SlideViewObject> get outputSliderViewObject =>
      _streamController.stream.map((slideViewObject) => slideViewObject);

  //private function
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

  _postDataToView(){
    inputSliderViewObject.add(SlideViewObject(_list[currentPage],currentPage,_list.length));
  }
}

//inputs mean the orders that our view model recieve from our view
abstract class OnBoardingViewModelInputs   {
  void goNext(); //when user clicks on right arrow or swipe left
  void goPrevious(); //when user clicks on left arrow or swipe right
  void onPageChanged(int index);

  Sink
      get inputSliderViewObject; //this way to add data to the stream...stream input
}

//outputs mean data or results that will be sent from our view model to our view
abstract class OnBoardingViewModelOutputs {
  Stream<SlideViewObject> get outputSliderViewObject;
}

class SlideViewObject {
  SliderObject sliderObject;
  int numOfSlides;
  int currentIndex;

  SlideViewObject(this.sliderObject, this.currentIndex, this.numOfSlides);
}
