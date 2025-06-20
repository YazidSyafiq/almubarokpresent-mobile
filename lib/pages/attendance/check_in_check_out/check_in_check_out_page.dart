import 'package:almubarok_present/controllers/check_in_check_out_controller.dart';
import 'package:almubarok_present/resources/resources.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class CheckInCheckOutPage extends StatelessWidget {
  const CheckInCheckOutPage({
    super.key,
    required this.check,
  });
  final String check;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CheckInCheckOutController>(
      builder: (controller) {
        return Scaffold(
          body: Obx(
            () {
              if (!controller.isCameraReady.value) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                if (controller.cameraController?.value.isInitialized ?? false) {
                  return Stack(
                    children: [
                      Positioned(
                        top: 0,
                        left: 0,
                        width: 100.w,
                        height: 100.h,
                        child: AspectRatio(
                          aspectRatio:
                              controller.cameraController!.value.aspectRatio,
                          child: CameraPreview(
                            controller.cameraController!,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 100.w,
                        height: 100.h,
                        child: controller.buildResult(),
                      ),
                      Positioned(
                        top: 3.h,
                        left: 24,
                        right: 24,
                        child: Center(
                          child: SafeArea(
                            child: Container(
                              width: double.infinity,
                              height: 50,
                              padding: EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                color: controller.isRecognized.value
                                    ? ColorApp.green
                                    : ColorApp.red,
                                borderRadius: BorderRadius.circular(
                                  10,
                                ),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Icon(
                                    controller.isRecognized.value
                                        ? Icons.verified
                                        : Icons.cancel_rounded,
                                    color: ColorApp.white,
                                  ),
                                  SizedBox(
                                    width: 2.w,
                                  ),
                                  Text(
                                    controller.faceStatusMessage.value,
                                    style: TextStyleApp.bodyTextBold.copyWith(
                                      fontSize: 11,
                                      color: ColorApp.white,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 5.h,
                        left: 16,
                        right: 16,
                        child: Column(
                          children: [
                            Visibility(
                              visible: controller.isRecognized.value,
                              child: Column(
                                children: [
                                  Container(
                                    height: 50,
                                    padding: EdgeInsets.symmetric(
                                      vertical: 8,
                                      horizontal: 16,
                                    ),
                                    decoration: BoxDecoration(
                                      color: controller.isRecognized.value
                                          ? ColorApp.green
                                          : ColorApp.red,
                                      borderRadius: BorderRadius.circular(
                                        10,
                                      ),
                                    ),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Text(
                                          'Klik tombol di bawah untuk $check!',
                                          style: TextStyleApp.bodyTextBold
                                              .copyWith(
                                            fontSize: 11,
                                            color: ColorApp.white,
                                          ),
                                        ),
                                        SizedBox(
                                          width: 2.w,
                                        ),
                                        Icon(
                                          Icons.arrow_drop_down_circle_rounded,
                                          color: ColorApp.white,
                                        )
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 2.h,
                                  ),
                                ],
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                InkWell(
                                  onTap: () {
                                    controller.reverseCamera();
                                  },
                                  borderRadius: BorderRadius.circular(15),
                                  child: Container(
                                    width: 15.w,
                                    height: 15.w,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: ColorApp.white,
                                        width: 2,
                                      ),
                                      borderRadius: BorderRadius.circular(
                                        15,
                                      ),
                                    ),
                                    child: Center(
                                      child: Icon(
                                        Icons.repeat,
                                        size: 30,
                                        color: ColorApp.white,
                                      ),
                                    ),
                                  ),
                                ),
                                Center(
                                  child: InkWell(
                                    onTap: () {
                                      controller.submitAttend();
                                    },
                                    borderRadius: BorderRadius.circular(100),
                                    child: Container(
                                      width: 20.w,
                                      height: 20.w,
                                      decoration: BoxDecoration(
                                        color: controller.isRecognized.value
                                            ? ColorApp.green
                                            : ColorApp.red,
                                        borderRadius: BorderRadius.circular(
                                          100,
                                        ),
                                      ),
                                      child: Center(
                                        child: Icon(
                                          Icons.fingerprint,
                                          size: 50,
                                          color: ColorApp.white,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  width: 15.w,
                                  height: 15.w,
                                  decoration: BoxDecoration(
                                    color: Colors.transparent,
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      )
                    ],
                  );
                } else {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
              }
            },
          ),
        );
      },
    );
  }
}
