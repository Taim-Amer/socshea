import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:socshea/utils/constants/colors.dart';

class TCartCounterIcon extends StatelessWidget {
  const TCartCounterIcon({super.key, required this.onPressed, this.iconColor});

  final VoidCallback onPressed;
  final Color? iconColor;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        IconButton(onPressed: (){}, icon: Icon(Iconsax.shopping_bag, color: iconColor,)),
        Positioned(
          right: 0,
          child: Container(
            width: 18,
            height: 18,
            decoration: BoxDecoration(
                color: TColors.black,
                borderRadius: BorderRadius.circular(100)
            ),
            child: Center(
              child: Text("2" , style: Theme.of(context).textTheme.labelLarge!.apply(color: TColors.white, fontSizeFactor: .8)),
            ),
          ),
        ),
      ],
    );
  }
}