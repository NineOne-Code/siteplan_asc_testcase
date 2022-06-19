import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:siteplan_asc_testcase/core/models/models.dart';
import 'package:siteplan_asc_testcase/view/shared/global.dart';

import 'dart:developer';

FirebaseFirestore firestore = FirebaseFirestore.instance;
CollectionReference kavling = firestore.collection('kavling');

class Pos {
  double x = 0.0, y = 0.0;

  Pos(x, y) {
    this.x = x;
    this.y = y;
  }
}

class SitePlanModel extends ChangeNotifier {
  double _scale = 1.0;
  double _previousScale = 1.0;
  Pos _pos = Pos(0.0, 0.0);
  Pos _previousPos = Pos(0.0, 0.0);
  Pos _endPos = Pos(0.0, 0.0);
  bool _isScaled = false;

  double get scale => _scale;
  double get previousScale => _previousScale;
  Pos get pos => _pos;
  Pos get previousPos => _previousPos;
  Pos get endPos => _endPos;
  bool get isScaled => _isScaled;

  bool _hasTouched = false;
  bool get hasTouched => _hasTouched;
  set hasTouched(value) {
    _hasTouched = value;
    notifyListeners();
  }

  List<SellingZone> _zones =
      Global.data.map((e) => SellingZone.fromMap(e)).toList();
  List<SellingZone> get zones => _zones;
  set zones(value) {
    _zones =
        value.map<SellingZone>((e) => SellingZone.fromMap(e.data())).toList();
  }

  void handleDragScaleStart(ScaleStartDetails details) {
    _hasTouched = true;
    _previousScale = _scale;
    _previousPos.x = (details.focalPoint.dx / scale) - _endPos.x;
    _previousPos.y = (details.focalPoint.dy / scale) - _endPos.y;
    notifyListeners();
  }

  void handleDragScaleUpdate(ScaleUpdateDetails details) {
    _scale = _previousScale * details.scale;
    if (_scale > 2.0) {
      _isScaled = true;
    } else {
      _isScaled = false;
    }

    if (_scale < 1.0) {
      _scale = 1.0;
    } else if (_scale > 4.0) {
      _scale = 4.0;
    } else if (_previousScale == _scale) {
      _pos.x = (details.focalPoint.dx / _scale) - _previousPos.x;
      _pos.y = (details.focalPoint.dy / _scale) - _previousPos.y;
    }
    notifyListeners();
  }

  void handleDragScaleEnd() {
    _previousScale = 1.0;
    _endPos = _pos;
    notifyListeners();
  }

  void reset() {
    _hasTouched = false;
    _scale = 1.0;
    _previousScale = 1.0;
    _pos = Pos(0.0, 0.0);
    _previousPos = Pos(0.0, 0.0);
    _endPos = Pos(0.0, 0.0);
    _isScaled = false;
    notifyListeners();
  }

  void handleChangeStatus(int value) async {
    String id;
    await kavling
        .where('name', isEqualTo: value.toString())
        .get()
        .then((querySnapshot) {
      id = querySnapshot.docs[0].id;
      kavling.doc(id).update({'status': !querySnapshot.docs[0].get("status")});
      notifyListeners();
    }).catchError((onError) => print("error: $onError"));
  }

  void handleAddData() {
    _zones.forEach((e) {
      kavling.add({
        'name': e.name,
        'status': e.status,
        'position': e.position,
        'tile': e.tile
      });
    });
    print('seeder complete!');
  }
}
