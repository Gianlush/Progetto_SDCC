class Constants{
  static const String REALM = "myRealm";
  static const String TITLE_APP = "MyLibrary";
  static const String CLIENT_ID = "MyLibrary";

  static const String CLIENT_ID_MASTER = "admin-cli";
  static const String USERNAME_MASTER = "gianluca";
  static const String PASSWORD_MASTER = "massara";

  static const String REQUEST_LOGIN_MASTER="/auth/realms/master/protocol/openid-connect/token";
  static const String REQUEST_LOGOUT_MASTER="/auth/realms/master/protocol/openid-connect/logout";


  static const String ADDRESS_AUTHENTICATION_SERVER = "localhost:8080";
  static const String ADDRESS_STORE_SERVER = "localhost:8081";

  static const String REQUEST_LOGIN = "/user/login";
  static const String REQUEST_SIGNUP = "/user/register";

  static const String REQUEST_SEARCH_BOOK = "/books";
  static const String REQUEST_SEARCH_BOOK_BY_AUTHORS = "/books/authors";
  static const String REQUEST_SEARCH_BOOK_BY_GENRES = "/books/genres";
  static const String REQUEST_SEARCH_BOOK_BY_AGE = "/books/age";
  static const String REQUEST_SEARCH_BY_GENRE = "/games/genre";
  static const String REQUEST_ADD_USER = "/users";
  static const String REQUEST_USER_BY_EMAIL = "/users/email";
  static const String REQUEST_GET_OR_CREATE_ORDER = "/orders";
  static const String REQUEST_SEARCH_REVIEW_OWN = "/reviews/own";
  static const String REQUEST_SEARCH_REVIEW_ALL = "/reviews/all";
  static const String REQUEST_SEARCH_REVIEW_KEYWORD = "/reviews/keyword";
  static const String REQUEST_SEARCH_REVIEW_STAR = "/reviews/star";
  static const String REQUEST_SEARCH_REVIEW_STAR_KEYWORD = "/reviews/star_keyword";
  static const String REQUEST_SEARCH_REVIEW_SAVE = "/reviews/save";



  static const String RESPONSE_ERROR_MAIL_ALREADY_EXIST ="ERROR_MAIL_ALREADY_EXIST";

}