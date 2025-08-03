import 'package:url_launcher/url_launcher.dart';

Future<void> launchURL(String urlString) async {
  final Uri uri = Uri.parse(urlString);

  try {
    final launched = await launchUrl(uri, mode: LaunchMode.externalApplication);
    if (!launched) {
      print('Could not launch $urlString');
    }
  } catch (e) {
    print('Error launching URL: $e');
  }
}
