class BathroomModel {
  final String id;
  final String title;
  final String location;
  final double rating;
  final String status;
  final String imageUrl;

  BathroomModel({
    required this.id,
    required this.title,
    required this.location,
    required this.rating,
    required this.status,
    required this.imageUrl,
  });

  factory BathroomModel.fromJson(Map<String, dynamic> json) {
    return BathroomModel(
      id: json['id'],
      title: json['title'],
      location: json['location'],
      rating: json['rating'].toDouble(),
      status: json['status'],
      imageUrl: json['imageUrl'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'location': location,
      'rating': rating,
      'status': status,
      'imageUrl': imageUrl,
    };
  }
}
