import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:file_picker/file_picker.dart';
import 'package:http/http.dart';

import '../object/Review.dart';


enum TypeHeader {
  json,
  urlencoded
}


class RestManager {
  String token;


  Future<String> _makeRequest(String serverAddress, String servicePath, String method, TypeHeader type, {Map<String, String> value, dynamic body}) async {
    Uri uri = Uri.http(serverAddress, servicePath, value);
    while ( true ) {
      try {
        Response response;
        // setting content type
        String contentType;
        dynamic formattedBody;
        if ( type == TypeHeader.json ) {
          contentType = "application/json;charset=utf-8";
          if(body.runtimeType == String) {
            formattedBody = body;
          }
          formattedBody = json.encode(body);
        }
        else if ( type == TypeHeader.urlencoded ) {
          contentType = "application/x-www-form-urlencoded";
          formattedBody = body.keys.map((key) => "$key=${body[key]}").join("&");
        }
        // setting headers
        Map<String, String> headers = {};
        headers[HttpHeaders.contentTypeHeader] = contentType;
        headers[HttpHeaders.accessControlAllowOriginHeader] = "*";
        headers[HttpHeaders.acceptHeader] = "*/*";
        if ( token != null ) {
          headers[HttpHeaders.authorizationHeader] = 'bearer $token';
        }
        // making request
        switch ( method ) {
          case "post":
            response = await post(
              uri,
              headers: headers,
              body: formattedBody
            );
            break;
          case "get":
            response = await get(
              uri,
              headers: headers,
            );
            break;
          case "put":
            response = await put(
              uri,
              headers: headers,
            );
            break;
          case "delete":
            response = await delete(
              uri,
              headers: headers,
            );
            break;
        }
        /*if ( delegate != null && errorOccurred ) {
          delegate.errorNetworkGone();
          errorOccurred = false;
        }*/
        return response.body;
      } catch(err) {
        print(uri);
        print(err);
        await Future.delayed(const Duration(seconds: 1), () => null); // not the best solution
      }
    }
  }

  Future<String> makePostRequest(String serverAddress, String servicePath, dynamic body, {Map<String, String> param, TypeHeader type = TypeHeader.json}) async {
    return _makeRequest(serverAddress, servicePath, "post", type, body: body, value: param);
  }

  Future<String> makeGetRequest(String serverAddress, String servicePath, [Map<String, String> value, TypeHeader type = TypeHeader.json]) async {
    return _makeRequest(serverAddress, servicePath, "get", type, value: value);
  }

  Future<String> makePutRequest(String serverAddress, String servicePath, [Map<String, String> value, TypeHeader type]) async {
    return _makeRequest(serverAddress, servicePath, "put", type, value: value);
  }

  Future<String> makeDeleteRequest(String serverAddress, String servicePath, [Map<String, String> value, TypeHeader type]) async {
    return _makeRequest(serverAddress, servicePath, "delete", type, value: value);
  }

  void makePostMultiPartRequestProva(String serverAddress, String servicePath, List<PlatformFile> files){
    Uri uri = Uri.http(serverAddress, servicePath);
    Map<String, String> headers = {};
    headers[HttpHeaders.contentTypeHeader] = "application/json";

    List<Uint8List> fil=[];
    for(PlatformFile x in files) {
      fil.add(x.bytes);
    }
    String jsonFile = jsonEncode(fil);
    post(uri, headers:headers, body: jsonFile);
    /*MultipartRequest request = MultipartRequest('POST', uri);
    Map<String, String> headers = {};
    headers[HttpHeaders.contentTypeHeader] = "multipart/form-data";
    request.headers.addAll(headers);
    request.files.add(MultipartFile.fromBytes("file", files.bytes));
    print(request.toString());
    print(request.headers);
    print(request.files.first.toString());
    request.send();*/
  }

  Future<Review> makePostMultiPartRequest(String serverAddress, String servicePath, Review review, List<PlatformFile> files, {TypeHeader type = TypeHeader.json}) async {
    try{
      Uri uri = Uri.http(serverAddress, servicePath);

      String contentType;
      if ( type == TypeHeader.json ) {
        contentType = "application/json;charset=utf-8";
      }
      else if ( type == TypeHeader.urlencoded ) {
        contentType = "application/x-www-form-urlencoded";
      }

      MultipartRequest request = MultipartRequest('POST', uri);
      Map<String, String> headers = {};
      //headers[HttpHeaders.contentTypeHeader] = contentType;
      headers[HttpHeaders.accessControlAllowOriginHeader] = "*";
      headers[HttpHeaders.acceptHeader] = "*/*";
      request.headers.addAll(headers);

      //request.fields["jsonReview"] = jsonEncode(review);
      List<MultipartFile> toAdd = [];
      for(PlatformFile file in files) {
        toAdd.add(MultipartFile.fromBytes("files", file.bytes));
      }
      request.files.addAll(toAdd);
      print(request.files.length);

      print("s");
      StreamedResponse res = await request.send();
      print(res.reasonPhrase);
      Response response = await Response.fromStream(res);
      print(response.body);
      //Review x = Review.fromJson(jsonDecode(response.body));
      print("w");
    }
    catch(e){
      print(e);
      return null;
    }
  }


}