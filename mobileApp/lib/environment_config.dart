import 'package:flutter_dotenv/flutter_dotenv.dart';

class EnvironmentConfig {
  static String apiUrl = dotenv.env['api_url'] ?? '';

  static String deepLinkUrl = dotenv.env['deep_link_url'] ?? '';
}
