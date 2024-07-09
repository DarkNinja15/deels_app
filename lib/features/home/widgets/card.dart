import 'package:deels_app/common/AppColors/app_colors.dart';
import 'package:flutter/material.dart';

class SwiperCard extends StatelessWidget {
  const SwiperCard({super.key,required this.imageUrl,required this.title,required this.price,required this.description});
  final String imageUrl;
  final String title;
  final String price;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: 450,
      width: 327,
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
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 16,),
            Text(title,style: const TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 18,
              color: AppColors.textColor
            ),),
            Text('₹ $price',style: const TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 18,
              color: AppColors.textColor
            ),),
            const SizedBox(height: 16,),
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: SizedBox(height: 194,width: 394, child: Image.network(imageUrl,fit: BoxFit.cover,))),
            const SizedBox(height: 16,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                    color: AppColors.whiteColor,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 10.0,
                      spreadRadius: 0.02,
                      offset: const Offset(0.0, 0.0),
                    )]
                  ),
                  child: const Center(
                    child: Icon(Icons.close_rounded,color: AppColors.primaryColor,),
                  ),
                ),
                Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                    color: AppColors.whiteColor,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 10.0,
                      spreadRadius: 0.02,
                      offset: const Offset(0.0, 0.0),
                    )]
                  ),
                  child: const Center(
                    child: Icon(Icons.done_outline_rounded,color: AppColors.primaryColor,),
                  ),
                ),

              ],
            ),
            const SizedBox(height: 24,),
            const Text('Description',style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 18,
              color: AppColors.textColor
            ),),
            Expanded(
              child:  Text(description
              ,maxLines: 5,
              style: const TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 16,
                overflow: TextOverflow.ellipsis,
                color: AppColors.greyColor
              ),),
            ),
          ],
        ),
      ),
    );
  }
}