import 'package:flutter/material.dart';
import 'package:mini_store/Core/widgets/custom_text_field.dart';
import 'package:mini_store/Features/home/presentation/widgets/custom_buttom.dart';

class UpdateProductViewBody extends StatelessWidget {
  const UpdateProductViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: SingleChildScrollView(
        child: Column(
          children: [
             SizedBox(
              height: 200,
            ),
            CustomTextField(
              text: 'Product Name',
              onChanged: (data) {},
            ),
            const SizedBox(
              height: 12,
            ),
            CustomTextField(
                text: 'Description',
                onChanged: (data) {},),
            const SizedBox(
              height: 12,
            ),
            CustomTextField(
                text: 'Price',
                textInputType: TextInputType.number,
                onChanged: (data) {},),
            SizedBox(
              height: 12,
            ),
            CustomTextField(
              text: 'Image',
              onChanged: (data) {},
            ),
            SizedBox(
              height: 60,
            ),
            CustomButtom(
              text: 'Update',
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
