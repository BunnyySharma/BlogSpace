import 'package:subspaceass/models/blog.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/favblog.dart';

class Apiuse{
  Future<List<Blog>> fetchBlogs(BuildContext context) async {
    final String url = 'https://intent-kit-16.hasura.app/api/rest/blogs';
    final String adminSecret = '32qR4KmXOIpsGPQKMqEJHGJS27G5s7HdSKO3gdtQd2kv5e852SiYwWNfxkZOBuQ6';

    try {
      final response = await http.get(Uri.parse(url), headers: {
        'x-hasura-admin-secret': adminSecret,
      });

      if (response.statusCode == 200) {
        // Request successful, handle the response data here
        final jsondata = jsonDecode(response.body);
        final List<dynamic> jsonblogs = jsondata['blogs'];
        final List<Blog> blogslist = List<Blog>.from(jsonblogs.map((blog) {
          return Blog(
              id: blog['id'], image: blog["image_url"], title: blog['title']);
        }));
        final favModel = Provider.of<Favblogmodel>(context, listen: false);
        favModel.setBlogs(blogslist);
        return blogslist;
      } else {
        // Request failed

        print('Request failed with status code: ${response.statusCode}');
        print('Response data: ${response.body}');
        return [];
      }
    } catch (e) {
      // Handle any errors that occurred during the request
      print('Error: $e');
      return [];
    }
  }
}


