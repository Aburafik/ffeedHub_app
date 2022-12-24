import 'package:country_pickers/country.dart';
import 'package:country_pickers/country_pickers.dart';
import 'package:ffeed_hub/Commons/Components/custom_button.dart';
import 'package:ffeed_hub/Commons/Components/text_form_field.dart';
import 'package:ffeed_hub/Commons/color_theme.dart';
import 'package:ffeed_hub/Providers/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignInFormComponent extends StatefulWidget {
  const SignInFormComponent({Key? key}) : super(key: key);

  @override
  State<SignInFormComponent> createState() => _SignInFormComponentState();
}

class _SignInFormComponentState extends State<SignInFormComponent> {
  bool isVisible = true;

  TextEditingController phonenNuberController = TextEditingController();
  String countryCode = '';
  Country _selectedDialogCountry =
      CountryPickerUtils.getCountryByPhoneCode('233');
  Widget _buildDialogItem(Country country) {
    countryCode = country.phoneCode;

    print(countryCode);

    return Row(
      children: [
        CountryPickerUtils.getDefaultFlagImage(country),
        const SizedBox(width: 8.0),
        Text("+${country.phoneCode}"),
        SizedBox(width: 8.0),
      ],
    );
  }

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<Authprovider>(context);
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              SizedBox(
                width: 86,
                child: ListTile(
                  contentPadding: EdgeInsets.zero,
                  onTap: _openCountryPickerDialog,
                  title: _buildDialogItem(_selectedDialogCountry),
                ),
              ),
              Expanded(
                child: CustomTextFormField(
                  controller: phonenNuberController,
                  hintText: "Enter phoneNumber",
                  hasPreffix: true,
                  // prefixIcon: FeatherIcons.mail,
                ),
              ),
            ],
          ),
          const SizedBox(height: 15),
          Align(
            alignment: Alignment.centerRight,
            child: GestureDetector(
              onTap: () => Navigator.pushNamed(
                context,
                "/reset-password-view",
                arguments: {},
              ),
              child: Text(
                "Forgot password?",
                style: Theme.of(context)
                    .textTheme
                    .bodyText1!
                    .copyWith(color: blueColor),
              ),
            ),
          ),
          CustomButtonComponent(
              buttonText: "Login",
              onPressed: () {
                // authProvider.verifyPhone(
                //     phoneNumber: "+$countryCode${phonenNuberController.text}",
                //     context: context);
                Navigator.pushNamed(context, "/choose-role");
                // if (_formKey.currentState!.validate()) {
              }),
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

  void _openCountryPickerDialog() => showDialog(
        context: context,
        builder: (context) => Theme(
          data: Theme.of(context).copyWith(primaryColor: Colors.pink),
          child: CountryPickerDialog(
            titlePadding: const EdgeInsets.all(8.0),
            searchCursorColor: Colors.pinkAccent,
            searchInputDecoration: const InputDecoration(hintText: 'Search...'),
            isSearchable: true,
            title: const Text('Select your phone code'),
            onValuePicked: (Country country) =>
                setState(() => _selectedDialogCountry = country),
            itemBuilder: _buildDialogItem,
            priorityList: [
              CountryPickerUtils.getCountryByIsoCode('TR'),
              CountryPickerUtils.getCountryByIsoCode('US'),
            ],
          ),
        ),
      );
}
