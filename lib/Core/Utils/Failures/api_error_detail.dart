class ApiErrorDetail {
  final String code;
  final String description;
  final String reference;
  final String originalValue;

  ApiErrorDetail({
    required this.code,
    required this.description,
    required this.reference,
    required this.originalValue,
  });

  factory ApiErrorDetail.fromJson(Map<String, dynamic> json) {
    return ApiErrorDetail(
      code: json['error_code'] ?? '',
      description: json['error_description'] ?? '',
      reference: json['reference_name'] ?? '',
      originalValue: json['original_value'] ?? '',
    );
  }
}
