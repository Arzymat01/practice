import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as htpp;

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final scrollController = ScrollController();
  List posts = [];
  int page = 1;
  bool isLoading = false;
  @override
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchPosts();
    scrollController.addListener(_scrollistener);
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: ListView.builder(
        controller: scrollController,
        padding: const EdgeInsets.all(12),
        itemCount: isLoading ? posts.length + 1 : posts.length,
        itemBuilder: (context, index) {
          if (index < posts.length) {
            final post = posts[index];
            final title = post['title']['rendered'];
            final description = post['seoDescription'];
            return Card(
              child: ListTile(
                leading: CircleAvatar(child: Text('${index = index}')),
                title: Text(
                  '$title',
                  maxLines: 1,
                ),
                subtitle: Text(
                  '$description',
                  maxLines: 2,
                ),
              ),
            );
          } else {
            return Center(
              child: SizedBox(
                child: CircularProgressIndicator(),
                height: 70,
                width: 70,
              ),
            );
          }
        },
      ),
    );
  }

  Future<void> fetchPosts() async {
    final url =
        'https://techcrunch.com/wp-json/wp/v2/posts?context=embed&per_page=10&page=$page';
    final uri = Uri.parse(url);
    final response = await htpp.get(uri);
    if (response.statusCode == 200) {
      final json = jsonDecode(response.body) as List;
      setState(() {
        posts = json + posts;
      });
    } else {
      print('Не ожидано');
    }
  }

  Future<void> _scrollistener() async {
    if (scrollController.position.pixels ==
        scrollController.position.maxScrollExtent) {
      print('call');
      setState(() {
        isLoading = true;
      });
      page = page + 1;
      await fetchPosts();
      setState(() {
        isLoading = false;
      });
    }
  }
}
