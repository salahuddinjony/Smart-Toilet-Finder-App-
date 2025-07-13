class PackageModel {
  final String id;
  final String name;
  final String description;
  final String pickupLocation;
  final String deliveryLocation;
  final String status;
  final String size;
  final DateTime createdAt;
  final DateTime? updatedAt;
  final String? hostId;
  final double? weight;
  final String? trackingNumber;
  final String? eta;
  final String? deliveredAt;
  final String? rejectedAt;

  PackageModel({
    required this.id,
    required this.name,
    required this.description,
    required this.pickupLocation,
    required this.deliveryLocation,
    required this.status,
    required this.size,
    required this.createdAt,
    this.updatedAt,
    this.hostId,
    this.weight,
    this.trackingNumber,
    this.eta,
    this.deliveredAt,
    this.rejectedAt,
  });

  // Convert to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'pickup_location': pickupLocation,
      'delivery_location': deliveryLocation,
      'status': status,
      'size': size,
      'created_at': createdAt.toIso8601String(),
      'updated_at': updatedAt?.toIso8601String(),
      'host_id': hostId,
      'weight': weight,
      'tracking_number': trackingNumber,
      'eta': eta,
      'delivered_at': deliveredAt,
      'rejected_at': rejectedAt,
    };
  }

  // Create from JSON
  factory PackageModel.fromJson(Map<String, dynamic> json) {
    return PackageModel(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
      description: json['description'] ?? '',
      pickupLocation: json['pickup_location'] ?? '',
      deliveryLocation: json['delivery_location'] ?? '',
      status: json['status'] ?? 'pending',
      size: json['size'] ?? 'Medium',
      createdAt: DateTime.parse(
        json['created_at'] ?? DateTime.now().toIso8601String(),
      ),
      updatedAt:
          json['updated_at'] != null
              ? DateTime.parse(json['updated_at'])
              : null,
      hostId: json['host_id'],
      weight: json['weight']?.toDouble(),
      trackingNumber: json['tracking_number'],
      eta: json['eta'],
      deliveredAt: json['delivered_at'],
      rejectedAt: json['rejected_at'],
    );
  }

  // Copy with new values
  PackageModel copyWith({
    String? id,
    String? name,
    String? description,
    String? pickupLocation,
    String? deliveryLocation,
    String? status,
    String? size,
    DateTime? createdAt,
    DateTime? updatedAt,
    String? hostId,
    double? weight,
    String? trackingNumber,
    String? eta,
    String? deliveredAt,
    String? rejectedAt,
  }) {
    return PackageModel(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      pickupLocation: pickupLocation ?? this.pickupLocation,
      deliveryLocation: deliveryLocation ?? this.deliveryLocation,
      status: status ?? this.status,
      size: size ?? this.size,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      hostId: hostId ?? this.hostId,
      weight: weight ?? this.weight,
      trackingNumber: trackingNumber ?? this.trackingNumber,
      eta: eta ?? this.eta,
      deliveredAt: deliveredAt ?? this.deliveredAt,
      rejectedAt: rejectedAt ?? this.rejectedAt,
    );
  }
}
