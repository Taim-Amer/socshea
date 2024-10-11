import "package:flutter/cupertino.dart";
import "package:flutter/material.dart";
import "package:socshea/common/widgets/success_screen/success_screen.dart";
import "package:socshea/features/authentication/email_register/presentation/manager/register_cubit/register_email_cubit.dart";
import "package:socshea/utils/constants/image_strings.dart";
import "package:socshea/utils/constants/sizes.dart";
import "package:socshea/utils/constants/text_strings.dart";
import "package:socshea/utils/helpers/helper_functions.dart";

class EmailVerificationScreen extends StatelessWidget {
  const EmailVerificationScreen({super.key, this.email});

  final String? email;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(onPressed: (){}, icon: const Icon(CupertinoIcons.clear))
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              //image
              Image(image: const AssetImage(TImages.deliveredEmailIllustration), width: THelperFunctions.screenWidth(context)),
              const SizedBox(height: TSizes.spaceBtwSections),

              //title and subTitle
              Text(TTexts.confirmEmail, style: Theme.of(context).textTheme.headlineMedium, textAlign: TextAlign.center,),
              const SizedBox(height: TSizes.spaceBtwItems,),
              Text(email ?? "", style: Theme.of(context).textTheme.labelLarge, textAlign: TextAlign.center,),
              const SizedBox(height: TSizes.spaceBtwItems,),
              Text(TTexts.confirmEmailSubTitle, style: Theme.of(context).textTheme.labelMedium, textAlign: TextAlign.center,),
              const SizedBox(height: TSizes.spaceBtwSections,),

              //buttons
              SizedBox(width: double.infinity, child: ElevatedButton(
                onPressed: (){
                  RegisterEmailCubit.get(context).checkEmailVerification();
                  if(RegisterEmailCubit.get(context).isVerified == true){
                    const SuccessScreen(image: TImages.successfulRegisterAnimation, title: TTexts.yourAccountCreatedTitle, subTitle: TTexts.yourAccountCreatedSubTitle);
                  }
                },
                child: const Text(TTexts.tContinue))),
              const SizedBox(height: TSizes.spaceBtwItems,),
              SizedBox(width: double.infinity, child: TextButton(
                onPressed: () => RegisterEmailCubit.get(context).sendEmailVerification(),
                child: const Text(TTexts.resendEmail),
              ))
            ],
          ),
        ),
      ),
    );
  }
}
