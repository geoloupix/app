import 'package:app/app/core/constants.dart';
import 'package:flutter/material.dart';
import 'package:app/app/models/location.dart';

class LocationWidget extends StatefulWidget {
  final Location location;

  const LocationWidget(this.location, {Key? key}) : super(key: key);

  @override
  State<LocationWidget> createState() => _LocationWidgetState();
}

class _LocationWidgetState extends State<LocationWidget> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pushReplacementNamed(context, "/home", arguments: widget.location),
      child: Container(
          decoration: BoxDecoration(
              color: AppConstants.colors.lightGrey.withOpacity(.4),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: AppConstants.colors.lightGrey)),
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
          child: Row(
            children: [
              Icon(
                Icons.location_on_rounded,
                color: AppConstants.colors.grey,
                size: 32,
              ),
              const SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Location", style: AppConstants.texts.paragraph),
                  Text(widget.location.name,
                      style: AppConstants.texts.button.copyWith(color: AppConstants.colors.black, height: 1)),
                ],
              ),
              const Expanded(child: SizedBox()),
              const SizedBox(width: 12),
              GestureDetector(
                  onTap: () {
                    print("tapped");
                  },
                  child: Icon(
                    Icons.more_vert_rounded,
                    color: AppConstants.colors.grey,
                  ))
            ],
          )),
    );
  }
}
