import 'package:geoloupix/app/core/constants.dart';
import 'package:geoloupix/app/core/global.dart';
import 'package:geoloupix/app/core/router.dart';
import 'package:geoloupix/app/models/category.dart';
import 'package:geoloupix/app/models/location.dart';
import 'package:geoloupix/widgets/category.dart';
import 'package:geoloupix/widgets/location.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class StorageScreen extends StatefulWidget {
  const StorageScreen({Key? key}) : super(key: key);

  @override
  State<StorageScreen> createState() => _StorageScreenState();
}

class _StorageScreenState extends State<StorageScreen> with TickerProviderStateMixin {
  final List<Category> categories = [];
  final List<Location> locations = [];
  bool loading = false;
  Category? category;

  Future<void> fetch() async {
    if (loading) return;
    setState(() {
      loading = true;
    });
    final res = await locationController.getAll(folderId: category?.id);
    setState(() {
      if (res.error == null) {
        locations.clear();
        locations.addAll(res.locations);
        categories.clear();
        categories.addAll(res.categories);
      }
      loading = false;
    });
  }

  List<Widget> children<T>(List<T> elements, Widget Function(T) f) {
    List<Widget> _els = [];
    final int _length = elements.length;

    for (int i = 0; i < _length + _length - 1; i++) {
      _els.add(i % 2 == 0 ? f(elements[i ~/ 2]) : const SizedBox(height: 12));
    }

    return _els;
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      fetch();
    });
  }

  @override
  void setState(fn) {
    if (mounted) {
      super.setState(fn);
    }
  }

  @override
  Widget build(BuildContext context) {
    category = AppRouter.getArgs<Category?>(context);
    return Scaffold(
        backgroundColor: AppConstants.colors.white,
        body: SizedBox(
          width: double.infinity,
          child: Stack(
            children: [
              SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 100),
                      Text(category == null ? "Storage" : category!.name, style: AppConstants.texts.headline),
                      const SizedBox(height: 40),
                      ConstrainedBox(
                        constraints: const BoxConstraints(minHeight: 200),
                        child: Stack(
                          children: [
                            !(locations.isEmpty && categories.isEmpty)
                                ? Column(
                                    children: [
                                      ...children<Category>(categories, (e) => CategoryWidget(e)).toList(),
                                      const SizedBox(height: 12),
                                      ...children<Location>(locations, (e) => LocationWidget(e)).toList(),
                                    ],
                                  )
                                : Column(children: [
                                    const SizedBox(
                                      height: 20,
                                      width: double.infinity,
                                    ),
                                    Text("Category is empty", style: AppConstants.texts.paragraph)
                                  ]),
                            if (loading)
                              Positioned(
                                  top: 0,
                                  left: 0,
                                  right: 0,
                                  bottom: 0,
                                  child: Container(
                                    color: AppConstants.colors.lightGrey.withOpacity(.8),
                                    child: Column(children: [
                                      const SizedBox(height: 100),
                                      SpinKitWave(
                                        color: AppConstants.colors.black,
                                        size: 30,
                                      )
                                    ]),
                                  ))
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                  top: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                      color: AppConstants.colors.white,
                      padding: const EdgeInsets.all(12),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: () => Navigator.pop(context),
                            child: Row(
                              children: [
                                Icon(Icons.arrow_back_rounded, color: AppConstants.colors.grey, size: 20),
                                const SizedBox(width: 8),
                                Text("Back", style: AppConstants.texts.paragraph)
                              ],
                            ),
                          ),
                          Row(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  print("add");
                                },
                                child: Text("Add",
                                    style: AppConstants.texts.paragraph
                                        .copyWith(color: AppConstants.colors.primary, fontWeight: FontWeight.bold)),
                              ),
                              if (!loading) const SizedBox(width: 16),
                              if (!loading)
                                GestureDetector(
                                  onTap: () => fetch(),
                                  child: Text("Refresh",
                                      style: AppConstants.texts.paragraph
                                          .copyWith(color: AppConstants.colors.primary, fontWeight: FontWeight.bold)),
                                ),
                            ],
                          ),
                        ],
                      ))),
            ],
          ),
        ));
  }
}
