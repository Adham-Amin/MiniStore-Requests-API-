import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mini_store/Core/widgets/custom_error.dart';
import 'package:mini_store/Core/widgets/custom_loading.dart';
import 'package:mini_store/Features/home/presentation/manager/all_product_cubit/cubit/all_product_cubit.dart';
import 'package:mini_store/Features/home/presentation/widgets/custom_card.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 80, left: 16, right: 16),
      child: BlocBuilder<AllProductCubit, AllProductState>(
        builder: (context, state) {
          if (state is AllProductLoaded) {
            return GridView.builder(
            itemCount: state.products.length,
            clipBehavior: Clip.none,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              childAspectRatio: 1.4,
              crossAxisSpacing: 12,
              mainAxisSpacing: 80,
              crossAxisCount: 2,
            ),
            itemBuilder: (context, index) => CustomCard(product: state.products[index],),
          );
          } else if (state is AllProductFailure) {
            return CustomError(title: state.message);
          } else {
            return const CustomLoading();
          }
        },
      ),
    );
  }
}
