import 'package:cloud_storage/styles/app_styles.dart';
import 'package:cloud_storage/styles/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../misc/Misc.dart';
import 'package:get/get.dart';
import 'home.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    Need misc = Need();
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(
            horizontal: kPaddingHorizontal,
          ),
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              SizedBox(
                height: SizeConfig.blockSizeVertical! * 2,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    child: SvgPicture.asset('assets/arrow_back_icon.svg'),
                    onTap: () => Get.back(),
                  ),
                  Text(
                    "My Profile",
                    style: kQuestrialSemibold.copyWith(
                      color: kBlackColor,
                      fontSize: SizeConfig.blockSizeHorizontal! * 3.5,
                    ),
                  ),
                  SvgPicture.asset('assets/more_horiz_icon.svg'),
                ],
              ),
              SizedBox(
                height: SizeConfig.blockSizeVertical! * 3,
              ),
              Container(
                width: SizeConfig.screenWidth,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(kBorderRadius),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      spreadRadius: 0,
                      offset: const Offset(0, 18),
                      blurRadius: 18,
                      color: kBlackColor.withOpacity(0.06),
                    ),
                  ],
                ),
                padding: EdgeInsets.symmetric(
                  vertical: 19,
                  horizontal: kPaddingHorizontal,
                ),
                child: IntrinsicHeight(
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.centerRight,
                        child: SvgPicture.asset('assets/pro_label.svg'),
                      ),
                      Container(
                        transform: Matrix4.translationValues(0, -18, 0),
                        child: const CircleAvatar(
                          radius: 40,
                          backgroundColor: kLightBlueColor,
                          backgroundImage:
                              AssetImage('assets/images/profile_pic.jpg'),
                        ),
                      ),
                      Text(
                        "Lalu B. Ramadhan",
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: kQuestrialBold.copyWith(
                          color: kBlackColor,
                          fontSize: SizeConfig.blockSizeHorizontal! * 6,
                        ),
                      ),
                      SizedBox(
                        height: SizeConfig.blockSizeVertical! * 1,
                      ),
                      Text(
                        "' PT. Wayen Tedem '",
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: kQuestrialRegular.copyWith(
                          color: kLightBlackColor,
                          fontSize: SizeConfig.blockSizeHorizontal! * 4,
                        ),
                      ),
                      SizedBox(
                        height: SizeConfig.blockSizeVertical! * 1,
                      ),
                      Text(
                        'melet sugih sik kepeng ni hep',
                        maxLines: 3,
                        textAlign: TextAlign.center,
                        overflow: TextOverflow.ellipsis,
                        style: kQuestrialRegular.copyWith(
                          color: kLightBlackColor,
                          fontSize: SizeConfig.blockSizeHorizontal! * 3.5,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: SizeConfig.blockSizeVertical! * 5,
              ),
              Row(
                children: [
                  Text(
                    'My folders',
                    style: kQuestrialSemibold.copyWith(
                      color: kBlackColor,
                    ),
                  ),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        SvgPicture.asset('assets/add_icon.svg'),
                        const SizedBox(
                          width: 28,
                        ),
                        SvgPicture.asset('assets/setting_icon.svg'),
                        const SizedBox(
                          width: 28,
                        ),
                        GestureDetector(
                          child:
                              SvgPicture.asset('assets/arrow_right_icon.svg'),
                          // onTap: () => Get.to(() => TestPage()),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: SizeConfig.blockSizeVertical! * 3,
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
              SizedBox(
                height: SizeConfig.blockSizeVertical! * 6,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Recent uploads",
                    style: kQuestrialSemibold.copyWith(
                      fontSize: 14,
                    ),
                  ),
                  SvgPicture.asset('assets/arrange_vertical_icon.svg'),
                ],
              ),
              SizedBox(
                height: SizeConfig.blockSizeVertical! * 3,
              ),
              ListView.builder(
                shrinkWrap: true,
                itemCount: 14,
                itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.only(
                        bottom: SizeConfig.blockSizeVertical! * 1.5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            CircleAvatar(
                              radius: 20.5,
                              backgroundColor: kLightBlueColor,
                              child: SvgPicture.asset(
                                'assets/word_icon.svg',
                                width: 20,
                              ),
                            ),
                            SizedBox(
                              width: SizeConfig.blockSizeHorizontal! * 2.5,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Kode nuklir.docx',
                                  style: kQuestrialSemibold.copyWith(
                                    fontSize: 12,
                                  ),
                                ),
                                Text(
                                  '${misc.folderDates[index]}',
                                  style: kQuestrialRegular.copyWith(
                                    fontSize: 10,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Text(
                          '300kb',
                          style: kQuestrialRegular.copyWith(
                            fontSize: 10,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
