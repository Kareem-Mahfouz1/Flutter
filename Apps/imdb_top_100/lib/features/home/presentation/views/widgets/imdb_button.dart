import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ImdbButton extends StatelessWidget {
  const ImdbButton({super.key, required this.url});
  final String url;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
          backgroundColor: Theme.of(context).colorScheme.secondary),
      onPressed: () async {
        try {
          await launchUrl(Uri.parse(url));
        } catch (e) {
          ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Couldn\'t launch this url :(')));
        }
      },
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Explore on IMDB'),
          Icon(
            Icons.arrow_forward_ios_rounded,
            size: 19,
          )
        ],
      ),
    );
  }
}
