import 'package:currency_symbols/currency_symbols.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../resources/AppConfigs.dart';
import '../../../resources/RoundButtonWidget.dart';
import '../../../resources/colors.dart';
import '../../../resources/constants.dart';
import '../../../resources/styles.dart';

class EshopDetails extends StatefulWidget {
  const EshopDetails({super.key});

  @override
  _EshopDetailsState createState() => _EshopDetailsState();
}

class _EshopDetailsState extends State<EshopDetails>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    print('>>> Build Car Page');
    super.build(context);
    return Scaffold(
      backgroundColor: currentTheme.getCurrentTheme() == ThemeMode.dark
          ? Colors.black
          : ColorManager.uiBackgroundColor,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(200), // Set this height
        child: AppBar(
          centerTitle: true,
          elevation: 0,
          title: Text(
            'Details',
            style: getTextStyle(16, FontWeight.w600, Colors.white),
          ),
          flexibleSpace: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.fill,
                  image: AssetImage(AssetConstant.threeCircleIcon)),
              // gradient: LinearGradient(colors: [
              //   HexColor.fromHex("#F0478C"),
              //   HexColor.fromHex("#CC0B5A"),
              // ]),
            ),
            child: Column(
              children: [
                sizeVer(90),
                Text(
                  'UTME JAMB', style: TextStyle(fontSize: 20),
                  // style: getTextStyle(16, FontWeight.w600, Colors.white),
                ),
                Text(
                  'CONTAINS FOLLOWING UTME JAMB SUBJECTS',
                  style: TextStyle(fontSize: 14),
                  // style: getTextStyle(16, FontWeight.w600, Colors.white),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: InkWell(
        onTap: () {},
        child: Container(
          color: Colors.white,height: 80,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Choose Subscription',style:
                  getTextStyle(12, FontWeight.normal, Colors.black),),
                  Row(
                    children: [
                      Text(getCurrency(),
                        style:
                        TextStyle(color: ColorManager.blueTextColor)
                      ),
                      Text(
                        '250/1 Year',
                        style:
                            getTextStyle(16, FontWeight.w600, ColorManager.blueTextColor),
                      ),
                    ],
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: RoundButtonWidget(
                  loading: false,
                  title: 'Buy Now',
                  width: Get.width / 2,
                  height: 48,
                  onPress: () {},
                  textColor: Colors.white,
                  buttonColor: ColorManager.brandColor,
                ),
              ),
            ],
          ),
        ),
      ),
      body: CustomScrollView(
        slivers: [buildSliverList()],
      ),
    );
  }

  buildSliverList() {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        childCount: 10,
        (context, index) => buildQAListItem(index),
      ),
    );
  }

  Widget buildQAListItem(int index) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 0),
      child: Container(
          width: Get.width - 48,
          decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(5)),
              color: currentTheme.getCurrentTheme() == ThemeMode.dark
                  ? ColorManager.darkModeCard
                  : Colors.white),
          child: ExpansionTile(
              title: Text('ACCOUNTS/PRINCIPLES OF ACCOUNTS'),
              children: [
                ListTile(
                  leading: Icon(Icons.radio_button_on_sharp),
                  title: Text('NATURE AND SIGNIFICANCE OF ACCOUNTING'),
                ),
                ListTile(
                  leading: Icon(Icons.radio_button_on_sharp),
                  title: Text('PRINCIPLES OF DOUBLE ENTY'),
                ),
                ListTile(
                  leading: Icon(Icons.radio_button_on_sharp),
                  title: Text('ETHICS IN ACCOUNTING'),
                ),
              ])),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
