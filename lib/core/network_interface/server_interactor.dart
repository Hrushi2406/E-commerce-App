import 'dart:convert';
import 'package:furnitur/core/errors/failures.dart';
import 'package:http/http.dart' as http;

class ServerInteractor {
  //Base Url
  String baseUrl;

  //Default Headers
  Map<String, String> defaultHeaders;

//Constructor
  ServerInteractor({
    String baseUrl,
    Map<String, String> defaultHeaders,
  }) {
    this.baseUrl = baseUrl ?? "https://furnitur-1v.herokuapp.com/api";
    // this.baseUrl = baseUrl ?? "http://localhost:8080/api";
    this.defaultHeaders = defaultHeaders;
  }

  ///Set the passed headers as default headers
  ///
  void setDefaultHeaders(Map<String, String> headers) {
    this.defaultHeaders = headers;
  }

  ///Make Get Request Using Get Request Interactor
  ///
  ///If success returns serialized data
  ///
  ///Else throws Error
  Future getRequest(String url, {Map<String, String> headers}) async {
    //Making request
    var response = await http.get(
      baseUrl + url,
      headers: headers ?? this.defaultHeaders,
    );

    //Parsing request to json
    final data = jsonDecode(response.body);

    //Sucess Case
    if (response.statusCode == 200) {
      //return the data
      return data;
    }

    //Error Case
    else {
      //Returns the error
      print(data);
      throw new ErrorHandler.fromJson(data);
    }
  }

  ///Make Post Request Using Post Request Interactor
  ///
  ///If success returns serialized data
  ///
  ///Else throws Error
  Future postRequest(
    String url, {
    Map<String, String> headers,
    Map<String, dynamic> body,
  }) async {
    //Making request
    var response = await http.post(
      baseUrl + url,
      body: body,
      headers: headers ?? this.defaultHeaders,
    );

    var data;

    data = '';
    if (response.body.isNotEmpty) {
      //Parsing request to json
      data = jsonDecode(response.body);
    }

    //Sucess Case
    if (response.statusCode == 201) {
      //return the data
      return data;
    }

    //Error Case
    else {
      //Returns the error
      print(data);
      throw new ErrorHandler.fromJson(data);
      // throw new ErrorHandler(errorMessage: "Went wrong");
    }
  }

  ///Make Delete Request Using Delete Request Interactor
  ///
  ///If success returns no data
  ///
  ///Else throws Error
  Future deleteRequest(
    String url, {
    Map<String, String> headers,
  }) async {
    //Making request
    var response = await http.delete(
      baseUrl + url,
      headers: headers ?? this.defaultHeaders,
    );

    //Parsing request to json
    var data;

    data = '';
    if (response.body.isNotEmpty) {
      //Parsing request to json
      data = jsonDecode(response.body);
    }

    //Sucess Case

    if (response.statusCode == 204) {
      //return the data
      return;
    }

    //Error Case
    else {
      //Returns the error
      print(data);
      throw new ErrorHandler.fromJson(data);
    }
  }
}
