import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:flutter_paypal_payment/flutter_paypal_payment.dart';
import 'package:payment_methods/Features/checkout/presentation/manager/cubit/checkout_payment_cubit.dart';
import 'package:payment_methods/Features/data/models/payment_input_model.dart';
import 'package:payment_methods/Features/data/models/payment_intent_model/transaction_models/transaction_model.dart';

import 'custom_checkout_button.dart';

class CustomCreditCard extends StatefulWidget {
  const CustomCreditCard({super.key});

  @override
  State<CustomCreditCard> createState() => _CustomCreditCardState();
}

class _CustomCreditCardState extends State<CustomCreditCard> {
  String cardNumber = '', expiryDate = '', cardHolderName = '', cvvCode = '';
  bool showBackView = false;
  GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autoValidateMode = AutovalidateMode.disabled;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CreditCardWidget(
          cardNumber: cardNumber,
          expiryDate: expiryDate,
          cardHolderName: cardHolderName,
          isHolderNameVisible: true,
          cvvCode: cvvCode,
          showBackView: showBackView,
          onCreditCardWidgetChange: (p0) {},
        ),
        CreditCardForm(
          cardNumber: cardNumber,
          expiryDate: expiryDate,
          cardHolderName: cardHolderName,
          autovalidateMode: autoValidateMode,
          cvvCode: cvvCode,
          onCreditCardModelChange: (creditCardModel) {
            cardNumber = creditCardModel.cardNumber;
            expiryDate = creditCardModel.expiryDate;
            cardHolderName = creditCardModel.cardHolderName;
            cvvCode = creditCardModel.cvvCode;
            showBackView = creditCardModel.isCvvFocused;
            setState(() {});
          },
          formKey: formKey,
        ),
        const SizedBox(height: 22),
        CustomButton(
          title: 'Pay',
          onTap: () {
            //? Card
            BlocProvider.of<CheckoutPaymentCubit>(context).checkoutPayment(
              paymentInputModel: PaymentInputModel(
                currency: 'usd',
                customerId:'cus_PoLE35aaI0mQ39',
                amount: 100,
              ),
            );
            //? Paypal
            Navigator.of(context).push(MaterialPageRoute(
              builder: (BuildContext context) => PaypalCheckoutView(
                sandboxMode: true,
                clientId: "YOUR CLIENT ID",
                secretKey: "YOUR SECRET KEY",
                transactions: [
                  TransactionModel(
                    amountModel: AmountModel(
                      total: '100',
                      currency: 'USD',
                      detailsModel: DetailsModel(
                        subtotal: '100',
                        shipping: '0',
                        shippingDiscount: 0,
                      ),
                    ),
                    description: 'Hello I am Flutter dveloper',
                    itemsListModel: ItemsListModel(
                      items: [
                        ItemsModel(
                          name: 'Apple',
                          quantity: 4,
                          price: '10',
                          currency: 'USD',
                        ),
                        ItemsModel(
                          name: 'Pineapple',
                          quantity: 5,
                          price: '12',
                          currency: 'USD',
                        ),
                      ],
                    ),
                  ).toJson(
                    amountModel: AmountModel(
                      total: '100',
                      currency: 'USD',
                      detailsModel: DetailsModel(
                        subtotal: '100',
                        shipping: '0',
                        shippingDiscount: 0,
                      ),
                    ),
                    detailsModel: DetailsModel(
                      subtotal: '100',
                      shipping: '0',
                      shippingDiscount: 0,
                    ),
                    itemsListModel: ItemsListModel(
                      items: [
                        ItemsModel(
                          name: 'Apple',
                          quantity: 4,
                          price: '10',
                          currency: 'USD',
                        ),
                        ItemsModel(
                          name: 'Pineapple',
                          quantity: 5,
                          price: '12',
                          currency: 'USD',
                        ),
                      ],
                    ),
                  ),
                  /*{
                      "amount": {
                        "total": '100',
                        "currency": "USD",
                        "details": {
                          "subtotal": '100',
                          "shipping": '0',
                          "shipping_discount": 0
                        }
                      },
                      "description": "The payment transaction description.",
                      // "payment_options": {
                      //   "allowed_payment_method":
                      //       "INSTANT_FUNDING_SOURCE"
                      // },
                      "item_list": {
                        "items": [
                          {
                            "name": "Apple",
                            "quantity": 4,
                            "price": '10',
                            "currency": "USD"
                          },
                          {
                            "name": "Pineapple",
                            "quantity": 5,
                            "price": '12',
                            "currency": "USD"
                          }
                        ],
                        // Optional
                        //   "shipping_address": {
                        //     "recipient_name": "Tharwat samy",
                        //     "line1": "tharwat",
                        //     "line2": "",
                        //     "city": "tharwat",
                        //     "country_code": "EG",
                        //     "postal_code": "25025",
                        //     "phone": "+00000000",
                        //     "state": "ALex"
                        //  },
                      }
                    }*/
                ],
                note: "Contact us for any questions on your order.",
                onSuccess: (Map params) async {
                  log("onSuccess: $params");
                  Navigator.pop(context);
                },
                onError: (error) {
                  log("onError: $error");
                  Navigator.pop(context);
                },
                onCancel: () {
                  print('cancelled:');
                  Navigator.pop(context);
                },
              ),
            ));
          },
        ),
      ],
    );
  }
}
