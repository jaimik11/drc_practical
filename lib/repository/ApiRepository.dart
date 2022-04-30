import 'dart:convert';
import 'dart:io';

import 'package:untitled_drc/network_services/network_call.dart';



class ApiRepository {
  ApiRepository._internal();


  static final ApiRepository apiRepository =
  ApiRepository._internal();

  factory ApiRepository() {
    return apiRepository;
  }

  Future<Map<String, dynamic>> callApi() {
    var doDateJson = {
      "customer_id" : ""
    };
    print("the profile 4 is $doDateJson");
      return callPostApi(jsonEncodeParams: jsonEncode(doDateJson));

  }
  Future<List<dynamic>> callApi1() {
    var doDateJson = {
      "customer_id" : ""
    };
    print("the profile 4 is $doDateJson");
      return callPostApi1(jsonEncodeParams: jsonEncode(doDateJson));

  }

}