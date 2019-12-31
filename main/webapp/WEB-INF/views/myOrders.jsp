<%--
  此页作用:(请输入一句话描述此页作用)
  创建作者: 16052
  当前时间: 2019/12/3011:54

--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>我的订单</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style.css" />
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/shopping-mall-index.css" />
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/zhonglin.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/zhongling2.js"></script>
</head>

<body style="position:relative;">

<%--header 顶部--%>
<%@ include file="header.jsp" %>

<%--切换城市--%>
<%@ include file="switch.jsp" %>

<%--快捷导航--%>
<%@ include file="nav.jsp" %>

<!--内容开始-->
<div class="personal w1200">
    <div class="personal-left f-l">
        <div class="personal-l-tit">
            <h3>个人中心</h3>
        </div>
        <ul>
            <li class="current-li per-li1"><a href="#">消息中心<span>></span></a></li>
            <li class="per-li2"><a href="#">个人资料<span>></span></a></li>
            <li class="per-li3"><a href="#">我的订单<span>></span></a></li>
            <li class="per-li4"><a href="#">我的预约<span>></span></a></li>
            <li class="per-li5"><a href="#">购物车<span>></span></a></li>
            <li class="per-li6"><a href="#">管理收货地址<span>></span></a></li>
            <li class="per-li7"><a href="#">店铺收藏<span>></span></a></li>
            <li class="per-li8"><a href="#">购买记录<span>></span></a></li>
            <li class="per-li9"><a href="#">浏览记录<span>></span></a></li>
            <li class="per-li10"><a href="#">会员积分<span>></span></a></li>
        </ul>
    </div>
    <div class="order-right f-r">
        <div class="order-hd">
            <dl class="f-l">
                <dt>
                    <a href="#"><img src="${pageContext.request.contextPath}/images/data-tu2.gif" /></a>
                </dt>
                <dd>
                    <h3><a href="#">${sessionScope.user.name}</a></h3>
                    <p>${sessionScope.user.username}</p>
                </dd>
                <div style="clear:both;"></div>
            </dl>
<%--            <div class="ord-dai f-l">
                <p>待付款<span>1</span></p>
                <p>待发货<span>1</span></p>
                <p>待收货<span>1</span></p>
                <p>待评价<span>1</span></p>
            </div>--%>
            <div style="clear:both;"></div>
        </div>
        <div class="order-md">
            <div class="md-tit">
                <h3>我的订单</h3>
            </div>
            <div class="md-hd">
<%--
            <P class="md-p1"><input type="checkbox" name="hobby" value=""></input><span>全选</span></P>
--%>

    <p class="md-p2">商品信息</p>
                <p class="md-p1"></p>
                <p class="md-p1">金额（元）</p>
    <p class="md-p1">总金额（元）</p>
            </div>

            <c:forEach items="${orderBean.list}" var="orderExt" >

                <c:choose>
                    <c:when test="${orderExt.state==0}"><c:set var="status" value="待付款" ></c:set> </c:when>
                    <c:when test="${orderExt.state==1}"><c:set var="status" value="待发货" ></c:set> </c:when>
                    <c:when test="${orderExt.state==2}"><c:set var="status" value="待收货" ></c:set> </c:when>
                    <c:when test="${orderExt.state==3}"><c:set var="status" value="待确认" ></c:set> </c:when>
                </c:choose>


                <div class="md-info">
                    <div class="dai">

                        <span>${status}</span>

                    </div>



                    <c:forEach items="${orderExt.orderItemExts}" var="orderItem" >
<%--订单项--%>
                        <div class="dai-con">
                            <dl class="dl1">
                                <dt>
<%--
                                    <input type="checkbox" name="hobby" value="" class="f-l"></input>
--%>
                                    <a href="#" class="f-l"><img width="80" src="${pageContext.request.contextPath}/${orderItem.product.image}" /></a>
                                    <div style="clear:both;"></div>
                                </dt>
                                <dd>
                                    <p>
                                       <a href="${pageContext.request.contextPath}/product/toProductDetail.do?pid=${orderItem.pid}">
                                               ${orderItem.product.pname}
                                       </a>
                                        <br>
                                            ${fn:substring(orderItem.product.pdesc,0,15)}...</p>
                                    <span>X ${orderItem.count}</span>
                                </dd>
                                <div style="clear:both;"></div>
                            </dl>
                            <div class="dai-right f-l">
                                <p class="d-r-p2">¥ ${orderItem.product.shopPrice}</p>
                                <p class="d-r-p3">¥ ${orderItem.subTotal}</p>
                                <p class="d-r-p4">
                                    <br />

                                    <br />
                                </p>
                            </div>
                            <div style="clear:both;"></div>
                        </div>

                    </c:forEach>
                    <div class="dai-right " style="margin-inline-start: 800px ; font-size:20px ; color: red ">
                            <%--付款按钮--%>
                        <h1>总价:${orderExt.total}
                            <c:choose>
                                <c:when test="${orderExt.state==0}">
                                    <a href="${pageContext.request.contextPath}/order/toPays.do?oid=${orderExt.oid}">付款</a>
                                </c:when>

                                <c:when test="${orderExt.state==1}"><a href="#">提醒发货</a></c:when>
                                <c:when test="${orderExt.state==2}">
                                    <a href="${pageContext.request.contextPath}/order/toPayss.do?oid=${orderExt.oid}&pageNow=${param.pageNow}">确认发货</a>
                                </c:when>
                                <c:when test="${orderExt.state==3}">
                                    <a href="${pageContext.request.contextPath}/order/toDelPay.do?oid=${orderExt.oid}&pageNow=${param.pageNow}">删除</a>
                                </c:when>
                            </c:choose>
                        </h1>
                    </div>

                </div>

            </c:forEach>

            <!--分页-->
            <div class="paging">
                <div class="pag-left f-l">
<c:if test="${orderBean.pageNow>1}">
                    <a href="${pageContext.request.contextPath}/order/toMyOrder.do?pageNow=1" class="about left-l f-l"> << </a>

                    <a href="${pageContext.request.contextPath}/order/toMyOrder.do?pageNow=${orderBean.pageNow-1}" class="about left-r f-l"><</a>
</c:if>

                    <ul class="left-m f-l">
                        <%--小于三显示--%>
                        <c:if test = "${orderBean.pageNow<=3}">
                            <%--循环5遍--%>
                            <c:forEach begin="1" end="5" var="demaxiya">
                                <%--不得超过限制--%>
                                <c:if test="${orderBean.pageNow<=orderBean.pageCount}">
                <li <c:if test="${demaxiya==orderBean.pageNow}">class="current"</c:if>>
                                    <a href="${pageContext.request.contextPath}/order/toMyOrder.do?pageNow=${demaxiya}">${demaxiya}</a>
                </li>
                                </c:if>
                            </c:forEach>
                        </c:if>
                        <%--大于三就显示--%>
                        <c:if test="${orderBean.pageNow>3}">

                            <c:forEach begin = "${orderBean.pageNow-2}" end = "${orderBean.pageNow+2}" var  = "s">

                                <c:if test="${s<=orderBean.pageCount}">

                                    <li <c:if test="${s==param.pageNow}">class="current"</c:if>>

                                        <a href="${pageContext.request.contextPath}/order/toMyOrder.do?pageNow=${s}">${s}</a>

                                    </li>

                                </c:if>

                            </c:forEach>

                        </c:if>
                        <div style="clear:both;"></div>

                    </ul>
<c:if test="${orderBean.pageCount!=param.pageNow}">
    <a href="${pageContext.request.contextPath}/order/toMyOrder.do?pageNow=${param.pageNow+1}" class="about left-l f-l">></a>
    <a href="${pageContext.request.contextPath}/order/toMyOrder.do?pageNow=${orderBean.pageCount}" class="about left-l f-l"> >> </a>
</c:if>
                    <div style="clear:both;"></div>
                </div>
                <div class="pag-right f-l">
                    <form action="${pageContext.request.contextPath}/order/toMyOrder.do" method="get">

                    <div class="jump-page f-l">

                        到第<input type="number" name="pageNow" min="1" max="${orderBean.pageCount}">页

                    </div>

                    <button class="f-l">确定</button>
                    </form>
                    <div style="clear:both;"></div>
                </div>
                <div style="clear:both;"></div>
            </div>
            <div class="md-ft">
<%--
                <P class="md-p1"><input type="checkbox" name="hobby" value=""></input><span>全选</span></P>
                <a href="#">删除</a>
                <a href="#">加入收藏夹<span>（此处始终在屏幕下方）</span></a>
--%>
            </div>
        </div>

    </div>
    <div style="clear:both;"></div>
</div>

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

<%--<!--查看物流 弹窗-->
<div class="view-logistics">
    <div class="view-bg"></div>
    <div class="view-con">
        <div class="view-tit">
            <h3>物流信息</h3>
            <a href="JavaScript:;" guanbi="">
                <img src="${pageContext.request.contextPath}/images/close-select-city.gif" />
            </a>
            <div style="clear:both;"></div>
        </div>
        <div class="view-bd">
            <ul>
                <li class="bd-pdl-li after"><span>1</span>2015-08-06　周四　　14:06:53您的订单开始处理</li>
                <li class="after"><span>2</span>14:08:44您的订单待配货</li>
                <li><span>3</span>14:16:04您的包裹已出库</li>
                <li><span>4</span>14:16:03商家正通知快递公司揽件</li>
                <li><span>5</span>21:47:54【惠州市】圆通速递 广东省惠州市惠东县收件员 已揽件</li>
                <li class="bd-pdb-li"><span>6</span>22:13:51广东省惠州市惠东县公司 已发出</li>
                <li class="bd-pdl-li"><span>7</span>2015-08-07　周五　　04:57:33广州转运中心公司 已收入</li>
                <li><span>8</span>04:58:54广州转运中心公司 已发出</li>
                <li><span>9</span>2015-08-08周六22:46:43重庆转运中心公司 已收入</li>
                <li class="bd-pdb-li"><span>10</span>23:01:49【重庆市】重庆转运中心 已发出</li>
                <li class="bd-pdl-li"><span>11</span>2015-08-09　周日　　00:57:11【重庆市】快件已到达 重庆市南岸区</li>
                <li><span>12</span>11:14:52重庆市南岸区 已收入</li>
                <li><span>13</span>11:14:52【重庆市】重庆市南岸区派件员：李天生 13330284757正在为您派件</li>
                <li class="bd-bd-li"><span>14</span>15:53:14【重庆市】重庆市南岸区公司 已签收 签收人：保安，感谢使用圆通速递，期待再次为您服务</li>
            </ul>
            <p class="sign">您的包裹已被签收！</p>
        </div>
    </div>
</div>--%>

</body>
</html>
