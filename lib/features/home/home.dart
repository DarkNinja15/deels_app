import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:deels_app/common/AppColors/app_colors.dart';
import 'package:deels_app/features/home/cards.dart';
import 'package:deels_app/features/home/tickets.dart';
import 'package:deels_app/features/home/widgets/add_product.dart';
import 'package:deels_app/features/home/widgets/raise_ticket.dart';
import 'package:flutter/material.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  final CardSwiperController controller = CardSwiperController();
  int _bottomNavIndex = 0;




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: _bottomNavIndex==0?const CardScreen():const TicketPage(),
      floatingActionButton: FloatingActionButton(
        shape:const CircleBorder(),
        onPressed: (){
          
          showModalBottomSheet(
            backgroundColor: AppColors.whiteColor,
            isDismissible: false,
            sheetAnimationStyle: AnimationStyle(
              curve: Curves.easeInOut,
              duration: const Duration(milliseconds: 500),
              reverseDuration: const Duration(milliseconds: 500),
            ),
            context: context,
            isScrollControlled: true,
            builder: (BuildContext context) {
              return _bottomNavIndex==0? const AddItemForm():const RaiseTicket();
            },
          );
        },
        backgroundColor: AppColors.primaryColor,
        child: const Icon(Icons.add, color: AppColors.whiteColor, size: 30),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: AnimatedBottomNavigationBar(
      inactiveColor: AppColors.greyColor,
      activeColor: AppColors.whiteColor,
      backgroundColor: AppColors.primaryColor,
      icons: const [Icons.home,Icons.pages_outlined],
      activeIndex: _bottomNavIndex,
      gapLocation: GapLocation.center,
      notchSmoothness: NotchSmoothness.verySmoothEdge,
      leftCornerRadius: 32,
      rightCornerRadius: 32,
      onTap: (index) => setState(() => _bottomNavIndex = index),
  ),
    );
  }

  
}
