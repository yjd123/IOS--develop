//
//  XCFConstRequest.m
//  XCFApp
//
//  Created by callmejoejoe on 16/4/5.
//  Copyright © 2016年 Joey. All rights reserved.
//

#import <UIKit/UIKit.h>

/** 下厨房 - 首页数据 */
NSString * const XCFRequestKitchenCell = @"http://api.xiachufang.com/v2/issues/list.json?cursor=&origin=iphone&api_sign=069310ae4fc0b866207dba71320f1c13&sk=7UnwJ-JkQ36hbfrMRoL0fA&size=2&timezone=Asia%2FShanghai&version=5.1.1&api_key=0f9f79be1dac5f003e7de6f876b17c00";
/** 下厨房 - 首页更多数据 */
NSString * const XCFRequestKitchenCellMore = @"http://api.xiachufang.com/v2/issues/list.json?cursor=&origin=iphone&api_sign=069310ae4fc0b866207dba71320f1c13&sk=7UnwJ-JkQ36hbfrMRoL0fA&size=2&timezone=Asia%2FShanghai&version=5.1.1&api_key=0f9f79be1dac5f003e7de6f876b17c00";
/** 下厨房 - 关注动态 */
NSString * const XCFRequestKitchenFeeds = @"http://api.xiachufang.com/v2/account/feeds_v4.json?_ts=1475452903.971918&api_key=07397197043fafe11ce5c65c10febf84&api_sign=6a1bfc72b98d18bbf91ef12c6ff4cf9f&limit=20&location_code=156330100000000&nonce=E68DB80E-EBB2-4755-AD10-F7CC2C4D50B5&offset=0&origin=iphone&sk=ztc0Z65CTiCWHwsBVHjziQ&version=5.9.1";
// 流行菜谱
 
NSString * const XCFRequestKitchenPopular =@"http://api.xiachufang.com/v2/recipes/popular_v3.json?_ts=1475410940.448199&api_key=07397197043fafe11ce5c65c10febf84&api_sign=66072cd299b2d76b31b74972b41d30c4&limit=20&location_code=156330100000000&nonce=B8C88DFB-BEF9-4EB2-A043-346F3EB0F651&offset=0&origin=iphone&sk=ztc0Z65CTiCWHwsBVHjziQ&version=5.9.1";

// 流行菜谱url

NSString * const XCFRequestKitchenPopularUrl =@"http://www.xiachufang.com/explore/";



/** 下厨房 - 导航数据 */
NSString * const XCFRequestKitchenNav = @"http://api.xiachufang.com/v2/init_page_v5.json?version=5.1.1&timezone=Asia%2FShanghai&api_sign=8436824b4ec402b228bf20028d49c9b5&api_key=0f9f79be1dac5f003e7de6f876b17c00&origin=iphone&sk=7UnwJ-JkQ36hbfrMRoL0fA";
/** 下厨房 - 早餐 */
NSString * const XCFRequestKitchenBreakfast = @"http://api.xiachufang.com/v2/events/show.json?_ts=1475416246.950871&api_key=07397197043fafe11ce5c65c10febf84&api_sign=2157d1054d7392a2e71d4741166f0ba3&id=100166595&location_code=156330100000000&nonce=4D06EE24-5681-4D71-8D1C-902EA04F7EE6&origin=iphone&sk=ztc0Z65CTiCWHwsBVHjziQ&version=5.9.1";


///** 下厨房 - 早餐 - 作品数据 */
//NSString * const XCFRequestKitchenBreakfastDishes = @"http://api.xiachufang.com/v2/events/100114704/dishes_order_by_hot.json?offset=0&detail=true&origin=iphone&api_sign=181fa96605c796ba8e1e66b90afdc464&sk=7UnwJ-JkQ36hbfrMRoL0fA&limit=18&version=5.1.1&timestamp=1461943166&api_key=0f9f79be1dac5f003e7de6f876b17c00";



/** 下厨房 - 排行榜 */
NSString * const XCFRequestKitchenTopLists = @"http://www.xiachufang.com/page/top-list/";
/** 下厨房 - 厨房问答 */
NSString * const XCFRequestKitchenTalks = @"https://www.xiachufang.com/page/market/98/";
/** 下厨房 - 买烘焙 */
NSString * const XCFRequestKitchenBuys = @"https://www.xiachufang.com/page/baking_zone/home/";

/** 下厨房 - 菜谱分类 */
NSString * const XCFRequestKitchenRecipeCategorys = @"http://www.xiachufang.com/page/app-category/";




/** 下厨房 - cell跳转数据 - 模板2 菜单详情 */
NSString * const XCFRequestKitchenRecipeList = @"http://api.xiachufang.com/v2/recipe_lists/show.json?origin=iphone&id=101554496&api_sign=9b01343de4bc0f61a5b2f051227d00f9&pic_size=720&sk=7UnwJ-JkQ36hbfrMRoL0fA&version=5.1.1&api_key=0f9f79be1dac5f003e7de6f876b17c00";
/** 下厨房 - cell跳转数据 - 模板2 菜单内菜谱理由数据 */
NSString * const XCFRequestKitchenRecipeReason = @"http://api.xiachufang.com/v2/recipe_lists/100072887/recipes_v2.json?offset=0&origin=iphone&api_sign=2057b55a66e4d86a9284232741762f0e&sk=7UnwJ-JkQ36hbfrMRoL0fA&limit=20&version=5.1.1&api_key=0f9f79be1dac5f003e7de6f876b17c00";
/** 下厨房 - cell跳转数据 - 模板4 作品数据 */
NSString * const XCFRequestKitchenDish = @"http://api.xiachufang.com/v2/dishes/show_v2.json?version=5.1.1&id=115246351&api_sign=b3771cf94fa48e3a064247e5ae0610ea&api_key=0f9f79be1dac5f003e7de6f876b17c00&origin=iphone&sk=7UnwJ-JkQ36hbfrMRoL0fA";
/** 下厨房 - cell跳转数据 - 模板5 菜谱详情 */
NSString * const XCFRequestKitchenRecipe = @"http://api.xiachufang.com/v2/recipes/show_v2.json?origin=iphone&mode=full&id=101773324&api_sign=6332fd2dc5517a725cc5a7fb8e58ea5e&sk=7UnwJ-JkQ36hbfrMRoL0fA&version=5.1.1&api_key=0f9f79be1dac5f003e7de6f876b17c00";
/** 下厨房 - cell跳转数据 - 模板5 菜谱id数组数据 */
NSString * const XCFRequestKitchenRecipeIDs = @"http://api.xiachufang.com/v2/recipes/101773324/dishes_v2.json?detail=false&offset=0&origin=iphone&api_sign=43b447f66fff40e58f39d1aa7b6aab0e&sk=7UnwJ-JkQ36hbfrMRoL0fA&limit=4&version=5.1.1&api_key=0f9f79be1dac5f003e7de6f876b17c00";
/** 下厨房 - cell跳转数据 - 模板5 菜谱内作品详细数据 */
NSString * const XCFRequestKitchenRecipeDish = @"http://api.xiachufang.com/v2/dishes/lookup_v2.json?version=5.1.1&id=115422648%2C115406797%2C115405331%2C115400878&api_sign=ca8aa5cbae7ce01e2c705e4cef02c0ac&api_key=0f9f79be1dac5f003e7de6f876b17c00&origin=iphone&sk=7UnwJ-JkQ36hbfrMRoL0fA";
/** 下厨房 - cell跳转数据 - 模板5 菜谱“被加入的菜单”数据 */
NSString * const XCFRequestKitchenAddedRecipeList = @"http://api.xiachufang.com/v2/recipes/101773324/related_recipe_lists_v2.json?detail=true&offset=0&origin=iphone&api_sign=13227ccd1adc16087e67960be8b45457&sk=7UnwJ-JkQ36hbfrMRoL0fA&limit=2&version=5.1.1&api_key=0f9f79be1dac5f003e7de6f876b17c00";


/** 下厨房 - 商品详情 */
NSString * const XCFRequestGoods = @"http://api.xiachufang.com/v2/goods/show_v2.json?version=5.1.1&id=3157&api_sign=e353a21329147e9e712b4ff7758d4796&api_key=0f9f79be1dac5f003e7de6f876b17c00&origin=iphone&sk=7UnwJ-JkQ36hbfrMRoL0fA";
/** 下厨房 - 商品详情 - 评价 */
NSString * const XCFRequestGoodsReview = @"http://api.xiachufang.com/v2/goods/3157/reviews.json?offset=0&origin=iphone&api_sign=2057b55a66e4d86a9284232741762f0e&sk=7UnwJ-JkQ36hbfrMRoL0fA&limit=20&version=5.1.1&api_key=0f9f79be1dac5f003e7de6f876b17c00";

/** 用户信息 */
NSString * const XCFAuthorInfo = @"http://api.xiachufang.com/v2/users/show.json?origin=iphone&api_sign=fa3963bc5a16b347e4f7d4ccf2896330&pic_size=160&sk=7UnwJ-JkQ36hbfrMRoL0fA&version=5.1.1&user_id=105223583&api_key=0f9f79be1dac5f003e7de6f876b17c00";
/** 用户作品 */
NSString * const XCFAuthorDish = @"http://api.xiachufang.com/v2/dishes/created_by_user.json?detail=true&offset=0&origin=iphone&api_sign=5d8e211b92c5d1e45c214946cc5362a5&sk=7UnwJ-JkQ36hbfrMRoL0fA&limit=18&version=5.1.1&user_id=105223583&api_key=0f9f79be1dac5f003e7de6f876b17c00";


/** 流行搜索 */
NSString * const XCFSearchKeywords = @"http://api.xiachufang.com/v2/search/keyword_day.json?version=5.1.1&api_sign=beb380133484f55e86fd15a147226582&api_key=0f9f79be1dac5f003e7de6f876b17c00&origin=iphone&sk=7UnwJ-JkQ36hbfrMRoL0fA";

/** 购物车 */
NSString * const XCFShoppingCart = @"http://api.xiachufang.com/v2/cart/items.json?offset=0&origin=iphone&api_sign=2057b55a66e4d86a9284232741762f0e&sk=7UnwJ-JkQ36hbfrMRoL0fA&limit=20&version=5.1.1&api_key=0f9f79be1dac5f003e7de6f876b17c00";


/** 社区 */
NSString * const XCFRequestCommunity = @"http://api.xiachufang.com/v2/social/init_page.json?origin=iphone&longitude=114.918727&api_sign=bcd62c6e9e0c9b70f1c60719c0b96082&sk=7UnwJ-JkQ36hbfrMRoL0fA&latitude=22.806659&version=5.1.1&api_key=0f9f79be1dac5f003e7de6f876b17c00";
/** 社区 - 帖子 */
NSString * const XCFRequestTopic = @"http://api.xiachufang.com/v2/forums/2/topics.json?offset=0&origin=iphone&api_sign=2057b55a66e4d86a9284232741762f0e&sk=7UnwJ-JkQ36hbfrMRoL0fA&limit=20&version=5.1.1&api_key=0f9f79be1dac5f003e7de6f876b17c00";
