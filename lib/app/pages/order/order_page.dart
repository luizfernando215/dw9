import 'dart:js';

import 'package:dw9_delivery_app/app/core/ui/styles/text_styles.dart';
import 'package:dw9_delivery_app/app/core/ui/widgets/delivery_appbar.dart';
import 'package:dw9_delivery_app/app/core/ui/widgets/order_field.dart';
import 'package:dw9_delivery_app/app/core/ui/widgets/payment_types_field.dart';
import 'package:dw9_delivery_app/app/dto/order_product_dto.dart';
import 'package:dw9_delivery_app/app/models/product_model.dart';
import 'package:dw9_delivery_app/app/pages/order/order_product_tile.dart';
import 'package:flutter/material.dart';
import 'package:validatorless/validatorless.dart';

class OrderPage extends StatelessWidget {
  const OrderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DeliveryAppbar(),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Row(
                children: [
                  Text(
                    'Carrinho',
                    style: context.textStyles.textTitle,
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Image.asset('assets/images/trashRegular.png'),
                  ),
                ],
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              childCount: 2,
              ((context, index) {
                return Column(
                  children: [
                    OrderProductTile(
                      index: index,
                      orderProduct: OrderProductDto(
                        amount: 4,
                        product: ProductModel.fromMap({}),
                      ),
                    ),
                    const Divider(
                      color: Colors.grey,
                    ),
                  ],
                );
              }),
            ),
          ),
          SliverToBoxAdapter(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    children: [
                      Text(
                        'Total do Pedido',
                        style: context.textStyles.textExtraBold.copyWith(fontSize: 16),
                      ),
                      Text(
                        r'R$200,00',
                        style: context.textStyles.textExtraBold.copyWith(fontSize: 20),
                      ),
                    ],
                  ),
                ),
                const Divider(color: Colors.grey),
                const SizedBox(height: 10),
                OrderField(
                  title: 'Endereço de Entrega',
                  controller: TextEditingController(),
                  validator: Validatorless.required('m'),
                  hintText: 'Digite o endereço',
                ),
                const SizedBox(height: 16),
                OrderField(
                  title: 'CPF',
                  controller: TextEditingController(),
                  validator: Validatorless.required('m'),
                  hintText: 'Digite o CPF',
                ),
                const SizedBox(height: 16),
                PaymentTypesField(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
