// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

import 'package:ui/model/category_card_model.dart';

class CategorySection extends StatelessWidget {
  final Size mediaQuery;
  const CategorySection(this.mediaQuery, {super.key});

  @override
  Widget build(BuildContext context) {
    List<CategoryCardModel> category = [
      CategoryCardModel(
          "Education", const Color(0xFFF5AF19), const Color(0xFFF12711)),
      CategoryCardModel(
          "Society", const Color(0xFF340FD1), const Color(0xFF623DEF)),
      CategoryCardModel(
          "Sports", const Color(0xFF43EF1D), const Color(0xFF0D80F2)),
      CategoryCardModel(
          "Films", const Color(0xFFE9228D), const Color(0xFFF12711)),
      CategoryCardModel(
          "Songs", const Color(0xFF79095c), const Color(0xFF00d4ff)),
      CategoryCardModel(
          "Movies", const Color(0xFF096279), const Color(0xFF00ff6f)),
    ];

    return Column(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(vertical: 16),
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            children: [
              const Text(
                'Categories',
                style: TextStyle(color: Colors.white),
              ),
              const Icon(
                Icons.arrow_drop_down_sharp,
                color: Colors.white,
              ),
              const Spacer(),
              TextButton(
                style: TextButton.styleFrom(
                  padding: EdgeInsets.zero,
                  minimumSize: const Size(50, 30),
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                ),
                onPressed: () {},
                child: Text(
                  'View all',
                  style: Theme.of(context).textTheme.labelMedium,
                ),
              )
            ],
          ),
        ),
        SizedBox(
          height: mediaQuery.width * 0.3,
          child: Padding(
            padding: const EdgeInsets.only(left: 16),
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: category.length,
              separatorBuilder: (context, index) => const SizedBox(
                width: 8,
              ),
              itemBuilder: (context, index) => Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      category[index].beginColor,
                      category[index].endColor
                    ],
                  ),
                ),
                width: mediaQuery.width * 0.26,
                child: Center(
                  child: Text(
                    category[index].name,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
        const SizedBox(height: 16),
      ],
    );
  }
}
