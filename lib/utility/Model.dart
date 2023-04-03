import 'dart:async';
import 'dart:convert';
import 'package:frontend_sdcc_flutter/utility/Constants.dart';
import 'package:frontend_sdcc_flutter/utility/RestManager.dart';
import 'package:hash_password/password_hasher.dart';
import 'package:crypto/crypto.dart';
import '../object/Book.dart';
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

}
