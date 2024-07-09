import 'package:deels_app/utils/utils.dart';
import 'package:email_otp/email_otp.dart';

class AuthService {
  EmailOTP myAuth = EmailOTP();
  AuthService(String email) {
    myAuth.setConfig(
        appEmail: "me@rohitchouhan.com",
        appName: "Email OTP",
        userEmail: email,
        otpLength: 6,
        otpType: OTPType.digitsOnly);
    // myAuth.setTheme(
    //   theme: "v3"
    // );
  }

  Future<void> sendOTP() async {
    try {
      await myAuth.sendOTP().then((value) {
        Utils.snackBar("Otp send successfully", "Check your spam folder if you don't see it in your inbox.");
      });
    } catch (e) {
      Utils.snackBar("Unable to send otp", "Please try again later.");
    }
  }

  bool verifyOTP(String otp) {
    return myAuth.verifyOTP(otp:otp);
  }
}
