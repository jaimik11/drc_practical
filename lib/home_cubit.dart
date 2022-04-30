import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:meta/meta.dart';
import 'package:untitled_drc/models/home_screen_model.dart';
import 'package:untitled_drc/repository/ApiRepository.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  bool isLoading = false;
  final ApiRepository? apiRepository;
  HomeScreenModel? homeScreenModel;
  HomeCubit({this.apiRepository}) : super(HomeInitial());

  void callGeDataListApi() async {
    isLoading = true;
    EasyLoading.show(status: 'Please Wait...');
    emit(HomeInitial());

    Map<String, dynamic> responseData =
        await apiRepository!.callApi();
    isLoading = false;
    EasyLoading.dismiss();

    if (responseData[0]['code'] == 200) {
      // List<HomeScreenModel>.from(
      //     json.decode(responseData.toString()).map((x) => HomeScreenModel.fromJson(x)));
      homeScreenModel = HomeScreenModel.fromJson(responseData);
      print("homeModel ${homeScreenModel!.data!.bannerSlider!.length}");
      emit(HomeStateSuccess());
    } else {
      emit(HomeStateError(error: responseData["msg"]));
    }
  }

  void callGeDataListApi1() async {
    isLoading = true;
    EasyLoading.show(status: 'Please Wait...');
    emit(HomeInitial());

    List<dynamic> responseData =
        await apiRepository!.callApi1();
    isLoading = false;
    EasyLoading.dismiss();

    if (responseData[0]['status'] == "200") {
      // List<HomeScreenModel>.from(
      //     json.decode(responseData.toString()).map((x) => HomeScreenModel.fromJson(x)));
      homeScreenModel = HomeScreenModel.fromJson(responseData[0]);
      print("homeModel ${homeScreenModel!.data!.bannerSlider!.length}");
      emit(HomeStateSuccess());
    } else {
      emit(HomeStateError(error: responseData[0]["message"]));
    }
  }
}
