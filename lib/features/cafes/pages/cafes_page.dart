import 'package:coffee_expert/core/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/config/router.dart';
import '../../../core/widgets/buttons/primary_button.dart';
import '../../../core/widgets/custom_appbar.dart';
import '../../../core/widgets/custom_scaffold.dart';
import '../../../core/widgets/no_data.dart';
import '../bloc/cafes_bloc.dart';
import '../widgets/cafe_card.dart';

class CafesPage extends StatelessWidget {
  const CafesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: Stack(
        children: [
          Column(
            children: [
              const CustomAppbar(title: 'Popular Cafes'),
              Expanded(
                child: BlocBuilder<CafesBloc, CafesState>(
                  builder: (context, state) {
                    if (state is CafesLoadedState) {
                      if (state.cafes.isEmpty) return const NoData();

                      return GridView.count(
                        crossAxisCount: 2,
                        childAspectRatio: getWidth(context) > 500 ? 1.8 : 0.8,
                        crossAxisSpacing: 14,
                        mainAxisSpacing: 14,
                        padding: const EdgeInsets.only(
                          left: 24,
                          right: 24,
                          top: 12,
                          bottom: 70 + 56 + 24,
                        ),
                        children: [
                          ...List.generate(
                            state.cafes.length,
                            (index) {
                              return CafeCard(
                                cafe: state.cafes[index],
                              );
                            },
                          ),
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
            title: 'Add New Cafe',
            bottom: true,
            add: true,
            onPressed: () {
              context.push(Routes.cafeAdd);
            },
          ),
        ],
      ),
    );
  }
}
