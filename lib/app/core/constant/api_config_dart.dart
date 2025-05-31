class ApiConfig {
  static final ApiConfig _instance = ApiConfig._internal();

  factory ApiConfig() => _instance;

  ApiConfig._internal();

  final String _baseUrl = "https://bholatradingbackend.bholasquare.com";

  String get baseUrl => _baseUrl;


}
