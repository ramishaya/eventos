import 'package:eventos/core/utils/constants/assets_data.dart';
import 'package:eventos/core/utils/constants/colors.dart';
import 'package:eventos/core/utils/router/app_router.dart';
import 'package:eventos/core/utils/widgets/custom_text_button.dart';
import 'package:eventos/core/utils/widgets/glass_container.dart';
import 'package:eventos/features/home/data/models/service_model.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ServiceProvidersCard extends StatelessWidget {
  const ServiceProvidersCard({
    super.key,
    required this.size,
    required this.serviceProviders,
    required this.index,
  });
  final int index;
  final Size size;
  final ServiceModel serviceProviders;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: size.height * 0.34,
        child: Card(
          clipBehavior: Clip.antiAlias,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          margin: EdgeInsets.only(right: size.width * 0.04),
          child: Stack(
            alignment: Alignment.center,
            children: [
              serviceProviders.data![index].image!.isNotEmpty
                  ? Hero(
                      tag: serviceProviders.data![index].image!,
                      child: Image.network(
                        //  serviceProviders.data![index].image!,
                        "https://images.unsplash.com/photo-1493863641943-9b68992a8d07?q=80&w=2058&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
                        fit: BoxFit.cover,
                        width: double.infinity,
                        height: double.infinity,
                      ),
                    )
                  : Center(
                      child: Image.asset(
                        AssetsData.categoryimg,
                        fit: BoxFit.cover,
                        width: size.width * 0.6,
                      ),
                    ),
              Positioned(
                  left: 0,
                  top: 0,
                  child: Container(
                    height: size.height * 0.06,
                    width: size.width * 0.5,
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(15),
                          bottomRight: Radius.circular(15),
                        ),
                        color: AppColors.secondaryColor2),
                    child: Center(
                        child: Text("Service Category",
                            style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w400))),
                  )),
              // Positioned(
              //     top: size.height * 0.01,
              //     right: size.width * 0.03,
              //     child: Container(
              //         width: size.width * 0.2,
              //         height: size.height * 0.04,
              //         decoration: BoxDecoration(
              //             color: Colors.white,
              //             borderRadius: BorderRadius.circular(30)),
              //         child: Center(
              //             child: Text(
              //           "\$ ${index * 100 + 54}.00",
              //           style: const TextStyle(fontWeight: FontWeight.w400),
              //         )))),
              Positioned(
                bottom: 0,
                child: GlassContainer(
                  size: size,
                  bottomLeft: 20,
                  bottomRight: 20,
                  topLeft: 0,
                  topRight: 0,
                  sigmaX: 6,
                  sigmaY: 6,
                  height: size.height * 0.1,
                  width: size.width * 0.93,
                ),
              ),
              Positioned(
                bottom: size.height * 0.02,
                left: size.width * 0.03,
                right: size.width * 0.3,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      serviceProviders.data![index].name!,
                      style: const TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                          overflow: TextOverflow.ellipsis),
                    ),
                    SizedBox(
                      height: size.height * 0.01,
                    ),
                    // Row(
                    //   children: [
                    //     const Icon(
                    //       Icons.work,
                    //       color: Colors.white,
                    //     ),
                    //     SizedBox(
                    //       width: size.width * 0.01,
                    //     ),
                    //     const Text(
                    //       "Location, Country",
                    //       style: TextStyle(
                    //           color: Colors.white,
                    //           fontWeight: FontWeight.w300,
                    //           fontSize: 16),
                    //     ),
                    //   ],
                    // ),
                  ],
                ),
              ),
              Positioned(
                  bottom: size.height * 0.02,
                  right: size.width * 0.03,
                  child: CustomTextButton(
                      text: "View Details",
                      onPressFunction: () {
                        GoRouter.of(context).push(
                            AppRouter.kServiceProvidersView,
                            extra: serviceProviders.data![index]);
                      },
                      textColor: AppColors.grey,
                      fontWeight: FontWeight.bold))
            ],
          ),
        ));
  }
}
