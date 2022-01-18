import 'package:flutter/material.dart';
import 'package:uas_19710091_newsapp/components/customListTile.dart';
import 'package:uas_19710091_newsapp/model/article_model.dart';
import 'package:uas_19710091_newsapp/services/api_service.dart';
import 'package:uas_19710091_newsapp/splash.dart';
import 'package:uas_19710091_newsapp/pages/news.dart';

class OtoNews extends StatefulWidget {
  @override
  _OtoNewsState createState() => _OtoNewsState();
}

class _OtoNewsState extends State<OtoNews> {
  ApiServiceOtomotive client = ApiServiceOtomotive();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("OTOMOTIVE", style: TextStyle(color: Colors.black)),
          backgroundColor: Colors.white),
      body: FutureBuilder(
        future: client.getArticle(),
        builder: (BuildContext context, AsyncSnapshot<List<Article>> snapshot) {
          if (snapshot.hasData) {
            List<Article> articles = snapshot.data;
            return ListView.builder(
                itemCount: articles.length,
                itemBuilder: (context, index) =>
                    customListTile(articles[index], context));
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}

class SportNews extends StatefulWidget {
  @override
  _SportNewsState createState() => _SportNewsState();
}

class _SportNewsState extends State<SportNews> {
  ApiServiceSport client = ApiServiceSport();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("SPORTS", style: TextStyle(color: Colors.black)),
          backgroundColor: Colors.white),
      body: FutureBuilder(
        future: client.getArticle(),
        builder: (BuildContext context, AsyncSnapshot<List<Article>> snapshot) {
          if (snapshot.hasData) {
            List<Article> articles = snapshot.data;
            return ListView.builder(
                itemCount: articles.length,
                itemBuilder: (context, index) =>
                    customListTile(articles[index], context));
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
