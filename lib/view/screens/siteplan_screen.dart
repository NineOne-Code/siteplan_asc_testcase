import 'package:flutter/material.dart';
import 'package:siteplan_asc_testcase/view/shared/global.dart';
import 'package:siteplan_asc_testcase/view/widgets/appbar_widget.dart';
import 'package:siteplan_asc_testcase/view/widgets/bottom_widget.dart';
import 'package:siteplan_asc_testcase/view/widgets/button_help_widget.dart';
import 'package:siteplan_asc_testcase/view/widgets/gesture_detector_widget.dart';
import 'package:siteplan_asc_testcase/view/widgets/gridview_widget.dart';

class SitePlanScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Global.grey,
      appBar: PreferredSize(
        child: AppBarWidget(),
        preferredSize: Size.fromHeight(100),
      ),
      body: ClipRRect(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30), topRight: Radius.circular(30)),
        child: Container(
          color: Colors.white,
          child: Center(
            child: Stack(
              alignment: Alignment.center,
              children: <Widget>[
                GestureDetectorWidget(
                  child: GridViewWidget(),
                ),
                BottomWidget(),
                ButtonHelpWidget(),
                // ElevatedButton(
                //     onPressed: () {
                //       model.handleAddData();
                //     },
                //     child: Text('Are you rede ?'))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
