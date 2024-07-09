import 'package:deels_app/features/home/home.dart';
import 'package:deels_app/features/onboarding/onboarding.dart';
import 'package:deels_app/store/store.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // inject the Store and GetStorage into the GetX dependency manager
    Get.put(Store());
    Get.put(GetStorage());

    final box = Get.find<GetStorage>();
    return GetMaterialApp(
      title: 'Deels',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(
        useMaterial3: true,
      ),
      home: box.hasData('user') ? const Home() : const Onboarding(),
    );
  }
}
