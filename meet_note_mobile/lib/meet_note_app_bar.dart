import 'package:flutter/material.dart';

import 'color.dart';

class MeetNoteAppBar extends PreferredSize {
  @override
  Widget get child {
    return Container(
      alignment: Alignment.bottomLeft,
      padding: EdgeInsets.symmetric(horizontal: 48),
      child: Row(
        children: [
          Text("20", style: TextStyle(fontSize: 36, color: fontColor)),
          SizedBox(width: 4),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text("JAN", style: TextStyle(fontSize: 14, color: fontColor)),
              Text("2018",
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
