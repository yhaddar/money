import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile/model/User.dart';
import 'package:mobile/utils/constant/color.dart';
import 'package:mobile/utils/constant/size.dart';
import 'package:mobile/viewmodel/authentication_viewmodel.dart';
import 'package:provider/provider.dart';
import '../../../utils/constant/regex.dart';
import '../../../utils/constant/texts.dart';
import '../widgets/input_widget.dart';
import '../../../utils/constant/buttons.dart';

class RegisterWidget extends StatefulWidget {
  const RegisterWidget({super.key});

  @override
  State<RegisterWidget> createState() => _RegisterWidgetState();
}

class _RegisterWidgetState extends State<RegisterWidget> {

  late TextEditingController fullNameController = TextEditingController();
  late TextEditingController emailController = TextEditingController();
  late TextEditingController passwordController = TextEditingController();

  late List<TextEditingController> inputControllers = [
    fullNameController,
    emailController,
    passwordController,
  ];

  late List<RegExp> regex = [Regex.fullName, Regex.email, Regex.password];

  final sliced = Texts.inputText;

  final formKey = GlobalKey<FormState>();

  void register(authentication, context) async {
    formKey.currentState!.validate();

    UserModel userModel = UserModel(fullNameController.text, emailController.text, passwordController.text, null);

    Map<String, dynamic>? authenticationviewModel = await authentication.register(userModel);

    if(authenticationviewModel!["status"] == 500){
      Fluttertoast.showToast(msg: authenticationviewModel["message"], toastLength: Toast.LENGTH_SHORT);
    }else {
      Navigator.pushReplacementNamed(context, "/");
    }

  }

  @override
  Widget build(BuildContext context) {
    final authentication = Provider.of<AuthenticationViewmodel>(context);
    return Container(
      width: Size.fullWidth(context),
      padding: EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            Texts.authenticationTitle[1],
            style: GoogleFonts.balsamiqSans(
              color: AllColors.black,
              fontSize: 25,
              fontWeight: FontWeight.w600,
            ),
          ),
          Text(
            Texts.authenticationDescription[1],
            style: GoogleFonts.poppins(
              color: AllColors.black,
              fontSize: 15,
              fontWeight: FontWeight.w400,
            ),
          ),
          SizedBox(height: 25),
          Form(
            key: formKey,
            child: Column(
              children: List.generate(sliced.length, (i) {
                return InputWidget(
                  hint: sliced[i]["hint"]!,
                  label: sliced[i]["label"]!,
                  textInputType: sliced[i]["label"] == "Password"
                      ? TextInputType.visiblePassword
                      : sliced[i]["label"] == "Email"
                      ? TextInputType.emailAddress
                      : TextInputType.text,
                  textEditingController: inputControllers[i],
                  regex: regex[i],
                );
              }),
            ),
          ),

          Buttons.elevatedButton(
            context,
                () => register(authentication, context),
            Texts.authenticationButton[1],
          ),
        ],
      ),
    );
  }
}
