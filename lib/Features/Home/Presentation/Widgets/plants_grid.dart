import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../Bloc/home_bloc.dart';
import 'plant_card.dart';

class PlantsGrid extends StatelessWidget {
  const PlantsGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
      listener: (context, state) {
        if (state is FetchItemsFailedState) {}
      },
      builder: (context, state) {
        if (state is FetchItemsSuccessState) {
          final plants = state.plants;

          return Expanded(
            child: ScrollConfiguration(
              behavior: const ScrollBehavior().copyWith(scrollbars: false),
              child: GridView.builder(
                itemCount: plants.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 16,
                  crossAxisSpacing: 16,
                  childAspectRatio: 0.75,
                ),
                itemBuilder: (context, index) {
                  final plant = plants[index];

                  return PlantCard(
                    id: plant.id,
                    name: plant.name,
                    price: '\$${plant.price}',
                    image: plant.imageUrl,
                  );
                },
              ),
            ),
          );
        } else if (state is FetchItemsLoadingState) {
          return const Center(child: CircularProgressIndicator());
        }
        return Center(child: Text("No items found!"));
      },
    );
  }
}
