import 'package:flutter/foundation.dart';
import 'blog.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Favblogmodel extends ChangeNotifier{
  List<Blog> _blogs = [];
  List<Blog> _favoriteBlogs = [];
  List<Blog> get favoriteBlogs => _favoriteBlogs;
  List<Blog> get blogs => _blogs;

  void setBlogs(List<Blog> blogs) {
    _blogs = blogs;
    notifyListeners();
  }

  void addToFavorites(Blog blog, int index) {
    _blogs[index].isfav = true;
    blog.isfav = true;
    _favoriteBlogs.add(blog);
    notifyListeners();
  }

  void removeFromFavorites(Blog blog, int index) {
    _blogs[index].isfav = false;
    blog.isfav = false;
    _favoriteBlogs.remove(blog);
    notifyListeners();
  }
}