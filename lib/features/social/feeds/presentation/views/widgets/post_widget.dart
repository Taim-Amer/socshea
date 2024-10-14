import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:socshea/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:socshea/common/widgets/icons/circular_icon.dart';
import 'package:socshea/common/widgets/images/circular_image.dart';
import 'package:socshea/common/widgets/images/rounded_image.dart';
import 'package:socshea/common/widgets/texts/read_more_text.dart';
import 'package:socshea/common/widgets/texts/sub_title_text.dart';
import 'package:socshea/common/widgets/texts/text_with_verified_icon.dart';
import 'package:socshea/utils/constants/colors.dart';
import 'package:socshea/utils/constants/enums.dart';
import 'package:socshea/utils/constants/image_strings.dart';
import 'package:socshea/utils/constants/sizes.dart';

class TPostWidget extends StatelessWidget {
  const TPostWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const TRoundedContainer(
      showBorder: false,
      width: double.infinity,
      backgroundColor: Colors.transparent,
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: TSizes.sm),
            child: Row(
              children: [
                TCircularImage(image: TImages.user, padding:0, width: 45, height: 45),
                SizedBox(width: TSizes.spaceBtwItems,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TTextWithVerifiedIcon(title: 'Taim Amer'),
                    TSubTitleText(title: '21 july, 2024 at 11:00 pm ',),
                  ],
                ),
                Spacer(),
                TCircularIcon(icon: Icons.more_horiz, backgroundColor: Colors.transparent),
              ],
            ),
          ),
          SizedBox(height: TSizes.sm),
          // Divider(indent: TSizes.sm, endIndent: TSizes.sm),
          // SizedBox(height: TSizes.spaceBtwItems),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: TSizes.sm),
            child: TReadMoreText(text: "Online shopping has revolutionized how we shop. It’s a convenient and widely embraced way of making purchases through the internet, making it possible to shop from virtually anywhereThe biggest advantage of online shopping is its sheer convenience. It’s a game-changer for busy individuals who struggle to find time for physical store visits. With online shopping, you can make purchases 24/7, fitting it seamlessly into your schedule without the pressure of store closing hours.Variety is another key perk. Online stores offer an extensive array of products. You can effortlessly explore different websites, compare prices, and discover unique items that might not be accessible at your local stores.Payment is a breeze as well. You can use credit or debit cards, and some online retailers even offer cash-on-delivery options.However, there are some drawbacks to consider. Sometimes, what you see online may not match what arrives at your doorstep. Issues like color or size discrepancies can be disappointing. Furthermore, there are fraudulent websites that lure you in with unbelievable deals.In conclusion, online shopping is a modern convenience that saves time and opens up a world of choices. Just remember to exercise caution and make informed decisions to ensure a positive online shopping experience."),
          ),
          SizedBox(height: TSizes.spaceBtwItems),
          TRoundedImage(imageUrl: TImages.promoBanner2, width: double.infinity, applyImageRadius: false),
          SizedBox(height: TSizes.sm),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: TSizes.sm),
            child: Row(
              children: [
                TCircularIcon(icon: Iconsax.heart, color: Colors.redAccent, backgroundColor: Colors.transparent),
                TSubTitleText(title: "200 Likes", textSize: TextSizes.small),
                Spacer(),
                TCircularIcon(icon: Iconsax.message, color: TColors.primary, backgroundColor: Colors.transparent),
                TSubTitleText(title: "120 Comments", textSize: TextSizes.small),
              ],
            ),
          ),
          Divider(indent: TSizes.sm, endIndent: TSizes.sm),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: TSizes.sm),
            child: Row(
              children: [
                TCircularImage(image: TImages.user, padding: 0, width: 30, height: 30),
                SizedBox(width: TSizes.spaceBtwItems,),
                TSubTitleText(title: 'write a comment ...',),
              ],
            ),
          )
        ],
      ),
    );
  }
}
