import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mini_store/Core/utils/app_routers.dart';
import 'package:mini_store/Core/utils/app_styles.dart';
import 'package:mini_store/Features/home/presentation/widgets/home_view_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Store', style: AppStyles.textBold24,),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.category_outlined),
            onPressed: () {
              GoRouter.of(context).push(AppRouters.categoryView);
            },
          ),
        ],
      ),
      body: HomeViewBody(),
    );
  }
}