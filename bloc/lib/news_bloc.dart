import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:bloc_tut/news_info.dart';

enum NewsAction {
  Fetch,
  Delete,
}

class NewsBloc {
  int counter;
  final _stateStreamController = StreamController<List<Article>>.broadcast();
  StreamSink<List<Article>> get newsSink => _stateStreamController.sink;
  Stream<List<Article>> get newsStream => _stateStreamController.stream;

  final _eventStreamController = StreamController<NewsAction>.broadcast();
  StreamSink<NewsAction> get eventSink => _eventStreamController.sink;
  Stream<NewsAction> get eventStream => _eventStreamController.stream;

  NewsBloc() {
    eventStream.listen((event) async {
      if (event == NewsAction.Fetch) {
        try {
          var news = await getNews();
          if(news != null) newsSink.add(news.articles);
          else newsSink.addError('Something went wrong');
        } on Exception catch (e) {
          newsSink.addError('Something went wrong');
        }
      } else if (event == NewsAction.Delete) {}
    });
  }

  Future<NewsModel> getNews() async {
    var client = http.Client();
    var newsModel;

    try {
      var response = await client.get('http://newsapi.org/v2/everything?domains=wsj.com&apiKey=YOUR_API_KEY');
      if (response.statusCode == 200) {
        var jsonString = response.body;
        var jsonMap = json.decode(jsonString);

        newsModel = NewsModel.fromJson(jsonMap);
      }
    } catch (Exception) {
      return newsModel;
    }

    return newsModel;
  }

  void dispose() {
    _stateStreamController.close();
    _eventStreamController.close();
  }
}
