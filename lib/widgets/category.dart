import 'package:app/app/core/constants.dart';
import 'package:flutter/material.dart';
import 'package:app/app/models/category.dart';

class CategoryWidget extends StatefulWidget {
  final Category category;

  const CategoryWidget(this.category, {Key? key}) : super(key: key);

  @override
  State<CategoryWidget> createState() => _CategoryWidgetState();
}

class _CategoryWidgetState extends State<CategoryWidget> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(context, "/storage", arguments: widget.category),
      child: Container(
          decoration: BoxDecoration(color: AppConstants.colors.lightGrey, borderRadius: BorderRadius.circular(12)),
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
          child: Row(
            children: [
              Icon(
                Icons.folder_rounded,
                color: AppConstants.colors.grey,
                size: 32,
              ),
              const SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Category", style: AppConstants.texts.paragraph),
                  Text(widget.category.name,
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
