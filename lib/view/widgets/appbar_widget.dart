import 'package:flutter/material.dart';
import 'package:siteplan_asc_testcase/view/shared/global.dart';

class AppBarWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0.0,
      backgroundColor: Global.grey,
      bottom: PreferredSize(
        preferredSize: Size.zero,
        child: Column(
          children: [
            Text(
              'Site Plan Perumahan',
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w900,
                  fontSize: 16.0),
            ),
            Icon(
              Icons.arrow_drop_down_circle_outlined,
              color: Colors.white,
            ),
            SizedBox(
              height: 15,
            )
          ],
        ),
      ),
    );
  }
}
