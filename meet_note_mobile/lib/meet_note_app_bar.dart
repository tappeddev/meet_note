import 'package:flutter/material.dart';

class MeetNoteAppBar extends PreferredSize {
  @override
  Widget get child => Container(
        alignment: Alignment.bottomLeft,
        padding: EdgeInsets.symmetric(horizontal: 48),
        child: Row(
          children: [
            Text("20", style: TextStyle(fontSize: 32)),
            SizedBox(width: 4),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text("JAN", style: TextStyle(fontSize: 14)),
                Text("2018", style: TextStyle(fontSize: 14))
              ],
            )
          ],
        ),
      );

  @override
  Size get preferredSize => Size.fromHeight(88);
}
