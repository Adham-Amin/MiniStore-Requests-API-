import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mini_store/Core/models/product_model/product_model/product_model.dart';
import 'package:mini_store/Core/utils/app_colors.dart';
import 'package:mini_store/Core/utils/app_routers.dart';
import 'package:mini_store/Core/utils/app_styles.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({
    super.key,
    required this.product,
  });

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _navigateToUpdateView(context),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          _buildCardContent(),
          _buildProductImage(),
        ],
      ),
    );
  }

  void _navigateToUpdateView(BuildContext context) {
    GoRouter.of(context).push(
      AppRouters.updateProductView,
      extra: product,
    );
  }

  Widget _buildCardContent() {
    return Container(
      decoration: _buildBoxShadow(),
      child: Card(
        color: AppColors.white,
        elevation: 10,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildProductTitle(),
              const SizedBox(height: 8),
              _buildPriceAndFavoriteRow(),
            ],
          ),
        ),
      ),
    );
  }

  BoxDecoration _buildBoxShadow() {
    return BoxDecoration(
      boxShadow: [
        BoxShadow(
          offset: const Offset(10, 10),
          color: AppColors.black.withOpacity(0.05),
          blurRadius: 40,
          spreadRadius: 10,
        ),
      ],
    );
  }

  Widget _buildProductTitle() {
    return Text(
      product.title ?? 'N/A',
      style: AppStyles.textBlod18,
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
    );
  }

  Widget _buildPriceAndFavoriteRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _buildPriceText(),
        _buildFavoriteIcon(),
      ],
    );
  }

  Widget _buildPriceText() {
    return Text(
      '\$${product.price?.toStringAsFixed(2) ?? '0.00'}',
      style: AppStyles.textMedium16,
    );
  }

  Widget _buildFavoriteIcon() {
    return const Icon(
      Icons.favorite,
      color: Colors.red,
    );
  }

  Widget _buildProductImage() {
    return Positioned(
      top: -50,
      right: 40,
      child: CachedNetworkImage(
        width: 100,
        height: 100,
        imageUrl: product.image ?? '',
        placeholder: (context, url) => const CircularProgressIndicator(),
        errorWidget: (context, url, error) => const Icon(Icons.error),
        fit: BoxFit.contain,
      ),
    );
  }
}