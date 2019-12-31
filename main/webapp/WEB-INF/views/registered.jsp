<%--
  此页作用:(请输入一句话描述此页作用)
  创建作者: 16052
  当前时间: 2019/12/1713:48

--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>注册</title>
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

<!--内容开始-->
<div class="password-con registered">
    <script type="text/javascript">
        $(function(){
            /*输入验证码4个字母*/
            $("#imgcode").change(function () {
                if($(this).val()!="") {
                    $.ajax({
                            url:"${pageContext.request.contextPath}/validate/checkImgCode.do",
                            data:{
                                imgCode:$(this).val()
                            },
                            success:function (data) {
                                if (data=="ok"){
                                    $("#imgcodeMsg").attr("class","dui");
                                    $("#imgcodeMsg").html("验证码输入正确");
                                }else {
                                    $("#imgcodeMsg").attr("class","cuo");
                                    $("#imgcodeMsg").html("请输入正确的验证码");
                                }

                            }
                    })
                }
            })

            /*更换图片验证码*/
            $("#chengePic").click(function () {
                $("#imgValidate").attr("src","${pageContext.request.contextPath}/validate/getValidateCode.do?imgMa="+Math.random())
            })

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
                                $("#userNameMsg").html("用户名可以注册");
                            }else {
                                $("#userNameMsg").attr("class","cuo");
                                $("#userNameMsg").html("用户名已经重复");
                            }
                        }
                    })
                }
            })

            /*判断密码符不符合条件*/
            $("[name='password']").change(function () {
                var pattern = /^(?=.*[\d])(?=.*[a-zA-Z])(?=.*[\W])[a-zA-Z\d\W]{6,16}$/;

                if (pattern.test($(this).val())){
                    $("#passWordMsg").attr("class","dui");
                    $("#passWordMsg").html("密码输入通过");
                }else{
                    $("#passWordMsg").attr("class","cuo");
                    $("#passWordMsg").html("密码由6-16的字母、数字、符号组成");
                }

            })

            /*判断两次密码一不一致*/
            $("[name='confirmPassWord']").change(function () {
                if ($("input[name='password']").val() == $("input[name='confirmPassWord']").val()){
                    $("#passWordFsg").attr("class","dui");
                    $("#passWordFsg").html("二次密码通过");
                }else {
                    $("#passWordFsg").attr("class","cuo");
                    $("#passWordFsg").html("两次输入的密码不一样");
                }
            })
        })
        /*提交事件*/
        function addUser() {
            var flag = true;
            if ($("input[name='password']").val() == $("input[name='confirmPassWord']").val()){
                $("#passWordFsg").attr("class","dui");
                $("#passWordFsg").html("二次密码通过");
            }else {
                $("#passWordFsg").attr("class","cuo");
                $("#passWordFsg").html("两次输入的密码不一样");
                return false;
            }
            $("[name='msg']").each(function () {


                if ($(this).attr("class")=="cuo"){

                   flag=false;
                }

            })
            return flag;
        }

    </script>

    <%-- 注册用户-表单提交 --%>
    <form action="${pageContext.request.contextPath}/user/registered.do" method="get" onsubmit="return addUser()" >

    <%-- 用户名 --%>

    <div class="psw">
        <p class="psw-p1">用户名</p>
        <input type="text" name="username" placeholder="请输入用户名" required />
        <span id="userNameMsg" name="msg"></span>
    </div>

    <%-- 密码 --%>
    <div class="psw">
        <p class="psw-p1">输入密码</p>
        <input type="text" name="password" placeholder="请输入密码" required />
        <span id="passWordMsg" name="msg"></span>
    </div>
    <%-- 确认密码 --%>
    <div class="psw">
        <p class="psw-p1">确认密码</p>
        <input type="text" name="confirmPassWord" placeholder="请再次确认密码" required />
        <span id="passWordFsg" ></span>
    </div>

    <%-- 手机号 --%>
    <div class="psw">
        <p class="psw-p1">手机号</p>
        <input type="text" name="phone" placeholder="请输入手机号" required pattern="1[3-9][\d]{9}" />
        <span style="color: red" >友情提示:请输入手机号格式</span>
    </div>

    <%-- 验证码 输入文字 --%>
    <div class="psw psw3">
        <p class="psw-p1">验证码</p>
        <input type="text" id="imgcode" placeholder="请输入验证码"/>
        <span id="imgcodeMsg" name="msg" ></span>
    </div>
    <%-- 验证码 图片 --%>
    <div class="yanzhentu">
        <div class="yz-tu f-l">
            <img id="imgValidate" src="${pageContext.request.contextPath}/validate/getValidateCode.do" />
        </div>
        <p class="f-l">看不清？<a href="javascript:" id="chengePic">换张图</a></p>
        <div style="clear:both;"></div>
    </div>

     <%-- 网站协议 --%>
    <div class="agreement">
        <input type="checkbox" name="hobby" required value="true"></input>
        <p>我有阅读并同意<span>《宅客微购网站服务协议》</span></p>
    </div>
    <button class="psw-btn">立即注册</button>
    <p class="sign-in">已有账号？请<a href="http://localhost/shop/user/toLogin.do">登录</a></p>
    </form>
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
