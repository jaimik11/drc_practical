import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:untitled_drc/home_cubit.dart';
import 'package:untitled_drc/repository/ApiRepository.dart';
import 'package:untitled_drc/src/colors.dart';
import 'package:untitled_drc/src/image_assests.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

final List<int> imgList = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];

class _HomeScreenState extends State<HomeScreen> {
  var geHomeCubit = HomeCubit(apiRepository: ApiRepository());
  CarouselController controller = CarouselController();
  PageController pageController = PageController();
  int _current = 0;

  @override
  void initState() {
    geHomeCubit.callGeDataListApi1();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener(
      bloc: geHomeCubit,
      listener: (context, state) {
        print(
            "geHomeCubit.============homeModel ${geHomeCubit.homeScreenModel!.data!.bannerSlider!.length}");
        if (state is HomeStateError) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              behavior: SnackBarBehavior.floating,
              content: Text(state.error!),
              duration: const Duration(seconds: 3),
            ),
          );
        }
      },
      child: BlocBuilder(
        bloc: geHomeCubit,
        builder: (context, state) {
          if (state is HomeStateSuccess) {
            // for(int i = 0; i < geHomeCubit.homeScreenModel!.data!.bannerSlider!.length ; i ++){
            //   imgList.add(i+1);
            // }
            return SafeArea(
              child: SingleChildScrollView(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 50.0,
                        child: const Center(
                            child: Text(
                          "Annabelle",
                          style: TextStyle(
                              fontFamily: "Montserrat",
                              fontSize: 18.0,
                              color: color1),
                        )),
                      ),
                      CarouselSlider.builder(
                        carouselController: controller,
                        itemCount: geHomeCubit
                            .homeScreenModel!.data!.bannerSlider!.length,
                        itemBuilder: (ctx, index, realIdx) {
                          return Container(
                            child: Image.network(geHomeCubit.homeScreenModel!
                                .data!.bannerSlider![index].mobileImage!),
                          );
                        },
                        options: CarouselOptions(
                            autoPlay: true,
                            aspectRatio: 0.9,
                            viewportFraction: 1.0,
                            enlargeCenterPage: true,
                            onPageChanged: (index, reason) {
                              setState(() {
                                _current = index;
                              });
                            }),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: imgList.map((url) {
                          int index = imgList.indexOf(url);
                          return Container(
                              width: _current == index ? 25 : 8.0,
                              height: 8.0,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15.0)),
                              margin: EdgeInsets.symmetric(
                                  vertical: 10.0, horizontal: 2.0),
                              child: _current == index
                                  ? Container(
                                      decoration: BoxDecoration(
                                          color: color1,
                                          borderRadius:
                                              BorderRadius.circular(15.0)),
                                    )
                                  : Container(
                                      decoration: BoxDecoration(
                                          color: color2,
                                          borderRadius:
                                              BorderRadius.circular(15.0)),
                                    ));
                        }).toList(),
                      ),
                      Stack(
                        children: [
                          Image.asset(ImageAssests.bg_best_sellers),
                          const Positioned(
                            top: 15.0,
                            left: 20.0,
                            child: Text(
                              "Best Sellers",
                              style: TextStyle(
                                fontFamily: "Montserrat",
                                fontSize: 18.0,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          const Positioned(
                            top: 15.0,
                            right: 20.0,
                            child: Text(
                              "see all",
                              style: TextStyle(
                                  fontFamily: "Montserrat",
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.w600,
                                  color: color1),
                            ),
                          )
                        ],
                      ),
                      Container(
                        color: color4,
                        height: MediaQuery.of(context).size.height / 2.2,
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: ListView.builder(
                              shrinkWrap: true,
                              itemCount: geHomeCubit.homeScreenModel!.data!
                                  .bestSeller!.bestsellerList!.length,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                return Container(
                                  width: 150.0,
                                  color: Colors.white,
                                  padding: EdgeInsets.only(
                                      left: index == 0 ? 0 : 15.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                          height: 250.0,
                                          child: Image.network(geHomeCubit
                                              .homeScreenModel!
                                              .data!
                                              .bestSeller!
                                              .bestsellerList![index]
                                              .image!)),
                                      const Text(
                                        "Annabelle",
                                        style: TextStyle(
                                            fontFamily: "Montserrat",
                                            fontSize: 14.0,
                                            color: color1),
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(top: 7.0),
                                        child: Text(
                                          geHomeCubit
                                              .homeScreenModel!
                                              .data!
                                              .bestSeller!
                                              .bestsellerList![index]
                                              .name!,
                                          maxLines: 2,
                                          style: const TextStyle(
                                              fontFamily: "Montserrat",
                                              fontSize: 16.0,
                                              fontWeight: FontWeight.w600),
                                        ),
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(top: 10.0),
                                        child: Text(
                                          "${geHomeCubit.homeScreenModel!.data!.bestSeller!.bestsellerList![index].currencyCode!} ${geHomeCubit.homeScreenModel!.data!.bestSeller!.bestsellerList![index].price!}",
                                          maxLines: 2,
                                          style: const TextStyle(
                                              fontFamily: "Montserrat",
                                              fontSize: 14.0,
                                              color: color1,
                                              fontWeight: FontWeight.w600),
                                        ),
                                      )
                                    ],
                                  ),
                                );
                              }),
                        ),
                      ),
                      Container(
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Container(
                              child: Image.network(geHomeCubit.homeScreenModel!
                                  .data!.offerItemsBanner![0].bannerImage!)),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 15.0),
                        child: const Text(
                          "See more categories",
                          style: TextStyle(
                            fontFamily: "Montserrat",
                            fontSize: 18.0,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      ),
                      Container(
                         height: 150,
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: ListView.builder(
                              shrinkWrap: true,
                              itemCount: geHomeCubit.homeScreenModel!.data!
                                  .seeMoreCategories!.length,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                return Container(
                                  margin: EdgeInsets.only(left: 10.0,top: 10.0),
                                  padding: EdgeInsets.only(
                                      left: index == 0 ? 0 : 15.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Stack(
                                        children: [

                                          Container(
                                            height: 85.0,
                                            width: 85.0,
                                            decoration: BoxDecoration(
                                              color: Colors.pink.withOpacity(0.5),
                                                border: Border.all(
                                                  color: Colors.pink,
                                                  width: 1.5
                                                ),
                                                shape: BoxShape.circle
                                            )
                                          ),
                                          Transform.translate(
                                            offset: Offset(-5.0, -5.0),
                                            child: Container(
                                              height: 85.0,
                                              width: 85.0,
                                              child: CircleAvatar(
                                                backgroundImage: NetworkImage(geHomeCubit
                                                    .homeScreenModel!
                                                    .data!
                                                    .seeMoreCategories![index]
                                                    .image!),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(top: 10.0),
                                        child: Center(
                                          child: Text(
                                            geHomeCubit.homeScreenModel!.data!
                                                .seeMoreCategories![index].name!,
                                            style: const TextStyle(
                                                fontFamily: "Montserrat",
                                                fontSize: 14.0,
                                                fontWeight: FontWeight.w400,),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              }),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 15.0),
                        child: const Text(
                          "Shop by Brands",
                          style: TextStyle(
                            fontFamily: "Montserrat",
                            fontSize: 18.0,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      ),
                      Container(
                        height: 150,
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: ListView.builder(
                              shrinkWrap: true,
                              itemCount: geHomeCubit.homeScreenModel!.data!
                                  .shopByBrand!.length,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                return Container(
                                  margin: EdgeInsets.only(left: 10.0,top: 10.0),
                                  padding: EdgeInsets.only(
                                      left: index == 0 ? 0 : 15.0),
                                  child: Column(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.center,
                                    children: [
                                      Stack(
                                        children: [
                                          Container(
                                              height: 100.0,
                                              width: 100.0,
                                              child: Image.asset(ImageAssests.bg_brand_home)
                                          ),
                                          Positioned(
                                            left: 15.0,
                                            top: 10.0,
                                            child: Container(
                                              height: 75.0,
                                              width: 75.0,
                                              child: Image.network(geHomeCubit
                                                  .homeScreenModel!
                                                  .data!
                                                  .shopByBrand![index]
                                                  .image!)
                                            ),
                                          ),

                                        ],
                                      ),
                                    ],
                                  ),
                                );
                              }),
                        ),
                      ),
                      Container(
                        color: color4,
                        height: MediaQuery.of(context).size.height / 5,
                        child: Column(
                          children: [
                            Container(
                              height : 50.0,
                              margin: EdgeInsets.only(left: 10.0,right: 10.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: const [
                                  Text(
                                    "Get Glam",
                                    style: TextStyle(
                                      fontFamily: "Montserrat",
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  Text(
                                    "see all",
                                    style: TextStyle(
                                        fontFamily: "Montserrat",
                                        fontSize: 14.0,
                                        fontWeight: FontWeight.w600,
                                        color: color1),
                                  ),
                                ],
                              ),
                            ),
                          /*  Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: ListView.builder(
                                  shrinkWrap: true,
                                  itemCount: geHomeCubit.homeScreenModel!.data!
                                      .trendingCategory!.list!.length,
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder: (context, index) {
                                    return Container(
                                        height: 250.0,
                                        child: Image.network(geHomeCubit
                                            .homeScreenModel!
                                            .data!
                                            .bestSeller!
                                            .bestsellerList![index]
                                            .image!));
                                  }),
                            ),*/ //TODO I WAS NOT GETTING DATA OF TRENDING_CATEGORY SO I DIDN'T IMPLEMENTED IT
                          ],
                        ),
                      ),
                    ]),
              ),
            );
          } else {
            return Container();
          }
        },
      ),
    );
  }
}
