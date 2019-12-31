<%--
  此页作用:(请输入一句话描述此页作用)
  创建作者: 16052
  当前时间: 2019/12/2314:24

--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>搜索列表页</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style.css" />
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/shopping-mall-index.css" />
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/zhonglin.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/zhongling2.js"></script>
</head>

<body>

<%--header 顶部--%>
<%@ include file="header.jsp" %>

<%--切换城市--%>
<%@ include file="switch.jsp" %>

<%--快捷导航--%>
<%@ include file="nav.jsp" %>

<!--内容开始-->
<!--筛选结果-->
<c:forEach items="${allCategory}" var="categoryExt" >
    <c:if test="${categoryExt.cid==productBean.cid}">
        <c:set var="cname" value="${categoryExt.cname}"></c:set>
    </c:if>
    <c:forEach items="${categoryExt.categorySeconds}" var="categorySecond" >
        <c:if test="${categorySecond.csid==productBean.csid}">
            <c:set var="cname" value="${categoryExt.cname}"></c:set>
            <c:set var="csname" value="${categorySecond.csname}"></c:set>
        </c:if>
    </c:forEach>
</c:forEach>

<div class="screening-results w1200">
    <p class="tiao">找到共 ${productBean.rowCount} 条</p>
    <div class="results">
        <p class="re-p1 f-l">
            筛选结果：${cname} >${csname}
        </p>
        <div style="clear:both;"></div>
    </div>
</div>



<!--内容↓↑-->
<div class="shop-page-con w1200">
    <div class="shop-pg-left f-l" style="width:215px">
        <div class="shop-left-buttom" style="margin-top:0;">
            <div class="sp-tit1">
                <h3>商品推荐</h3>
            </div>
            <ul class="shop-left-ul">
                <%--商品推荐--%>
                <c:forEach items="${productBean.list}" begin="1" end="3" var="productBeanlist">
                    <li>
                        <div class="li-top">
                            <a href="#" class="li-top-tu"><img width="90" height="110" src="${pageContext.request.contextPath}/${productBeanlist.image}" /></a>
                            <p class="jiage"><span class="sp1">￥${productBeanlist.shopPrice}</span><span class="sp2">￥${productBeanlist.marketPrice}</span></p>
                        </div>
                        <p class="miaoshu">${productBeanlist.pname}</p>
                        <div class="li-md">

                            <div class="md-l f-l">
                                <p class="md-l-l f-l" name="count" ap="">1</p>
                                <div class="md-l-r f-l">
                                    <a href="JavaScript:;" class="md-xs" at="">∧</a>
                                    <a href="JavaScript:;" class="md-xx" ab="">∨</a>
                                </div>
                                <div style="clear:both;"></div>
                            </div>

                            <div class="md-r f-l">
                                <button class="md-l-btn1">立即购买</button>
                                <button name="addCartItem" id="${productBeanlist.pid}" class="md-l-btn2">加入购物车</button>
                            </div>
                            <div style="clear:both;"></div>
                        </div>
                        <p class="pingjia">88888评价</p>
                    </li>
                </c:forEach>

            </ul>
        </div>
    </div>
    <div class="shop-pg-right f-r">
        <%--<div class="shop-right-cmp" style="margin-top:0;">
            <ul class="shop-cmp-l f-l">
                <li class="current"><a href="#">综合 ↓</a></li>
                <li><a href="#">销量 ↓</a></li>
                <li><a href="#">新品 ↓</a></li>
                <li><a href="#">评价 ↓</a></li>
                <div style="clear:both;"></div>
            </ul>
            <div class="shop-cmp-m f-l">
                <span>价格</span><input type="text" /><span>-</span><input type="text" />
            </div>
            <div class="shop-cmp-r f-l">
                <ul class="f-l">
                    <li>
                        <input type="checkbox" name="hobby" value=""></input>
                        <span>包邮</span>
                    </li>
                    <li>
                        <input type="checkbox" name="hobby" value=""></input>
                        <span>进口</span>
                    </li>
                    <li>
                        <input type="checkbox" name="hobby" value=""></input>
                        <span>仅显示有货</span>
                    </li>
                    <li>
                        <input type="checkbox" name="hobby" value=""></input>
                        <span>满赠</span>
                    </li>
                    <li>
                        <input type="checkbox" name="hobby" value=""></input>
                        <span>满减</span>
                    </li>
                    <div style="clear:both;"></div>
                </ul>
                <button>确定</button>
            </div>
            <div style="clear:both;"></div>
        </div>--%>
        <div class="shop-right-con">
            <ul class="shop-ul-tu shop-ul-tu1">


<script>
    $(function () {
        //添加购物车
        $("[name='addCartItem']").click(function () {
            var count = $(this).parent().prev().find("[name='count']").text()
            var pid = $(this).attr("id")
            console.log(count)
            console.log(pid)
            $.ajax({
                url:"${pageContext.request.contextPath}/cart/addCartItem.do",
                data:{
                    count:count,
                    pid:pid
                },
                success:function (data) {
                    if (data=="ok"){
                        alert("添加成功")
                    }else {
                        alert("添加失败")
                    }
                }
            })
        })
    })
</script>
                <c:forEach items="${productBean.list}" var="product">

                <li <c:if test="${vs.count%4==0}">style="margin-right:0;"</c:if>>
                    <div class="li-top">
                        <a href="${pageContext.request.contextPath}/product/toProductDetail.do?pid=${product.pid}" class="li-top-tu"><img width="95" height="110" src="${pageContext.request.contextPath}/${product.image}" /></a>
                        <p class="jiage"><span class="sp1">￥${product.shopPrice}</span><span class="sp2">￥${product.marketPrice}</span></p>
                    </div>
                    <p class="miaoshu">${product.pname}</p>
                    <div class="li-md">

                        <div class="md-l f-l">
                            <p class="md-l-l f-l" name="count" ap="">1</p>
                            <div class="md-l-r f-l">
                                <a href="JavaScript:;" class="md-xs" at="">∧</a>
                                <a href="JavaScript:;" class="md-xx" ab="">∨</a>
                            </div>
                            <div style="clear:both;"></div>
                        </div>

                        <div class="md-r f-l">
                            <button class="md-l-btn1">立即购买</button>
                            <button name="addCartItem" id="${product.pid}" class="md-l-btn2">加入购物车</button>
                        </div>
                        <div style="clear:both;"></div>
                    </div>
                    <p class="pingjia">88888评价</p>
                    <p class="weike">初子小专卖</p>
                </li>

                </c:forEach>

                <div style="clear:both;"></div>
            </ul>

            <!--分页-->
            <div class="paging">
                <div class="pag-left f-l">

<%--上一页--%>
<c:if test="${1<productBean.pageNow}">
    <a href="${pageContext.request.contextPath}/product/toSearchProduucts.do?pageNow=${productBean.pageNow-1}&csid=${param.csid}&cid=${param.cid}&pname=${param.pname}" class="about left-r f-l"><</a>
</c:if>

    <ul class="left-m f-l">
        <c:if test = "${productBean.pageNow<=3}">
            <c:forEach begin="1" end="5" var="demaxiya">
                <c:if test="${productBean.pageNow<=productBean.pageCount}">

                    <li <c:if test="${demaxiya==productBean.pageNow}">class="current"</c:if>>
                        <a href="${pageContext.request.contextPath}/product/toSearchProduucts.do?pageNow=${demaxiya}&cid=${param.cid}&csid=${param.csid}&pname=${param.pname}">${demaxiya}</a>
                    </li>

                </c:if>
            </c:forEach>
        </c:if>
        <%--大于三就显示--%>
        <c:if test="${productBean.pageNow>3}">
            <c:forEach begin = "${productBean.pageNow-2}" end = "${productBean.pageNow+2}" var  = "s">

                <c:if test="${s<=productBean.pageCount}">

                    <li <c:if test="${s==productBean.pageNow}">class="current"</c:if>>

                        <a href="${pageContext.request.contextPath}/product/toSearchProduucts.do?pageNow=${s}&cid=${param.cid}&csid=${param.csid}&pname=${param.pname}">${s}</a>

                    </li>

                </c:if>

            </c:forEach>
        </c:if>
    </ul>

<%--下一页--%>
<c:if test="${productBean.pageCount>=productBean.pageNow}">
    <a href="${pageContext.request.contextPath}/product/toSearchProduucts.do?pageNow=${productBean.pageNow+1}&csid=${param.csid}&cid=${param.cid}&pname=${param.pname}" class="about left-l f-l">></a>
</c:if>
                    <div style="clear:both;"></div>
                </div>
                <div class="pag-right f-l">
                    <div class="jump-page f-l">
                        到第<input type="text" />页
                    </div>
                    <button class="f-l">确定</button>
                    <div style="clear:both;"></div>
                </div>
                <div style="clear:both;"></div>
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
</body>
</html>
