class HomeScreenModel {
  String? status;
  String? message;
  Data? data;

  HomeScreenModel({this.status, this.message, this.data});

  HomeScreenModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  List<String>? newsortBy;
  List<TopMenu>? topMenu;
  List<BannerSlider>? bannerSlider;
  BestSeller? bestSeller;
  MuumyMeCategory? muumyMeCategory;
  List<SeeMoreCategories>? seeMoreCategories;
  List<ShopByBrand>? shopByBrand;
  MuumyMeCategory? plusSizeCategory;
  TrendingCategory? trendingCategory;
  List<ShopUnder>? shopUnder;
  List<OfferItemsBanner>? offerItemsBanner;
  List<OfferItemsBanner>? colorCollectionBanner;
  List<OfferItemsBanner>? summerSaleBanner;
  List<ServiceBlock>? serviceBlock;

  Data(
      {this.newsortBy,
        this.topMenu,
        this.bannerSlider,
        this.bestSeller,
        this.muumyMeCategory,
        this.seeMoreCategories,
        this.shopByBrand,
        this.plusSizeCategory,
        this.trendingCategory,
        this.shopUnder,
        this.offerItemsBanner,
        this.colorCollectionBanner,
        this.summerSaleBanner,
        this.serviceBlock});

  Data.fromJson(Map<String, dynamic> json) {
    newsortBy = json['newsort_by'].cast<String>();
    if (json['top_menu'] != null) {
      topMenu = <TopMenu>[];
      json['top_menu'].forEach((v) {
        topMenu!.add(new TopMenu.fromJson(v));
      });
    }
    if (json['banner_slider'] != null) {
      bannerSlider = <BannerSlider>[];
      json['banner_slider'].forEach((v) {
        bannerSlider!.add(new BannerSlider.fromJson(v));
      });
    }
    bestSeller = json['best_seller'] != null
        ? new BestSeller.fromJson(json['best_seller'])
        : null;
    muumyMeCategory = json['muumy_me_category'] != null
        ? new MuumyMeCategory.fromJson(json['muumy_me_category'])
        : null;
    if (json['see_more_categories'] != null) {
      seeMoreCategories = <SeeMoreCategories>[];
      json['see_more_categories'].forEach((v) {
        seeMoreCategories!.add(new SeeMoreCategories.fromJson(v));
      });
    }
    if (json['shop_by_brand'] != null) {
      shopByBrand = <ShopByBrand>[];
      json['shop_by_brand'].forEach((v) {
        shopByBrand!.add(new ShopByBrand.fromJson(v));
      });
    }
    plusSizeCategory = json['plus_size_category'] != null
        ? new MuumyMeCategory.fromJson(json['plus_size_category'])
        : null;
    trendingCategory = json['trending_category'] != null
        ? new TrendingCategory.fromJson(json['trending_category'])
        : null;
    if (json['shop_under'] != null) {
      shopUnder = <ShopUnder>[];
      json['shop_under'].forEach((v) {
        shopUnder!.add(new ShopUnder.fromJson(v));
      });
    }
    if (json['offer_items_banner'] != null) {
      offerItemsBanner = <OfferItemsBanner>[];
      json['offer_items_banner'].forEach((v) {
        offerItemsBanner!.add(new OfferItemsBanner.fromJson(v));
      });
    }
    if (json['color_collection_banner'] != null) {
      colorCollectionBanner = <OfferItemsBanner>[];
      json['color_collection_banner'].forEach((v) {
        colorCollectionBanner!.add(new OfferItemsBanner.fromJson(v));
      });
    }
    if (json['summer_sale_banner'] != null) {
      summerSaleBanner = <OfferItemsBanner>[];
      json['summer_sale_banner'].forEach((v) {
        summerSaleBanner!.add(new OfferItemsBanner.fromJson(v));
      });
    }
    if (json['service_block'] != null) {
      serviceBlock = <ServiceBlock>[];
      json['service_block'].forEach((v) {
        serviceBlock!.add(new ServiceBlock.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['newsort_by'] = this.newsortBy;
    if (this.topMenu != null) {
      data['top_menu'] = this.topMenu!.map((v) => v.toJson()).toList();
    }
    if (this.bannerSlider != null) {
      data['banner_slider'] =
          this.bannerSlider!.map((v) => v.toJson()).toList();
    }
    if (this.bestSeller != null) {
      data['best_seller'] = this.bestSeller!.toJson();
    }
    if (this.muumyMeCategory != null) {
      data['muumy_me_category'] = this.muumyMeCategory!.toJson();
    }
    if (this.seeMoreCategories != null) {
      data['see_more_categories'] =
          this.seeMoreCategories!.map((v) => v.toJson()).toList();
    }
    if (this.shopByBrand != null) {
      data['shop_by_brand'] = this.shopByBrand!.map((v) => v.toJson()).toList();
    }
    if (this.plusSizeCategory != null) {
      data['plus_size_category'] = this.plusSizeCategory!.toJson();
    }
    if (this.trendingCategory != null) {
      data['trending_category'] = this.trendingCategory!.toJson();
    }
    if (this.shopUnder != null) {
      data['shop_under'] = this.shopUnder!.map((v) => v.toJson()).toList();
    }
    if (this.offerItemsBanner != null) {
      data['offer_items_banner'] =
          this.offerItemsBanner!.map((v) => v.toJson()).toList();
    }
    if (this.colorCollectionBanner != null) {
      data['color_collection_banner'] =
          this.colorCollectionBanner!.map((v) => v.toJson()).toList();
    }
    if (this.summerSaleBanner != null) {
      data['summer_sale_banner'] =
          this.summerSaleBanner!.map((v) => v.toJson()).toList();
    }
    if (this.serviceBlock != null) {
      data['service_block'] =
          this.serviceBlock!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class TopMenu {
  String? name;
  String? image;
  String? entityId;
  String? attributeSetId;
  String? isActive;
  String? includeInMenu;
  String? parentId;
  String? url;
  String? childrenCount;
  var categoryShape;

  TopMenu(
      {this.name,
        this.image,
        this.entityId,
        this.attributeSetId,
        this.isActive,
        this.includeInMenu,
        this.parentId,
        this.url,
        this.childrenCount,
        this.categoryShape});

  TopMenu.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    image = json['image'];
    entityId = json['entity_id'];
    attributeSetId = json['attribute_set_id'];
    isActive = json['is_active'];
    includeInMenu = json['include_in_menu'];
    parentId = json['parent_id'];
    url = json['url'];
    childrenCount = json['children_count'];
    categoryShape = json['category_shape'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['image'] = this.image;
    data['entity_id'] = this.entityId;
    data['attribute_set_id'] = this.attributeSetId;
    data['is_active'] = this.isActive;
    data['include_in_menu'] = this.includeInMenu;
    data['parent_id'] = this.parentId;
    data['url'] = this.url;
    data['children_count'] = this.childrenCount;
    data['category_shape'] = this.categoryShape;
    return data;
  }
}

class BannerSlider {
  String? slideId;
  String? sliderId;
  String? storeId;
  String? title;
  String? mobileImage;
  String? link;
  String? categoryId;
  String? order;

  BannerSlider(
      {this.slideId,
        this.sliderId,
        this.storeId,
        this.title,
        this.mobileImage,
        this.link,
        this.categoryId,
        this.order});

  BannerSlider.fromJson(Map<String, dynamic> json) {
    slideId = json['slide_id'];
    sliderId = json['slider_id'];
    storeId = json['store_id'];
    title = json['title'];
    mobileImage = json['mobile_image'];
    link = json['link'];
    categoryId = json['category_id'];
    order = json['order'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['slide_id'] = this.slideId;
    data['slider_id'] = this.sliderId;
    data['store_id'] = this.storeId;
    data['title'] = this.title;
    data['mobile_image'] = this.mobileImage;
    data['link'] = this.link;
    data['category_id'] = this.categoryId;
    data['order'] = this.order;
    return data;
  }
}

class BestSeller {
  String? id;
  List<BestsellerList>? bestsellerList;

  BestSeller({this.id, this.bestsellerList});

  BestSeller.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    if (json['bestseller_list'] != null) {
      bestsellerList = <BestsellerList>[];
      json['bestseller_list'].forEach((v) {
        bestsellerList!.add(new BestsellerList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    if (this.bestsellerList != null) {
      data['bestseller_list'] =
          this.bestsellerList!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class BestsellerList {
  String? productId;
  String? sku;
  String? mgsBrand;
  String? name;
  String? url;
  String? image;
  String? price;
  String? specialPrice;
  String? finalPrice;
  String? discount;
  String? currencyCode;
  int? isWishlisted;
  String? wishlistItemId;
  String? wishlistId;

  BestsellerList(
      {this.productId,
        this.sku,
        this.mgsBrand,
        this.name,
        this.url,
        this.image,
        this.price,
        this.specialPrice,
        this.finalPrice,
        this.discount,
        this.currencyCode,
        this.isWishlisted,
        this.wishlistItemId,
        this.wishlistId});

  BestsellerList.fromJson(Map<String, dynamic> json) {
    productId = json['product_id'];
    sku = json['sku'];
    mgsBrand = json['mgs_brand'];
    name = json['name'];
    url = json['url'];
    image = json['image'];
    price = json['price'];
    specialPrice = json['special_price'];
    finalPrice = json['final_price'];
    discount = json['discount'];
    currencyCode = json['currency_code'];
    isWishlisted = json['is_wishlisted'];
    wishlistItemId = json['wishlist_item_id'];
    wishlistId = json['wishlist_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['product_id'] = this.productId;
    data['sku'] = this.sku;
    data['mgs_brand'] = this.mgsBrand;
    data['name'] = this.name;
    data['url'] = this.url;
    data['image'] = this.image;
    data['price'] = this.price;
    data['special_price'] = this.specialPrice;
    data['final_price'] = this.finalPrice;
    data['discount'] = this.discount;
    data['currency_code'] = this.currencyCode;
    data['is_wishlisted'] = this.isWishlisted;
    data['wishlist_item_id'] = this.wishlistItemId;
    data['wishlist_id'] = this.wishlistId;
    return data;
  }
}

class MuumyMeCategory {
  String? categoryId;
  String? categoryName;
  List<Lists>? list;

  MuumyMeCategory({this.categoryId, this.categoryName, this.list});

  MuumyMeCategory.fromJson(Map<String, dynamic> json) {
    categoryId = json['category_id'];
    categoryName = json['category_name'];
    if (json['list'] != null) {
      list = <Lists>[];
      json['list'].forEach((v) {
        list!.add(new Lists.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['category_id'] = this.categoryId;
    data['category_name'] = this.categoryName;
    if (this.list != null) {
      data['list'] = this.list!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Lists {
  String? entityId;
  String? name;
  String? sku;
  String? mgsBrand;
  String? image;
  String? currencyCode;
  String? price;
  String? specialPrice;
  String? finalPrice;
  var discount;
  String? productLabel;
  int? isWishlisted;
  String? wishlistItemId;
  String? wishlistId;

  Lists(
      {this.entityId,
        this.name,
        this.sku,
        this.mgsBrand,
        this.image,
        this.currencyCode,
        this.price,
        this.specialPrice,
        this.finalPrice,
        this.discount,
        this.productLabel,
        this.isWishlisted,
        this.wishlistItemId,
        this.wishlistId});

  Lists.fromJson(Map<String, dynamic> json) {
    entityId = json['entity_id'];
    name = json['name'];
    sku = json['sku'];
    mgsBrand = json['mgs_brand'];
    image = json['image'];
    currencyCode = json['currency_code'];
    price = json['price'];
    specialPrice = json['special_price'];
    finalPrice = json['final_price'];
    discount = json['discount'];
    productLabel = json['product_label'];
    isWishlisted = json['is_wishlisted'];
    wishlistItemId = json['wishlist_item_id'];
    wishlistId = json['wishlist_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['entity_id'] = this.entityId;
    data['name'] = this.name;
    data['sku'] = this.sku;
    data['mgs_brand'] = this.mgsBrand;
    data['image'] = this.image;
    data['currency_code'] = this.currencyCode;
    data['price'] = this.price;
    data['special_price'] = this.specialPrice;
    data['final_price'] = this.finalPrice;
    data['discount'] = this.discount;
    data['product_label'] = this.productLabel;
    data['is_wishlisted'] = this.isWishlisted;
    data['wishlist_item_id'] = this.wishlistItemId;
    data['wishlist_id'] = this.wishlistId;
    return data;
  }
}

class SeeMoreCategories {
  String? name;
  String? image;
  String? entityId;
  String? attributeSetId;
  String? isActive;
  String? parentId;
  String? url;
  String? childrenCount;
  var categoryShape;

  SeeMoreCategories(
      {this.name,
        this.image,
        this.entityId,
        this.attributeSetId,
        this.isActive,
        this.parentId,
        this.url,
        this.childrenCount,
        this.categoryShape});

  SeeMoreCategories.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    image = json['image'];
    entityId = json['entity_id'];
    attributeSetId = json['attribute_set_id'];
    isActive = json['is_active'];
    parentId = json['parent_id'];
    url = json['url'];
    childrenCount = json['children_count'];
    categoryShape = json['category_shape'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['image'] = this.image;
    data['entity_id'] = this.entityId;
    data['attribute_set_id'] = this.attributeSetId;
    data['is_active'] = this.isActive;
    data['parent_id'] = this.parentId;
    data['url'] = this.url;
    data['children_count'] = this.childrenCount;
    data['category_shape'] = this.categoryShape;
    return data;
  }
}

class ShopByBrand {
  String? brandId;
  String? label;
  String? urlKey;
  String? optionId;
  String? image;

  ShopByBrand(
      {this.brandId, this.label, this.urlKey, this.optionId, this.image});

  ShopByBrand.fromJson(Map<String, dynamic> json) {
    brandId = json['brand_id'];
    label = json['label'];
    urlKey = json['url_key'];
    optionId = json['option_id'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['brand_id'] = this.brandId;
    data['label'] = this.label;
    data['url_key'] = this.urlKey;
    data['option_id'] = this.optionId;
    data['image'] = this.image;
    return data;
  }
}

class TrendingCategory {
  String? categoryId;
  String? categoryName;
  List<Lists>? list;

  TrendingCategory({this.categoryId, this.categoryName,/* this.list*/});

  TrendingCategory.fromJson(Map<String, dynamic> json) {
    categoryId = json['category_id'];
    categoryName = json['category_name'];
    // if (json['list'] != null) {
    //   list = <Lists>[];
    //   json['list'].forEach((v) {
    //     list!.add(new Lists.fromJson(v));
    //   });
    // }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['category_id'] = this.categoryId;
    data['category_name'] = this.categoryName;
    // if (this.list != null) {
    //   data['list'] = this.list!.map((v) => v.toJson()).toList();
    // }
    return data;
  }
}

class ShopUnder {
  String? id;
  String? title;
  String? currencyCode;

  ShopUnder({this.id, this.title, this.currencyCode});

  ShopUnder.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    currencyCode = json['currency_code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['currency_code'] = this.currencyCode;
    return data;
  }
}

class OfferItemsBanner {
  String? categoryId;
  String? bannerImage;

  OfferItemsBanner({this.categoryId, this.bannerImage});

  OfferItemsBanner.fromJson(Map<String, dynamic> json) {
    categoryId = json['category_id'];
    bannerImage = json['banner_image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['category_id'] = this.categoryId;
    data['banner_image'] = this.bannerImage;
    return data;
  }
}

class ServiceBlock {
  String? title;
  String? description;
  String? icon;

  ServiceBlock({this.title, this.description, this.icon});

  ServiceBlock.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    description = json['description'];
    icon = json['icon'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['description'] = this.description;
    data['icon'] = this.icon;
    return data;
  }
}
