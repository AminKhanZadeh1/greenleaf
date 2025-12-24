import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:greenleaf/Config/Theme/Colors/app_colors.dart';
// import 'package:greenleaf/Features/Cart/Presentation/Bloc/cart_bloc.dart';
import 'package:greenleaf/Features/Home/Presentation/Bloc/home_bloc.dart';
import 'package:greenleaf/Features/Home/Presentation/Widgets/plants_grid.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    context.read<HomeBloc>().add(GetItemsEvent());
  }

  final TextEditingController _controller = TextEditingController();
  final FocusNode _focusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 50),
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Welcome to',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Row(
                      children: [
                        SvgPicture.asset("assets/icons/heart.svg"),
                        SizedBox(width: 16),
                        SvgPicture.asset("assets/icons/cart.svg"),
                      ],
                    ),
                  ],
                ),
              ),
              Text(
                'GreenLeaf',
                style: TextStyle(
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                  color: AppColors.success,
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: 45,
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        decoration: BoxDecoration(
                          color: Colors.grey.shade200,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: TextField(
                          focusNode: _focusNode,
                          onChanged: (query) {
                            // به دلیل منجر شدن به تغییر بنیادی صفحات از پیاده سازی دسته بندی محصولات خودداری کردم
                            setState(
                              () {},
                            ); // با علم بر اینکه بهتر است از مدیریت وضعیت درست استفاده شود... راه حل موقت
                          },
                          controller: _controller,
                          decoration: InputDecoration(
                            icon: SvgPicture.asset('assets/icons/search.svg'),
                            hintText: 'Search',
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    SizedBox(
                      height: 45,
                      width: 45,
                      child: SvgPicture.asset("assets/icons/settings.svg"),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              PlantsGrid(controller: _controller),
            ],
          ),
        ),
      ),
    );
  }
}
