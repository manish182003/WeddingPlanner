class AllVenueData {
  final String image;
  final String name;
  final String place;
  final String price;
  final String tag;
  final bool isfetch;
  AllVenueData({
    required this.image,
    required this.name,
    required this.place,
    required this.price,
    required this.tag,
    this.isfetch = false,
  });
}

class AllPhotoData {
  final String image;
  final String name;
  final String place;
  final String price;
  final String tag;
  final bool isfetch;

  AllPhotoData({
    required this.image,
    required this.name,
    required this.place,
    required this.price,
    required this.tag,
    this.isfetch = false,
  });
}
