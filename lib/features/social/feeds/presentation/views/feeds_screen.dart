import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:socshea/common/widgets/appbar/appbar.dart';
import 'package:socshea/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:socshea/common/widgets/icons/circular_icon.dart';
import 'package:socshea/common/widgets/images/circular_image.dart';
import 'package:socshea/common/widgets/images/rounded_image.dart';
import 'package:socshea/common/widgets/texts/read_more_text.dart';
import 'package:socshea/common/widgets/texts/sub_title_text.dart';
import 'package:socshea/common/widgets/texts/text_with_verified_icon.dart';
import 'package:socshea/utils/constants/colors.dart';
import 'package:socshea/utils/constants/image_strings.dart';
import 'package:socshea/utils/constants/sizes.dart';

class FeedsScreen extends StatelessWidget {
  const FeedsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TAppBar(
        actions: [
          IconButton(onPressed: (){}, icon: const Icon(Icons.search)),
          IconButton(onPressed: (){}, icon: const Icon(Iconsax.message)),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            TRoundedContainer(
              showBorder: false,
              width: double.infinity,
              backgroundColor: Colors.transparent,
              child: Column(
                children: [
                  const Padding(
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
                  const SizedBox(height: TSizes.sm),
                  const Divider(indent: TSizes.sm, endIndent: TSizes.sm),
                  const SizedBox(height: TSizes.spaceBtwItems),
                  const TReadMoreText(text: "Online shopping has revolutionized how we shop. It’s a convenient and widely embraced way of making purchases through the internet, making it possible to shop from virtually anywhereThe biggest advantage of online shopping is its sheer convenience. It’s a game-changer for busy individuals who struggle to find time for physical store visits. With online shopping, you can make purchases 24/7, fitting it seamlessly into your schedule without the pressure of store closing hours.Variety is another key perk. Online stores offer an extensive array of products. You can effortlessly explore different websites, compare prices, and discover unique items that might not be accessible at your local stores.Payment is a breeze as well. You can use credit or debit cards, and some online retailers even offer cash-on-delivery options.However, there are some drawbacks to consider. Sometimes, what you see online may not match what arrives at your doorstep. Issues like color or size discrepancies can be disappointing. Furthermore, there are fraudulent websites that lure you in with unbelievable deals.In conclusion, online shopping is a modern convenience that saves time and opens up a world of choices. Just remember to exercise caution and make informed decisions to ensure a positive online shopping experience."),
                  const SizedBox(height: TSizes.spaceBtwItems),
                  const TRoundedImage(imageUrl: TImages.promoBanner2, width: double.infinity, applyImageRadius: false),
                  const SizedBox(height: TSizes.sm),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: TSizes.sm),
                    child: Row(
                      children: [
                        const TCircularIcon(icon: Iconsax.heart, color: Colors.redAccent, backgroundColor: Colors.transparent),
                        Text("200 Likes", style: Theme.of(context).textTheme.bodySmall),
                        const Spacer(),
                        const TCircularIcon(icon: Iconsax.message, color: TColors.primary, backgroundColor: Colors.transparent),
                        Text("120 Comment", style: Theme.of(context).textTheme.bodySmall),
                      ],
                    ),
                  ),
                  const Divider(indent: TSizes.sm, endIndent: TSizes.sm),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: TSizes.sm),
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
            ),
          ],
        ),
      ),
    );
  }
}