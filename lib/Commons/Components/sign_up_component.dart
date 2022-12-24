import 'package:feather_icons/feather_icons.dart';
import 'package:ffeed_hub/Commons/Components/custom_button.dart';
import 'package:ffeed_hub/Commons/Components/text_form_field.dart';
import 'package:flutter/material.dart';

class SignUpFormComponent extends StatefulWidget {
  const SignUpFormComponent({Key? key}) : super(key: key);

  @override
  State<SignUpFormComponent> createState() => _SignUpFormComponentState();
}

class _SignUpFormComponentState extends State<SignUpFormComponent> {
  bool isVisible = true;

  final _formKey = GlobalKey<FormState>();
  // AuthUser _authUser = AuthUser();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController locationController = TextEditingController();
  TextEditingController installationYearController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController contactController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 15),
            child: CustomTextFormField(
              controller: nameController,
              hintText: "Full name",
              hasPreffix: true,
              prefixIcon: FeatherIcons.user,
              errorMessage: "name can't be empty",
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 15),
            child: CustomTextFormField(
              controller: emailController,
              hintText: "Enter email",
              hasPreffix: true,
              prefixIcon: FeatherIcons.mail,
              errorMessage: "Email can't be empty",
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 15),
            child: CustomTextFormField(
              controller: locationController,
              hintText: "Location",
              hasPreffix: true,
              prefixIcon: FeatherIcons.mapPin,
              errorMessage: "Location can't be empty",
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 15),
            child: CustomTextFormField(
              controller: passwordController,
              hintText: "Enter password",
              obscureText: isVisible,
              hasSuffix: true,
              suffixIcon: isVisible ? Icons.visibility_off : Icons.visibility,
              hasPreffix: true,
              prefixIcon: FeatherIcons.lock,
              errorMessage: "Password can't be empty",
              onPressed: () {
                setState(
                  () {
                    isVisible = !isVisible;
                  },
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 15),
            child: CustomTextFormField(
              controller: contactController,
              hintText: "Contact",
              hasPreffix: true,
              prefixIcon: FeatherIcons.phone,
              errorMessage: "Contact can't be empty",
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 30),
            child: CustomButtonComponent(
              buttonText: "Create account",
              onPressed: () async {
                Navigator.pushNamed(context, "/location_picker-view");
                // if (_formKey.currentState!.validate()) {
                //   startLoading();

                //   await _authUser.signUpCustomer(
                //       email: emailController.text,
                //       password: passwordController.text,
                //       nameOrCompany: nameController.text,
                //       location: locationController.text,
                //       installationYear: installationYearController.text,
                //       contact: contactController.text,
                //       context: context);

                //   // stopLoading();
                // }
              },
            ),
          ),
          Row(
            children: const [
              Expanded(
                  child: Divider(
                thickness: 1,
              )),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Text("OR"),
              ),
              Expanded(
                child: Divider(
                  thickness: 1,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
