
import 'package:flutter/material.dart';
import 'package:ui/widgets/best_podcast.dart';
import 'package:ui/widgets/category_section.dart';
import 'package:ui/widgets/search_box.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final Size mediaQuery = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 20, right: 16, left: 16),
              child: Text(
                "Looking for podcast channels",
                style: TextStyle(color: Colors.white),
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            const SearchBox(),
            CategorySection(mediaQuery),
            const BestPostcast(""),
          ],
        ),
      ),
    );
  }
}
