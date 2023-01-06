import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:news_app/Providers/settings_provider.dart';
import 'package:provider/provider.dart';

class ShowLanguageBottomSheet extends StatefulWidget {
  @override
  State<ShowLanguageBottomSheet> createState() =>
      _ShowLanguageBottomSheetState();
}

class _ShowLanguageBottomSheetState extends State<ShowLanguageBottomSheet> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<SettingsProvider>(context);
    return Container(
      padding: const EdgeInsets.all(12),
      child: Column(
        children: [
          InkWell(
            onTap: () {
              provider.changeLanguage(
                const Locale('ar'),
              );
            },
            child: provider.isArabic()
                ? getSelectedItem(AppLocalizations.of(context)!.arabic)
                : getUnSelectedItem(AppLocalizations.of(context)!.arabic),
          ),
          const SizedBox(
            height: 12,
          ),
          InkWell(
            onTap: () {
              provider.changeLanguage(
                const Locale('en'),
              );
            },
            child: provider.isArabic()
                ? getUnSelectedItem(AppLocalizations.of(context)!.english)
                : getSelectedItem(AppLocalizations.of(context)!.english),
          ),
        ],
      ),
    );
  }

  Widget getSelectedItem(String title) {
    return Row(
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.headline6?.copyWith(
                color: Theme.of(context).primaryColor,
              ),
        ),
        const Spacer(),
        Icon(
          Icons.check,
          color: Theme.of(context).primaryColor,
        ),
      ],
    );
  }

  Widget getUnSelectedItem(String title) {
    return Row(
      children: [
        Text(title, style: Theme.of(context).textTheme.headline6),
        const Spacer(),
        Icon(
          Icons.check,
          color: Colors.black,
        ),
      ],
    );
  }
}
