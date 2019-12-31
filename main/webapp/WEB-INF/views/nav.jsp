<%--
  此页作用:(请输入一句话描述此页作用)
  创建作者: 16052
  当前时间: 2019/12/2414:48

--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!--nav-->
<div class="nav-box">
    <div class="nav-kuai w1200">
        <div class="nav-kuaijie yjp-hover1 f-l">
            <a href="JavaScript:;" class="kj-tit1">商品分类快捷</a>
            <div class="kuaijie-box yjp-show1" style="display:none;">

                <%-- 循环导航 --%>
                <c:forEach items="${allCategory}" var="categoryExt" begin="0" end="5">

                    <div class="kuaijie-info">
                        <dl class="kj-dl1">
                            <dt>
                                <img src="${pageContext.request.contextPath}/images/zl2-07.gif" />
                                <a href="${pageContext.request.contextPath}/product/toSearchProduucts.do?pageNow=1&cid=${categoryExt.cid}">${categoryExt.cname}</a>
                            </dt>
                            <dd>
                                <c:forEach items="${categoryExt.categorySeconds}" begin="0" end="2" varStatus="vs" var="categoryExtSecond" >
                                    <%-- 左:二级栏目 名称 --%>
                                    <a href="${pageContext.request.contextPath}/product/toSearchProduucts.do?pageNow=1&csid=${categoryExtSecond.csid}">${categoryExtSecond.csname}</a><c:if test="${!vs.last}"><span>|</span></c:if>
                                </c:forEach>
                            </dd>
                        </dl>
                        <div class="kuaijie-con">
                            <dl class="kj-dl2">
                                <dt><a href="${pageContext.request.contextPath}/product/toSearchProduucts.do?pageNow=1&cid=${categoryExt.cid}">${categoryExt.cname}</a></dt>
                                <dd>
                                    <c:forEach items="${categoryExt.categorySeconds}" varStatus="vs" var="categorySecond" >
                                        <%--二级栏目--%>
                                        <a href="${pageContext.request.contextPath}/product/toSearchProduucts.do?pageNow=1&csid=${categorySecond.csid}">${categorySecond.csname}</a>
                                        <%-- 判断横线在最后一个闲不闲是 --%>
                                        <c:if test="${!vs.last}"><span>|</span></c:if>
                                    </c:forEach>
                                </dd>
                            </dl>
                            <div style="clear:both;"></div>
                        </div>
                    </div>

                </c:forEach>

            </div>
        </div>
        <ul class="nav-font f-l">
            <li><a href="在线商城首页.html">在线商城</a></li>
            <li><a href="餐饮娱乐首页.html">餐饮娱乐</a></li>
            <li><a href="家政服务首页.html">家政服务</a></li>
            <li><a href="美容美发首页.html">美容美发</a></li>
            <li><a href="教育培训首页.html">教育培训</a></li>
            <li><a href="汽车房产首页.html">汽车房产</a></li>
            <li><a href="家居建材首页.html">家居建材</a></li>
            <li><a href="二手市场首页.html">二手市场</a><span><img src="${pageContext.request.contextPath}/images/zl2-05.gif" /></span></li>
            <div style="clear:both;"></div>
        </ul>
        <div style="clear:both;"></div>
    </div>
</div>