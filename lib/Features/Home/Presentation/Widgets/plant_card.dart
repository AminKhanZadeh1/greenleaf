import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:greenleaf/Features/Cart/Domain/Entity/cart_product.dart';
import 'package:greenleaf/Features/Cart/Presentation/Bloc/cart_bloc.dart';

class PlantCard extends StatelessWidget {
  final String id;
  final String name;
  final String price;
  final String image;

  const PlantCard({
    super.key,
    required this.id,
    required this.name,
    required this.price,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Heart icon
          Align(
            alignment: Alignment.topRight,
            child: CircleAvatar(
              radius: 16,
              backgroundColor: Colors.white,
              child: SizedBox(
                height: 20,
                width: 20,
                child: SvgPicture.asset('assets/icons/heart.svg'),
              ),
            ),
          ),

          // Plant image
          Expanded(
            child: Center(child: Image.network(image, fit: BoxFit.contain)),
          ),

          // Plant name
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Text(
              name,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(height: 4),

          // Price and Cart action
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(price, style: const TextStyle(fontSize: 16)),

                // BlocBuilder for Cart
                BlocBuilder<CartBloc, CartState>(
                  builder: (context, state) {
                    // if (state is GetCartItemsSuccessState) {
                    //   final cartItem = state.items.firstWhere(
                    //     (item) => item.id == id,
                    //     orElse: () => CartProduct(
                    //       id: '',
                    //       name: '',
                    //       price: 0,
                    //       imageUrl: '',
                    //       quantity: 0,
                    //     ),
                    //   );

                    return Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            context.read<CartBloc>().add(
                              RemoveFromCartEvent(id: id),
                            );
                          },
                          child: const SizedBox(
                            height: 24,
                            width: 24,
                            child: Icon(Icons.delete, color: Colors.red),
                          ),
                        ),
                        const SizedBox(width: 8),
                        // Text(
                        //   cartItem.quantity.toString(),
                        //   style: const TextStyle(fontWeight: FontWeight.bold),
                        // ),
                        GestureDetector(
                          onTap: () {
                            context.read<CartBloc>().add(
                              AddToCartEvent(
                                CartProduct(
                                  id: id,
                                  name: name,
                                  imageUrl: image,
                                  quantity: 1,
                                  price: double.parse(
                                    price.replaceAll('\$', '').trim(),
                                  ),
                                ),
                              ),
                            );
                            context.read<CartBloc>().add(GetCartItemsEvent());
                          },
                          child: SizedBox(
                            height: 30,
                            width: 30,
                            child: SvgPicture.asset("assets/icons/add.svg"),
                          ),
                        ),
                      ],
                    );
                  },

                  // },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
