import 'package:flutter/rendering.dart';

class Blog{
  String name;
  String blogContent;
  String createdAt;
  
  Blog({this.name, this.blogContent, this.createdAt});

  Map<String, dynamic> toMap(){
    return {
      'name': name,
      'blogContent' : blogContent,
      'createdAt': createdAt
    };
  }

  @override
  String toString() {
    // TODO: implement toString
    return 'Blog : @author: $name \n @feelings: $blogContent \n @created At: $createdAt';
  }


}