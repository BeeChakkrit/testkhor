import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_2/style/palette.dart';
import 'package:flutter_application_2/style/textstyle.dart';
import 'package:flutter_application_2/widget/mywidget.dart';

// class MyTextFormField extends StatelessWidget {
//   final String? hintText, labelText;
//   final TextEditingController? textEditingController;
//   final bool readOnly;
//   const MyTextFormField({
//     Key? key,
//     this.hintText,
//     this.textEditingController,
//     this.readOnly = false,
//     this.labelText,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       mainAxisAlignment: MainAxisAlignment.end,
//       children: [
//         TextFormField(
//             controller: textEditingController,
//             decoration: InputDecoration(
//               hintText: hintText,
//               hintStyle: readOnly
//                   ? const TextStyle(color: Colors.black54, fontSize: 13)
//                   : MyTextStyle.textHisText,
//             )),
//       ],
//     );
//   }
// }

class MyTextFormField1 extends StatelessWidget {
  final String? hintText, labelText;
  final Icon? prefixIcon;
  final bool obscureText;
  final bool readOnly;
  final Function()? onTab;
  final Function(String)? onFieldSubmitted;
  final String? Function(String?)? validator;
  final Function(String)? onChanged;
  final TextEditingController? textEditingController;
  final Function(bool)? onFocusChange;

  const MyTextFormField1({
    Key? key,
    this.hintText,
    this.prefixIcon,
    this.obscureText = false,
    this.onTab,
    this.textEditingController,
    this.readOnly = false,
    this.labelText,
    this.onChanged,
    this.validator,
    this.onFocusChange,
    this.onFieldSubmitted,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Column(
          children: [
            Text(labelText ?? ''),
            MyWidget.mySizedBox(size: 3, type: 'h'),
          ],
        ),
        SizedBox(
          //height: 50,
          //alignment: Alignment.center,
          //color: const Color(0xffc6c9cb),
          child: Focus(
            onFocusChange: onFocusChange,
            child: TextFormField(
              readOnly: readOnly,
              controller: textEditingController,
              onFieldSubmitted: onFieldSubmitted,
              obscureText: obscureText,
              onTap: onTab,
              onChanged: onChanged,
              validator: validator,
              decoration: InputDecoration(
                //labelText: labelText,
                prefixIcon: prefixIcon,
                errorStyle:
                    const TextStyle(fontSize: 11, color: Colors.redAccent),
                filled: readOnly,
                fillColor: readOnly == true ? const Color(0xffc6c9cb) : null,
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                hintText: hintText,
                hintStyle: readOnly
                    ? const TextStyle(color: Colors.black54, fontSize: 13)
                    : MyTextStyle.textHisText,
                labelStyle: readOnly
                    ? const TextStyle(
                        color: Colors.black54,
                      )
                    : MyTextStyle.textHisText,
                focusedBorder: readOnly
                    ? const OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0xffc6c9cb),
                        ),
                      )
                    : const OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Palette.kToDark,
                        ),
                      ),
                enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Color(0xffc6c9cb),
                  ),
                ),
                border: readOnly
                    ? const OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0xffc6c9cb),
                        ),
                      )
                    : const OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Palette.kToDark,
                        ),
                      ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

// class MyFormFieldInTable extends StatelessWidget {
//   final String? hintText, labelText;
//   final Icon? prefixIcon;
//   final bool obscureText;
//   final TextAlign? textAlign;
//   final bool readOnly;
//   final Function()? onTab;
//   final Function(bool)? onFocusChange;
//   final String? Function(String?)? validator;
//   final Function(String)? onChanged;
//   final TextInputType? keyboardType;
//   final TextEditingController? textEditingController;

//   const MyFormFieldInTable({
//     Key? key,
//     this.hintText,
//     this.prefixIcon,
//     this.obscureText = false,
//     this.onTab,
//     this.textEditingController,
//     this.readOnly = false,
//     this.labelText,
//     this.onChanged,
//     this.validator,
//     this.textAlign,
//     this.onFocusChange,
//     this.keyboardType,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       //height: 50,
//       //alignment: Alignment.center,
//       //color: const Color(0xffc6c9cb),
//       child: Focus(
//         onFocusChange: onFocusChange,
//         child: TextFormField(
//           readOnly: readOnly,
//           controller: textEditingController,
//           obscureText: obscureText,
//           onTap: onTab,
//           onChanged: onChanged,
//           keyboardType: keyboardType,
//           validator: validator,
//           textAlign: textAlign ?? TextAlign.right,
//           decoration: InputDecoration(
//             //labelText: labelText,
//             prefixIcon: prefixIcon,
//             errorStyle: const TextStyle(fontSize: 11, color: Colors.redAccent),
//             filled: readOnly,
//             fillColor: readOnly == true ? const Color(0xffc6c9cb) : null,
//             contentPadding:
//                 const EdgeInsets.symmetric(horizontal: 5, vertical: 0),
//             hintText: hintText,
//             hintStyle: readOnly
//                 ? const TextStyle(color: Colors.black, fontSize: 13)
//                 : MyTextStyle.textHisText,
//             labelStyle: readOnly
//                 ? const TextStyle(
//                     color: Colors.black54,
//                   )
//                 : MyTextStyle.textHisText,
//             focusedBorder: readOnly
//                 ? const OutlineInputBorder(
//                     borderSide: BorderSide(
//                       color: Color(0xffc6c9cb),
//                     ),
//                   )
//                 : const OutlineInputBorder(
//                     borderSide: BorderSide(
//                       color: Palette.kToDark,
//                     ),
//                   ),
//             enabledBorder: const OutlineInputBorder(
//               borderSide: BorderSide(
//                 color: Color(0xffc6c9cb),
//               ),
//             ),
//             border: readOnly
//                 ? const OutlineInputBorder(
//                     borderSide: BorderSide(
//                       color: Color(0xffc6c9cb),
//                     ),
//                   )
//                 : const OutlineInputBorder(
//                     borderSide: BorderSide(
//                       color: Palette.kToDark,
//                     ),
//                   ),
//           ),
//         ),
//       ),
//     );
//   }
// }

// class MyTextFormFieldMaxLines extends StatelessWidget {
//   final String? hintText, labelText;
//   final Icon? prefixIcon;
//   final bool obscureText;
//   final int? maxLines;
//   final bool readOnly;
//   final Function()? onTab;
//   final TextEditingController? textEditingController;

//   const MyTextFormFieldMaxLines({
//     Key? key,
//     this.hintText,
//     this.prefixIcon,
//     this.obscureText = false,
//     this.onTab,
//     this.textEditingController,
//     this.readOnly = false,
//     this.maxLines,
//     this.labelText,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       mainAxisAlignment: MainAxisAlignment.end,
//       children: [
//         Column(
//           children: [
//             Text(labelText ?? ''),
//             MyWidget.mySizedBox(size: 4, type: 'h'),
//           ],
//         ),
//         TextFormField(
//           readOnly: readOnly,
//           maxLines: maxLines,
//           controller: textEditingController,
//           obscureText: obscureText,
//           onTap: onTab,
//           decoration: InputDecoration(
//             //labelText: labelText,
//             prefixIcon: prefixIcon,
//             filled: readOnly,
//             fillColor: readOnly == true ? const Color(0xffc6c9cb) : null,
//             /* contentPadding:
//                   const EdgeInsets.symmetric(horizontal: 8, vertical: 5),*/
//             hintText: hintText,
//             hintStyle: readOnly
//                 ? const TextStyle(
//                     color: Colors.black54,
//                   )
//                 : MyTextStyle.textHisText,
//             labelStyle: readOnly
//                 ? const TextStyle(
//                     color: Colors.black54,
//                   )
//                 : MyTextStyle.textHisText,
//             focusedBorder: readOnly
//                 ? const OutlineInputBorder(
//                     borderSide: BorderSide(
//                       color: Color(0xffc6c9cb),
//                     ),
//                   )
//                 : const OutlineInputBorder(
//                     borderSide: BorderSide(
//                       color: Palette.kToDark,
//                     ),
//                   ),
//             enabledBorder: const OutlineInputBorder(
//               borderSide: BorderSide(
//                 color: Color(0xffc6c9cb),
//               ),
//             ),
//             border: readOnly
//                 ? const OutlineInputBorder(
//                     borderSide: BorderSide(
//                       color: Color(0xffc6c9cb),
//                     ),
//                   )
//                 : const OutlineInputBorder(
//                     borderSide: BorderSide(
//                       color: Palette.kToDark,
//                     ),
//                   ),
//           ),
//         ),
//       ],
//     );
//   }
// }

