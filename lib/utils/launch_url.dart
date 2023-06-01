import 'package:url_launcher/url_launcher.dart';

Future<void> openNewTab(String url) async {
  final Uri uri = Uri.parse(url);
  final bool isValid = await canLaunchUrl(uri);

  if (isValid) {
    await launchUrl(uri, mode: LaunchMode.externalApplication);
  }
}
