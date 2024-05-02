class Venue {
  final String id;
  final String vendorName;
  final String vendorImage;
  final String vendorDiscription;
  final String vendorPrice;

  Venue({
    required this.id,
    required this.vendorName,
    required this.vendorImage,
    required this.vendorDiscription,
    required this.vendorPrice,
  });

  Map<String, dynamic> toMap() {
    return {
      '_id': id,
      'vendorName': vendorName,
      'vendorImage': vendorImage,
      'vendorDiscription': vendorDiscription,
      'vendorPrice': vendorPrice,
    };
  }

  factory Venue.fromMap(Map<String, dynamic> map) {
    return Venue(
      id: map['_id'] ?? '',
      vendorName: map['vendorName'] ?? '',
      vendorImage: map['vendorImage'][0] ?? '',
      vendorDiscription: map['vendorDiscription'] ?? '',
      vendorPrice: map['vendorPrice'] ?? '',
    );
  }
}
