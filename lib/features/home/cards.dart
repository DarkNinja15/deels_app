import 'package:deels_app/common/AppAssets/app_assets.dart';
import 'package:deels_app/common/AppColors/app_colors.dart';
import 'package:deels_app/features/home/widgets/card.dart';
import 'package:deels_app/services/firestore_service.dart';
import 'package:deels_app/store/store.dart';
import 'package:deels_app/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';
import 'package:get/get.dart';

class CardScreen extends StatefulWidget {
  const CardScreen({super.key});

  @override
  State<CardScreen> createState() => _CardScreenState();
}

class _CardScreenState extends State<CardScreen> {
  final CardSwiperController controller = CardSwiperController();
  bool _isLoading = false;
  final store = Get.find<Store>();

  @override
  void initState() {
    getProducts();
    super.initState();
  }

  void getProducts() async {
    setState(() {
      _isLoading = true;
    });
    await FirestoreService.getProducts();
    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.whiteColor,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * 0.7,
                      height: 40,
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 10.0,
                            spreadRadius: 0.02,
                            offset: const Offset(0.0, 0.0),
                          )
                        ],
                        color: AppColors.whiteColor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Center(
                        child: TextField(
                          style: TextStyle(
                            color: AppColors.blackColor,
                          ),
                          decoration: InputDecoration(
                            labelText: 'Search for deals',
                            labelStyle: TextStyle(
                              color: AppColors.blackColor,
                            ),
                            prefixIcon: Icon(
                              Icons.search,
                              color: AppColors.blackColor,
                            ),
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ),
                    const CircleAvatar(
                      radius: 20,
                      backgroundColor: AppColors.whiteColor,
                      child: Icon(
                        Icons.person,
                        color: AppColors.textColor,
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 16),
                const Text(
                  'Welcome Back,\nUser',
                  textAlign: TextAlign.start,
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 20,
                      color: AppColors.textColor),
                ),
                SizedBox(
                  height: 500,
                  child: _isLoading? const Center(child: CircularProgressIndicator(color: AppColors.primaryColor,),): CardSwiper(
                    controller: controller,
                    cardsCount: store.currProducts.length,
                    isLoop: false,
                    onEnd: () {
                      Utils.snackBar("No more deals", "No more deals to show");
                    },
                    onSwipe: _onSwipe,
                    onUndo: _onUndo,
                    // numberOfCardsDisplayed: 12,
                    backCardOffset: const Offset(40, 40),
                    padding: const EdgeInsets.all(24.0),
                    cardBuilder: (
                      context,
                      index,
                      horizontalThresholdPercentage,
                      verticalThresholdPercentage,
                    ) =>
                        SwiperCard(
                      imageUrl: store.currProducts[index].imageUrl,
                      title: store.currProducts[index].title,
                      price: store.currProducts[index].price.toString(),
                      description: store.currProducts[index].description,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  bool _onSwipe(
    int previousIndex,
    int? currentIndex,
    CardSwiperDirection direction,
  ) {
    debugPrint(
      'The card $previousIndex was swiped to the ${direction.name}. Now the card $currentIndex is on top',
    );
    return true;
  }

  bool _onUndo(
    int? previousIndex,
    int currentIndex,
    CardSwiperDirection direction,
  ) {
    debugPrint(
      'The card $currentIndex was undod from the ${direction.name}',
    );
    return true;
  }
}
