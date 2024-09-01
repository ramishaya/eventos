import 'package:eventos/core/utils/constants/colors.dart';
import 'package:eventos/core/utils/local_storage/local_storage.dart';
import 'package:eventos/core/utils/router/app_router.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key, required this.size, required this.userName});

  final Size size;
  final String userName;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              "Welcome Back!",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
            ),

            // here we will use the notifications
            GestureDetector(
              child: const Icon(Iconsax.logout),
              onTap: () {
                LocalStorage.removeData(key: "token");
                GoRouter.of(context).pushReplacement(AppRouter.kLoginView);
              },
            )
          ],
        ),
        SizedBox(height: size.height * 0.001),
        // here we print the user name that comes from the login page
        Text(
          LocalStorage.getData(key: "name"),
          style: const TextStyle(color: AppColors.darkerGrey, fontSize: 20),
        ),
      ],
    );
  }
}

class MyTextStyles {}
