import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:mini_store/Core/models/product_model/product_model/product_model.dart';
import 'package:mini_store/Core/widgets/custom_loading.dart';
import 'package:mini_store/Core/widgets/custom_text_field.dart';
import 'package:mini_store/Features/home/presentation/manager/update_product_cubit/update_product_cubit.dart';
import 'package:mini_store/Features/home/presentation/widgets/custom_buttom.dart';

class UpdateProductViewBody extends StatefulWidget {
  const UpdateProductViewBody({super.key, required this.product});
  final ProductModel product;

  @override
  State<UpdateProductViewBody> createState() => _UpdateProductViewBodyState();
}

class _UpdateProductViewBodyState extends State<UpdateProductViewBody> {
  late String _title;
  late String _description;
  late double _price;
  late String _image;

  @override
  void initState() {
    super.initState();
    _initializeFields();
  }

  void _initializeFields() {
    _title = widget.product.title ?? '';
    _description = widget.product.description ?? '';
    _price = widget.product.price ?? 0;
    _image = widget.product.image ?? '';
  }

  void _onUpdatePressed(BuildContext context) async {
    await BlocProvider.of<UpdateProductCubit>(context).updateProduct(
      id: widget.product.id.toString(),
      title: _title,
      price: _price,
      description: _description,
      image: _image,
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UpdateProductCubit, UpdateProductState>(
      listener: (context, state) {
        if (state is UpdateProductLoaded) {
          GoRouter.of(context).pop(state.product);
        } else if (state is UpdateProductFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: Colors.red,
              content: Text(state.message),
            ),
          );
        }
      },
      builder: (context, state) {
        if (state is UpdateProductLoading) {
          return const CustomLoading();
        }

        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 200),
                _buildTitleField(),
                const SizedBox(height: 12),
                _buildDescriptionField(),
                const SizedBox(height: 12),
                _buildPriceField(),
                const SizedBox(height: 12),
                _buildImageField(),
                const SizedBox(height: 60),
                _buildUpdateButton(context),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildTitleField() {
    return CustomTextField(
      text: 'Product Name',
      onChanged: (data) => _title = data,
    );
  }

  Widget _buildDescriptionField() {
    return CustomTextField(
      text: 'Description',
      onChanged: (data) => _description = data,
    );
  }

  Widget _buildPriceField() {
    return CustomTextField(
      text: 'Price',
      textInputType: TextInputType.number,
      onChanged: (data) => _price = double.tryParse(data) ?? _price,
    );
  }

  Widget _buildImageField() {
    return CustomTextField(
      text: 'Image',
      onChanged: (data) => _image = data,
    );
  }

  Widget _buildUpdateButton(BuildContext context) {
    return CustomButtom(
      text: 'Update',
      onTap: () => _onUpdatePressed(context),
    );
  }
}