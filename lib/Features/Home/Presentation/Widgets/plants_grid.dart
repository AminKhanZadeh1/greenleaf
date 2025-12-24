import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:greenleaf/Features/Cart/Presentation/Bloc/cart_bloc.dart';

import '../Bloc/home_bloc.dart';
import 'plant_card.dart';

class PlantsGrid extends StatefulWidget {
  final TextEditingController controller;
  const PlantsGrid({super.key, required this.controller});

  @override
  State<PlantsGrid> createState() => _PlantsGridState();
}

class _PlantsGridState extends State<PlantsGrid> {
  @override
  void initState() {
    super.initState();
    // Load cart
    context.read<CartBloc>().add(GetCartItemsEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
      listener: (context, state) {
        if (state is FetchItemsFailedState) {}
      },
      builder: (context, state) {
        if (state is FetchItemsSuccessState) {
          final plants = state.plants;

          final query = widget.controller.text.toLowerCase();

          final manualOrder = [3, 1, 4, 0, 2, 5];
          final orderedPlants = manualOrder.map((i) => plants[i]).toList();

          final filteredPlants = orderedPlants.where((plant) {
            return plant.name.toLowerCase().contains(query);
          }).toList();

          final customHeights = {1: 230.0, 2: 220.0};
          const defaultHeight = 185.0;

          return Expanded(
            child: ScrollConfiguration(
              behavior: const ScrollBehavior().copyWith(scrollbars: false),
              child: MasonryGridView.count(
                crossAxisCount: 2,
                mainAxisSpacing: 16,
                crossAxisSpacing: 16,
                itemCount: filteredPlants.length,
                itemBuilder: (context, i) {
                  final plant = filteredPlants[i];
                  final height = customHeights[i] ?? defaultHeight;

                  return PlantCard(
                    containerHeight: height,
                    id: plant.id,
                    name: plant.name,
                    price: plant.price,
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
