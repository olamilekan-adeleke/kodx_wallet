import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kodx_wallet_mobile/cores/components/custom_text_widget.dart';
import '../../cores/constants/color.dart';
import '../utils/custom_sizer_utils.dart';

class KodTextField extends StatefulWidget {
  const KodTextField({
    Key? key,
    this.textEditingController,
    this.autoCorrect = true,
    required this.hintText,
    this.labelText = '',
    this.validator,
    this.textInputType = TextInputType.text,
    this.isPassword = false,
    this.maxLine = 1,
    this.usePadding = true,
  }) : super(key: key);

  final TextEditingController? textEditingController;
  final bool autoCorrect;
  final String hintText;
  final String labelText;
  final String? Function(String?)? validator;
  final TextInputType textInputType;
  final bool isPassword;
  final bool usePadding;
  final int? maxLine;

  @override
  _KodTextFieldState createState() => _KodTextFieldState();
}

class _KodTextFieldState extends State<KodTextField> {
  final ValueNotifier<bool> obscureText = ValueNotifier<bool>(false);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
      valueListenable: obscureText,
      builder: (BuildContext context, bool value, dynamic child) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            widget.labelText.isEmpty
                ? Container()
                : Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      textWidget(
                        widget.labelText,
                        size: sizerSp(15),
                        fontWeight: FontWeight.w600,
                      ),
                      SizedBox(height: sizerSp(5)),
                    ],
                  ),
            TextFormField(
              maxLines: widget.maxLine,
              cursorColor: kcPrimaryColor,
              style: GoogleFonts.raleway(fontWeight: FontWeight.w400),
              controller: widget.textEditingController,
              autocorrect: widget.autoCorrect,
              autovalidateMode: widget.validator != null
                  ? AutovalidateMode.onUserInteraction
                  : null,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.grey.shade100,
                border: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.transparent),
                  borderRadius: BorderRadius.circular(sizerSp(8.0)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.transparent),
                  borderRadius: BorderRadius.circular(sizerSp(8.0)),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.transparent),
                  borderRadius: BorderRadius.circular(sizerSp(8.0)),
                ),
                disabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.transparent),
                  borderRadius: BorderRadius.circular(sizerSp(8.0)),
                ),
                hintText: widget.hintText,
                hintStyle: TextStyle(
                  color: Colors.grey.shade400,
                  fontWeight: FontWeight.w600,
                ),
                suffixIcon: widget.isPassword == false
                    ? const SizedBox()
                    : IconButton(
                        icon: const Icon(Icons.remove_red_eye_outlined),
                        onPressed: () => obscureText.value = !obscureText.value,
                      ),
              ),
              keyboardType: widget.textInputType,
              obscureText: value,
              validator: (String? val) => widget.validator!(val?.trim()),
            ),
          ],
        );
      },
    );
  }
}
