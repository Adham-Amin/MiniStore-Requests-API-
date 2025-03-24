import 'package:flutter/material.dart';
import 'package:mini_store/Core/utils/app_routers.dart';

void main() {
  runApp(const MiniStore());
}
class MiniStore extends StatelessWidget {
  const MiniStore({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: AppRouters.router,
    );
  }
}