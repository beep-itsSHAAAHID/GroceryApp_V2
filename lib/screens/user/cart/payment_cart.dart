import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:grocery_app_2022/controller/cart_controller.dart';
import 'package:grocery_app_2022/controller/order_controller.dart';
import 'package:grocery_app_2022/controller/payment_controller.dart';
import 'package:grocery_app_2022/controller/user_controller.dart';
import 'package:grocery_app_2022/models/order.dart';
import 'package:cloud_firestore/cloud_firestore.dart' as firestore;


import 'package:grocery_app_2022/styles/styles.dart';
import 'package:unicons/unicons.dart';

import '../../../styles/app_layout.dart';
import '../../../widgets/build_appbar.dart';

class PaymentCart extends StatelessWidget {
  const PaymentCart({super.key});

  @override
  Widget build(BuildContext context) {
    OrderController orderController = Get.put(OrderController());
    UserController userController = Get.put(UserController());
    CartController cartController = Get.put(CartController());
    PaymentController paymentController = Get.put(PaymentController());
    return Scaffold(
      body: SafeArea(
        child: Column(children: [
          const Padding(
            padding: EdgeInsets.all(20),
            child: BuildAppBar(title: 'Payment'),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                Text('Payment method', style: Styles.headLineStyle3),

                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15)),
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Total: ', style: Styles.textStyle),
                            Text('220 USD ', style: Styles.headLineStyle4),
                          ],
                        ),
                        Divider(color: Styles.primaryColor),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Total order: ', style: Styles.textStyle),
                            Text('200 USD ', style: Styles.headLineStyle4),
                          ],
                        ),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Shipping fee: ', style: Styles.textStyle),
                            Text('20 USD ', style: Styles.headLineStyle4),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),

                Text('Payment method', style: Styles.headLineStyle3),

                Obx(
                  () => Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Column(
                      children: [
                        RadioListTile(
                          activeColor: Styles.orangeColor,
                          value: 1,
                          groupValue: paymentController.payment,
                          title: Text('Pay via card', style: Styles.textStyle),
                          subtitle: Text('Visa or master card',
                              style: Styles.headLineStyle4),
                          onChanged: (value) =>
                              paymentController.payment = value!,
                          secondary: Icon(UniconsLine.credit_card,
                              color: Styles.secondaryColor),
                        ),
                        RadioListTile(
                          activeColor: Styles.orangeColor,
                          value: 2,
                          groupValue: paymentController.payment,
                          title:
                              Text('Cash on delivery', style: Styles.textStyle),
                          subtitle: Text('Pay cash at home',
                              style: Styles.headLineStyle4),
                          onChanged: (value) =>
                              paymentController.payment = value!,
                          secondary: Icon(UniconsLine.bill,
                              color: Styles.secondaryColor),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                //implment ur confirm payment logic
                },
                child: const Text('Confirm payment'),
              ),
            ),
          ),

        ]),
      ),
    );
  }
}
