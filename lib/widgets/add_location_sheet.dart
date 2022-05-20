import 'package:geoloupix/app/core/constants.dart';
import 'package:flutter/material.dart';

class AddLocationSheet extends StatefulWidget {
  const AddLocationSheet({Key? key}) : super(key: key);

  @override
  State<AddLocationSheet> createState() => _AddLocationSheetState();
}

class _AddLocationSheetState extends State<AddLocationSheet> {
  Widget el(BuildContext context, {required String text, required IconData iconData, required VoidCallback onTap}) =>
      Expanded(
        child: GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: onTap,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration:
                      BoxDecoration(color: AppConstants.colors.primary, borderRadius: BorderRadius.circular(9999)),
                  child: Icon(iconData, color: AppConstants.colors.white),
                ),
                const SizedBox(height: 12),
                Text(text, style: AppConstants.texts.paragraph)
              ],
            ),
          ),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: AppConstants.colors.white),
      child: Column(
        children: [
          el(context, text: "From current position", iconData: Icons.location_on_rounded, onTap: () {
            print("tapped");
          }),
          Divider(color: AppConstants.colors.lightGrey),
          el(context, text: "Search", iconData: Icons.search_rounded, onTap: () {
            print("tapped");
          }),
        ],
      ),
    );
  }
}
