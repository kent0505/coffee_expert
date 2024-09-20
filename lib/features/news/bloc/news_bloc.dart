import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/db/db.dart';
import '../../../core/models/news.dart';

part 'news_event.dart';
part 'news_state.dart';

class NewsBloc extends Bloc<NewsEvent, NewsState> {
  NewsBloc() : super(NewsInitial()) {
    on<GetNewsEvent>((event, emit) async {
      if (DB.newsList.isEmpty) {
        await getNews();
        emit(NewsLoadedState(news: DB.newsList));
      } else {
        emit(NewsLoadedState(news: DB.newsList));
      }
    });

    on<AddNewsEvent>((event, emit) async {
      DB.newsList.add(event.news);
      await updateNews();
      emit(NewsLoadedState(news: DB.newsList));
    });

    on<EditNewsEvent>((event, emit) async {
      for (News news in DB.newsList) {
        if (news.id == event.news.id) {
          news.title = event.news.title;
          news.content = event.news.content;
          news.image = event.news.image;
        }
      }
      await updateNews();
      emit(NewsLoadedState(news: DB.newsList));
    });

    on<DeleteNewsEvent>((event, emit) async {
      DB.newsList.removeWhere((element) => element.id == event.id);
      await updateNews();
      emit(NewsLoadedState(news: DB.newsList));
    });
  }
}
