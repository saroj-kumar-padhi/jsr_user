import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

class RazorPayController extends GetxController {
  final _razorpay = Razorpay();
  late Map<String, dynamic> options;

  @override
  void onInit() {
    super.onInit();
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
    // Initialize options map
  }

  void updateOptions({required int sum}) {
    options = {
      'key': 'rzp_test_XrQWdyHxeCGyIR',
      'amount': sum * 100,
      'name': 'JSR Services',
      'description': "Food Items",
      'prefill': {'contact': '6280644889', 'email': 'surajpadhi01@gmail.com'},
      'config': {
        'display': {
          'hide': [
            {'method': 'paylater'},
            {'method': 'netbanking'},
            {'method': 'wallet'},
          ],
          'preferences': {'show_default_blocks': 'true'},
        },
      }
    };
  }

  @override
  void onClose() {
    super.onClose();
    _razorpay.clear();
  }

  void openPayment() {
    _razorpay.open(options);
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    Fluttertoast.showToast(msg: "Payment done Successfully");
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    Fluttertoast.showToast(msg: "Payment Failed, please contact admin");
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    Fluttertoast.showToast(msg: "Oops, something went wrong");
  }
}
