import 'package:flutter/material.dart';
import 'package:sports_news/utils/colors.dart';
import 'package:sports_news/utils/constants.dart';

import '../backend/functions.dart';
import '../components/appbar.dart';
import '../components/newsbox.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late Future<List> news;

  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColors.black,
      appBar: appbar(),
      body: Column(
        children: [
          const SearchBar(),
          Expanded(
            child: Container(
              width: w,
              child: FutureBuilder<List>(
                future: fetchnews(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                        return NewsBox(
                          url: snapshot.data![index]['url'],
                          imageurl: snapshot.data![index]['urlToImage'] ??
                              Constants.imageurl,
                          title: snapshot.data![index]['title'],
                          time: snapshot.data![index]['publishedAt'],
                          description:
                              snapshot.data![index]['description'].toString(),
                        );
                      },
                    );
                  } else if (snapshot.hasError) {
                    return Text("${snapshot.error}");
                  }

                  return Center(
                    child: CircularProgressIndicator(
                      color: AppColors.primary,
                    ),
                  );
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
