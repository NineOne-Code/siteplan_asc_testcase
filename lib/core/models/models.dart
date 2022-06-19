class SellingZone {
  String? name;
  bool? status;
  List? position;
  int? tile;

  SellingZone.fromMap(Map data) {
    name = data['name'] ?? 'No name';
    status = data['status'] ?? false;
    position = data['position'] ?? [0.0];
    tile = data['tile'];
  }
}
