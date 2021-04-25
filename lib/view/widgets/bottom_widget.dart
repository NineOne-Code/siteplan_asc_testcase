import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:siteplan_asc_testcase/core/viewmodels/siteplan_model.dart';
import 'package:siteplan_asc_testcase/view/shared/global.dart';

class BottomWidget extends StatefulWidget {
  @override
  _BottomWidgetState createState() => _BottomWidgetState();
}

class _BottomWidgetState extends State<BottomWidget> {
  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final model = Provider.of<SitePlanModel>(context);
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        color: Colors.white,
        height: 150,
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            model.hasTouched
                ? RaisedButton(
                    color: Global.grey,
                    onPressed: () {
                      model.reset();
                    },
                    child: Icon(
                      Icons.refresh,
                      color: Colors.white,
                    ),
                  )
                : SizedBox(
                    height: 10,
                  ),
            Row(
              children: <Widget>[
                Flexible(
                  child: TextField(
                    onChanged: (value) {},
                    controller: controller,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      focusColor: Colors.amber,
                      labelText: 'Masukan 1 - 34',
                      prefixText: 'Kavling: ',
                      prefixStyle: TextStyle(
                          color: Global.grey, fontWeight: FontWeight.w100),
                    ),
                  ),
                ),
                ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Global.blue)),
                  onPressed: () {
                    model.handleChangeStatus(int.parse(controller.text));
                    // model.handleChangeStatus(int.parse(controller.text) - 1);
                  },
                  child: Text('Ganti'),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
