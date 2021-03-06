//
//  MConfig.h
//  MSeller
//
//  Created by TreeWrite on 2017/9/25.
//  Copyright © 2017年 TreeWrite. All rights reserved.
//

#ifndef MConfig_h
#define MConfig_h

#define M_ENVIRONMENT 0 //iOS网络环境 0:int 开发环境 1: 测试环境 2:线上测试环境 3:生产环境

/*********************环境配置*********************/
#if M_ENVIRONMENT==0

#define M_HeadHost @"http://"
#warning 域名可以用的时候需要把 M_SeverHost的值替换成域名
#define M_APIHeadHost       @"devapi.manjd.com"
#define M_SeverHost         @"192.168.2.101"

#define M_ImageHeadHost     @"devimg.manjd.net"
#define M_ImageSeverHost    @"192.168.2.102"

#define M_FileHeadHost      @"devfile.manjd.net"
#define M_FileSeverHost     @"192.168.2.102"

#elif M_ENVIRONMENT==1


#elif M_ENVIRONMENT==2


#elif M_ENVIRONMENT==3


#endif

/*********************接口定义*********************/
//用户
#define M_User_Login_URL        @"/api/user/v1/app/login"           //用户登录
#define M_User_SMSCode_URL      @"/api/user/v1/app/getcode"         //发送验证码
#define M_User_GetUserInfo_URL  @"/api/user/v1/app/getuserinfo"     //获取用户资料信息
#define M_User_GetMyInfo_URL    @"/api/user/v1/app/getmyinfo"       //获取用户收益信息


//商品
#define M_Goods_GetCate_URL     @"/api/goods/v1/app/getcate"        //获取商品分类
#define M_Goods_GetList_URL     @"/api/goods/v1/app/getlist"        //获取商品分类下商品列表
#define M_Goods_Search_URL      @"/api/goods/v1/app/search"         //商品搜索结果
#define M_Goods_Detail_URL      @"/api/goodsdetail/v1/app/getdetail"    //商品详情
#define M_Goods_Detail_Getsku_URL   @"/api/goodsdetail/v1/app/getsku"   //商品规格
#define M_Goods_RecommAndLike_URL   @"/api/goods/v1/app/dogoods"        //添加关注或推荐



//店铺
#define M_Shop_Create_URL       @"/api/shop/v1/app/create"          //卖家创建店铺
#define M_Shop_GetInfo_URL      @"/api/shop/v1/app/getShop"         //卖家获取店铺基础信息
#define M_Shop_EditInfo_URL     @"/api/shop/v1/app/edit"            //卖家修改店铺信息
#define M_Shop_GetGoods_URL     @"/api/shop/v1/app/goods"           //卖家获取店铺在售商品列表
#define M_Shop_EditGoods_URL    @"/api/shop/v1/app/editGoods"       //修改店铺商品状态
#define M_Shop_SetLogo_URL      @"/api/shop/v1/app/setLogo"         //设置店铺Logo
#define M_Shop_GetSignPics_URL  @"/api/shop/v1/app/getSignPics"     //获取店招图列表，返回路径数组



#endif /* MConfig_h */
