import 'package:almubarok_present/controllers/text_form_field_controller.dart';
import 'package:almubarok_present/resources/resources.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class TextFormFieldWidget extends StatelessWidget {
  const TextFormFieldWidget({
    super.key,
    required this.titleForm,
    this.textEditingController,
    required this.isPassword,
    this.readOnly,
    this.initialValue,
    this.maxLines,
    this.isTanggal,
    this.onTapTanggal,
  });

  final String titleForm;
  final TextEditingController? textEditingController;
  final bool isPassword;
  final bool? readOnly;
  final String? initialValue;
  final int? maxLines;
  final bool? isTanggal;
  final void Function()? onTapTanggal;

  @override
  Widget build(BuildContext context) {
    TextFormFieldController controller = Get.put(
      TextFormFieldController(),
      tag: titleForm,
    );

    return Obx(
      () {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              titleForm,
              style: TextStyleApp.bodyTextBold.copyWith(
                color: controller.getTextFieldColor(
                  defaultColor: ColorApp.black,
                  focusedColor: ColorApp.colorPrimary,
                  errorColor: ColorApp.red,
                ),
              ),
            ),
            SizedBox(
              height: 1.5.h,
            ),
            Focus(
              onFocusChange: (focus) {
                controller.handleFocus(focus);
              },
              child: TextFormField(
                maxLines: maxLines ?? 1,
                controller: textEditingController,
                initialValue: initialValue,
                style: TextStyleApp.bodyTextSmall.copyWith(
                  color: ColorApp.black,
                  fontWeight: FontWeight.normal,
                ),
                keyboardType: titleForm == 'Email'
                    ? TextInputType.emailAddress
                    : TextInputType.text,
                onChanged: (value) {
                  controller.validator(value);
                },
                readOnly: readOnly ?? false,
                obscureText: isPassword ? controller.obsecureText.value : false,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.all(16),
                  hintText: titleForm,
                  hintStyle: TextStyleApp.bodyTextSmall,
                  errorText: controller.errorText.value,
                  suffixIcon: isPassword
                      ? IconButton(
                          onPressed: () {
                            controller.obsecureText.value =
                                !controller.obsecureText.value;
                          },
                          icon: Icon(
                            controller.obsecureText.value
                                ? Icons.visibility
                                : Icons.visibility_off,
                          ),
                        )
                      : isTanggal == true
                          ? IconButton(
                              onPressed: onTapTanggal,
                              icon: Icon(
                                Icons.calendar_month,
                              ),
                            )
                          : null,
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(
                      color: ColorApp.grey,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(
                      color: ColorApp.colorPrimary,
                    ),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(
                      color: ColorApp.red,
                    ),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(
                      color: ColorApp.red,
                    ),
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
