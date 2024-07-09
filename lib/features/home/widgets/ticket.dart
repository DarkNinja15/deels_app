import 'package:deels_app/common/AppAssets/app_assets.dart';
import 'package:deels_app/common/AppColors/app_colors.dart';
import 'package:flutter/material.dart';

class Ticket extends StatelessWidget {
  const Ticket({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            height: 200,
            width: double.infinity,
            decoration: BoxDecoration(
              color: AppColors.whiteColor,
              borderRadius: BorderRadius.circular(16.0),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 10.0,
                  spreadRadius: 0.02,
                  offset: Offset(0.0, 0.0),
                )
              ],
            ),
            child: Column(
              children: [
                Container(
                  height: 130,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(16),
                        topRight: Radius.circular(16)),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          '₹ 12',
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w400,
                              color: AppColors.textColor),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                                height: 194 / 2,
                                width: 347 / 2,
                                child: Image.asset(AppAssets.workingBench))
                          ],
                        ),
                        IconButton.filledTonal(
                            onPressed: () {}, icon: const Icon(Icons.add))
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(16),
                          bottomRight: Radius.circular(16)),
                    ),
                    child: const Padding(
                      padding:  EdgeInsets.symmetric(horizontal: 8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Working Bench",
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: AppColors.textColor),
                          ),
                          Expanded(
                            child: Text(
                              "Sturdy and versatile, the Premium Workbench features a solid hardwood top and a heavy-duty steel frame.",
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: AppColors.textColor),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
        const SizedBox(height: 2),
        const Text("45 Tickets raised",style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w400,
          color: AppColors.greenColor
        ),),
        const SizedBox(height: 16),
      ],
    );
  }
}
