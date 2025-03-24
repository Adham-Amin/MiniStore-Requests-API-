import 'package:flutter/material.dart';
import 'package:mini_store/Features/home/presentation/widgets/custom_card.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 80, left: 16, right: 16),
      child: GridView.builder(
        itemCount: 5,
        clipBehavior: Clip.none,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          childAspectRatio: 1.4,
          crossAxisSpacing: 12,
          mainAxisSpacing: 80,
          crossAxisCount: 2,
        ),
        itemBuilder: (context, index) => CustomCard(),
      ),
    );
  }
}
