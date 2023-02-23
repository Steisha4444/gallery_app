import 'package:flutter/material.dart';
import 'package:gallery_test/api/gallery_api.dart';
import 'package:gallery_test/models/gallery_item_model.dart';
import 'package:gallery_test/widgets/gallery_item_cart.dart';

class GalleryScreen extends StatefulWidget {
  const GalleryScreen({super.key});

  @override
  State<GalleryScreen> createState() => _GalleryScreenState();
}

class _GalleryScreenState extends State<GalleryScreen> {
  List<GalleryItem>? images;

  Future<void> getImages() async {
    final GalleryApi repository = GalleryApi();

    images = await repository.getImages();
    setState(() {});
  }

  @override
  void initState() {
    getImages();
    super.initState();
  }

  Widget _buildContent() {
    if (images == null) {
      return const Center(child: CircularProgressIndicator());
    } else if (images!.isEmpty) {
      return const Center(child: Text('There are no images!'));
    }

    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        mainAxisExtent: 230,
      ),
      itemCount: images!.length,
      itemBuilder: (BuildContext ctx, index) {
        return GalleryItemCard(item: images![index]);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 200),
      child: _buildContent(),
    );
  }
}
