import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:socshea/common/widgets/login_signup/form_divider.dart';
import 'package:socshea/common/widgets/login_signup/social_buttons.dart';
import 'package:socshea/features/authentication/email_register/presentation/views/widgets/register_form.dart';
import 'package:socshea/utils/constants/sizes.dart';
import 'package:socshea/utils/constants/text_strings.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(TTexts.signupTitle, style: Theme.of(context).textTheme.headlineMedium,),

              const SizedBox(height: TSizes.spaceBtwSections,),

              const TRegisterForm(),

              const SizedBox(height: TSizes.spaceBtwSections,),

              TFormDivider(dividerText: TTexts.orSignUpWith.capitalize!),

              const SizedBox(height: TSizes.spaceBtwSections,),

              const TSocialButtons()
            ],
          ),
        ),
      ),
    );
  }
}