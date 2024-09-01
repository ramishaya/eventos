
import 'package:eventos/core/utils/constants/colors.dart';
import 'package:eventos/core/utils/widgets/custom_back_button.dart';
import 'package:eventos/core/utils/widgets/custom_shader_mask.dart';
import 'package:flutter/material.dart';

class CustomSliverAppBar extends StatelessWidget {
  const CustomSliverAppBar(
      {super.key, required this.size, required this.img, required this.title});

  final Size size;
  final String img;
  final String title;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      pinned: true,
      surfaceTintColor: Colors.transparent,
      title: Text(
        title,
        style: const TextStyle(fontSize: 25, color: Colors.white),
      ),
      centerTitle: true,
      leading: const CustomBackButton2(),
      backgroundColor: AppColors.white,
      expandedHeight: size.height * 0.18,
      stretch: true,
      flexibleSpace: FlexibleSpaceBar(
        collapseMode: CollapseMode.pin,
        stretchModes: const [
          StretchMode.zoomBackground,
        ],
        background: CustomShaderMasK(
            fadeInColor: AppColors.white,
            imageUrl: img,
            width: size.width,
            height: size.height * 0.4),
      ),
    );
  }
}
