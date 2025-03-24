import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mini_store/Core/utils/app_colors.dart';
import 'package:mini_store/Core/utils/app_routers.dart';
import 'package:mini_store/Core/utils/app_styles.dart';

class CustomCategoryItem extends StatelessWidget {
  const CustomCategoryItem({
    super.key,
    required this.category,
  });
  final String category;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () =>
          GoRouter.of(context).push(AppRouters.categoryView, extra: category),
      child: Container(
        width: double.infinity,
        height: 60,
        decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.circular(12),
        ),
        margin: const EdgeInsets.only(bottom: 12),
        alignment: Alignment.center,
        child: Text(
          category,
          style: AppStyles.textBlod18.copyWith(color: AppColors.white),
        ),
      ),
    );
  }
}
