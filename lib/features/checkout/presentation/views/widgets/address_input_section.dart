import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fruits_hub/core/utils/app_text_styles.dart';
import 'package:fruits_hub/core/widgets/custom_text_form_field.dart';
import 'package:fruits_hub/features/checkout/domain/entities/order_entity.dart';
import 'package:provider/provider.dart';

class AddressInputSection extends StatelessWidget {
  const AddressInputSection({
    super.key,
    required this.formKey,
    required this.valueListenable,
  });
  final GlobalKey<FormState> formKey;
  final ValueListenable<AutovalidateMode> valueListenable;

  @override
  Widget build(BuildContext context) {
    var shippingEntitiy = context.read<OrderEntity>().shippingAddressEntity;
    return ValueListenableBuilder<AutovalidateMode>(
      valueListenable: valueListenable,
      builder:
          (context, value, child) => SingleChildScrollView(
            child: Form(
              key: formKey,
              autovalidateMode: value,
              child: Column(
                children: [
                  CustomTextFormField(
                    text: 'الاسم كامل',
                    onSaved: (value) {
                      shippingEntitiy.name = value!;
                    },
                  ),
                  const SizedBox(height: 8),
                  CustomTextFormField(
                    text: 'البريد الإلكتروني',
                    onSaved: (value) {
                      shippingEntitiy.email = value!;
                    },
                  ),
                  const SizedBox(height: 8),
                  CustomTextFormField(
                    text: 'العنوان',
                    onSaved: (value) {
                      shippingEntitiy.address = value!;
                    },
                  ),
                  const SizedBox(height: 8),
                  CustomTextFormField(
                    text: 'المدينه',
                    onSaved: (value) {
                      shippingEntitiy.city = value!;
                    },
                  ),
                  const SizedBox(height: 8),
                  CustomTextFormField(
                    text: 'رقم الطابق , رقم الشقه ..',
                    onSaved: (value) {
                      shippingEntitiy.floor = value!;
                    },
                  ),
                  const SizedBox(height: 8),
                  CustomTextFormField(
                    text: 'رقم الهاتف',
                    onSaved: (value) {
                      shippingEntitiy.phone = value!;
                    },
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      SizedBox(
                        width: 50,
                        height: 25,
                        child: FittedBox(
                          child: Switch(value: true, onChanged: (value) {}),
                        ),
                      ),
                      Text(
                        'حفظ العنوان',
                        style: AppTextStyles.semiBold13.copyWith(
                          color: const Color(0xFF949D9E),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
    );
  }
}
