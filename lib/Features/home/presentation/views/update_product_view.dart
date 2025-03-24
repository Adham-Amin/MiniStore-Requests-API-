import 'package:flutter/material.dart';
import 'package:mini_store/Core/utils/app_styles.dart';
import 'package:mini_store/Features/home/presentation/widgets/update_product_view_body.dart';

class UpdateProductView extends StatelessWidget {
  const UpdateProductView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Update Product', style: AppStyles.textBold24,),
        centerTitle: true,
      ),
      body: UpdateProductViewBody(),
    );
  }
}