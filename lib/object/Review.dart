import 'Book.dart';
import 'User.dart';

class Review {
  int id;
  Book book;
  User user;
  String comment;
  int starNumber;
  String images;
  String title;

  Review({this.id, this.book, this.user, this.comment, this.starNumber, this.title, this.images});

  factory Review.fromJson(Map<String, dynamic> json) {
    return Review(
      id: json['id'],
      book: Book.fromJson(json['book']),
      user: User.fromJson(json['user']),
      comment: json['comment'],
      starNumber: json['star_number'],
      images: json['images'],
      title: json['title']
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'book': book,
    'user': user,
    'star_number': starNumber,
    'images':images,
    'title':title,
    'comment':comment
  };

  @override
  String toString() {
    return "ID:" +id.toString() +" Author:"+user.toString()+" Book:"+book.name;
  }

  bool equals(Review review){
    return (user.id==user.id && book.id==book.id);
  }

}