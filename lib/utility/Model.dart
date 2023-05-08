import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';
import 'package:file_picker/file_picker.dart';
import 'package:frontend_sdcc_flutter/utility/Constants.dart';
import 'package:frontend_sdcc_flutter/utility/RestManager.dart';
import 'package:crypto/crypto.dart';
import 'package:http/http.dart';
import '../object/Book.dart';
import '../object/Review.dart';
import '../object/User.dart';



class Model {
  static Model sharedInstance = Model();

  final RestManager _restManager = RestManager();

  Future<User> login(String email, String password) async {
    Map<String,String> params = {};
    params['email'] = email;
    params['password'] = sha256.convert(utf8.encode(password)).toString();
    try {
      return User.fromJson(jsonDecode(await _restManager.makePostRequest(Constants.ADDRESS_STORE_SERVER, Constants.REQUEST_LOGIN, params, type: TypeHeader.urlencoded)));
    }
    catch(e){
      print(e);
      return null;
    }
  }

  Future<User> signup(User user) async {
    try {
      return User.fromJson(jsonDecode(await _restManager.makePostRequest(Constants.ADDRESS_STORE_SERVER, Constants.REQUEST_SIGNUP, user)));
    }
    catch(e){
      print(e);
      return null;
    }
  }

  Future<List<Book>> searchBookByName({String name=""}) async {
    Map<String, String> params = {};
    params["name"] = name;
    try {
      return List<Book>.from(json.decode(await _restManager.makeGetRequest(Constants.ADDRESS_STORE_SERVER, Constants.REQUEST_SEARCH_BOOK, params)).map((i) => Book.fromJson(i)).toList());
    }
    catch (e) {
      print(e);
      return null; // not the best solution
    }
  }

  Future<List<Book>> searchBookByAuthorsIn({List<String> authors = const <String>[]}) async {
    try {
      return List<Book>.from(json.decode(await _restManager.makePostRequest(Constants.ADDRESS_STORE_SERVER, Constants.REQUEST_SEARCH_BOOK_BY_AUTHORS, authors)).map((i) => Book.fromJson(i)).toList());
    }
    catch (e) {
      print(e);
      return null; // not the best solution
    }
  }

  Future<List<Book>> searchBookByAge({List<String> ages}) async {
    try {
      return List<Book>.from(json.decode(await _restManager.makePostRequest(Constants.ADDRESS_STORE_SERVER, Constants.REQUEST_SEARCH_BOOK_BY_AGE, ages)).map((i) => Book.fromJson(i)).toList());
    }
    catch (e) {
      print(e);
      return null; // not the best solution
    }
  }


  Future<List<Book>> searchBookByGenresIn({List<String> genres = const <String>[]}) async {
    try {
      return List<Book>.from(json.decode(await _restManager.makePostRequest(Constants.ADDRESS_STORE_SERVER, Constants.REQUEST_SEARCH_BOOK_BY_GENRES, genres)).map((i) => Book.fromJson(i)).toList());
    }
    catch (e) {
      print(e);
      return null; // not the best solution
    }
  }

  Future<Response> saveReview(Review review, List<PlatformFile> files) async {
    return await _restManager.makePostMultiPartRequest(Constants.ADDRESS_STORE_SERVER, Constants.REQUEST_SEARCH_REVIEW_SAVE, review, files);
  }

  Future<List<Review>> searchReviews({Book book, User user, int starNumber=-1, String keyword=""}) async {
    try {
      // /own
      if(user!=null){
        Map<String,String> params = {};
        params['idUser'] = user.id.toString();
        params['idBook'] = book.id.toString();
        return List<Review>.from(jsonDecode(await _restManager.makePostRequest(Constants.ADDRESS_STORE_SERVER, Constants.REQUEST_SEARCH_REVIEW_OWN, params, type: TypeHeader.urlencoded)).map((i) => Review.fromJson(i)).toList());
      }
      // /all
      if(starNumber==-1 && keyword==""){
        return List<Review>.from(jsonDecode(await _restManager.makePostRequest(Constants.ADDRESS_STORE_SERVER, Constants.REQUEST_SEARCH_REVIEW_ALL, book)).map((i) => Review.fromJson(i)).toList());
      }

      // /keyword
      if(starNumber==-1 && keyword!=""){
        Map<String,String> params = {};
        params['keyword'] = keyword;
        return List<Review>.from(jsonDecode(await _restManager.makePostRequest(Constants.ADDRESS_STORE_SERVER, Constants.REQUEST_SEARCH_REVIEW_KEYWORD, book, param: params)).map((i) => Review.fromJson(i)).toList());
      }

      // /star
      if(starNumber!=-1 && keyword==""){
        Map<String,String> params = {};
        params['starNumber'] = starNumber.toString();
        return List<Review>.from(jsonDecode(await _restManager.makePostRequest(Constants.ADDRESS_STORE_SERVER, Constants.REQUEST_SEARCH_REVIEW_STAR, book, param: params)).map((i) => Review.fromJson(i)).toList());
      }

      // /star_keyword
      Map<String,String> params = {};
      params['starNumber'] = starNumber as String;
      params['keyword'] = keyword;
      return List<Review>.from(jsonDecode(await _restManager.makePostRequest(Constants.ADDRESS_STORE_SERVER, Constants.REQUEST_SEARCH_REVIEW_STAR_KEYWORD, book, param: params)).map((i) => Review.fromJson(i)).toList());

    } catch(e){
      print(e);
      return null;
    }
  }

}
