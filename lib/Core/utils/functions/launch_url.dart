import 'package:books_app/Core/utils/functions/show_snack_bar.dart';
import 'package:url_launcher/url_launcher.dart';

Future<void> customLaunchUrl(context, String? previewUrl) async {
  // if (previewUrl != null) {
  //   Uri url = Uri.parse(previewUrl);
  //   if (await canLaunchUrl(url)) {
  //     await launchUrl(url);
  //   }
  // } else if (previewUrl == null || previewUrl.isEmpty) {
  //   showSnackbar(context, 'Cannot launch $previewUrl');
  // }

  if (previewUrl == null || previewUrl.isEmpty) {
    showSnackbar(context, 'Preview link is null or empty');
    return;
  }
  final Uri url = Uri.parse(previewUrl);
  if (await canLaunchUrl(url)) {
    await launchUrl(url);
    return;
  } else if (!await canLaunchUrl(url)) {
    showSnackbar(context, 'Cannot launch this link');
    return;
  }
}
