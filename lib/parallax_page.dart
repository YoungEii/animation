import 'package:flutter/material.dart';

class ParallaxPage extends StatelessWidget {
  ParallaxPage({super.key});

  final List<String> imgs = [
    'https://img.freepik.com/free-vector/flat-design-lake-scenery_23-2149161405.jpg?w=2000',
    'https://img.freepik.com/free-photo/beautiful-scenery-phragmites-plants-by-sea-with-swimming-pelican-sunset_181624-37787.jpg',
    'https://thumbs.dreamstime.com/b/amazing-misty-autumn-scenery-lake-sorapis-dolomites-italy-beautiful-mountains-colorful-yellow-larches-shore-193683774.jpg',
    'https://img.freepik.com/free-vector/flat-design-lake-scenery_23-2149161405.jpg?w=2000',
    'https://img.freepik.com/free-photo/beautiful-scenery-phragmites-plants-by-sea-with-swimming-pelican-sunset_181624-37787.jpg',
    'https://thumbs.dreamstime.com/b/amazing-misty-autumn-scenery-lake-sorapis-dolomites-italy-beautiful-mountains-colorful-yellow-larches-shore-193683774.jpg',
    'https://img.freepik.com/free-vector/flat-design-lake-scenery_23-2149161405.jpg?w=2000',
    'https://img.freepik.com/free-photo/beautiful-scenery-phragmites-plants-by-sea-with-swimming-pelican-sunset_181624-37787.jpg',
    'https://thumbs.dreamstime.com/b/amazing-misty-autumn-scenery-lake-sorapis-dolomites-italy-beautiful-mountains-colorful-yellow-larches-shore-193683774.jpg',
    'https://img.freepik.com/free-vector/flat-design-lake-scenery_23-2149161405.jpg?w=2000',
    'https://img.freepik.com/free-photo/beautiful-scenery-phragmites-plants-by-sea-with-swimming-pelican-sunset_181624-37787.jpg',
    'https://thumbs.dreamstime.com/b/amazing-misty-autumn-scenery-lake-sorapis-dolomites-italy-beautiful-mountains-colorful-yellow-larches-shore-193683774.jpg',
    'https://img.freepik.com/free-vector/flat-design-lake-scenery_23-2149161405.jpg?w=2000',
    'https://img.freepik.com/free-photo/beautiful-scenery-phragmites-plants-by-sea-with-swimming-pelican-sunset_181624-37787.jpg',
    'https://thumbs.dreamstime.com/b/amazing-misty-autumn-scenery-lake-sorapis-dolomites-italy-beautiful-mountains-colorful-yellow-larches-shore-193683774.jpg',
    'https://img.freepik.com/free-vector/flat-design-lake-scenery_23-2149161405.jpg?w=2000',
    'https://img.freepik.com/free-photo/beautiful-scenery-phragmites-plants-by-sea-with-swimming-pelican-sunset_181624-37787.jpg',
    'https://thumbs.dreamstime.com/b/amazing-misty-autumn-scenery-lake-sorapis-dolomites-italy-beautiful-mountains-colorful-yellow-larches-shore-193683774.jpg',
    'https://img.freepik.com/free-vector/flat-design-lake-scenery_23-2149161405.jpg?w=2000',
    'https://img.freepik.com/free-photo/beautiful-scenery-phragmites-plants-by-sea-with-swimming-pelican-sunset_181624-37787.jpg',
    'https://thumbs.dreamstime.com/b/amazing-misty-autumn-scenery-lake-sorapis-dolomites-italy-beautiful-mountains-colorful-yellow-larches-shore-193683774.jpg',
    'https://img.freepik.com/free-vector/flat-design-lake-scenery_23-2149161405.jpg?w=2000',
    'https://img.freepik.com/free-photo/beautiful-scenery-phragmites-plants-by-sea-with-swimming-pelican-sunset_181624-37787.jpg',
    'https://thumbs.dreamstime.com/b/amazing-misty-autumn-scenery-lake-sorapis-dolomites-italy-beautiful-mountains-colorful-yellow-larches-shore-193683774.jpg',
    'https://img.freepik.com/free-vector/flat-design-lake-scenery_23-2149161405.jpg?w=2000',
    'https://img.freepik.com/free-photo/beautiful-scenery-phragmites-plants-by-sea-with-swimming-pelican-sunset_181624-37787.jpg',
    'https://thumbs.dreamstime.com/b/amazing-misty-autumn-scenery-lake-sorapis-dolomites-italy-beautiful-mountains-colorful-yellow-larches-shore-193683774.jpg',
  ];

  final ScrollController scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: ListView.separated(
          controller: scrollController,
          itemBuilder: (context, index) {
            return AnimatedBuilder(
                animation: scrollController,
                builder: (context, child) {
                  return _Item(
                    index: index,
                    imgUrl: imgs[index],
                  );
                });
          },
          separatorBuilder: (context, index) => const SizedBox(height: 8.0),
          itemCount: imgs.length,
        ),
      ),
    );
  }
}

class _Item extends StatelessWidget {
  const _Item({
    required this.index,
    required this.imgUrl,
  });

  final int index;
  final String imgUrl;

  @override
  Widget build(BuildContext context) {
    final renderObject = context.findRenderObject() as RenderBox?;
    final offset = renderObject?.localToGlobal(Offset.zero).dy ?? 0;
    final screenHeight = MediaQuery.of(context).size.height;
    final relativePosition = offset / screenHeight;

    if (index == 0) {
      debugPrint('$index, $offset, $screenHeight, $relativePosition');
    }

    return Container(
      height: 200,
      margin: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.black, width: 2),
        image: DecorationImage(
          fit: BoxFit.cover,
          alignment: Alignment(0, relativePosition - 0.5),
          image: NetworkImage(imgUrl),
        ),
      ),
    );
  }
}
