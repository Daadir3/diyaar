import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/onboarding_controller.dart';
import '../utils/app_colors.dart';
import '../utils/app_text_styles.dart';
import 'home_view.dart'; // 👈 Home screen import (hubi path-ka)

class OnboardingView extends GetView<OnboardingController> {
  const OnboardingView({super.key});

  @override
  Widget build(BuildContext context) {
    final pages = [
      {
        "image": "assets/images/page1.png",
        "title1": "Discover ",
        "title2": "and Find Your Perfect ",
        "title3": "Dream House",
        "desc":
            "App to search and discover the most suitable place for you to stay.",
      },
      {
        "image": "assets/images/page1.png",
        "title1": "Find ",
        "title2": "Your Perfect Home ",
        "title3": "With Us Today",
        "desc": "State management made easy with GetX".tr,
      },
      {
        "image": "assets/images/page2.png",
        "title1": "Discover Properties ",
        "title2": "Using the Map",
        "title3": null,
        "desc": "Fast and reactive app with GetX".tr,
      },
      {
        "image": "assets/images/page3.png",
        "title1": "Arrange Tours ",
        "title2": "To View Properties",
        "title3": null,
        "desc": "Switch between languages dynamically".tr,
      },
    ];

    return Scaffold(
      body: PageView.builder(
        controller: controller.pageController,
        onPageChanged: controller.updatePage,
        itemCount: pages.length,
        itemBuilder: (_, index) {
          final page = pages[index];
          return Stack(
            children: [
              Padding(
                padding: const EdgeInsets.all(24),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(page['image'] as String, height: 300),
                    const SizedBox(height: 40),

                    if (index == 0) ...[
                      RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: page['title1'] as String? ?? "",
                              style: AppTextStyles.subHeading.copyWith(
                                color: AppColors.org,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            TextSpan(
                              text: page['title2'] as String? ?? "",
                              style: AppTextStyles.subHeading.copyWith(
                                color: Colors.black,
                              ),
                            ),
                            TextSpan(
                              text: page['title3'] as String? ?? "",
                              style: AppTextStyles.subHeading.copyWith(
                                color: AppColors.org,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        page['desc'] as String? ?? "",
                        textAlign: TextAlign.center,
                        style: AppTextStyles.body.copyWith(
                          color: Colors.black54,
                        ),
                      ),
                      const SizedBox(height: 32),

                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.org,
                            padding: const EdgeInsets.symmetric(vertical: 14),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          onPressed: () => controller.nextPage(),
                          child: Text(
                            "Let’s Get Started",
                            style: AppTextStyles.button.copyWith(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Already have an account? ",
                            style: AppTextStyles.body,
                          ),
                          GestureDetector(
                            onTap: () {},
                            child: Text(
                              "Sign In",
                              style: AppTextStyles.body.copyWith(
                                color: AppColors.org,
                                fontWeight: FontWeight.bold,
                                decoration:
                                    TextDecoration.underline, // 👈 underline
                              ),
                            ),
                          ),
                        ],
                      ),
                    ] else ...[
                      RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: page['title1'] as String? ?? "",
                              style: AppTextStyles.subHeading.copyWith(
                                color:
                                    AppColors
                                        .customBlue, // 👈 hadda org ayaa loo adeegsaday
                                fontWeight: FontWeight.bold,
                              ),
                            ),

                            TextSpan(
                              text: page['title2'] as String? ?? "",
                              style: AppTextStyles.subHeading.copyWith(
                                color: AppColors.org,
                              ),
                            ),
                            TextSpan(
                              text: page['title3'] as String? ?? "",
                              style: AppTextStyles.subHeading.copyWith(
                                color: AppColors.customBlue,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 12),
                      Text(
                        page['desc'] as String? ?? "",
                        textAlign: TextAlign.center,
                        style: AppTextStyles.body.copyWith(
                          color: AppColors.customBlue,
                        ),
                      ),
                    ],
                  ],
                ),
              ),

              // 👇 Skip button saxan
              Positioned(
                top: 50,
                right: 16,
                child: Obx(() {
                  return controller.currentPage.value == 0
                      ? const SizedBox.shrink()
                      : GestureDetector(
                        onTap: () {
                          Get.offAllNamed('/');
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 6,
                          ),
                          // decoration: BoxDecoration(
                          //   color: Colors.white.withOpacity(0.8),
                          //   borderRadius: BorderRadius.circular(20),
                          // ),
                          child: Text(
                            "Skip",
                            style: AppTextStyles.body.copyWith(
                              color: AppColors.customBlue,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      );
                }),
              ),
            ],
          );
        },
      ),
      bottomNavigationBar: Obx(() {
        if (controller.currentPage.value == 0) return const SizedBox.shrink();

        return Padding(
          padding: const EdgeInsets.all(20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // 👈 Back arrow (stroke color)
              controller.currentPage.value > 0
                  ? GestureDetector(
                    onTap: controller.previousPage,
                    child: Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        color: Colors.transparent, // 👈 background transparent
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: AppColors.customBlue, // 👈 stroke color
                          width: 2, // 👈 stroke width
                        ),
                      ),
                      child: const Icon(
                        Icons.arrow_back_outlined,
                        color:
                            AppColors.customBlue, // arrow color same as stroke
                      ),
                    ),
                  )
                  : const SizedBox(width: 48),

              // 👈 Page indicators
              Row(
                children: List.generate(pages.length - 1, (index) {
                  final realIndex = index + 1;
                  return Container(
                    margin: const EdgeInsets.symmetric(horizontal: 3),
                    width: 10,
                    height: 10,
                    decoration: BoxDecoration(
                      color:
                          controller.currentPage.value == realIndex
                              ? AppColors
                                  .customBlue // active
                              : AppColors.textSecondary.withOpacity(
                                0.4,
                              ), // inactive
                      shape: BoxShape.circle,
                    ),
                  );
                }),
              ),

              // 👈 Next / Finish Arrow (stroke + background)
              // 👈 Next / Finish Arrow (stroke + background)
              GestureDetector(
                onTap: () {
                  if (controller.currentPage.value == pages.length - 1) {
                    controller.finishOnboarding();
                  } else {
                    controller.nextPage();
                  }
                },
                child: Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.transparent, // 👈 background transparent
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: AppColors.customBlue, // 👈 stroke color
                      width: 2, // 👈 stroke width
                    ),
                  ),

                  child: const Icon(
                    Icons.arrow_forward_outlined,
                    color: AppColors.customBlue, // arrow color
                  ),
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}
