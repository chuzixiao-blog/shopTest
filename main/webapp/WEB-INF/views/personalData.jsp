<%--
  此页作用:(请输入一句话描述此页作用)
  创建作者: 16052
  当前时间: 2019/12/1916:45
--%>
<!DOCTYPE html>
<html>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>个人资料</title>
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
    <div class="personal-r f-r">
        <div class="personal-right">
            <script type="text/javascript">
                $(function(){
                    //代施工


                     var yxusername = $("[name='username']").val();
                    /*查询用户名*/
                    $("[name='username']").change(function () {
                        var userName = $(this).val();
                        if(userName!="") {
                            $.ajax({
                                url:"${pageContext.request.contextPath}/user/checkUser.do",
                                data:{
                                    userName:userName,
                                },
                                success:function (data) {
                                    /*返回on不可以注册*/
                                    /*返回ok可以注册*/
                                    if (data=="ok"){
                                        $("#userNameMsg").attr("class","dui");
                                        $("#userNameMsg").html("用户名可以修改");
                                    }else {
                                        $("#userNameMsg").attr("class","cuo");
                                        $("#userNameMsg").html("用户名不可以修改");
                                    }
                                }
                            })
                        }
                    })

                })
            </script>
            <div class="personal-r-tit">
                <h3>个人资料</h3>
            </div>
            <div class="data-con">
<%--
                <div class="dt1">
                    <p class="f-l">当前头像：</p>
                    <div class="touxiang f-l">
                        <div class="tu f-l">
                            <a href="#">
                                <img src="${pageContext.request.contextPath}/images/data-tu.gif" />
                                <input type="file" name="" id="" class="img1" />
                            </a>
                        </div>
                        <a href="JavaScript:;" class="sc f-l" shangchuang="">上传头像</a>
                        <div style="clear:both;"></div>
                    </div>
                    <div style="clear:both;"></div>
                </div>
--%>
            <form action="${pageContext.request.contextPath}/user/modifyUser.do" method="get">


                <%-- 名称 --%>
                <div class="dt1">
                    <p class="dt-p f-l">昵称：</p>
                    <input type="text" name="name" placeholder="名称" value="${sessionScope.user.name}" />
                    <div style="clear:both;"></div>
                </div>
                <%-- 用户名 --%>
                <div class="dt1">
                    <p class="dt-p f-l">用户名：</p>
                    <input type="text" name="username" placeholder="用户名" value="${sessionScope.user.username}" />
                    <span id="userNameMsg" name="msg"></span>
                    <div style="clear:both;" id="userNameMsg1"></div>
                </div>
                <%-- 密码 --%>
                <div class="dt1">
                        <p class="dt-p f-l">密码：</p>
                        <input type="password" name="password" placeholder="密码"  value="${sessionScope.user.password}" />
<%--
                   <button>修改密码</button>
--%>
                    <div style="clear:both;"></div>
                </div>
<%--
                <div class="dt1 dt2">
                    <p class="dt-p f-l">性别：</p>
                    <input type="radio" name="hobby" value="nan" ></input><span>男</span>
                    <input type="radio" name="hobby" value="nan"></input><span>女</span>
                    <div style="clear:both;"></div>
                </div>
--%>
                <%-- 手机号 --%>
                <div class="dt1">
                    <p class="dt-p f-l">手机号：</p>
                    <input type="text" name="phone" placeholder="手机号"  value="${sessionScope.user.phone}" />
<%--
                    <button>获取短信验证码</button>
--%>
                    <div style="clear:both;"></div>
                </div>

<%--
                <div class="dt1">
                    <p class="dt-p f-l">验证码：</p>
                    <input type="text" value="" />
                    <div style="clear:both;"></div>
                </div>
--%>
                <%-- 邮箱 --%>
                <div class="dt1">
                    <p class="dt-p f-l">邮箱：</p>
                    <input type="text" name="email" placeholder="邮箱" value="${sessionScope.user.email}" />
                    <div style="clear:both;"></div>
                </div>

                <%-- 年龄 --%>
                    <div class="dt1">
                        <p class="dt-p f-l">地址：</p>
                        <input type="text" name="addr" placeholder="地址" value="${sessionScope.user.addr}" />
                    <div style="clear:both;"></div>
                </div>
                <input type="submit" class="btn-pst" value="修改"/>
            </form>
            </div>
        </div>
    </div>
    <div style="clear:both;"></div>
</div>

<!--上传头像弹窗
<div class="tanchuang">
    <div class="t-c-bg"></div>
    <div class="t-c-con">
        <div class="tc-tit">
            <h3>上传头像</h3>
            <a href="JavaScript:;" delete=""><img src="images/t-c-del.gif" /></a>
            <div style="clear:both;"></div>
        </div>
        <div class="tc-con">
            <a href="#"><img src="images/tc-tu.gif" /></a>
            <button>保存头像</button>
        </div>
    </div>
</div>-->

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
