import 'package:deels_app/common/AppColors/app_colors.dart';
import 'package:deels_app/features/auth/login_screen.dart';
import 'package:deels_app/features/auth/widgets/gender_dropdown.dart';
import 'package:deels_app/services/auth_service.dart';
import 'package:deels_app/services/firestore_service.dart';
import 'package:deels_app/store/store.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _otpController = TextEditingController();
  bool otpLoader = false;
  bool signupLoader = false;
  bool showSendOtp = true;
  late AuthService authService;
  final store = Get.find<Store>();

  @override
  void dispose() {
    _otpController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.primaryColor,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  const SizedBox(height: 32),
                  const Text(
                    '"Hurry up and grab your deal before it is gone!"',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 36,
                    ),
                  ),
                  const SizedBox(height: 24),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextFormField(
                        onChanged: (val) {
                          store.user.name = val.trim();
                        },
                        style: const TextStyle(color: AppColors.textColor),
                        keyboardType: TextInputType.name,
                        validator: (val) {
                          if (val!.isEmpty) {
                            return 'Please enter your name';
                          }
                          return null;
                        },
                        decoration: const InputDecoration(
                            hintText: 'Enter your name',
                            hintStyle: TextStyle(color: AppColors.textColor),
                            filled: true,
                            fillColor: AppColors.whiteColor,
                            border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                            )),
                      ),
                      const SizedBox(height: 16.0),
                      TextFormField(
                        onChanged: (val) {
                          store.user.email = val.trim();
                        },
                        keyboardType: TextInputType.emailAddress,
                        style: const TextStyle(color: AppColors.textColor),
                        validator: (val) {
                          if (val!.isEmpty) {
                            return 'Please enter your email address';
                          }
                          if (!(val.endsWith(".ac.in") ||
                              val.endsWith(".edu"))) {
                            return 'Please enter a valid college email address';
                          }
                          return null;
                        },
                        decoration: const InputDecoration(
                            hintText: 'Enter your email address',
                            hintStyle: TextStyle(color: AppColors.textColor),
                            filled: true,
                            fillColor: AppColors.whiteColor,
                            border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                            )),
                      ),
                      const SizedBox(height: 16.0),
                      TextFormField(
                        onChanged: (val) {
                          store.user.phone = val.trim();
                        },
                        style: const TextStyle(color: AppColors.textColor),
                        validator: (val) {
                          if (val!.isEmpty) {
                            return 'Please enter your phone number';
                          }
                          if (val.length != 10) {
                            return 'Please enter a valid phone number';
                          }
                          return null;
                        },
                        keyboardType: TextInputType.phone,
                        decoration: const InputDecoration(
                            hintText: 'Enter your phone number',
                            hintStyle: TextStyle(color: AppColors.textColor),
                            filled: true,
                            fillColor: AppColors.whiteColor,
                            border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                            ),),
                      ),
                      const SizedBox(height: 16.0),
                      const GenderDropdown(),
                      const SizedBox(height: 16.0),
                      otpLoader
                          ? const Center(
                              child: CircularProgressIndicator(
                                color: AppColors.whiteColor,
                              ),
                            )
                          : !showSendOtp
                              ? const SizedBox.shrink()
                              : GestureDetector(
                                  onTap: () async {
                                    if (_formKey.currentState!.validate()) {
                                      authService = AuthService(
                                          store.user.email);
                                      setState(() {
                                        otpLoader = true;
                                      });
                                      await authService.sendOTP();
                                      setState(() {
                                        otpLoader = false;
                                        showSendOtp = false;
                                      });
                                    }
                                  },
                                  child: Container(
                                    height: 50,
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      color: AppColors.whiteColor,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: const Center(
                                      child: Text(
                                        'Send OTP',
                                        style: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 18,
                                          color: AppColors.textColor,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                      const SizedBox(height: 48),
                      TextFormField(
                        controller: _otpController,
                        keyboardType: TextInputType.number,
                        style: const TextStyle(color: AppColors.textColor),
                        decoration: const InputDecoration(
                            hintText: 'Enter OTP',
                            hintStyle: TextStyle(color: AppColors.textColor),
                            filled: true,
                            fillColor: AppColors.whiteColor,
                            border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                            )),
                      ),
                      const SizedBox(height: 16.0),
                      GestureDetector(
                        onTap: () {
                          FirestoreService.createUser();
                          // if (_otpController.text.isNotEmpty) {
                          //   if (authService.verifyOTP(_otpController.text)) {
                          //     FirestoreService.createUser();
                          //   } else {
                          //     Utils.snackBar(
                          //         "Invalid OTP", "Please enter a valid OTP.");
                          //   }
                          // }
                        },
                        child: Container(
                          height: 50,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: AppColors.whiteColor,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: const Center(
                            child: Text(
                              'Sign Up',
                              style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 18,
                                color: AppColors.textColor,
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 24),
                            child: GestureDetector(
                              onTap: () {
                                Get.to(() => const LoginScreen(),
                                    transition: Transition.downToUp);
                              },
                              child: RichText(
                                text: const TextSpan(
                                  text: 'Already have an account? ',
                                  style: TextStyle(
                                    color: AppColors.whiteColor,
                                    fontSize: 15,
                                  ),
                                  children: [
                                    TextSpan(
                                      text: 'Login',
                                      style: TextStyle(
                                        color: AppColors.whiteColor,
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
