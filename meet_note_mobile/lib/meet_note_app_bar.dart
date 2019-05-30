import 'package:flutter/material.dart';

import 'color.dart';

class MeetNoteAppBar extends PreferredSize {
  final String day;
  final String month;
  final String year;

  MeetNoteAppBar({
    @required this.day,
    @required this.month,
    @required this.year,
  });

  @override
  Widget get child {
    return Container(
      alignment: Alignment.bottomLeft,
      padding: EdgeInsets.symmetric(horizontal: 48),
      child: Row(
        children: [
          Text(day, style: TextStyle(fontSize: 36, color: fontColor)),
          SizedBox(width: 4),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(month, style: TextStyle(fontSize: 14, color: fontColor)),
              Text(year,
                  style:
                      TextStyle(fontSize: 14, color: fontColor.withOpacity(.5)))
            ],
          )
        ],
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(88);
}
