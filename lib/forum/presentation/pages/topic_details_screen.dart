import 'package:examtice_teacher/forum/view_models/forum_controller_vm.dart';
import 'package:examtice_teacher/resources/colors.dart';
import 'package:examtice_teacher/resources/constants.dart';
import 'package:examtice_teacher/resources/styles.dart';
import 'package:examtice_teacher/resources/utis.dart';
import 'package:examtice_teacher/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../../../resources/AppConfigs.dart';
import '../../../resources/RoundButtonWidget.dart';


class TopicDetailsScreen extends GetView<ForumDetailsViewModel>{
  const TopicDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size(100, MediaQuery.of(context).size.width,),
          child: Flexible(
            child: Container(
              padding: const EdgeInsets.only(top: 20, left: 15, right: 15,),
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/Profile.png'),
                  fit: BoxFit.cover,
                ),
              ),
              child: Obx(() => Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        child: const Icon(Icons.arrow_back, color: Colors.white,),
                        onTap: (){
                          Get.back();
                        },
                      ),
                      const Text('Topics Details', style: TextStyle(fontSize: 19, color: Colors.white,),),
                      InkWell(
                        child: const Icon(Icons.arrow_back, color: Colors.transparent,),
                        onTap: (){},
                      ),
                    ],
                  ),
                  const SizedBox(height: 18,),
                  const Text('Math is a tough Subject', style: TextStyle(fontSize: 16, color: Colors.white,),),
                  const SizedBox(height: 10,),
                  buildText('I am currently a PhD student in mathematics and '
                      'I have done a lot of tutoring/teaching math over my college career. '
                      'One of the biggest issues that I’ve noticed in my classmates and students that '
                      'struggle with math is this: They view math as memorizing a bunch of formulas and applying them. '
                      'This is often how they were taught, and it’s horrible! To show the difference, '
                      'let me give an example of the two ways that a simple concept can be taught',
                  ),
                  controller.isExpanded.value
                      ? const Padding(
                        padding: EdgeInsets.only(top: 12.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('by Abraham', style: TextStyle(fontSize: 13, color: Colors.white,),),
                            Text('23 july, 2022', style: TextStyle(fontSize: 13, color: Colors.white,),),
                          ],
                        ),
                      )
                      : const SizedBox(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextButton(
                        onPressed: (){
                          controller.isExpanded.value = !controller.isExpanded.value;
                        },
                        child: controller.isExpanded.value
                            ? SvgPicture.asset('assets/icons/arrow_up.svg')
                            : SvgPicture.asset('assets/icons/arrow_down.svg'),
                      ),
                    ],
                  ),
                ],
              ),),
            ),
          ),
        ),
        body: Obx(
          () => Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              sizeVer(10),
              Expanded(
                child: ListView.builder(
                  itemCount: 10,
                  shrinkWrap: true,
                  reverse: true,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: const EdgeInsets.all(5.0),
                      child: Row(
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Container(
                                height: 50,
                                width: 50,
                                decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    image: DecorationImage(
                                      image: NetworkImage(
                                          'https://th.bing.com/th/id/OIP.Mk5abz3tVMVyy17HXjmorAHaFj?w=2560&h=1920&rs=1&pid=ImgDetMain'),
                                      fit: BoxFit.cover,
                                    )),
                              ),
                              sizeVer(5),
                            ],
                          ),
                          sizeHor(10),
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Flexible(
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 10.0,
                                    vertical: 10.0,
                                  ),
                                  decoration: const BoxDecoration(
                                    color: Color(0xffF12679),
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(10.0),
                                      topRight: Radius.circular(10.0),
                                      bottomRight: Radius.circular(10.0),
                                    ),
                                  ),
                                  child: const Text('Hello', style: TextStyle(color: Colors.white,),),
                                ),
                              ),
                              sizeVer(3),
                              const Text('5 minute ago', style: TextStyle(fontSize: 9, color: Colors.grey,),),
                            ],
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(
                  14.0,
                ),
                child: Container(
                  width: MediaQuery.of(context).size.width - 28,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.grey.withOpacity(0.15),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 7),
                    child: TextFormField(
                      controller: controller.messageTextEditingController.value,
                      keyboardType: TextInputType.multiline,
                      minLines: 1,
                      maxLines: 4,
                      onChanged: (value) {
                        controller.messageTextEditingController.value.text =
                            value;
                      },
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.only(top: 14.5),
                        suffixIcon: InkWell(
                          onTap: () {
                            controller.messageTextEditingController.value
                                .clear();
                          },
                          child: Icon(
                            Icons.send,
                            color:
                                controller.messageTextEditingController.value ==
                                        ''
                                    ? Colors.grey
                                    : const Color(0xffF12679),
                            size: 30,
                          ),
                        ),
                        prefixIcon: InkWell(
                          onTap: () {
                            controller.messageTextEditingController.value
                                .clear();
                          },
                          child: const Icon(
                            Icons.emoji_emotions_outlined,
                            color: Colors.grey,
                            size: 30,
                          ),
                        ),
                        border: InputBorder.none,
                        filled: false,
                        hintStyle: const TextStyle(
                          color: Colors.grey,
                          fontSize: 15,
                        ),
                        hintText: 'Enter message',
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  Widget buildText(String text){
    final lines = controller.isExpanded.value ? null : 2;
    return Text(
      text,
      maxLines: lines,
      overflow: controller.isExpanded.value ? TextOverflow.visible: TextOverflow.clip,
      style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w300, color: Colors.white,),
    );
  }
}

