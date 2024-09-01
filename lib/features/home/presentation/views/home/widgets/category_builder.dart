import 'package:eventos/core/utils/constants/assets_data.dart';
import 'package:eventos/core/utils/constants/colors.dart';
import 'package:eventos/features/home/data/models/category_model.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CategoryBuilder extends StatelessWidget {
  const CategoryBuilder(
      {super.key, required this.size, required this.categoriesList});

  final Size size;
  final List<CategoryData> categoriesList;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size.height * 0.13,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        itemCount: categoriesList.length,
        itemBuilder: (context, index) {
          return CategoryCard(
            size: size,
            index: index,
            categoriesList: categoriesList,
          );
        },
      ),
    );
  }
}

class CategoryCard extends StatelessWidget {
  const CategoryCard(
      {super.key,
      required this.size,
      required this.index,
      required this.categoriesList});

  final Size size;
  final int index;
  final List<CategoryData> categoriesList;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // if (index == 0) {
        //   GoRouter.of(context).push(AppRouter.kHotelsSearch);
        // }
        // if (index == 1) {
        //   GoRouter.of(context).push(AppRouter.kFlightsSearch);
        // }
        // if (index == 2) {
        //   GoRouter.of(context).push(AppRouter.kActivitesSearch);
        // }
      },
      child: Padding(
        padding: EdgeInsets.only(right: size.width * 0.05),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: size.width * 0.2,
              height: size.height * 0.09,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: [
                    AppColors.secondaryColor2.withOpacity(0.8),
                    AppColors.secondaryColor.withOpacity(0.1),
                  ],
                ),
                border: Border.all(width: 0.15, color: AppColors.grey),
                borderRadius: BorderRadius.circular(15),
                image: const DecorationImage(
                  image: AssetImage(
                    AssetsData.categoryimg,
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(height: size.height * 0.006),
            Text(
              categoriesList[index].name!,
              style: GoogleFonts.truculenta(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
