import 'package:flutter/material.dart';

class DetailContentWidget extends StatelessWidget {
  final String imageUrl;
  final String author;

  const DetailContentWidget({
    Key? key,
    required this.imageUrl,
    required this.author,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Image.network(
          imageUrl,
          height: 300,
          fit: BoxFit.cover,
        ),
        const SizedBox(height: 16),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            'Taken by: $author',
            style: const TextStyle(
              fontSize: 18,
            ),
            textAlign: TextAlign.right,
          ),
        ),
      ],
    );
  }
}
