import 'package:country_pickers/country.dart';
import 'package:country_pickers/country_pickers.dart';
import 'package:feather_icons/feather_icons.dart';
import 'package:ffeed_hub/Commons/Components/custom_button.dart';
import 'package:ffeed_hub/Commons/Components/text_form_field.dart';
import 'package:ffeed_hub/Commons/color_theme.dart';
import 'package:flutter/material.dart';

class SignInFormComponent extends StatefulWidget {
  const SignInFormComponent({Key? key}) : super(key: key);

  @override
  State<SignInFormComponent> createState() => _SignInFormComponentState();
}

class _SignInFormComponentState extends State<SignInFormComponent> {
  bool isVisible = true;

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  // AuthUser _authUser = AuthUser();
  Country _selectedDialogCountry =
      CountryPickerUtils.getCountryByPhoneCode('90');
  Widget _buildDialogItem(Country country) => Row(
        children: <Widget>[
          CountryPickerUtils.getDefaultFlagImage(country),
          SizedBox(width: 8.0),
          Text("+${country.phoneCode}"),
          SizedBox(width: 8.0),
          // Flexible(child: Text(country.name))
        ],
      );
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
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
                  controller: emailController,
                  hintText: "Enter phoneNumber",
                  hasPreffix: true,
                  // prefixIcon: FeatherIcons.mail,
                ),
              ),
            ],
          ),
          SizedBox(height: 15),
          Align(
              alignment: Alignment.centerRight,
              child: GestureDetector(
                onTap: () =>
                    Navigator.pushNamed(context, "/reset-password-view"),
                child: Text(
                  "Forgot password?",
                  style: Theme.of(context)
                      .textTheme
                      .bodyText1!
                      .copyWith(color: blueColor),
                ),
              )),
          CustomButtonComponent(
              buttonText: "Login",
              onPressed: () {
                Navigator.pushNamed(context, "/code-verification-view");
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
            titlePadding: EdgeInsets.all(8.0),
            searchCursorColor: Colors.pinkAccent,
            searchInputDecoration: InputDecoration(hintText: 'Search...'),
            isSearchable: true,
            title: Text('Select your phone code'),
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

_buildCountryPickerDropdownSoloExpanded({BuildContext? context}) {
  return SizedBox(
    width: 120,
    child: CountryPickerDropdown(
      iconSize: 20,
      //show'em (the text fields) you're in charge now
      onTap: () => FocusScope.of(context!).requestFocus(FocusNode()),
      //if you want your dropdown button's selected item UI to be different
      //than itemBuilder's(dropdown menu item UI), then provide this selectedItemBuilder.
      onValuePicked: (Country country) {
        print("${country.name}");
      },
      itemBuilder: (Country country) {
        return Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            // SizedBox(width: 8.0),
            CountryPickerUtils.getDefaultFlagImage(country),
            // SizedBox(width: 8.0),
            Text(country.phoneCode),
          ],
        );
      },
      itemHeight: null,
      // isExpanded: true,
      //initialValue: 'TR',
      // icon: Icon(Icons.arrow_downward),
    ),
  );
}
