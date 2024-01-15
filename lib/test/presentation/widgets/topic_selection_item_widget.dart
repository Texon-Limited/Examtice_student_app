
import 'package:examtice_teacher/exam/models/topic_list_response.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../resources/colors.dart';

class TopicSelectionItem extends StatefulWidget {
  final Key key;
  final TopicDatum item;
  final Widget child;
  final ValueChanged<bool> isSelectedCallBack;

  TopicSelectionItem(
      {required this.isSelectedCallBack,
        required this.key,
        required this.child,
        required this.item});

  @override
  State<TopicSelectionItem> createState() => _TopicSelectionItemState();
}

class _TopicSelectionItemState extends State<TopicSelectionItem> {
  bool isSelected = true;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          isSelected = !isSelected;
          widget.isSelectedCallBack(isSelected);
        });
        // widget.isSelectedCallBack(isSelected);
      },
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.start,crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          isSelected
              ? Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(
              Icons.check_box,
              color: ColorManager.brandColor,
              size: 16,
            ),
          )
              : Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(
              Icons.check_box_outline_blank,
              color: ColorManager.brandColor,
              size: 16,
            ),
          ),
          widget.child,
        ],
      ),
    );
  }
}