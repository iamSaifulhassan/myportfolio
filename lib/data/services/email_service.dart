import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../core/constants/app_constants.dart';

class EmailService {
  static const String _url = 'https://api.emailjs.com/api/v1.0/email/send';

  static Future<bool> sendEmail({
    required String name,
    required String email,
    required String message,
  }) async {
    try {
      final response = await http.post(
        Uri.parse(_url),
        headers: {
          'origin': 'http://localhost',
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          'service_id': AppConstants.serviceId,
          'template_id': AppConstants.templateId, // User needs to provide this
          'user_id': AppConstants.publicKey,
          'template_params': {
            'user_name': name,
            'user_email': email,
            'user_message': message,
            'to_name': AppConstants.developerName,
          },
        }),
      );

      if (response.statusCode == 200) {
        return true;
      }
      return false;
    } catch (e) {
      return false;
    }
  }
}
