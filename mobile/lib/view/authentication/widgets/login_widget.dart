import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile/utils/constant/color.dart';
import 'package:mobile/utils/constant/size.dart';
import 'package:mobile/viewmodel/authentication_viewmodel.dart';
import 'package:provider/provider.dart';
import '../../../model/User.dart';
import '../../../utils/constant/regex.dart';
import '../../../utils/constant/texts.dart';
import '../widgets/input_widget.dart';
import '../../../utils/constant/buttons.dart';

class LoginWidget extends StatefulWidget {
  const LoginWidget({super.key});

  @override
  State<LoginWidget> createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {

  late TextEditingController emailController = TextEditingController();

  late TextEditingController passwordController = TextEditingController();

  late List<TextEditingController> inputControllers = [
    emailController,
    passwordController,
  ];

  late List<RegExp> regex = [Regex.email, Regex.password];

  final sliced = Texts.inputText.sublist(1, 3);

  final formKey = GlobalKey<FormState>();

  void login(authentication, context) async {
    formKey.currentState!.validate();

    UserModel userModel = UserModel(null, emailController.text, passwordController.text, null);

    Map<String, dynamic>? authenticationViewmodel = await authentication.login(userModel);

    if(authenticationViewmodel!["status"] == 500){
        Fluttertoast.showToast(msg: authenticationViewmodel["message"], toastLength: Toast.LENGTH_SHORT);
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
            Texts.authenticationTitle[0],
            style: GoogleFonts.balsamiqSans(
              color: AllColors.black,
              fontSize: 25,
              fontWeight: FontWeight.w600,
            ),
          ),
          Text(
            Texts.authenticationDescription[0],
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

          Buttons.textButton(
            Texts.forgetPassword,
                () => print("hello world"),
          ),

          Buttons.elevatedButton(
            context,
                () => login(authentication, context),
            Texts.authenticationButton[0],
          ),
        ],
      ),
    );
  }
}
