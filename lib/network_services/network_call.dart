
import 'dart:convert';
import 'dart:developer';

import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:http/http.dart' as http;

final Connectivity _connectivity = Connectivity();

var response;
http.Client? client;

Future<Map<String, dynamic>> callPostApi({jsonEncodeParams}) async {

  try {
    ConnectivityResult result = ConnectivityResult.none;
    result = await _connectivity.checkConnectivity();
    if(result == ConnectivityResult.none){
      EasyLoading.dismiss();

      // showSnackBar(context: navigatorKey.currentContext, msg: "Please Check Network connection");
      return {"code": 0,
        "status": "Fail",
        "message": "Please Check Network connection"};
    }
  } on PlatformException catch (e) {

    print(e.toString());
    return {"code": 0,
      "status": "Fail",
      "message": "Failed to get connectivity."};
  }


  var headers = await getHeaders();

  var url = "https://mobileapp.annabelleme.com/en/rest/V1/homepage";
  print("url maded");
  print("params is $jsonEncodeParams");

  if(client != null) {
    client!.close();
    client = null;
  }
  client = http.Client();
  try{
    response = await client?.post(Uri.parse(url),
        body: jsonEncodeParams,
        headers: headers).timeout(const Duration(seconds: 10));
  }catch(e){
    client = null;
    return {"code": 0,
      "status": "Fail",
      "message": "Please Check Network connection"};
  }
  /*var response = await http.post(Uri.parse(url),
      body: jsonEncodeParams != null ? jsonEncodeParams : param,
      headers: headers);*/
  log("responce ${response.statusCode}");

  Map<String, dynamic> responseData = json.decode(response.body[0]);

  print("headers $headers");

  print("response ${response.body}");
  client = null;
    return responseData;
}


Future<List<dynamic>> callPostApi1({jsonEncodeParams}) async {

  try {
    ConnectivityResult result = ConnectivityResult.none;
    result = await _connectivity.checkConnectivity();
    if(result == ConnectivityResult.none){
      EasyLoading.dismiss();

      // showSnackBar(context: navigatorKey.currentContext, msg: "Please Check Network connection");
      return [{"code": 0,
        "status": "Fail",
        "message": "Please Check Network connection"}];
    }
  } on PlatformException catch (e) {

    print(e.toString());
    return [{"code": 0,
      "status": "Fail",
      "message": "Failed to get connectivity."}];
  }


  var headers = await getHeaders();

  var url = "https://mobileapp.annabelleme.com/en/rest/V1/homepage";
  print("url maded");
  print("params is $jsonEncodeParams");

  if(client != null) {
    client!.close();
    client = null;
  }
  client = http.Client();
  try{
    response = await client?.post(Uri.parse(url),
        body: jsonEncodeParams,
        headers: headers).timeout(const Duration(seconds: 10));
  }catch(e){
    client = null;
    return [{"code": 0,
      "status": "Fail",
      "message": "Please Check Network connection"}];
  }
  /*var response = await http.post(Uri.parse(url),
      body: jsonEncodeParams != null ? jsonEncodeParams : param,
      headers: headers);*/
  log("responce ${response.statusCode}");

  List<dynamic> responseData = json.decode(response.body);

  print("headers $headers");

  print("response ${response.body}");
  client = null;
  return responseData;
}

Future<Map<String, String>> getHeaders() async {

  var headers = Map<String, String>();
  headers["language"] = "en";
  headers["os"] = "14.1";
  headers["Content-Type"] = "application/json";


  return headers;
}
