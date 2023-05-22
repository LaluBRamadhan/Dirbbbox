import 'package:cloud_storage/styles/app_styles.dart';
import 'package:cloud_storage/styles/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../misc/Misc.dart';
import 'profile.dart';

class Homepage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    Need misc = Need();

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(
            horizontal: kPaddingHorizontal,
            vertical: kPaddingVertical,
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Your Dribbbox",
                    style: kQuestrialSemibold.copyWith(
                      color: kBlackColor,
                      fontSize: SizeConfig.blockSizeHorizontal! * 6,
                    ),
                  ),
                  SvgPicture.asset('assets/menu_icon.svg'),
                ],
              ),
              const SizedBox(
                height: 40,
              ),
              TextField(
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(kBorderRadius),
                    borderSide: const BorderSide(
                      width: 1,
                      color: kGreyColor,
                    ),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(kBorderRadius),
                    borderSide: const BorderSide(
                      width: 1,
                      color: kGreyColor,
                    ),
                  ),
                  prefixIcon: Container(
                    width: 24,
                    height: 24,
                    alignment: Alignment.center,
                    child: SvgPicture.asset('assets/search_icon.svg'),
                  ),
                  hintText: 'Search Folder',
                  hintStyle: kQuestrialMedium.copyWith(
                    fontSize: SizeConfig.blockSizeHorizontal! * 4,
                    color: kDarkGreyColor,
                  ),
                ),
                style: kQuestrialMedium.copyWith(
                  fontSize: SizeConfig.blockSizeHorizontal! * 4,
                  color: kDarkGreyColor,
                ),
              ),
              SizedBox(
                height: SizeConfig.blockSizeVertical! * 4,
              ),
              Row(
                children: [
                  Text(
                    "Recent",
                    style: kQuestrialSemibold.copyWith(
                      color: kLightBlackColor,
                      fontSize: SizeConfig.blockSizeHorizontal! * 5,
                    ),
                  ),
                  SizedBox(
                    width: SizeConfig.blockSizeHorizontal! * 2,
                  ),
                  SvgPicture.asset('assets/arrow_down_icon.svg'),
                  Expanded(
                    child: Align(
                      alignment: Alignment.bottomRight,
                      child: SvgPicture.asset('assets/sort_icon.svg'),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: SizeConfig.blockSizeVertical! * 6,
              ),
              GridView.builder(
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: SizeConfig.blockSizeHorizontal! * 2,
                  mainAxisSpacing: SizeConfig.blockSizeVertical! * 2,
                  mainAxisExtent: 107,
                ),
                itemCount: misc.folderColor.length,
                itemBuilder: (context, index) {
                  return Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 0.5 * kPaddingHorizontal,
                    ),
                    decoration: BoxDecoration(
                        color: misc.folderColor[index],
                        borderRadius: BorderRadius.circular(kBorderRadius)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SvgPicture.asset(
                                'assets/${misc.folderIconColors[index]}'),
                            SvgPicture.asset(
                                'assets/${misc.moreFolderIconColors[index]}'),
                          ],
                        ),
                        SizedBox(
                          height: SizeConfig.blockSizeVertical! * 1,
                        ),
                        Text(
                          misc.folderNames[index],
                          style: kQuestrialSemibold.copyWith(
                            fontSize: SizeConfig.blockSizeHorizontal! * 4,
                            color: misc.textColor[index],
                          ),
                        ),
                        SizedBox(
                          height: SizeConfig.blockSizeVertical! * 0.3,
                        ),
                        Text(
                          misc.folderDates[index],
                          style: kQuestrialRegular.copyWith(
                            fontSize: SizeConfig.blockSizeHorizontal! * 3,
                            color: misc.textColor[index],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: SizedBox(
        height: 60,
        width: 60,
        child: GestureDetector(
          child: FloatingActionButton(
            onPressed: () {
              Get.to(() => const Profile());
            },
            backgroundColor: kDeepBlueColor,
            child: SvgPicture.asset(
              'assets/arrow_right_icon.svg',
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
