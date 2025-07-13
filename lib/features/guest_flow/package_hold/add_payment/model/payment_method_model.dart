class PaymentMethodModel {
  final String id;
  final String name;
  final String displayName;
  final String iconUrl;
  final bool isEnabled;

  PaymentMethodModel({
    required this.id,
    required this.name,
    required this.displayName,
    required this.iconUrl,
    this.isEnabled = true,
  });

  factory PaymentMethodModel.fromJson(Map<String, dynamic> json) {
    return PaymentMethodModel(
      id: json['id'],
      name: json['name'],
      displayName: json['display_name'],
      iconUrl: json['icon_url'],
      isEnabled: json['is_enabled'] ?? true,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'display_name': displayName,
      'icon_url': iconUrl,
      'is_enabled': isEnabled,
    };
  }
}
