import 'package:flutter/material.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:food_delivery_app/components/my_button.dart';
import 'package:food_delivery_app/pages/delivery_progress_page.dart';

class PaymentPage extends StatefulWidget {
  const PaymentPage({super.key});

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  
  GlobalKey<FormState> formKey= GlobalKey<FormState>();
  String cardNumber='';
  String expiryDate='';
  String cardHolderName='';
  String cvvCode='';
  bool isCvvFoused=false;

  //user wants to pay
  void userTappedPay(){
    if(formKey.currentState!.validate()){
      //only show dialog if form is valid 
      showDialog(
        context: context,
        builder: (context)=> AlertDialog(
          title: const Text("Confirm payment"),
          content: SingleChildScrollView(
            child: ListBody(
              children: [
                Text("Card Number: $cardNumber"),
                Text("Expiry Date: $expiryDate"),
                Text("Card Holdername: $cardHolderName"),
                Text("CVV: $cvvCode"),
              ],
            ),
          ),
          actions: [
            //cancel button 
            TextButton(
              onPressed: ()=> Navigator.pop(context),
              child: const Text("Cancel"),
              ),

            //yes button 
             TextButton(
              onPressed: ()=> Navigator.push(context, MaterialPageRoute(builder: (context)=> const DeliveryProgressPage(),
              ),
            ),
              child: const Text("Yes"),
              ),

          ],
        ),
        );
    }
  }

  @override
  Widget build(BuildContext context) {
     return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Text("Checkout"),
        centerTitle: true,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Column(
        children: [
          //credit cart
          CreditCardWidget(
          cardNumber: cardNumber,
          expiryDate: expiryDate,
          cardHolderName: cardHolderName,
          cvvCode: cvvCode,
          showBackView: isCvvFoused,
          onCreditCardWidgetChange: (p0){},
          ),

          //credit card form
          CreditCardForm(
            cardNumber: cardNumber,
            expiryDate: expiryDate,
            cardHolderName: cardHolderName, 
            cvvCode: cvvCode, 
            onCreditCardModelChange: (data){
              setState(() {
                 cardNumber= data.cardNumber;
                 expiryDate=data.expiryDate;
                 cardHolderName=data.cardHolderName;
                 cvvCode=data.cvvCode;
                 
              });
            }, 
            formKey: formKey, themeColor: Theme.of(context).colorScheme.secondary,
            ),

            const Spacer(),

            MyButton(
              text: "Pay now", 
              onTap: userTappedPay,
              )
        ],
      ),
    );
  }
}