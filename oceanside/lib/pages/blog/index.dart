import 'package:flutter/material.dart';

class MyBlog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('博客'),),
      body: Center(
        child: Text('个人的语雀知识库')
      ),
    );
  }
}