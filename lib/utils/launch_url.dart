import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:url_launcher/url_launcher.dart';

Future<void> openNewTab(String url) async {
  final Uri uri = Uri.parse(url);
  final bool isValid = await canLaunchUrl(uri);
  FirebaseAnalytics.instance.logEvent(name: "URL Clicks", parameters: {
    "urls": url,
  });

  if (isValid) {
    await launchUrl(uri, mode: LaunchMode.externalApplication);
  }
}
