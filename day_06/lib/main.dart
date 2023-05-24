import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/widgets.dart';

void main() {
  MyWidgetsBinding();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<StatefulWidget> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final imagePaths = [
    "https://storage.googleapis.com/shop-backend/prod/shop/collections/R2m7TEcSEakqwfDutiwgAuHxCbx2fOcNhZzLPRVS.png",
    "https://storage.googleapis.com/shop-backend/prod/shop/collections/a38pn3uHNwsB1SknRObYew38JpQGFaqgwCqEWy8T.png",
    "https://storage.googleapis.com/shop-backend/prod/shop/collections/M01h3XA9zpEJ3QmJeRhzfHRmpoSKitIAvbtRMQYO.jpg",//88
    "https://storage.googleapis.com/shop-backend/prod/shop/collections/6SixpQ22ZBmxegTtJOW0IHtF9HAdLBSnGzmC6cVk.png",
    "https://storage.googleapis.com/shop-backend/prod/shop/collections/g5Wm8YJTHR7AajhdhAaLZoOIGi0LSMgbjc4HMUsI.jpg",
    "https://storage.googleapis.com/shop-backend/prod/shop/collections/iyJFX63I9ikoAtlr3mVFjgMMeTTPOv1Trg0VpovM.png",
    "https://storage.googleapis.com/shop-backend/prod/shop/collections/gOVAaHLVx5tbJ6aCfsPtbMFuIgbq4KDH6ei9Mk6a.jpg",//88
    "https://storage.googleapis.com/shop-backend/prod/shop/collections/iwsF5qUQoKZj2pWTai0fNq58VBxxKGc9EMvbMdpy.jpg",//88
    "https://storage.googleapis.com/shop-backend/prod/shop/collections/KKXhArtkZBg4xaQWXpi4HscC4mnFRus7CqgSOB5O.png",
    "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/101.png",
  ];
  @override
  void initState() {
    super.initState();
    makeRequest();
  }

  void makeRequest() async {
    for(var i in imagePaths) {
      final image = CachedNetworkImage(imageUrl: i);
      print("image size ${i}");
      final response = await http.get(Uri.parse(i));
      print("image size ${i} = ${response.bodyBytes.lengthInBytes/1000000}mb");
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          body: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CarouselSlider(
                    options: CarouselOptions(autoPlay: true),
                    items: imagePaths.map((imagePath) {
                      return Builder(builder: (context) {
                        return Container(
                          width: MediaQuery.of(context).size.width,//get the width of the device
                          margin: const EdgeInsets.symmetric(horizontal: 2),
                          child: Image(image: CachedNetworkImageProvider(
                              imagePath,
                          )),
                        );
                      });
                    }).toList(),
                ),
              ],
            ),
          ),
      ),
    );
  }
}


class MyWidgetsBinding extends WidgetsFlutterBinding {
  @override
  ImageCache createImageCache() {
    ImageCache imageCache = super.createImageCache();
    imageCache.maximumSizeBytes = 1024 * 1024 * 100 * 10; // 100 MB
    return imageCache;
  }
}

/*
imagePaths.map((imageSrc) {
                      return Builder(
                        builder: (BuildContext context) {
                          return CachedNetworkImage(
                            fit: BoxFit.cover,
                            imageUrl: imageSrc,
                            progressIndicatorBuilder:
                                (context, url, downloadProgress) => const Center(
                              child: CircularProgressIndicator(),
                            ),
                            errorWidget: (context, url, error) =>
                            const Icon(Icons.error),
                          );
                        },
                      );
                    }).toList(),


imagePaths.map((imagePath) {
                      return Builder(builder: (context) {
                        return Container(
                          width: MediaQuery.of(context).size.width,//get the width of the device
                          margin: const EdgeInsets.symmetric(horizontal: 2),
                          child: Image(image: CachedNetworkImageProvider(imagePath)),
                        );
                      });
                    }).toList(),

CachedNetworkImage(
    imageUrl: "https://www.fluttercampus.com/img/logo_small.webp",
    placeholder: (context, url) => CircularProgressIndicator(),
    errorWidget: (context, url, error) => Icon(Icons.error),
    cacheManager: CacheManager(
        Config(
          "fluttercampus",
          stalePeriod: const Duration(days: 7),
          //one week cache period
        )
    ),
)
// 🐦 Flutter imports:
import 'dart:typed_data';

import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:flutter_swiper_tv/flutter_swiper.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

// 🌎 Project imports:
import 'package:app_sb_c_shop/modules/collection/data/models/collection_media.dart';
import 'package:app_sb_c_shop/modules/settings/presenter/settings_bloc.dart';
import 'package:app_sb_c_shop/utils/constants/application_responsive.dart';
import 'package:app_sb_c_shop/utils/widgets/carousel/carousel_collection_link.dart';
import 'package:app_sb_c_shop/utils/widgets/carousel/carousel_indicator.dart';
import 'package:app_sb_c_shop/utils/widgets/carousel/carousel_preview_button.dart';
import 'package:app_sb_c_shop/utils/widgets/carousel/carousel_slide_counter.dart';
import 'package:app_sb_c_shop/utils/widgets/carousel/carousel_swipe.dart';

class CarouselImageSlider extends StatefulWidget {
  const CarouselImageSlider({
    Key? key,
    required this.imagesSrc,
    this.width,
    this.infiniteScroll,
    this.autoPlay,
    showCarouselIndicator,
    showImageCounter,
    required this.onTapImage,
    this.viewportFraction,
    this.collectionMedia,
    showArrowSlide,
    isDashboardScreen,
  })  : showImageCounter = showImageCounter as bool? ?? true,
        showCarouselIndicator = showCarouselIndicator as bool? ?? true,
        isDashboardScreen = isDashboardScreen as bool? ?? false,
        showArrowSlide = showArrowSlide as bool? ?? false,
        super(key: key);

  final List<String> imagesSrc;
  final double? width;
  final bool? infiniteScroll;
  final bool? autoPlay;
  final bool showCarouselIndicator;
  final bool showImageCounter;
  final bool onTapImage;
  final double? viewportFraction;
  final List<CollectionMedia>? collectionMedia;
  final bool isDashboardScreen;
  final bool showArrowSlide;

  @override
  State<CarouselImageSlider> createState() => _CarouselImageSlider();
}

class _CarouselImageSlider extends State<CarouselImageSlider> {
  late SettingsBloc _settingsBloc;
  late ColorScheme _colorScheme;
  late TextTheme _textTheme;
  late List<String> _imgSrc;
  int _indexPage = 1;

  @override
  void initState() {
    super.initState();
    _settingsBloc = context.read<SettingsBloc>();
    _colorScheme = _settingsBloc.state.settings.themeData.colorScheme;
    _textTheme = _settingsBloc.state.settings.themeData.textTheme;
    _imgSrc = widget.imagesSrc;
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    for(var i = 0; i < _imgSrc.length; i++) {
      final image = Image(image: CachedNetworkImageProvider(_imgSrc[i]), fit: BoxFit.cover);
      precacheImage(image.image, context);
    }
  }

  @override
  void didUpdateWidget(CarouselImageSlider oldWidget) {
    super.didUpdateWidget(oldWidget);
    _imgSrc = widget.imagesSrc;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          alignment: Alignment.topLeft,
          children: <Widget>[
            /*
            Container(
              height: widget.isDashboardScreen
                  ? Responsive.dashboardHeight(context)
                  : Responsive.sliderHeight(context),
              child: Swiper(
                itemCount: _imgSrc.length,
                pagination: const SwiperPagination(),
                control: const SwiperControl(),
                itemBuilder: (BuildContext context, int index) {
                    return CachedNetworkImage(
                      fit: BoxFit.cover,
                      imageUrl: _imgSrc[index],
                      progressIndicatorBuilder:
                          (context, url, downloadProgress) => const Center(
                        child: CircularProgressIndicator(),
                      ),
                      errorWidget: (context, url, error) =>
                      const Icon(Icons.error),
                    );
                },
                onIndexChanged: (index) {
                  setState(() {
                    _indexPage = index! + 1;
                  });
                }
              ),
            ),

             */


            CarouselSlider(
              options: CarouselOptions(
                enlargeCenterPage: true,
                autoPlay: widget.autoPlay ?? false,
                autoPlayInterval: const Duration(seconds: 5),
                height: widget.isDashboardScreen
                    ? Responsive.dashboardHeight(context)
                    : Responsive.sliderHeight(context),
                viewportFraction: widget.viewportFraction ?? 1.0,
                enableInfiniteScroll: widget.infiniteScroll ?? false,
                onPageChanged: (page, carouselPageReason) {
                  setState(() {
                    _indexPage = page + 1;
                  });
                },
              ),
              items: _imgSrc.map((imageSrc) {
                return Builder(
                  builder: (BuildContext context) {
                    return CachedNetworkImage(
                      fit: BoxFit.cover,
                      imageUrl: imageSrc,
                      progressIndicatorBuilder:
                          (context, url, downloadProgress) => const Center(
                        child: CircularProgressIndicator(),
                      ),
                      errorWidget: (context, url, error) =>
                          const Icon(Icons.error),
                    );
                  },
                );
              }).toList(),
            ),


            if (widget.showArrowSlide)
              Positioned(
                right: 2.w,
                bottom: Responsive.isSmallSize || Responsive.isTabletDevice
                    ? 12.h
                    : 2.h,
                child: const Center(
                  child: CarouselSwipe(
                    icon: Icons.arrow_back_ios,
                  ),
                ),
              ),
            if (widget.collectionMedia != null)
              Positioned.fill(
                child: Align(
                  child: CarouselCollectionLink(
                    collectionMedia: widget.collectionMedia![_indexPage - 1],
                    colorScheme: _colorScheme,
                    textTheme: _textTheme,
                  ),
                ),
              ),
            if (widget.showImageCounter)
              Positioned(
                top: 2.h,
                left: 4.w,
                child: CarouselSlideCounter(
                  totalImages: _imgSrc.length,
                  indexPage: _indexPage,
                  colorScheme: _colorScheme,
                  textTheme: _textTheme,
                ),
              ),
            if (widget.onTapImage)
              Positioned(
                bottom: 3.h,
                right: 2.h,
                child: CarouselPreviewButton(
                  imagesSrc: _imgSrc,
                  indexPage: _indexPage,
                  colorScheme: _colorScheme,
                ),
              ),
          ],
        ),
        if (widget.showCarouselIndicator)
          CarouselIndicator(
            imagesSrc: _imgSrc,
            indexPage: _indexPage,
            colorScheme: _colorScheme,
          ),
      ],
    );
  }

  @override
  void dispose() {
    super.dispose();
  }


}


 */
