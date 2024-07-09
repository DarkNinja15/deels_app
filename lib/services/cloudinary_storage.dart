import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';

class CloudianryStorage {
  static Future<String?> cloudFileUpload(XFile file) async {
    try {
      final url = Uri.parse('https://api.cloudinary.com/v1_1/dqhgtnpvg/upload');
      final request = http.MultipartRequest('POST', url)
        ..fields['upload_preset'] = 'tgtbz798'
        ..files.add(await http.MultipartFile.fromPath('file', file.path));

      final response = await request.send();

      if (response.statusCode == 200) {
        final responseData = await response.stream.toBytes();
        final responseString = String.fromCharCodes(responseData);
        final jsonMap = jsonDecode(responseString);
        return jsonMap["url"];
      }
      return null;
    } catch (e) {
      
      return null;
    }
  }
}
