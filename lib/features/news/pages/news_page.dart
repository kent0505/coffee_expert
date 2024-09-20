import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/config/router.dart';
import '../../../core/widgets/buttons/primary_button.dart';
import '../../../core/widgets/custom_appbar.dart';
import '../../../core/widgets/custom_scaffold.dart';
import '../../../core/widgets/no_data.dart';
import '../bloc/news_bloc.dart';
import '../widgets/news_card.dart';

class NewsPage extends StatelessWidget {
  const NewsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: Stack(
        children: [
          Column(
            children: [
              const CustomAppbar(title: 'News'),
              Expanded(
                child: BlocBuilder<NewsBloc, NewsState>(
                  builder: (context, state) {
                    if (state is NewsLoadedState) {
                      if (state.news.isEmpty) return const NoData();

                      return ListView(
                        padding: const EdgeInsets.symmetric(horizontal: 24),
                        children: [
                          const SizedBox(height: 12),
                          ...List.generate(
                            state.news.length,
                            (index) {
                              return NewsCard(
                                news: state.news[index],
                              );
                            },
                          )
                        ],
                      );
                    }

                    return Container();
                  },
                ),
              ),
            ],
          ),
          PrimaryButton(
            title: 'Add News',
            bottom: true,
            add: true,
            onPressed: () {
              context.push(Routes.newsAdd);
            },
          ),
        ],
      ),
    );
  }
}
