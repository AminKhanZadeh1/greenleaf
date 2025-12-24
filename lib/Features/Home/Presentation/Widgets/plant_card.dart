import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:greenleaf/Config/Theme/Colors/app_colors.dart';
import 'package:greenleaf/Features/Cart/Domain/Entity/cart_product.dart';
import 'package:greenleaf/Features/Cart/Presentation/Bloc/cart_bloc.dart';

import '../../../Favorites/Presentation/Cubit/favorites_cubit.dart';

class PlantCard extends StatelessWidget {
  final String id;
  final String name;
  final double price;
  final String image;
  final double? containerHeight;

  const PlantCard({
    super.key,
    required this.id,
    required this.name,
    required this.price,
    required this.image,
    this.containerHeight,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        height: containerHeight,
        width: 160,
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.grey.shade100,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Stack(
          children: [
            Align(
              alignment: Alignment.topRight,
              child: CircleAvatar(
                radius: 16,
                backgroundColor: Colors.white,
                child: GestureDetector(
                  onTap: () => context.read<FavoriteCubit>().toggle(id),
                  child: BlocBuilder<FavoriteCubit, Set<String>>(
                    builder: (context, state) {
                      final isFavorite = state.contains(id);

                      return SizedBox(
                        height: 20,
                        width: 20,
                        child: SvgPicture.asset(
                          'assets/icons/heart.svg',
                          colorFilter: ColorFilter.mode(
                            isFavorite ? Colors.red : Colors.black,
                            BlendMode.srcIn,
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Spacer(),
                Center(
                  child: ConstrainedBox(
                    constraints: BoxConstraints(maxHeight: 100, minHeight: 60),
                    child: CachedNetworkImage(
                      imageUrl: image,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 13,
                        color: AppColors.charcoalBlack,
                      ),
                    ),
                  ],
                ),

                Center(
                  child: Row(
                    children: [
                      Text(
                        '\$$price',
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: AppColors.charcoalBlack,
                        ),
                      ),

                      BlocBuilder<CartBloc, CartState>(
                        builder: (context, state) {
                          CartProduct? cartItem;

                          if (state is GetCartItemsSuccessState) {
                            final foundItems = state.items.where(
                              (item) => item.id == id,
                            );
                            if (foundItems.isNotEmpty) {
                              cartItem = foundItems.first;
                            }
                          }

                          return SizedBox(
                            height: 30,
                            width: 75,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                AnimatedSwitcher(
                                  duration: const Duration(milliseconds: 300),
                                  transitionBuilder: (child, animation) {
                                    return FadeTransition(
                                      opacity: animation,
                                      child: SizeTransition(
                                        sizeFactor: animation,
                                        axis: Axis.horizontal,
                                        child: child,
                                      ),
                                    );
                                  },
                                  child:
                                      (cartItem == null ||
                                          cartItem.quantity == 0)
                                      ? Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            GestureDetector(
                                              key: const ValueKey('add_button'),
                                              onTap: () {
                                                context.read<CartBloc>().add(
                                                  AddToCartEvent(
                                                    CartProduct(
                                                      id: id,
                                                      name: name,
                                                      imageUrl: image,
                                                      price: price,
                                                    ),
                                                  ),
                                                );
                                              },
                                              child: SizedBox(
                                                height: 30,
                                                width: 30,
                                                child: SvgPicture.asset(
                                                  "assets/icons/add.svg",
                                                ),
                                              ),
                                            ),
                                          ],
                                        )
                                      : SizedBox(
                                          width: 65,
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            key: const ValueKey('cart_row'),
                                            children: [
                                              Center(
                                                child: GestureDetector(
                                                  onTap: () {
                                                    context
                                                        .read<CartBloc>()
                                                        .add(
                                                          RemoveFromCartEvent(
                                                            id: id,
                                                          ),
                                                        );
                                                  },
                                                  child: Center(
                                                    child: const SizedBox(
                                                      height: 20,
                                                      width: 20,
                                                      child: Icon(
                                                        Icons.delete,
                                                        color: Colors.red,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Center(
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                        left: 4.0,
                                                      ),
                                                  child: Text(
                                                    cartItem.quantity
                                                        .toString(),
                                                    style: const TextStyle(
                                                      fontSize: 17,
                                                      color: AppColors.blue,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Center(
                                                child: GestureDetector(
                                                  onTap: () {
                                                    context
                                                        .read<CartBloc>()
                                                        .add(
                                                          AddToCartEvent(
                                                            CartProduct(
                                                              id: id,
                                                              name: name,
                                                              imageUrl: image,
                                                              price: price,
                                                            ),
                                                          ),
                                                        );
                                                  },
                                                  child: Center(
                                                    child: const SizedBox(
                                                      height: 20,
                                                      width: 20,
                                                      child: Icon(
                                                        Icons.add,
                                                        color: Colors.green,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
