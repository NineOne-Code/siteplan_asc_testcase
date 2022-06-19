import 'package:flutter/material.dart';
import 'package:siteplan_asc_testcase/view/shared/global.dart';

class PopUpWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new AlertDialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(15))),
      title: const Text('Pop Up'),
      content: new Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Divider(
            color: Global.lightGrey,
            thickness: 5,
          ),
          Row(
            children: [
              Container(
                width: 78,
                height: 170,
                padding: EdgeInsets.all(3),
                child: Image.network(
                  'https://placeimg.com/600/600/arch',
                  fit: BoxFit.cover,
                ),
              ),
              Flexible(
                child: Text(
                  'Proident esse aliquip adipisicing ex commodo. Anim commodo et laboris Lorem nostrud ipsum dolore. Ad quis qui irure Lorem occaecat nisi quis velit in ea fugiat.',
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
