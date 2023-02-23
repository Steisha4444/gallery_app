import 'package:gallery_test/models/gallery_item_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class GalleryApi {
  Future<List<GalleryItem>> getImages() async {
    final http.Client client = http.Client();
    const String clientId = 'anwP5v5EORFTvS1XBx16EQjJFlW4XfgbdcaqYkvA3sA';
    const String url = 'https://api.unsplash.com/photos/?client_id=$clientId';

    final http.Response response = await client.get(Uri.parse(url));
    final decoded = json.decode(response.body);

    return List<GalleryItem>.from(
      decoded.map((image) => GalleryItem.fromJson(image)),
    );
  }
}
