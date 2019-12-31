<%--
  此页作用:(请输入一句话描述此页作用)
  创建作者: 16052
  当前时间: 2019/12/2711:45

--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<html>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>确认订单</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style.css" />
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/shopping-mall-index.css" />
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/zhonglin.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/zhongling2.js"></script>
</head>

<body style="position:relative;">

<!--header-->
<div class="zl-header">
    <div class="zl-hd w1200">
        <p class="hd-p1 f-l">
            Hi!您好，欢迎来到宅客微购，请登录  <a href="注册.html">【免费注册】</a>
        </p>
        <p class="hd-p2 f-r">
            <a href="index.html">返回首页 (个人中心)</a><span>|</span>
            <a href="购物车.html">我的购物车</a><span>|</span>
            <a href="我的订单.html">我的订单</a>
        </p>
        <div style="clear:both;"></div>
    </div>
</div>

<%--切换城市--%>
<%@ include file="switch.jsp" %>

<form action="${pageContext.request.contextPath}/order/toPay.do" method="post" >
<!--内容开始-->
<div class="payment-interface w1200">
    <div class="pay-info">
        <div class="info-tit">
            <h3>选择收货地址</h3>
        </div>
       <table>
            <tr>
                <td>收货人</td>
                <td>
                    <input type="text" name="name" value="${sessionScope.user.name}" required/>
                </td>
            </tr>
            <tr>
                <td>收货地址</td>
                <td>
                    <input type="text" name="addr" value="${sessionScope.user.addr}" required>
                </td>
            </tr>
            <tr>
                <td>联系方式</td>
                <td>
                    <input  type="tel" name="phonr" value="${sessionScope.user.phone}" required>
                </td>
            </tr>
       </table>
    </div>
    <div class="pay-info">
        <div class="info-tit" style="border-bottom:0;">
            <h3>订单信息</h3>
        </div>
    </div>
        <div class="cart-con-info">
            <div class="cart-con-tit" style="margin:20px 0 5px;">
                <p class="p1" style="width:350px;"></p>
                <p class="p4" style="width:130px;">数量</p>
                <p class="p8" style="width:75px;">单价（元）</p>
                <p class="p6" style="width:173px;">金额（元）</p>
            </div>

            <c:forEach items="${cart.cartltems}" var="cartItem">

            <div class="info-mid">
                <div class="mid-tu f-l">
                    <a href="#"><img width="80" src="${pageContext.request.contextPath}/${cartItem.product.image}" /></a>
                </div>
                <div class="mid-font f-l" style="margin-right:130px;">
                    <a href="#">
                            ${fn:substring(cartItem.product.pname,1 ,10)}
                        <br />
                            ${fn:substring(cartItem.product.pdesc,1 ,10)}...
                    </a>
                </div>
                <div class="mid-sl f-l" style="margin:10px 94px 0px 0px;">
                     X ${cartItem.count}
                </div>
                <p class="mid-yunfei f-l">¥ ${cartItem.product.shopPrice}</p>
                <p class="mid-je f-l" style="margin:10px 120px 0px 0px;">¥ ${cartItem.subTotal}</p>
                <div style="clear:both;"></div>
            </div>

            </c:forEach>
            <div class="info-tijiao">
                <p class="p1">实付款：<span>¥${cart.total}</span></p>
                <button class="btn">提交订单</button>
            </div>
        </div>
</div>

</form>

<!--底部一块-->
<div class="footer-box">
    <ul class="footer-info1 w1200">
        <li>
            <div class="ft-tu1">
                <a href="JavaScript:;"><img src="${pageContext.request.contextPath}/images/zl2-86.gif" /></a>
            </div>
            <h3><a href="JavaScript:;">号码保障</a></h3>
            <P>所有会员，手机短信验证</P>
        </li>
        <li>
            <div class="ft-tu1">
                <a href="JavaScript:;"><img src="${pageContext.request.contextPath}/images/zl2-87.gif" /></a>
            </div>
            <h3><a href="JavaScript:;">6*12小时客服</a></h3>
            <P>有任何问题随时免费资讯</P>
        </li>
        <li>
            <div class="ft-tu1">
                <a href="JavaScript:;"><img src="${pageContext.request.contextPath}/images/zl2-88.gif" /></a>
            </div>
            <h3><a href="JavaScript:;">专业专攻</a></h3>
            <P>我们只专注于建筑行业的信息服务</P>
        </li>
        <li>
            <div class="ft-tu1">
                <a href="JavaScript:;"><img src="${pageContext.request.contextPath}/images/zl2-89.gif" /></a>
            </div>
            <h3><a href="JavaScript:;">注册有礼</a></h3>
            <P>随时随地注册有大礼包</P>
        </li>
        <li>
            <div class="ft-tu1">
                <a href="JavaScript:;"><img src="${pageContext.request.contextPath}/images/zl2-90.gif" /></a>
            </div>
            <h3><a href="JavaScript:;">值得信赖</a></h3>
            <P>专业的产品，专业的团队</P>
        </li>
        <div style="clear:both;"></div>
    </ul>
    <div class="footer-info2 w1200">
        <div class="ft-if2-left f-l">
            <dl>
                <dt><a href="6-1服务协议.html">新手上路</a></dt>
                <dd>
                    <a href="6-1服务协议.html">购物流程</a>
                    <a href="6-1服务协议.html">在线支付</a>
                    <a href="6-1服务协议.html">投诉与建议</a>
                </dd>
            </dl>
            <dl>
                <dt><a href="6-1服务协议.html">配送方式</a></dt>
                <dd>
                    <a href="6-1服务协议.html">货到付款区域</a>
                    <a href="6-1服务协议.html">配送费标准</a>
                </dd>
            </dl>
            <dl>
                <dt><a href="6-1服务协议.html">购物指南</a></dt>
                <dd>
                    <a href="6-1服务协议.html">订购流程</a>
                    <a href="6-1服务协议.html">购物常见问题</a>
                </dd>
            </dl>
            <dl>
                <dt><a href="6-1服务协议.html">售后服务</a></dt>
                <dd>
                    <a href="6-1服务协议.html">售后服务保障</a>
                    <a href="6-1服务协议.html">退换货政策总则</a>
                    <a href="6-1服务协议.html">自营商品退换细则</a>
                </dd>
            </dl>
            <div style="clear:both;"></div>
        </div>
        <div class="ft-if2-right f-r">
            <h3>400-2298-223</h3>
            <p>周一至周日  9:00-24:00</p>
            <p>（仅收市话费）</p>
        </div>
        <div style="clear:both;"></div>
    </div>
    <div class="footer-info3 w1200">
        <p>
            <a href="#">免责条款</a><span>|</span>
            <a href="#">隐私保护</a><span>|</span>
            <a href="#">咨询热点</a><span>|</span>
            <a href="#">联系我们</a><span>|</span>
            <a href="#">公司简介</a>
        </p>
        <p>
            <a href="#">沪ICP备13044278号</a><span>|</span>
            <a href="#">合字B1.B2-20130004</a><span>|</span>
            <a href="#">营业执照</a><span>|</span>
            <a href="#">互联网药品信息服务资格证</a><span>|</span>
            <a href="#">互联网药品交易服务资格证</a>
        </p>
        <div class="ft-if3-tu1">
            <a href="#"><img src="${pageContext.request.contextPath}/images/zl2-91.gif" /></a>
            <a href="#"><img src="${pageContext.request.contextPath}/images/zl2-92.gif" /></a>
            <a href="#"><img src="${pageContext.request.contextPath}/images/zl2-93.gif" /></a>
        </div>
    </div>
</div>

<!--确认订单（新增地址）-->
<div class="confirmation-tanchuang" xgdz1="">
    <div class="tanchuang-bg"></div>
    <div class="tanchuang-con">
        <div class="tc-title">
            <h3>新增地址</h3>
            <a href="JavaScript:;" dz-guan=""><img src="${pageContext.request.contextPath}/images/close-select-city.gif" /></a>
            <div style="clear:both;"></div>
        </div>
        <ul class="tc-con2">
            <li class="tc-li1">
                <p class="l-p">所在地区<span>*</span></p>
                <div class="xl-dz">
                    <div class="dz-left f-l">
                        <p>新疆</p>
                        <ul>
                            <li class="current"><a href="#">新疆</a></li>
                            <li><a href="#">甘肃</a></li>
                            <li><a href="#">宁夏</a></li>
                            <li><a href="#">青海</a></li>
                            <li><a href="#">重庆</a></li>
                            <li><a href="#">长寿</a></li>
                        </ul>
                    </div>
                    <div class="dz-right f-l">
                        <p>乌鲁木齐</p>
                        <ul>
                            <li class="current"><a href="#">乌鲁木齐</a></li>
                            <li><a href="#">昌吉</a></li>
                            <li><a href="#">巴音</a></li>
                            <li><a href="#">郭楞</a></li>
                            <li><a href="#">伊犁</a></li>
                            <li><a href="#">阿克苏</a></li>
                            <li><a href="#">喀什</a></li>
                            <li><a href="#">哈密</a></li>
                            <li><a href="#">克拉玛依</a></li>
                            <li><a href="#">博尔塔拉</a></li>
                            <li><a href="#">吐鲁番</a></li>
                            <li><a href="#">和田</a></li>
                            <li><a href="#">石河子</a></li>
                            <li><a href="#">克孜勒苏</a></li>
                            <li><a href="#">阿拉尔</a></li>
                            <li><a href="#">五家渠</a></li>
                            <li><a href="#">图木舒克</a></li>
                            <li><a href="#">库尔勒</a></li>
                            <div style="clear:both;"></div>
                        </ul>
                    </div>
                    <div style="clear:both;"></div>
                </div>
                <div style="clear:both;"></div>
            </li>
            <li class="tc-li1">
                <p class="l-p">详细地址<span>*</span></p>
                <textarea class="textarea1" placeholder="请如实填写您的详细信息，如街道名称、门牌号、楼层号和房间号。"></textarea>
                <div style="clear:both;"></div>
            </li>
            <li class="tc-li1">
                <p class="l-p">邮政编码<span></span></p>
                <input type="text" />
                <div style="clear:both;"></div>
            </li>
            <li class="tc-li1">
                <p class="l-p">收货人姓名<span>*</span></p>
                <input type="text" />
                <div style="clear:both;"></div>
            </li>
            <li class="tc-li1">
                <p class="l-p">联系电话<span>*</span></p>
                <input type="text" />
                <div style="clear:both;"></div>
            </li>
        </ul>
        <button class="btn-pst2">保存</button>
    </div>
</div>

<!--修改地址-->
<div class="confirmation-tanchuang" xgdz2="">
    <div class="tanchuang-bg"></div>
    <div class="tanchuang-con">
        <div class="tc-title">
            <h3>新增地址</h3>
            <a href="JavaScript:;" dz-guan=""><img src="${pageContext.request.contextPath}/images/close-select-city.gif" /></a>
            <div style="clear:both;"></div>
        </div>
        <ul class="tc-con2">
            <li class="tc-li1">
                <p class="l-p">所在地区<span>*</span></p>
                <div class="xl-dz">
                    <div class="dz-left f-l">
                        <p>北京</p>
                        <ul>
                            <li class="current"><a href="#">新疆</a></li>
                            <li><a href="#">甘肃</a></li>
                            <li><a href="#">宁夏</a></li>
                            <li><a href="#">青海</a></li>
                            <li><a href="#">重庆</a></li>
                            <li><a href="#">长寿</a></li>
                        </ul>
                    </div>
                    <div class="dz-right f-l">
                        <p>天安门</p>
                        <ul>
                            <li class="current"><a href="#">乌鲁木齐</a></li>
                            <li><a href="#">昌吉</a></li>
                            <li><a href="#">巴音</a></li>
                            <li><a href="#">郭楞</a></li>
                            <li><a href="#">伊犁</a></li>
                            <li><a href="#">阿克苏</a></li>
                            <li><a href="#">喀什</a></li>
                            <li><a href="#">哈密</a></li>
                            <li><a href="#">克拉玛依</a></li>
                            <li><a href="#">博尔塔拉</a></li>
                            <li><a href="#">吐鲁番</a></li>
                            <li><a href="#">和田</a></li>
                            <li><a href="#">石河子</a></li>
                            <li><a href="#">克孜勒苏</a></li>
                            <li><a href="#">阿拉尔</a></li>
                            <li><a href="#">五家渠</a></li>
                            <li><a href="#">图木舒克</a></li>
                            <li><a href="#">库尔勒</a></li>
                            <div style="clear:both;"></div>
                        </ul>
                    </div>
                    <div style="clear:both;"></div>
                </div>
                <div style="clear:both;"></div>
            </li>
            <li class="tc-li1">
                <p class="l-p">详细地址<span>*</span></p>
                <textarea class="textarea1" placeholder="请如实填写您的详细信息，如街道名称、门牌号、楼层号和房间号。"></textarea>
                <div style="clear:both;"></div>
            </li>
            <li class="tc-li1">
                <p class="l-p">邮政编码<span></span></p>
                <input type="text" />
                <div style="clear:both;"></div>
            </li>
            <li class="tc-li1">
                <p class="l-p">收货人姓名<span>*</span></p>
                <input type="text" class="shxm" />
                <div style="clear:both;"></div>
            </li>
            <li class="tc-li1">
                <p class="l-p">联系电话<span>*</span></p>
                <input type="text" class="lxdh" />
                <div style="clear:both;"></div>
            </li>
        </ul>
        <button class="btn-pst2">保存</button>
    </div>
</div>
</body>
</html>
