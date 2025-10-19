import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../../core/helpers/theme_helper.dart';
import '../../../../core/helpers/l10n_helper.dart';
import '../../../../core/services/config_service.dart';
import '../../../../presentation/widgets/components/app_checkbox.dart';

class TermsModal extends StatefulWidget {
  final VoidCallback onAccept;

  const TermsModal({super.key, required this.onAccept});

  @override
  State<TermsModal> createState() => _TermsModalState();
}

class _TermsModalState extends State<TermsModal> {
  final ConfigService configService = Get.find<ConfigService>();
  bool isAccepted = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(40),
          topRight: Radius.circular(40),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Handle bar
            Center(
              child: Container(
                width: 40,
                height: 4,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
            ),
            const SizedBox(height: 24),

            // Title
            Text(
              L10nHelper.of(context).termsOfUse,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 16),

            // Description
            RichText(
              text: TextSpan(
                style: Theme.of(
                  context,
                ).textTheme.bodyMedium?.copyWith(color: Colors.black87),
                children: [
                  TextSpan(text: L10nHelper.of(context).termsDescriptionText),
                  TextSpan(
                    text: L10nHelper.of(context).termsLinkText,
                    style: TextStyle(
                      color: ThemeHelper.primary(context),
                      decoration: TextDecoration.underline,
                    ),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () => _launchTermsUrl(),
                  ),
                  TextSpan(text: L10nHelper.of(context).termsDescriptionEnd),
                ],
              ),
            ),
            const SizedBox(height: 24),

            // Checkbox
            AppCheckbox(
              checked: isAccepted,
              title: L10nHelper.of(context).acceptTerms,
              onChanged: (value) {
                setState(() {
                  isAccepted = value;
                });
              },
              activeColor: ThemeHelper.primary(context),
            ),
            const SizedBox(height: 32),

            // Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: isAccepted ? widget.onAccept : null,
                style: ElevatedButton.styleFrom(
                  backgroundColor: isAccepted
                      ? ThemeHelper.primary(context)
                      : Colors.grey[300],
                  foregroundColor: isAccepted ? Colors.white : Colors.grey[600],
                  minimumSize: const Size(double.infinity, 56),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(28),
                  ),
                  elevation: 0,
                ),
                child: Text(
                  L10nHelper.of(context).validate,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }

  Future<void> _launchTermsUrl() async {
    final url = configService.termsOfUseUrl.value;
    if (url.isNotEmpty) {
      final uri = Uri.parse(url);
      if (await canLaunchUrl(uri)) {
        await launchUrl(uri, mode: LaunchMode.externalApplication);
      }
    }
  }
}
