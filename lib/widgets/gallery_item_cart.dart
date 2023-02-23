import 'package:flutter/material.dart';
import 'package:gallery_test/models/gallery_item_model.dart';
import 'package:gallery_test/screen/image_view_screen.dart';

class GalleryItemCard extends StatelessWidget {
  final GalleryItem item;

  const GalleryItemCard({super.key, required this.item});

  void navigateToImageView(context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ImageViewScreen(item: item),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          InkWell(
            onTap: () => navigateToImageView(context),
            child: Hero(
              tag: item.id,
              child: Image.network(
                item.thumbImage,
                width: 120,
                height: 120,
                fit: BoxFit.cover,
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress == null) return child;
                  return const Center(child: CircularProgressIndicator());
                },
              ),
            ),
          ),
          const SizedBox(height: 8),
          Tooltip(
            message: item.name,
            triggerMode: TooltipTriggerMode.tap,
            child: Text(
              item.name,
              maxLines: 2,
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            item.author,
            maxLines: 1,
            textAlign: TextAlign.center,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
