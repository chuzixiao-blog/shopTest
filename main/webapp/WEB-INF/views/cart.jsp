<%--
  此页作用:(请输入一句话描述此页作用)
  创建作者: 16052
  当前时间: 2019/12/2614:07

--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title>购物车</title>
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


<!--内容开始-->
<div class="cart-content w1200">
    <ul class="cart-tit-nav">
        <li class="current"><a href="#">购物车 ${fn:length(cart.cartltems)} </a></li>
        <div style="clear:both;"></div>
    </ul>
    <div class="cart-con-tit">
        <p class="p1">
        </p>
        <p class="p2">商品信息</p>
        <p class="p4">数量</p>
        <p class="p5">单价（元）</p>
        <p class="p6">总金额（元）</p>
        <p class="p7">操作</p>
    </div>
<%-- js --%>
    <script>
        $(function () {
            //数量修改
            $("[name='count']").change(function () {
                var count = $(this).val()
                var pid = $(this).attr("id")
                if(count>=9){
                    $(this).val(9)
                }
                if(count<1){
                    $(this).val(1)
                }

                chengeCount(count,pid)

            })
            //加减
            $("[name='chengeCount']").click(function () {
                var count = $(this).parent().find("[name='count']").val()
                var pid = $(this).parent().find("[name='count']").attr("id")
                if(count>=9){
                    $(this).parent().find("[name='count']").val(9)
                }
                if(count<1) {
                    $(this).parent().find("[name='count']").val(1)
                }
                chengeCount(count,pid)

            })
            //删除
            $("[name='del']").click(function () {
                if(confirm("删除吗???")){
                    var pid = $(this).attr("id")
                    $.ajax({
                        url:"${pageContext.request.contextPath}/cart/dolCartItem.do",
                        data:{
                            pid:pid,
                        },
                        success:function (data) {
                            if ( data !=""){

                                //更改总价
                                $("#total").text(data)
                                $("#div"+pid).remove()
                                document.location.reload();
                            }
                        }
                    })
                }

            })


        })
        //抽出来的ajax
        function  chengeCount(count,pid) {
            if(count>0&&count<10){
                $.ajax({
                    url:"${pageContext.request.contextPath}/cart/changeCount.do",
                    data:{
                        count:count,
                        pid:pid,
                    },
                    success:function (data) {
                        if (data!=null) {
                            //更改总价
                            $("#total").text(data)
                            var shopPrice= Number($("#shopPrice"+pid).text())
                            $("#subTotal"+pid).text(shopPrice*Number(count))
                        }
                    }


                })
            }else{
                alert("输入数量不可小于1或者超出库存")
            }

        }

        function qingkonggouwuche() {
            if(confirm("是否清空购物车???")){
                $.ajax({
                    url:"${pageContext.request.contextPath}/cart/toqkgwc.do",
                    data:{
                    },
                    success:function (data) {
                        if(data=="1"){
                            location.reload();
                        }
                    }
                })
            }
        }


    </script>


    <%-- 商品列表 --%>

    <c:forEach items="${cart.cartltems}" var="cartItem">


    <div class="cart-con-info" id="div${cartItem.product.pid}">
        <div class="info-mid">
            <div class="mid-tu f-l">
                <a href="#"><img width="100" src="${pageContext.request.contextPath}/${cartItem.product.image}" /></a>
            </div>
            <div class="mid-font f-l">
                <a href="#">
                    ${cartItem.product.pname}
                    <br />
                    ${fn:substring(cartItem.product.pdesc,0,10)}...
                </a>
                <span>满赠</span>
            </div>
            <div class="mid-sl f-l">
                <a href="JavaScript:;" name="chengeCount" class="sl-left">-</a>
                <input type="text" id="${cartItem.product.pid}" name="count"  value="${cartItem.count}" />
                <a href="JavaScript:;" name="chengeCount" class="sl-right">+</a>
            </div>
            <%--单价--%>
<p class="mid-dj f-l">¥ <span id="shopPrice${cartItem.product.pid}">${cartItem.product.shopPrice}</span>
</p>
            <%--总额--%>
<p class="mid-dj f-l">¥ <span id="subTotal${cartItem.product.pid}">${cartItem.subTotal}</span>
</p>

            <div class="mid-chaozuo f-l">
<%--
                <a href="#">移入收藏夹</a>
--%>
                <a href="JavaScript:;" name="del" id="${cartItem.product.pid}">删除</a>
            </div>
            <div style="clear:both;"></div>
        </div>
    </div>

    </c:forEach>
<c:if test="${cart.cartltems!=null}">

    <div class="cart-con-footer">
        <a href="JavaScript:;" class="js-a1 f-l" onclick="qingkonggouwuche()">清空购物车</a>
        <div class="quanxuan f-l">
          温馨提示: 拒绝假冒伪劣商品,甚防上当受骗!
        </div>
        <div class="jiesuan f-r">
            <div class="jshj f-l">
                <p>合计（不含运费）</p>
                <p class="jshj-p2">
                    ￥：<span id="total">${cart.total}</span>
                </p>
            </div>
            <a href="${pageContext.request.contextPath}/order/toConfirmOrder.do" class="js-a1 f-l">结算</a>
            <div style="clear:both;"></div>
        </div>
        <div style="clear:both;"></div>
    </div>

</c:if>
    <c:if test="${cart.cartltems==null}">
        <center><h1>瞅啥哪没了别砍了,穷鬼还不快去买点东西</h1></center>

    </c:if>
</div>

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
