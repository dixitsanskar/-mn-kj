

import 'package:flutter/material.dart';
import 'package:portfolio/model/crousel_item_mode.dart';

List<CrouselItemModel> crouselItems = List.generate(5, (index) => CrouselItemModel(
  text: Container(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
    ),
  ),
  image:Container(),
)