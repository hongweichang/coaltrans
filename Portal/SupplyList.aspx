﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="SupplyList.aspx.cs" Inherits="SupplyList" %>
<%@ Register Src="~/Controls/Login.ascx" TagName="login" TagPrefix="uc1" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=EmulateIE7" />
<title>国家煤炭工业供需网</title>
<link href="css/style_css.css" rel="stylesheet" type="text/css" />
<link href="css/news.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript">
 function StringBuffer()   
 {   
     this._strings = [];   
     if(arguments.length==1)   
     {   
         this._strings.push(arguments[0]);   
     }   
 }   
   
 StringBuffer.prototype.append = function(str)   
 {   
     this._strings.push(str);   
     return this;   
 }   
   
 StringBuffer.prototype.toString = function()   
 {   
     return this._strings.join("");   
 }   
   
 /* 返回长度 */  
 StringBuffer.prototype.length = function()   
 {   
     var str = this._strings.join("");   
     return str.length;   
 }   
   
 /* 删除后几位字符 */  
 StringBuffer.prototype.del = function(num)   
 {   
     var len = this.length();   
     var str = this.toString();   
     str     = str.slice(0,len-num);   
     this._strings = [];   
     this._strings.push(str);   
 }  
</script>
<script type="text/javascript">
    $(document).ready(function() {

        var reqData = { page_size: 5, page_index: 1, page_count: 1, cur_page: 1, region: -1 };

        function SetNext(pager) {
            if (reqData.cur_page == reqData.page_count) {
                pager.append("<span id='next' class='disabled'>下一页</span>");
            }
            else {
                pager.append("<a id='next' href='javascript:void(null)'>下一页</a>");
            }

            var next_page = reqData.cur_page + 1;
            $("#next").bind("click", { cur_id: next_page }, paging);
        }

        function SetPre(pager) {
            if (reqData.cur_page == 1) {
                pager.append("<span id='pre' class='disabled'>上一页</span>");
            }
            else {
                pager.append("<a id='pre' href='javascript:void(null)'>上一页</a>");
            }

            var pre_page = reqData.cur_page - 1;
            $("#pre").bind("click", { cur_id: pre_page }, paging);
        }

        function InitPager() {
            var pager = $("#pager");
            SetPre(pager);
            pager.append("<span id='1' class='current'>1</span>");
            var page_display_num;
            if (reqData.page_count <= 10) {
                page_display_num = reqData.page_count;
            }
            else {
                page_display_num = 10;
            }

            for (var i = 2; i <= page_display_num; i++) {
                pager.append("<a id='" + i + "' class='page' href='javascript:void(null)'>" + i + "</a>");
            }
            SetNext(pager);

            $(".page").each(function() {
                var id = $(this).attr("id");
                $(this).bind("click", { cur_id: id }, paging);
            });
        }

        function Bind(isInit) {
            $.post("Handler/TranList.ashx",
               reqData,
               function(data, textStatus) {
                   reqData.page_count = data.pageCount;
                   var content = new StringBuffer();
                   for (var one in data.rows) {
                       var row = data.rows[one];
                       content.append("<div class='cp_all'>");
                       content.append("<div class='cp_images'><img src='images/jx01.jpg' /></div>");
                       content.append("<div class='cp_cotton'>");
                       content.append("<h1><a href='Detail.aspx?ID=" + row["ID"] + "'>");
                       content.append(row["ID"]);
                       content.append(row["Subject"]);
                       content.append("</a></h1><ul><li>");
                       content.append("<em>公司名称：</em>");
                       content.append(row["CompanyName"]);
                       content.append("&nbsp;&nbsp;&nbsp;&nbsp;");
                       content.append("<em>煤种：</em>");
                       content.append(row["CoalType"]);
                       content.append("&nbsp;&nbsp;&nbsp;&nbsp;");
                       content.append("<em>所在地：</em>");
                       content.append(row["region"]);
                       content.append("</li><li>");
                       content.append(row["Description"]);
                       content.append("&nbsp;&nbsp;&nbsp;<em>&nbsp;</em><strong>");
                       content.append(row["CreatedOn"]);
                       content.append("</strong></li></ul></div><div class='jiage'>价格：￥<em>");
                       content.append(row["Price"]);
                       content.append("</em></div><div style='clear:both'></div></div>");
                   }

                   if ($(".cp_all")) {
                       $(".cp_all").each(function() {
                           $(this).remove();
                       });
                   }

                   $("#total_count").html(data.totalCount + "条");

                   $("#query_condition").after(content.toString());

                   if (isInit) {
                       InitPager();
                   }
               },
	           "json");
        }

        function paging(event) {
            var cur_page = event.data.cur_id;
            reqData.page_index = cur_page;
            reqData.cur_page = cur_page;
            Bind(false);

            var pager = $("#pager");
            pager.empty();

            var page_display_num;
            if (reqData.page_count <= 10) {
                page_display_num = reqData.page_count;
            }
            else {
                page_display_num = 10;
            }

            if (cur_page <= 5) {

                SetPre(pager);

                for (var i = 1; i <= page_display_num; i++) {
                    pager.append("<a id='" + i + "' class='page' href='javascript:void(null)'>" + i + "</a>");
                }

                SetNext(pager);

                $("#" + event.data.cur_id).replaceWith("<span id='" + cur_page + "' class='current'>" + cur_page + "</span>");
            }
            else if (cur_page < reqData.page_count - 4) {

                SetPre(pager);

                for (var i = 4; i > 0; i--) {
                    var index = cur_page - i;
                    pager.append("<a id='" + index + "' class='page' href='javascript:void(null)'>" + index + "</a>");
                }

                pager.append("<span id='" + cur_page + "' class='current'>" + cur_page + "</span>");

                for (var j = 1; j < 6; j++) {
                    var index = parseInt(cur_page) + j;
                    pager.append("<a id='" + index + "' class='page' href='javascript:void(null)'>" + index + "</a>");
                }

                SetNext(pager);
            }
            else {

                SetPre(pager);

                var icur_page = parseInt(cur_page);
                var flag = reqData.page_count - 9;
                for (var i = flag; i < icur_page; i++) {
                    pager.append("<a id='" + i + "' class='page' href='javascript:void(null)'>" + i + "</a>");
                }

                pager.append("<span id='" + cur_page + "' class='current'>" + cur_page + "</span>");

                var after = reqData.page_count - icur_page;
                for (var j = 1; j <= after; j++) {
                    var index = icur_page + j;
                    pager.append("<a id='" + index + "' class='page' href='javascript:void(null)'>" + index + "</a>");
                }

                SetNext(pager);
            }

            $(".page").each(function() {
                var id = $(this).attr("id");
                $(this).bind("click", { cur_id: id }, paging);
            });
        }

        $(".page").each(function() {
            var id = $(this).attr("id");
            $(this).bind("click", { cur_id: id }, paging);
        });

        $(".loading").each(function() {
            $(this).ajaxStart(function() {
                $(this).show();
            });
        });

        $(".loading").each(function() {
            $(this).ajaxStop(function() {
                $(this).hide();
            });
        });

        $("#query_condition a").each(function() {
            $(this).click(function() {
                var li = $(this).parent();
                var key = li.attr("id");
                var value = $(this).attr("id").split("_")[1];
                li.children(".now01").each(function() {
                    $(this).removeClass("now01").addClass("npw02");
                });
                $(this).removeClass("npw02").addClass("now01");
                reqData[key] = value;
                $("#pager").empty();
                Bind(true);
            });
        });

        Bind(true);
    });
</script>
</head>
<body>
<table width="948" border="0" align="center" cellpadding="0" cellspacing="0" class="top_bar">
  <tr>
    <td height="100" valign="top"><img src="images/banner707_243.jpg" width="950" height="100" /></td>
  </tr>
  <tr>
    <td valign="top" class="top_right_menu"><table width="900" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="78" align="center" class="linkf12_whiteb"><a href="#">[ 首页 ]</a></td>
        <td width="53" height="25">&nbsp;</td>
        <td width="769"><a href="#">协会动态</a> | <a href="#">行业动态</a> | <a href="#">经济运行</a> | <a href="#">煤炭市场</a> | <a href="#">统计信息</a> | <a href="#">科技发展</a> | <a href="#">国际合作</a> | <a href="#">安全生产</a> | <a href="#">公文下载</a></td>
      </tr>
      <tr>
        <td>&nbsp;</td>
        <td height="25">&nbsp;</td>
        <td height="25"><a href="#">煤炭建设</a> | <a href="#">加工利用</a> | <a href="#">人事培训</a> | <a href="#">信用建设</a> | <a href="#">政策法规</a> | <a href="#">能源经济</a> | <a href="#">煤炭资源</a> | <a href="#">文化体育</a> | <a href="#">会员之家</a></td>
      </tr>
    </table></td>
  </tr>
</table>
<table width="950" border="0" align="center" cellpadding="0" cellspacing="0" class="content_bar">
  <tr>
    <td valign="top" class="content_bar_left">
    <uc1:login ID="lg" runat="server" />
    <div class="bars">
      <table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td width="14%" align="center" class="login_title"><img src="images/gxxx_ico.gif" width="19" height="31" /></td>
          <td class="login_title">最新会员供应信息</td>
          </tr>
        <tr>
          <td colspan="2" valign="top"><table width="100%" border="0" cellspacing="0" cellpadding="0" class="linkf12_grey">
            <tr>
              <td width="23%" height="28" align="center" class="bor_b">[<a href="#">供应</a>]</td>
              <td width="77%" align="left" class="bor_b"><a href="#">防爆电子皮带秤</a> </td>
            </tr>
            <tr>
              <td width="23%" height="28" align="center" class="bor_b">[<a href="#">供应</a>]</td>
              <td width="77%" align="left" class="bor_b"><a href="#">临县主焦煤供应 </a> </td>
            </tr>
            <tr>
              <td width="23%" height="28" align="center" class="bor_b">[<a href="#">供应</a>]</td>
              <td width="77%" align="left" class="bor_b"><a href="#">出售神木店塔附近的电煤</a> </td>
            </tr>
            <tr>
              <td width="23%" height="28" align="center" class="bor_b">[<a href="#">供应</a>]</td>
              <td width="77%" align="left" class="bor_b"><a href="#">木煤矿股东代办神</a> </td>
            </tr>
            <tr>
              <td width="23%" height="28" align="center" class="bor_b">[<a href="#">供应</a>]</td>
              <td width="77%" align="left" class="bor_b"><a href="#">神木煤矿股东代办神</a> </td>
            </tr>
            <tr>
              <td width="23%" height="28" align="center" class="bor_b">[<a href="#">供应</a>]</td>
              <td width="77%" align="left" class="bor_b"><a href="#">盐雾试验报告/中性盐雾</a> </td>
            </tr>
            <tr>
              <td width="23%" height="28" align="center" class="bor_b">[<a href="#">供应</a>]</td>
              <td width="77%" align="left" class="bor_b"><a href="#">内蒙出售3500卡以上块煤及4</a> </td>
            </tr>
            <tr>
              <td width="23%" height="28" align="center" class="bor_b">[<a href="#">供应</a>]</td>
              <td width="77%" align="left" class="bor_b"><a href="#">供应各种规格无烟块煤</a> </td>
            </tr>
            <tr>
              <td width="23%" height="28" align="center" class="bor_b">[<a href="#">供应</a>]</td>
              <td width="77%" align="left" class="bor_b"><a href="#">供应2-4公分无烟块煤</a> </td>
            </tr>
            <tr>
              <td width="23%" height="28" align="center" class="bor_b">[<a href="#">供应</a>]</td>
              <td width="77%" align="left" class="bor_b"><a href="#">陕西省榆林市神木县 </a> </td>
            </tr>
          </table></td>
        </tr>
      </table>
      </div>
      <div class="bars pad_tb text_align">
             <a href="#"><img src="images/left_ad_1.gif" /></a>           </div>
             <div class="bars pad_tb text_align">
             <a href="#"><img src="images/left_ad_2.gif" /></a>           </div>
             <div class="bars pad_tb text_align">
             <a href="#"><img src="images/left_ad_3.gif" /></a>           </div>
    </td>
    <td align="right" valign="top"><table width="712" border="0" cellspacing="0" cellpadding="0" class="mar_t16">
      <tr>
        <td height="300" align="left" valign="top"><table width="712" border="0" cellspacing="0" cellpadding="0" class="gongxu_bars">
          <tr>
            <td width="47" align="center" class="f12b_grey"><img src="images/locatioin.gif" width="26" height="23" /></td>
            <td width="595" class="pad_t4 f12_grey_3 linkf12_grey"><strong>当前位置：</strong><a href="index.html">首页</a> &gt; 煤炭供需信息 &gt; 供应信息</td>
            <td width="70" align="center">&nbsp;</td>
          </tr>
        </table>
          <table width="712" border="0" cellspacing="0" cellpadding="0" class="mar_t4">
            <tr>
              <td height="60" align="center" valign="top" class="bor_all"><table width="680" border="0" align="center" cellpadding="0" cellspacing="0" class="mar_t16">
                <tr>
                  <td width="28" align="left"><img src="images/ico.gif" width="19" height="17" align="absmiddle"/></td>
                  <td width="62" align="left" class="linkf12_greyb"><a href="#">供应信息</a></td>
                  <td width="406" align="left" class="linkf12_grey f12_grey_3"><a href="#"> </a> ( <a href="#">查看所有供应信息</a> | <a href="#">查看所有求购信息</a>) 共有此类信息<span id="total_count" class=" f12_red">301条</span> </td>
                  <td width="204"><img src="images/lines.gif" width="202" height="10" /></td>
                </tr>
              </table>
                <form id="form2" name="form2" method="post" action="">
                <div id="query_condition" class="searce_tj">
				<ul>
				<li id="region">产地：<a href="javascript:void(null)" class="now01">不限</a>&nbsp;&nbsp;<a href="javascript:void(null)" id="r_1" class="npw02">华北</a>&nbsp;&nbsp;<a href="javascript:void(null)" id="r_2" class="npw02">西北</a>&nbsp;&nbsp;<a href="javascript:void(null)" id="r_3" class="npw02">华南</a></li>
				<li id="coal_type">煤种：<a href="javascript:void(null)" class="now01">不限</a>&nbsp;&nbsp;<a href="javascript:void(null)" class="npw02">洗精煤</a>&nbsp;&nbsp;<a href="javascript:void(null)" class="npw02">洗精煤</a>&nbsp;&nbsp;<a href="javascript:void(null)" class="npw02">动力煤</a></li>
				<li id="power">发热量：<a href="javascript:void(null)" class="now01">不限</a>&nbsp;&nbsp;<a href="javascript:void(null)" class="npw02">3000以下</a>&nbsp;&nbsp;<a href="javascript:void(null)" class="npw02">3000-5000</a>&nbsp;&nbsp;<a href="javascript:void(null)" class="npw02">5000-7000</a>&nbsp;&nbsp;<a href="javascript:void(null)" class="npw02">7000以上</a></li>
				</ul>
				<img class="loading" src="images/loading.gif"/>
				</div>    
                <div id="pager" class="scott">
                </div>  
                <img class="loading" src="images/loading.gif"/>
                  </form>
</td>
            </tr>
          </table>
          </td>
      </tr>
    </table></td>
  </tr>
</table>
<table width="950" border="0" align="center" cellpadding="0" cellspacing="0" class="mar_t12">
  <tr>
    <td class="footer f12_white linkf12_white"><a href="#">网站地图</a>   |   <a href="#">版权声明</a>   |   <a href="#">设为首页</a>   |   <a href="#">关于我们</a></td>
  </tr>
  <tr>
    <td height="120" align="center" class="f12_grey_3 line_h36">Copyright ©  2009 国家煤炭工业网<br />
      主办:中国煤炭工业协会 技术支持:北京中煤易通科技有限公司<br />
    (浏览本站主页,建议将电脑显示器分辨率调整为:1024*768)</td>
  </tr>
</table>
<map name="Map" id="Map"><area shape="rect" coords="1,0,42,28" href="#" alt="登录" />
<area shape="rect" coords="41,0,86,28" href="#" alt="注册" />
<area shape="rect" coords="85,0,153,28" href="#" alt="忘记密码" />
</map></body>
</html>
