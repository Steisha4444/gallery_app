import 'package:flutter/material.dart';
import 'package:gallery_test/models/gallery_item_model.dart';
import 'package:gallery_test/widgets/loading_image.dart';
import 'package:photo_view/photo_view.dart';

class ImageViewScreen extends StatelessWidget {
  const ImageViewScreen({super.key, required this.item});
  final GalleryItem item;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height - 200;
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            IconButton(
              onPressed: () => Navigator.pop(context),
              icon: const Icon(Icons.close),
            ),
            const SizedBox(
              height: 16,
            ),
            SizedBox(
              height: height,
              child: Hero(
                tag: item.id,
                child: PhotoView(
                  key: UniqueKey(),
                  loadingBuilder: (_, c) => LoadingImage(
                    image: item.thumbImage,
                    height: height,
                  ),
                  minScale: PhotoViewComputedScale.contained,
                  maxScale: PhotoViewComputedScale.covered * 3,
                  imageProvider: NetworkImage(item.fullImage),
                  backgroundDecoration: const BoxDecoration(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
