import 'package:eventos/core/utils/constants/colors.dart';
import 'package:eventos/core/utils/helpers/helper_functions.dart';
import 'package:eventos/core/utils/router/app_router.dart';
import 'package:eventos/features/home/data/models/venue_model.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class VenueCard extends StatelessWidget {
  const VenueCard({
    super.key,
    required this.venueModel,
    required this.index,
  });
  final VenueModel venueModel;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.light,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      elevation: 5,
      child: Column(
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(15),
                  topRight: Radius.circular(15),
                ),
                child: SizedBox(
                  width: double.infinity,
                  height: HelperFunctions.screenHeight(context) * 0.27,
                ),
              ),
              Hero(
                tag: venueModel.data![index].name!,
                child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                  child: Image.network(
                    // venueModel.data![index].images![1],
                    "https://images.unsplash.com/photo-1566073771259-6a8506099945?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
                    fit: BoxFit.cover,
                    width: double.infinity,
                    height: HelperFunctions.screenHeight(context) * 0.22,
                  ),
                ),
              ),
              Positioned(
                top: HelperFunctions.screenHeight(context) * 0.19,
                left: HelperFunctions.screenWidth(context) * 0.03,
                child: Card(
                  elevation: 4,
                  child: Container(
                    width: HelperFunctions.screenWidth(context) * 0.3,
                    height: HelperFunctions.screenHeight(context) * 0.055,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: AppColors.secondaryColor),
                    child: Center(
                        child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Icon(
                          Icons.location_city,
                          color: Colors.white,
                        ),
                        Text(
                          venueModel.data![index].location!,
                          style: const TextStyle(
                              color: AppColors.white,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    )),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(
                left: HelperFunctions.screenWidth(context) * 0.03,
                right: HelperFunctions.screenWidth(context) * 0.03,
                bottom: HelperFunctions.screenWidth(context) * 0.03),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  venueModel.data![index].name!,
                  style: Theme.of(context).textTheme.headlineSmall,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  softWrap: true,
                  textAlign: TextAlign.start,
                ),
                SizedBox(height: HelperFunctions.screenHeight(context) * 0.01),
                Text(
                  venueModel.data![index].description!,
                  style: Theme.of(context).textTheme.bodyLarge,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  softWrap: true,
                  textAlign: TextAlign.start,
                ),
                SizedBox(height: HelperFunctions.screenHeight(context) * 0.02),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      GoRouter.of(context).push(AppRouter.kVenueDetails,
                          extra: venueModel.data![index]);
                      // GoRouter.of(context).push(AppRouter.kCourseDetailsView,
                      //     extra: Tranobj(title, tag: title, image: image));
                    },
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15))),
                    child: const Text("See Details"),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
