import 'dart:io';

import 'package:dio/dio.dart';

class PromptRepository {
  static final Dio dio = Dio();
  
  static Future<File?> generateImage(String text) async {
    const String url = 'https://api.vyro.ai/v1/imagine/api/generations';
    const Map<String, dynamic> headers = {
      'Authorization': 'Bearer vk-***************'
    };
    final Map<String, dynamic> payload = {
      'prompt': text,
      'style_id': '122',
      'aspect_ratio': '1:1',
      'cfg': '1',
      'seed': '1',
      'high_res_results': '1'
    };
    dio.options == BaseOptions(headers: headers);
    final Response response = await dio.post(url, data: payload);
    if (response.statusCode == 200) {
      final String filename = 'image.jpg';
      File file = File(filename);
      file.writeAsBytesSync(response.data);
      return file;
    } else {
      return null;
    }
  }
}
/*
import requests

url = 'https://api.vyro.ai/v1/imagine/api/generations'

headers = {
  'Authorization': 'Bearer vk-***************'
}

# Using None here allows us to treat the parameters as string
payload = {
    'prompt': (None, 'football'),
    'style_id': (None, '122'),
    'aspect_ratio': (None, '1:1'),
    'cfg': (None, '7'),
    'seed': (None, '1'),
    'high_res_results': (None, '1')
}

response = requests.post(url, headers=headers, files=payload)

if response.status_code == 200:  # if request is successful
  with open('image.jpg', 'wb') as f:
    f.write(response.content)
else:
  print("Error:", response.status_code)
 */