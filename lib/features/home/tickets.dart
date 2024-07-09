import 'package:deels_app/common/AppColors/app_colors.dart';
import 'package:deels_app/features/home/widgets/ticket.dart';
import 'package:flutter/material.dart';

class TicketPage extends StatefulWidget {
  const TicketPage({super.key});

  @override
  State<TicketPage> createState() => _TicketPageState();
}

class _TicketPageState extends State<TicketPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.whiteColor,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: SingleChildScrollView(
            child: Column(
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
                            labelText: 'Search for raised tickets',
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
                const Ticket(),
                const Ticket(),
                const Ticket(),
                const Ticket(),
                
              ],
            ),
          ),
        ),
      ),
    );
  }
}