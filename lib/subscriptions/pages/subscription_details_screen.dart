import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../resources/AppConfigs.dart';
import '../../resources/RoundButtonWidget.dart';
import '../../resources/api_status.dart';
import '../../resources/colors.dart';
import '../../resources/constants.dart';
import '../../resources/styles.dart';
import '../view_models/subscription_vm.dart';

class SubscriptionDetailsScreen extends StatefulWidget {
  const SubscriptionDetailsScreen({Key? key}) : super(key: key);

  @override
  State<SubscriptionDetailsScreen> createState() =>
      _SubscriptionDetailsScreenState();
}

class _SubscriptionDetailsScreenState extends State<SubscriptionDetailsScreen>
    with TickerProviderStateMixin {
  final controller = Get.put(SubscriptionViewModel());

  late TabController tabController;
  var tabIndex = 0;
  @override
  void initState() {
    // TODO: implement initState
    tabController = TabController(vsync: this, length: 2);
    tabController.addListener(() {
      if (tabController.indexIsChanging) {
      }
      // Tab Changed tapping on new tab
      else if (tabController.index != tabController.previousIndex) {
        tabIndex = tabController.index;
      }
      // Tab Changed swiping to a new tab

      // if(tabIndex == 1){
      //   callExamStudentDetailsApi();
      // }else{
      //   callQuestionAnswerAPI();
      // }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: currentTheme.getCurrentTheme() == ThemeMode.dark
          ? Colors.black
          : ColorManager.uiBackgroundColor,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50), // Set this height
        child: AppBar(
          centerTitle: true,
          elevation: 0,
          title: Text(
            'Course Details',
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
          ),
        ),
      ),
      bottomNavigationBar: InkWell(
        onTap: () {},
        child: Container(
          // height: 88,
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(18.0),
            child: RoundButtonWidget(
              loading: false,
              title: 'Cancel Subscription',
              width: Get.width,
              height: 48,
              onPress: () {},
              textColor: Colors.white,
              buttonColor: ColorManager.brandColor,
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                  border: Border.all(color: ColorManager.brandColor),
                  borderRadius: BorderRadius.circular(8),
                  color: currentTheme.getCurrentTheme() == ThemeMode.dark
                      ? Colors.black
                      : ColorManager.uiBackgroundColor),
              child: TabBar(
                labelColor: Colors.white,
                controller: tabController,
                indicatorColor: Colors.transparent,
                unselectedLabelColor: ColorManager.brandColor,
                indicator: BoxDecoration(
                  color: ColorManager.brandColor,
                ),
                tabs: const [
                  Tab(
                    text: 'Subjects',
                  ),
                  Tab(
                    text: 'Subscription Details',
                  ),
                ],
                onTap: (index) {
                  tabIndex = index;
                },
              ),
            ),
            Expanded(
              child: TabBarView(
                controller: tabController,
                children: const [
                  CourseDetails(),
                  SubscriptionDetails(),
                ],
              ),
            ),
          ],
        ),
      ),
    ));
  }
}

class CourseDetails extends StatefulWidget {
  const CourseDetails({super.key});

  @override
  _CourseDetailsState createState() => _CourseDetailsState();
}

class _CourseDetailsState extends State<CourseDetails>
    with AutomaticKeepAliveClientMixin {
  final controller = Get.put(SubscriptionViewModel());

  @override
  Widget build(BuildContext context) {
    print('>>> Build Car Page');
    super.build(context);
    return CustomScrollView(
      slivers: [buildSliverList(controller)],
    );
  }

  @override
  bool get wantKeepAlive => true;

  Obx buildSliverList(SubscriptionViewModel homeController) {
    return Obx(() {
      switch (homeController.rxRequestStatus.value) {
        case ApiStatus.loading:
          return const SliverToBoxAdapter(
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        case ApiStatus.error:
          return const SliverToBoxAdapter(
            child: Center(
              child: Text(MessageConstant.errorMessage),
            ),
          );

        case ApiStatus.completed:
          if (controller
                  .subscriptionDetailsResponse.value.data?.subjects.isBlank ==
              false) {
            return SliverList(
              delegate: SliverChildBuilderDelegate(
                childCount: controller
                    .subscriptionDetailsResponse.value.data?.subjects?.length,
                (context, index) => buildQAListItem(index),
              ),
            );
          } else {
            return const SliverToBoxAdapter(
              child: Center(
                child: Text(MessageConstant.noDataMessage),
              ),
            );
          }
      }
    });
  }

  Widget buildQAListItem(int index) {
    var subject =
        controller.subscriptionDetailsResponse.value.data!.subjects![index]!;

    var pwdWidgets = <Widget>[];
    if (subject.topics?.isEmpty == false) {
      for (var topic in subject.topics!) {
        pwdWidgets.add(
          ListTile(
            leading: const Icon(Icons.radio_button_on_sharp),
            title: Text(topic.name.toString()),
          ),
        ); // TODO: Whatever layout you need foreach widget.
      }
    }

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 0),
      child: Container(
          width: Get.width - 48,
          decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(5)),
              color: currentTheme.getCurrentTheme() == ThemeMode.dark
                  ? ColorManager.darkModeCard
                  : Colors.white),
          child: ExpansionTile(title: Text(subject.name.toString()), children: pwdWidgets)),
    );
  }
}

class SubscriptionDetails extends StatefulWidget {
  const SubscriptionDetails({super.key});

  @override
  _SubscriptionDetailsState createState() => _SubscriptionDetailsState();
}

class _SubscriptionDetailsState extends State<SubscriptionDetails>
    with AutomaticKeepAliveClientMixin {

  final controller = Get.put(SubscriptionViewModel());


  @override
  Widget build(BuildContext context) {

    var data = controller.subscriptionDetailsResponse.value.data!;
    print('>>> Build Car Page');
    super.build(context);
    return CustomScrollView(
      slivers: [
        SliverPadding(padding: EdgeInsets.all(16)),
        SliverToBoxAdapter(
          child: Column(
            children: [
              ///plan
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Plan',
                    // style: getTextStyle(14, FontWeight.w400,
                    //     ColorManager.brandColor),
                  ),
                  Text(
                    data.planName.toString(),
                    style: getTextStyle(
                        14, FontWeight.w400, ColorManager.brandColor),
                  ),
                ],
              ),
              SizedBox(height: 8),

              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Subscription Code',
                    // style: getTextStyle(14, FontWeight.w400,
                    //     ColorManager.brandColor),
                  ),
                  Text(
                    data.subscriptionCode.toString(),
                    // style: getTextStyle(
                    //     14, FontWeight.w400, ColorManager.brandColor),
                  ),
                ],
              ),
              SizedBox(height: 8),

              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Amount',
                    // style: getTextStyle(
                    //     14, FontWeight.w400, ColorManager.brandColor),
                  ),
                  Text(
                    getCurrency() + data.planAmount.toString(),
                    // style: getTextStyle(14, FontWeight.w400,
                    //     ColorManager.brandColor),
                  ),
                ],
              ),
              SizedBox(height: 8),

              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Intervel',
                    // style: getTextStyle(14, FontWeight.w400,
                    //     ColorManager.brandColor),
                  ),
                  Text(
                    'Annually',
                    // style: getTextStyle(14, FontWeight.w400,
                    //     ColorManager.brandColor),
                  ),
                ],
              ),
              SizedBox(height: 8),

              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Subscribed On',
                    // style: getTextStyle(14, FontWeight.w400,
                    //     ColorManager.brandColor),
                  ),
                  if(data.subscribedOn != null)Text(
                    DateFormat.yMMMMd().format(data.subscribedOn!),
                    // style: getTextStyle(14, FontWeight.w400,
                    //     ColorManager.brandColor),
                  ),
                ],
              ),
              SizedBox(height: 8),



              if(data.isActive == 1)Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Status',
                    // style: getTextStyle(
                    //     14, FontWeight.w400, ColorManager.brandColor),
                  ),
                  Text(
                    'Active',
                    style:
                        getTextStyle(14, FontWeight.w400, ColorManager.green),
                  ),
                ],
              ),
              SizedBox(height: 8),
            ],
          ),
        )
      ],
    );
  }

  @override
  bool get wantKeepAlive => true;
}
