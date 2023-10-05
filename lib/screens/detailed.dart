import 'package:flutter/material.dart';
import 'package:subspaceass/models/blog.dart';

class detailed extends StatefulWidget {
  final Blog currblog;
  const detailed({super.key, required this.currblog});
  @override
  State<detailed> createState() => _detailedState(currblog: currblog);
}

class _detailedState extends State<detailed> {
  final Blog currblog;
  _detailedState({required this.currblog});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        automaticallyImplyLeading: true,
        backgroundColor: Colors.black,
      ),
      body: Column(
        children: [
          Center(
            child: Image.network(
                currblog.image,
              width: MediaQuery.of(context).size.width * 0.95,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(15),
            child: Text(
                "${currblog.title}",
              style: TextStyle(
                color: Colors.white,
                fontSize: 25
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
