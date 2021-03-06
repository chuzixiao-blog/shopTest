﻿<%--
  此页作用:(请输入一句话描述此页作用)
  创建作者: 16052
  当前时间: 2019/12/2716:06

--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<html>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>支付界面</title>
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
<div class="payment-interface w1200">
    <div class="pay-info">
        <div class="info-tit">
            <h3>选择银行</h3>
        </div>
        <ul class="pay-yh">
            <li>
                <input type="checkbox" value="" name="hobby"></input>
                <img src="${pageContext.request.contextPath}/images/jiangheng.gif" />
                <div style="clear:both;"></div>
            </li>
            <li>
                <input type="checkbox" value="" name="hobby"></input>
                <img src="${pageContext.request.contextPath}/images/jiangheng.gif" />
                <div style="clear:both;"></div>
            </li>
            <li>
                <input type="checkbox" value="" name="hobby"></input>
                <img src="${pageContext.request.contextPath}/images/jiangheng.gif" />
                <div style="clear:both;"></div>
            </li>
            <li style="border-right:0; width:298px;">
                <input type="checkbox" value="" name="hobby"></input>
                <img src="${pageContext.request.contextPath}/images/jiangheng.gif" />
                <div style="clear:both;"></div>
            </li>
            <li>
                <input type="checkbox" value="" name="hobby"></input>
                <img src="${pageContext.request.contextPath}/images/jiangheng.gif" />
                <div style="clear:both;"></div>
            </li>
            <li>
                <input type="checkbox" value="" name="hobby"></input>
                <img src="${pageContext.request.contextPath}/images/jiangheng.gif" />
                <div style="clear:both;"></div>
            </li>
            <li>
                <input type="checkbox" value="" name="hobby"></input>
                <img src="${pageContext.request.contextPath}/images/jiangheng.gif" />
                <div style="clear:both;"></div>
            </li>
            <li style="border-right:0; width:298px;">
                <input type="checkbox" value="" name="hobby"></input>
                <img src="${pageContext.request.contextPath}/images/jiangheng.gif" />
                <div style="clear:both;"></div>
            </li>
            <li style="border-bottom:0;">
                <input type="checkbox" value="" name="hobby"></input>
                <img src="${pageContext.request.contextPath}/images/jiangheng.gif" />
                <div style="clear:both;"></div>
            </li>
            <li style="border-bottom:0;">
                <input type="checkbox" value="" name="hobby"></input>
                <img src="${pageContext.request.contextPath}/images/jiangheng.gif" />
                <div style="clear:both;"></div>
            </li>
            <li style="border-bottom:0;">
                <input type="checkbox" value="" name="hobby"></input>
                <img src="${pageContext.request.contextPath}/images/jiangheng.gif" />
                <div style="clear:both;"></div>
            </li>
            <li style="border-right:0;border-bottom:0; width:298px;">
                <input type="checkbox" value="" name="hobby"></input>
                <img src="${pageContext.request.contextPath}/images/jiangheng.gif" />
                <div style="clear:both;"></div>
            </li>
            <div style="clear:both;"></div>
        </ul>
    </div>
    <div class="pay-info">
        <div class="info-tit">
            <h3>输入卡号</h3>
        </div>
        <div class="pay-kahao">
            <input type="text" placeholder="请输入银行卡号或支付宝账号"/>
            <p>输入正确</p>
        </div>
    </div>
    <div class="pay-info">
        <div class="info-tit">
            <h3>输入密码</h3>
        </div>
        <div class="pay-mima">
            <p class="mima-p1">你在安全的环境中，请放心使用！</p>
            <div class="mima-ipt">
                <p>支付宝或银行卡密码：</p>
                <input type="text" style="border-left:1px solid #E5E5E5;" /><input type="text" /><input type="text" /><input type="text" /><input type="text" /><input type="text" />
                <span>请输入6位数字支付密码</span>
            </div>
            <button class="mima-btn" onclick="window.location.href='${pageContext.request.contextPath}/order/doPay.do?oid=${oid}'">立即支付</button>
        </div>
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
