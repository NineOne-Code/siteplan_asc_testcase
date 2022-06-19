import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:siteplan_asc_testcase/core/models/models.dart';
import 'package:siteplan_asc_testcase/core/viewmodels/siteplan_model.dart';
import 'package:siteplan_asc_testcase/view/shared/global.dart';

class GridViewWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final model = Provider.of<SitePlanModel>(context);
    return StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
      stream: FirebaseFirestore.instance.collection('kavling').snapshots(),
      builder: (_, snapshot) {
        if (snapshot.hasData) {
          final temp = snapshot.data?.docs.map<dynamic>((e) => e);
          model.zones = temp;
          return Stack(
            alignment: Alignment.center,
            children: <Widget>[
              Container(
                color: Colors.white,
                child: Image.asset('images/siteplan.png'),
              ),
              GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 34),
                itemCount: 34,
                itemBuilder: (context, index) {
                  int currentTile = index + 1;
                  List<SellingZone> tileZone = model.zones
                      .where((element) => element.tile == currentTile)
                      .toList();
                  // print(model.zones[0].position[0]);
                  return Stack(
                    children: List.generate(tileZone.length, (idx) {
                      return Transform.translate(
                        offset: Offset(
                          size.width * tileZone[idx].position?[0],
                          size.width * tileZone[idx].position?[1],
                        ),
                        child: Stack(
                          children: <Widget>[
                            tileZone[idx].status ?? false
                                ? Container(
                                    color: Colors.red,
                                  )
                                : Transform(
                                    transform: Matrix4.identity()
                                      ..translate(0.0),
                                    child: Text(
                                      tileZone[idx].name ?? 'X',
                                      style: TextStyle(
                                          fontSize: 6,
                                          color:
                                              Global.purple.withOpacity(0.4)),
                                    ),
                                  )
                          ],
                        ),
                      );
                    }),
                  );
                },
              ),
            ],
          );
        } else {
          return Text('Loading...');
        }
      },
    );
  }
}
