import 'package:flutter/material.dart';
import 'package:siteplan_asc_testcase/view/shared/global.dart';

class ButtonHelpWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topRight,
      child: Container(
        margin: EdgeInsets.all(10),
        child: FlatButton(
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (BuildContext context) => PopUpHelp());
            },
            color: Global.blue,
            minWidth: 40,
            height: 40,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
            child: Text(
              '?',
              style: TextStyle(color: Colors.white, fontSize: 20),
            )),
      ),
    );
  }
}

class PopUpHelp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new AlertDialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(5))),
      content: new Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 30,
                      height: 30,
                      decoration: BoxDecoration(
                        color: Global.beige,
                        border: Border.all(color: Colors.lightGreen),
                      ),
                      child: Container(
                        margin: EdgeInsets.all(8),
                        color: Colors.red,
                      ),
                    ),
                    Text(
                      ' : sudah Terjual',
                      style: TextStyle(fontSize: 10, color: Global.lightBlack),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                        width: 30,
                        height: 30,
                        decoration: BoxDecoration(
                          color: Global.beige,
                          border: Border.all(color: Colors.lightGreen),
                        )),
                    Text(
                      ' : belum Terjual',
                      style: TextStyle(fontSize: 10, color: Global.lightBlack),
                    )
                  ],
                )
              ],
            )
          ]),
    );
  }
}
