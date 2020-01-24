<!DOCTYPE html>
<html>
<head>
<title><#Web_Title#> - <#menu5_16#></title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta http-equiv="Pragma" content="no-cache">
<meta http-equiv="Expires" content="-1">
<link rel="shortcut icon" href="images/favicon.ico">
<link rel="icon" href="images/favicon.png">
<link rel="stylesheet" type="text/css" href="/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="/bootstrap/css/main.css">
<link rel="stylesheet" type="text/css" href="/bootstrap/css/engage.itoggle.css">
<script type="text/javascript" src="/jquery.js"></script>
<script type="text/javascript" src="/bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript" src="/bootstrap/js/engage.itoggle.min.js"></script>
<script type="text/javascript" src="/state.js"></script>
<script type="text/javascript" src="/general.js"></script>
<script type="text/javascript" src="/itoggle.js"></script>
<script type="text/javascript" src="/popup.js"></script>
<script type="text/javascript" src="/help.js"></script>
<script>
<% trojan_status(); %>
<% pdnsd_status(); %>
<% rules_count(); %>
var m_rules = [<% get_nvram_list("TrojanConf", "SspList"); %>];
var mrules_ifield = 17;
if(m_rules.length > 0){
	var m_rules_ifield = m_rules[0].length;
	for (var i = 0; i < m_rules.length; i++) {
		m_rules[i][mrules_ifield] = i;
	}
}
var $j = jQuery.noConflict();
$j(document).ready(function(){
	init_itoggle('ss_enable');
	init_itoggle('switch_enable_x_0');
	init_itoggle('v2_mkcp_congestion_x_0');
	init_itoggle('v2_tls_x_0');
	init_itoggle('ss_udp');
	init_itoggle('ss_own');
	init_itoggle('ss_router_proxy',change_ss_watchcat_display);
	init_itoggle('ss_watchcat');
	init_itoggle('ss_update_chnroute');
	init_itoggle('ss_update_gfwlist');
	init_itoggle('ss_turn');
	$j("#tab_ss_cfg, #tab_ss_add, #tab_ss_ssl, #tab_ss_cli, #tab_ss_log").click(function(){
		var newHash = $j(this).attr('href').toLowerCase();
		showTab(newHash);
		return false;
	});
});
function initial(){
	show_banner(2);
	show_menu(13,13,0);
	show_footer();
	fill_ss_status(trojan_status());
	fill_ss_check_status(trojan_check_status());
	fill_pd_status(pdnsd_status());
	$("chnroute_count").innerHTML = '<#menu5_17_3#>' + chnroute_count() ;
	$("gfwlist_count").innerHTML = '<#menu5_17_3#>' + gfwlist_count() ;
	switch_ss_type();
	showTab(getHash());
	showMRULESList();
	showssList();
	shows5List();
	var o1 = document.form.global_server;
	var o2 = document.form.lan_con;
	var o3 = document.form.ss_threads;
	var o4 = document.form.ss_run_mode;
	var o5 = document.form.pdnsd_enable;
	var o6 = document.form.socks5_proxy;
	var o7 = document.form.tunnel_forward;
	var o8 = document.form.backup_server;
	o1.value = '<% nvram_get_x("","global_server"); %>';
	o2.value = '<% nvram_get_x("","lan_con"); %>';
	o3.value = '<% nvram_get_x("","ss_threads"); %>';
	o4.value = '<% nvram_get_x("","ss_run_mode"); %>';
	o5.value = '<% nvram_get_x("","pdnsd_enable"); %>';
	o6.value = '<% nvram_get_x("","socks5_proxy"); %>';
	o7.value = '<% nvram_get_x("","tunnel_forward"); %>';
	o8.value = '<% nvram_get_x("","backup_server"); %>';
}
function textarea_scripts_enabled(v){
//inputCtrl(document.form['scripts.ss.dom.sh'], v);
//inputCtrl(document.form['scripts.ss.ip.sh'], v);
}
function fill_pd_status(status_code){
	var stext = "Unknown";
	if (status_code == 0)
		stext = "<#Stopped#>";
	else if (status_code == 1)
		stext = "<#Running#>";
	$("pdnsd_status").innerHTML = '<span class="label label-' + (status_code != 0 ? 'success' : 'warning') + '">' + stext + '</span>';
}
function switch_ss_type(){
var b = document.form.ssp_type_x_0.value; //0:ss-orig;1:ssr2:v2ray
if (b=="ss"){
	var v=0;
	showhide_div('row_ss_password', 1);
	showhide_div('row_ss_method', 1);
	showhide_div('row_ss_protocol', v);
	showhide_div('row_ss_protocol_para', v);
	showhide_div('row_ss_obfs', v);
	showhide_div('row_ss_obfs_para', v);
	showhide_div('row_v2_aid', v);
	showhide_div('row_v2_vid', v);
	showhide_div('row_v2_security', v);
	showhide_div('row_v2_net', v);
	showhide_div('row_v2_type', v);
	showhide_div('row_v2_tls', v);
}
if (b=="ssr"){
	var v=1;
	showhide_div('row_ss_protocol', v);
	showhide_div('row_ss_protocol_para', v);
	showhide_div('row_ss_obfs', v);
	showhide_div('row_ss_obfs_para', v);
	showhide_div('row_ss_password', v);
	showhide_div('row_ss_method', v);
	showhide_div('row_v2_aid', 0);
	showhide_div('row_v2_vid', 0);
	showhide_div('row_v2_security', 0);
	showhide_div('row_v2_net', 0);
	showhide_div('row_v2_type', 0);
	showhide_div('row_v2_tls', 0);
}
if (b=="v2ray"){
	switch_v2_type();
	var v=1;
	showhide_div('row_ss_protocol', 0);
	showhide_div('row_ss_protocol_para', 0);
	showhide_div('row_ss_obfs', 0);
	showhide_div('row_ss_obfs_para', 0);
	showhide_div('row_ss_password', 0);
	showhide_div('row_ss_method', 0);
	showhide_div('row_v2_aid', v);
	showhide_div('row_v2_vid', v);
	showhide_div('row_v2_security', v);
	showhide_div('row_v2_net', v);
	showhide_div('row_v2_type', v);
	showhide_div('row_v2_tls', v);
}
}
function switch_v2_type(){
}
function applyRule(){
	showLoading();
	document.form.action_mode.value = " Restart ";
	document.form.current_page.value = "Trojan.asp";
	document.form.next_page.value = "";
	document.form.submit();
}
function submitInternet(v){
	showLoading();
	document.Trojan_action.action = "Trojan_action.asp";
	document.Trojan_action.connect_action.value = v;
	document.Trojan_action.submit();
}
function change_ss_watchcat_display(){
	var v = document.form.ss_router_proxy[0].checked;
	showhide_div('ss_wathcat_option', v);
}
function fill_ss_status(status_code){
	var stext = "Unknown";
	if (status_code == 0)
		stext = "<#Stopped#>";
	else if (status_code == 1)
		stext = "<#Running#>";
	$("ss_status").innerHTML = '<span class="label label-' + (status_code != 0 ? 'success' : 'warning') + '">' + stext + '</span>';
}
function fill_ss_check_status(status_code){
	var stext = "<#Stopped#>";
	if (status_code == 0)
		stext = "主服务器";
	else if (status_code == 1)
		stext = "备用服务器";
	$("ss_check_status").innerHTML = '<span class="label label-' + (status_code != 0 ? 'warning' : 'success') + '">' + stext + '</span>';
}
function fill_ss_tunnel_status(status_code){
	var stext = "Unknown";
	if (status_code == 0)
		stext = "<#Stopped#>";
	else if (status_code == 1)
		stext = "<#Running#>";
	$("ss_tunnel_status").innerHTML = '<span class="label label-' + (status_code != 0 ? 'success' : 'warning') + '">' + stext + '</span>';
}
var arrHashes = ["cfg", "add", "ssl", "cli", "log"];
function showTab(curHash){
	var obj = $('tab_ss_'+curHash.slice(1));
	if (obj == null || obj.style.display == 'none')
		curHash = '#cfg';
	for(var i = 0; i < arrHashes.length; i++){
		if(curHash == ('#'+arrHashes[i])){
			$j('#tab_ss_'+arrHashes[i]).parents('li').addClass('active');
			$j('#wnd_ss_'+arrHashes[i]).show();
		}else{
			$j('#wnd_ss_'+arrHashes[i]).hide();
			$j('#tab_ss_'+arrHashes[i]).parents('li').removeClass('active');
		}
	}
	window.location.hash = curHash;
}
function getHash(){
	var curHash = window.location.hash.toLowerCase();
	for(var i = 0; i < arrHashes.length; i++){
		if(curHash == ('#'+arrHashes[i]))
			return curHash;
	}
	return ('#'+arrHashes[0]);
}
function markGroupRULES(o, c, b) {
	document.form.group_id.value = "SspList";
	if(b == " Add "){
		if (document.form.ssp_staticnum_x_0.value >= c){
			alert("<#JS_itemlimit1#> " + c + " <#JS_itemlimit2#>");
			return false;
		}
	}
	pageChanged = 0;
	document.form.action_mode.value = b;
	return true;
}
function showMRULESList(){
	var code = '<table width="100%" cellspacing="0" cellpadding="3" class="table table-list">';
	if(m_rules.length == 0)
		code +='<tr><td colspan="5" style="text-align: center;"><div class="alert alert-info"><#IPConnection_VSList_Norule#></div></td></tr>';
	else{
		for(var i = 0; i < m_rules.length; i++){
			if(m_rules[i][0] == "v2ray"){
				s_method=m_rules[i][13]
			}else{
				s_method=m_rules[i][5]
			}
			code +='<tr id="rowrl' + i + '">';
			code +='<td width="10%">&nbsp;' + m_rules[i][0] + '</td>';
			code +='<td width="20%">&nbsp;' + m_rules[i][1] + '</td>';
			code +='<td width="30%"><input type="text" maxlength="6" class="input" size="15" name="ssp_name_x_0" style="width: 145px" disabled="disabled" value="' + m_rules[i][2] + '"/></td>';
			code +='<td width="15%">&nbsp;' + m_rules[i][3] + '</td>';
			code +='<td width="20%"><input type="text" maxlength="6" class="input" size="15" name="ssp_method_x_0" style="width: 80px" disabled="disabled" value="' + s_method + '"/></td>';
			code +='<td width="8%">&nbsp;' + m_rules[i][10] + '</td>';
			code +='<center><td width="5%" style="text-align: center;"><input type="checkbox" name="SspList_s" value="' + m_rules[i][mrules_ifield] + '" onClick="changeBgColorrl(this,' + i + ');" id="check' + m_rules[i][mrules_ifield] + '"></td></center>';
			code +='</tr>';
		}
		code += '<tr>';
		code += '<td colspan="6">&nbsp;</td>'
		code += '<td><button class="btn btn-danger" type="submit" onclick="markGroupRULES(this, 64, \' Del \');" name="SspList"><i class="icon icon-minus icon-white"></i></button></td>';
		code += '</tr>'
	}
	code +='</table>';
	$("MRULESList_Block").innerHTML = code;
}
function showssList(){
	var code2 = '<option value="nil" >停用</option>';
	if(m_rules.length == 0)
		code2 +='<option value="non" >暂无可以用服务器</option>';
	else{
		for(var j = 0; j < m_rules.length; j++){
			code2 +='<option value="'+ j +'" >['+ m_rules[j][0] + ']:'+ m_rules[j][1] + '</option>';
		}
	}
	$("ssList_Block").innerHTML = code2;
	$("ssbList_Block").innerHTML = code2;
}
function shows5List(){
	var code2 = '<option value="nil" >停用</option>';
	if(m_rules.length == 0)
		code2 +='<option value="non" >暂无可以用服务器</option>';
	else{
		for(var j = 0; j < m_rules.length; j++){
			code2 +='<option value="'+ j +'" >['+ m_rules[j][0] + ']:'+ m_rules[j][1] + '</option>';
		}
	}
	$("s5List_Block").innerHTML = code2;
}
function changeBgColor(obj, num){
	$("row" + num).style.background=(obj.checked)?'#D9EDF7':'whiteSmoke';
}
</script>
<script type="text/javascript">//<![CDATA[
function padright(str, cnt, pad) {
	return str + Array(cnt + 1).join(pad);
}
function b64EncodeUnicode(str) {
	return btoa(encodeURIComponent(str).replace(/%([0-9A-F]{2})/g, function (match, p1) {
		return String.fromCharCode('0x' + p1);
	}));
}
function b64encutf8safe(str) {
	return b64EncodeUnicode(str).replace(/\+/g, "-").replace(/\//g, "_").replace(/=+$/g, '');
}
function b64DecodeUnicode(str) {
	return decodeURIComponent(Array.prototype.map.call(atob(str), function (c) {
		return '%' + ('00' + c.charCodeAt(0).toString(16)).slice(-2);
	}).join(''));
}
function b64decutf8safe(str) {
	var l;
	str = str.replace(/-/g, "+").replace(/_/g, "/");
	l = str.length;
	l = (4 - l % 4) % 4;
	if (l)
		str = padright(str, l, "=");
	return b64DecodeUnicode(str);
}
function b64encsafe(str) {
	return btoa(str).replace(/\+/g, "-").replace(/\//g, "_").replace(/=+$/g, '')
}
function b64decsafe(str) {
	var l;
	str = str.replace(/-/g, "+").replace(/_/g, "/");
	l = str.length;
	l = (4 - l % 4) % 4;
	if (l)
		str = padright(str, l, "=");
	return atob(str);
}
function dictvalue(d, key) {
	var v = d[key];
	if (typeof (v) == 'undefined' || v == '')
		return '';
	return b64decsafe(v);
}
function import_ssr_url(btn, urlname, sid) {
	var s = document.getElementById(urlname + '-status');
	if (!s)
		return false;
	var ssrurl = prompt("在这里黏贴配置链接 ssr:// | ss:// | vmess://", "");
	if (ssrurl == null || ssrurl == "") {
		s.innerHTML = "<font color='red'>用户取消</font>";
		return false;
	}
	s.innerHTML = "";
var ssu = ssrurl.split('://');
console.log(ssu.length);
if ((ssu[0] != "ssr" && ssu[0] != "ss" && ssu[0] != "vmess") || ssu[1] == "") {
	s.innerHTML = "<font color='red'>无效格式</font>";
	return false;
}
var event = document.createEvent("HTMLEvents");
event.initEvent("change", true, true);
if (ssu[0] == "ssr") {
	return false;
} else if (ssu[0] == "ss") {
	return false;
} else if (ssu[0] == "vmess") {
	return false;
}
}
//]]></script>
<style>
.nav-tabs > li > a {
    padding-right: 6px;
    padding-left: 6px;
}
</style>
</head>
<body onload="initial();" onunLoad="return unload_body();">
	<div class="wrapper">
		<div class="container-fluid" style="padding-right: 0px">
			<div class="row-fluid">
				<div class="span3"><center><div id="logo"></div></center></div>
				<div class="span9" >
					<div id="TopBanner"></div>
				</div>
			</div>
		</div>
<div id="Loading" class="popup_bg"></div>
<iframe name="hidden_frame" id="hidden_frame" src="" width="0" height="0" frameborder="0"></iframe>
<form method="post" name="form" id="ruleForm" action="/start_apply.htm" target="hidden_frame">
<input type="hidden" name="current_page" value="Trojan.asp">
<input type="hidden" name="next_page" value="">
<input type="hidden" name="next_host" value="">
<input type="hidden" name="sid_list" value="TrojanConf;">
<input type="hidden" name="group_id" value="SspList">
<input type="hidden" name="action_mode" value="">
<input type="hidden" name="action_script" value="">
<input type="hidden" name="ssp_staticnum_x_0" value="<% nvram_get_x("SspList", "ssp_staticnum_x"); %>" readonly="1" />
<div class="container-fluid">
<div class="row-fluid">
<div class="span3">
<!--Sidebar content-->
<!--=====Beginning of Main Menu=====-->
<div class="well sidebar-nav side_nav" style="padding: 0px;">
	<ul id="mainMenu" class="clearfix"></ul>
	<ul class="clearfix">
		<li>
			<div id="subMenu" class="accordion"></div>
		</li>
	</ul>
</div>
</div>
<div class="span9">
<!--Body content-->
<div class="row-fluid">
	<div class="span12">
		<div class="box well grad_colour_dark_blue">
			<h2 class="box_head round_top"><#menu5_16#> - ShadowSocksR Plus+</h2>
			<div class="round_bottom">
				<div>
					<ul class="nav nav-tabs" style="margin-bottom: 10px;">
						<li class="active">
							<a id="tab_ss_cfg" href="#cfg">客户端</a>
						</li>
						<li>
							<a id="tab_ss_add" href="#add">节点设置</a>
							<li>
								<a id="tab_ss_ssl" href="#ssl">高级设置</a>
							</li>
							<li>
								<a id="tab_ss_cli" href="#cli">规则管理</a>
							</li>
							<li>
								<a id="tab_ss_log" href="#log">运行日志</a>
							</li>
						</ul>
					</div>
<div class="row-fluid">
	<div id="tabMenu" class="submenuBlock"></div>
	<div class="alert alert-info" style="margin: 10px;">一个兼容Trojan、TrojanR 、Vmess等协议的游戏加速工具。</div>
	<div id="wnd_ss_cfg">
		<table width="100%" cellpadding="4" cellspacing="0" class="table">
			<tr> <th>当前运行服务器</th>
				<td id="ss_check_status"></td>
			</tr></th> </tr>
			<tr> <th>客户端<#running_status#></th>
				<td id="ss_status"></td>
			</tr></th> </tr>
			<tr> <th>PDNSD<#running_status#></th>
				<td id="pdnsd_status"></td>
			</tr></th> </tr>
			<tr> <th><#InetControl#></th>
				<td >
					<input type="button" id="btn_connect_1" class="btn btn-info" value=<#Connect#> onclick="submitInternet('Reconnect');">
				</td>
			</tr>
			<tr> <th>总开关</th>
				<td>
					<div class="main_itoggle">
						<div id="ss_enable_on_of">
							<input type="checkbox" id="ss_enable_fake" <% nvram_match_x("", "ss_enable", "1", "value=1 checked"); %><% nvram_match_x("", "ss_enable", "0", "value=0"); %>>
						</div>
					</div>
					<div style="position: absolute; margin-left: -10000px;">
						<input type="radio" value="1" name="ss_enable" id="ss_enable_1" <% nvram_match_x("", "ss_enable", "1", "checked"); %>><#checkbox_Yes#>
						<input type="radio" value="0" name="ss_enable" id="ss_enable_0" <% nvram_match_x("", "ss_enable", "0", "checked"); %>><#checkbox_No#>
					</div>
				</td>
			</tr>
			<tr> <th>主服务器</th>
				<td>
					<select name="global_server" id="ssList_Block" class="input" style="width: 200px;">
					</select>
				</td>
			</tr>
			<tr> <th>故障转移服务器</th>
				<td>
					<select name="backup_server" id="ssbList_Block" class="input" style="width: 200px;">
					</select>
				</td>
			</tr>
			<tr> <th width="50%">多线程并发转发</th>
				<td>
					<select name="ss_threads" class="input" style="width: 200px;">
						<option value="0" >自动（CPU线程数）</option>
						<option value="1" >单线程</option>
						<option value="2" >2 线程</option>
						<option value="3" >4 线程</option>
						<option value="4" >8 线程</option>
					</select>
				</td>
			</tr>
			<tr> <th width="50%">运行模式</th>
				<td>
					<select name="ss_run_mode" class="input" style="width: 200px;">   
						<option value="gfw" >gfw列表模式</option>
						<option value="router" >绕过大陆IP模式</option>
						<option value="all" >全局模式</option>
						<option value="oversea" >海外用户回国模式</option>
					</select>
				</td>
			</tr>
			<tr> <th width="50%">内网控制</th>
				<td>
					<select name="lan_con" class="input" style="width: 200px;">
						<option value="0" >全部走代理</option>
						<option value="1" >指定IP走代理</option>
					</select>
				</td>
			</tr>
			<tr> <th width="50%">DNS解析方式</th>
				<td>
					<select name="pdnsd_enable" class="input" style="width: 200px;">
						<option value="0" >使用PDNSD TCP查询并缓存</option>
						<option value="1" >使用SmartDNS查询</option>
					</select>
				</td>
			</tr>
			<tr> <th width="50%">访问国外域名DNS服务器</th>
				<td>
					<select name="tunnel_forward" class="input" style="width: 200px;" >
						<option value="8.8.4.4:53" >Google Public DNS (8.8.4.4)</option>
						<option value="208.67.222.222:53" >OpenDNS (208.67.222.222)</option>
						<option value="208.67.220.220:53" >OpenDNS (208.67.220.220)</option>
						<option value="209.244.0.3:53" >Level 3 Public DNS (209.244.0.3)</option>
						<option value="209.244.0.4:53" >Level 3 Public DNS (209.244.0.4)</option>
						<option value="4.2.2.1:53" >Level 3 Public DNS (4.2.2.1)</option>
						<option value="4.2.2.2:53" >Level 3 Public DNS (4.2.2.2)</option>
						<option value="4.2.2.3:53" >Level 3 Public DNS (4.2.2.3)</option>
						<option value="4.2.2.4:53" >Level 3 Public DNS (4.2.2.4)</option>
						<option value="1.1.1.1:53" >Cloudflare DNS (1.1.1.1)</option>
						<option value="114.114.114.114:53" >Oversea Mode DNS-1 (114.114.114.114)</option>
						<option value="114.114.115.115:53" >Oversea Mode DNS-1 (114.114.115.115)</option>
					</select>
				</td>
			</tr>
			<tr> <th><#menu5_16_17#></th>
				<td>
					<div class="main_itoggle">
						<div id="ss_udp_on_of">
							<input type="checkbox" id="ss_udp_fake" <% nvram_match_x("", "ss_udp", "1", "value=1 checked"); %><% nvram_match_x("", "ss_udp", "0", "value=0"); %>>
						</div>
					</div>
					<div style="position: absolute; margin-left: -10000px;">
						<input type="radio" value="1" name="ss_udp" id="ss_udp_1" <% nvram_match_x("", "ss_udp", "1", "checked"); %>><#checkbox_Yes#>
						<input type="radio" value="0" name="ss_udp" id="ss_udp_0" <% nvram_match_x("", "ss_udp", "0", "checked"); %>><#checkbox_No#>
					</div>
				</td>
			</tr>
			<tr> <th>路由自身走代理</th>
				<td>
					<div class="main_itoggle">
						<div id="ss_own_on_of">
							<input type="checkbox" id="ss_own_fake" <% nvram_match_x("", "ss_own", "1", "value=1 checked"); %><% nvram_match_x("", "ss_own", "0", "value=0"); %>>
						</div>
					</div>
					<div style="position: absolute; margin-left: -10000px;">
						<input type="radio" value="1" name="ss_own" id="ss_own_1" <% nvram_match_x("", "ss_own", "1", "checked"); %>><#checkbox_Yes#>
						<input type="radio" value="0" name="ss_own" id="ss_own_0" <% nvram_match_x("", "ss_own", "0", "checked"); %>><#checkbox_No#>
					</div>
				</td>
			</tr>
		</table>
		<table class="table">
			<tr>
				<td style="border: 0 none; padding: 0px;"><center><input name="button" type="button" class="btn btn-primary" style="width: 200px" onclick="applyRule();" value="应用设置"/></center></td>
			</tr>
		</table>
	</div>
<div id="wnd_ss_add">
	<table width="100%" cellpadding="4" cellspacing="0" class="table">
		<tr> <th width="50%">导入节点信息:</th>
			<td>
				<input type="button" class="btn btn-primary" value="点击输入节点URL" onclick="return import_ssr_url(this, '<%=self.option%>', '<%=self.value%>')" />
				<span id="<%=self.option%>-status"></span></td>
			</tr>
			<tr> <th width="50%">服务器节点类型</th>
				<td>
					<select name="ssp_type_x_0" id="ssp_type_x_0" class="input" style="width: 200px;" onchange="switch_ss_type()">
						<option value="v2ray" >V2ray</option>
					</select>
				</td>
			</tr>
			<tr> <th width="50%">别名:（可选）</th>
				<td>
					<input type="text" class="input" size="15" name="ssp_name_x_0" id="ssp_name_x_0" style="width: 200px" value="<% nvram_get_x("","ssp_name_x_0"); %>" />
				</td>
			</tr>
			<tr> <th width="50%">服务器IP地址</th>
				<td>
					<input type="text" class="input" size="15" name="ssp_server_x_0" id="ssp_server_x_0" value="<% nvram_get_x("","ssp_server_x_0"); %>" />
				</td>
			</tr>
			<tr> <th width="50%">服务器端口</th>
				<td>
					<input type="text" class="input" size="15" name="ssp_prot_x_0" id="ssp_prot_x_0" style="width: 200px" value="<% nvram_get_x("","ssp_prot_x_0"); %>" />
				</td>
			</tr>
			<tr id="row_ss_password" style="display:none;">  <th width="50%">服务器密码</th>
				<td>
					<input type="password" class="input" size="32" name="ss_key_x_0" id="ss_key" value="<% nvram_get_x("","ss_key_x_0"); %>" />
					<button style="margin-left: -5px;" class="btn" type="button" onclick="passwordShowHide('ss_key')"><i class="icon-eye-close"></i></button>
				</td>
			</tr>	
			<tr> <th width="50%"><#menu5_16_21#></th>
				<td>
					<input type="text" class="input" size="15" name="ss_timeout" style="width: 200px" value="<% nvram_get_x("","ss_timeout"); %>" />
				</td>
			</tr>
			<tr> <th width="50%">本地端口</th>
				<td>
					<input type="text" maxlength="6" class="input" size="15" name="ssp_local_port_x_0" style="width: 200px" value="1080">
				</td>
			</tr>
</table>
<table width="100%" align="center" cellpadding="3" cellspacing="0" class="table">
	<tr id="row_rules_caption">
		<th width="10%">
			类型 <i class="icon-circle-arrow-down"></i>
		</th>
		<th width="20%">
			别名 <i class="icon-circle-arrow-down"></i>
		</th>
		<th width="24%">
			服务器地址 <i class="icon-circle-arrow-down"></i>
		</th>
		<th width="17%">
			服务器端口 <i class="icon-circle-arrow-down"></i>
		</th>
		<th width="15%">
			加密方式 <i class="icon-circle-arrow-down"></i>
		</th>
		<th width="15%">
			本地端口 <i class="icon-circle-arrow-down"></i>
		</th>
		<th width="10%">
			<center><i class="icon-th-list"></i></center>
		</th>
	</tr>
	<tr id="row_rules_header">
	</tr>
	<tr id="row_rules_body">
		<td colspan="7" style="border-top: 0 none; padding: 0px;">
			<div id="MRULESList_Block"></div>
		</td>
	</tr>
</table>
<table class="table">
	<tr>
		<td style="border: 0 none; padding: 0px;"><center><input name="ManualRULESList2" type="submit" class="btn btn-primary" style="width: 200px" onclick="return markGroupRULES(this, 64, ' Add ');" value="保存节点"/></center></td>
		<td style="border: 0 none; padding: 0px;"><center><input name="button" type="button" class="btn btn-primary" style="width: 200px" onclick="applyRule();" value="应用设置"/></center></td>
	</tr>
</table>
</div>
<div id="wnd_ss_ssl" style="display:none">
	<table width="100%" cellpadding="4" cellspacing="0" class="table">
		<tr> <th colspan="2" style="background-color: #E3E3E3;">节点故障自动切换设置</th> </tr>
		<tr> <th>启用进程自动守护</th>
			<td>
				<div class="main_itoggle">
					<div id="ss_watchcat_on_of">
						<input type="checkbox" id="ss_watchcat_fake" <% nvram_match_x("", "ss_watchcat", "1", "value=1 checked"); %><% nvram_match_x("", "ss_watchcat", "0", "value=0"); %>>
					</div>
				</div>
				<div style="position: absolute; margin-left: -10000px;">
					<input type="radio" value="1" name="ss_watchcat" id="ss_watchcat_1" <% nvram_match_x("", "ss_watchcat", "1", "checked"); %>><#checkbox_Yes#>
					<input type="radio" value="0" name="ss_watchcat" id="ss_watchcat_0" <% nvram_match_x("", "ss_watchcat", "0", "checked"); %>><#checkbox_No#>
				</div>
			</td>
		</tr>
<!--  <tr> <th>启用自动切换</th>
<td>
<div class="main_itoggle">
<div id="ss_turn_on_of">
<input type="checkbox" id="ss_turn_fake" <% nvram_match_x("", "ss_turn", "1", "value=1 checked"); %><% nvram_match_x("", "ss_turn", "0", "value=0"); %>>
</div>
</div>
<div style="position: absolute; margin-left: -10000px;">
<input type="radio" value="1" name="ss_turn" id="ss_turn_1" <% nvram_match_x("", "ss_turn", "1", "checked"); %>><#checkbox_Yes#>
<input type="radio" value="0" name="ss_turn" id="ss_turn_0" <% nvram_match_x("", "ss_turn", "0", "checked"); %>><#checkbox_No#>
</div>
</td>
</tr>
-->
<tr> <th width="50%">自动切换检查周期(秒)</th>
	<td>
		<input type="text" class="input" size="15" name="ss_turn_s" style="width: 200px"  value="<% nvram_get_x("","ss_turn_s"); %>" />
	</td>
</tr>
<tr> <th width="50%">切换检查超时时间(秒)</th>
	<td>
		<input type="text" class="input" size="15" name="ss_turn_ss" style="width: 200px" value="<% nvram_get_x("", "ss_turn_ss"); %>">
	</td>
</tr>
<tr> <th colspan="2" style="background-color: #E3E3E3;">SOCKS5代理</th> </tr>
<tr> <th>服务器</th>
	<td>
		<select name="socks5_proxy" id="s5List_Block" class="input" style="width: 200px;">
		</select>
	</td>
</tr>
<tr> <th width="50%">本地端口:</th>
	<td>
		<input type="text" class="input" size="15" name="socks5_proxy_port" style="width: 200px" value="<% nvram_get_x("", "socks5_proxy_port"); %>">
	</td>
</tr>
</table>
<table class="table">
	<tr>
		<td style="border: 0 none; padding: 0px;"><center><input name="button" type="button" class="btn btn-primary" style="width: 200px" onclick="applyRule();" value="应用设置"/></center></td>
	</tr>
</table>
</div>
<div id="wnd_ss_cli" style="display:none">
	<table width="100%" cellpadding="4" cellspacing="0" class="table">
		<tr> <th colspan="2" style="background-color: #E3E3E3;">Chnroute</th> </tr>
		<tr>
			<th width="50%"><#menu5_17_1#>&nbsp;&nbsp;&nbsp;&nbsp;<span class="label label-info" style="padding: 5px 5px 5px 5px;" id="chnroute_count"></span></th>
			<td style="border-top: 0 none;" colspan="2">
				<input type="button" id="btn_connect_3" class="btn btn-info" value=<#menu5_17_2#> onclick="submitInternet('Update_chnroute');">
			</td>
		</tr>
		<tr> <th><#menu5_16_19#></th>
			<td>
				<div class="main_itoggle">
					<div id="ss_update_chnroute_on_of">
						<input type="checkbox" id="ss_update_chnroute_fake" <% nvram_match_x("", "ss_update_chnroute", "1", "value=1 checked"); %><% nvram_match_x("", "ss_update_chnroute", "0", "value=0"); %>>
					</div>
				</div>
				<div style="position: absolute; margin-left: -10000px;">
					<input type="radio" value="1" name="ss_update_chnroute" id="ss_update_chnroute_1" <% nvram_match_x("", "ss_update_chnroute", "1", "checked"); %>><#checkbox_Yes#>
					<input type="radio" value="0" name="ss_update_chnroute" id="ss_update_chnroute_0" <% nvram_match_x("", "ss_update_chnroute", "0", "checked"); %>><#checkbox_No#>
				</div>
			</td>
		</tr>
		<tr> <th colspan="2" style="background-color: #E3E3E3;">gfwlist</th> </tr>
		<tr>
			<th width="50%"><#menu5_17_1#>&nbsp;&nbsp;&nbsp;&nbsp;<span class="label label-info" style="padding: 5px 5px 5px 5px;" id="gfwlist_count"></span></th>
			<td style="border-top: 0 none;" colspan="2">
				<input type="button" id="btn_connect_4" class="btn btn-info" value=<#menu5_17_2#> onclick="submitInternet('Update_gfwlist');">
			</td>
		</tr>
		<tr> <th><#menu5_16_19#></th>
			<td>
				<div class="main_itoggle">
					<div id="ss_update_gfwlist_on_of">
						<input type="checkbox" id="ss_update_gfwlist_fake" <% nvram_match_x("", "ss_update_gfwlist", "1", "value=1 checked"); %><% nvram_match_x("", "ss_update_gfwlist", "0", "value=0"); %>>
					</div>
				</div>
				<div style="position: absolute; margin-left: -10000px;">
					<input type="radio" value="1" name="ss_update_gfwlist" id="ss_update_gfwlist_1" <% nvram_match_x("", "ss_update_gfwlist", "1", "checked"); %>><#checkbox_Yes#>
					<input type="radio" value="0" name="ss_update_gfwlist" id="ss_update_gfwlist_0" <% nvram_match_x("", "ss_update_gfwlist", "0", "checked"); %>><#checkbox_No#>
				</div>
			</td>
		</tr>
		<tr>
			<td colspan="3" >
				<i class="icon-hand-right"></i> <a href="javascript:spoiler_toggle('script8')"><span>不走SS代理的LAN IP:</span></a>
				<div id="script8">
					<textarea rows="8" wrap="off" spellcheck="false" maxlength="314571" class="span12" name="scripts.ss_lan_ip.sh" style="font-family:'Courier New'; font-size:12px;"><% nvram_dump("scripts.ss_lan_ip.sh",""); %></textarea>
				</div>
			</td>
		</tr>
		<tr>
			<td colspan="3" >
				<i class="icon-hand-right"></i> <a href="javascript:spoiler_toggle('script9')"><span>强制走SS代理的LAN IP:</span></a>
				<div id="script9">
					<textarea rows="8" wrap="off" spellcheck="false" maxlength="314571" class="span12" name="scripts.ss_lan_bip.sh" style="font-family:'Courier New'; font-size:12px;"><% nvram_dump("scripts.ss_lan_bip.sh",""); %></textarea>
				</div>
			</td>
		</tr>				
		<tr>
			<td colspan="3" >
				<i class="icon-hand-right"></i> <a href="javascript:spoiler_toggle('script11')"><span>强制走SS代理的WAN IP:</span></a>
				<div id="script11">
					<textarea rows="8" wrap="off" spellcheck="false" maxlength="314571" class="span12" name="scripts.ss_ip.sh" style="font-family:'Courier New'; font-size:12px;"><% nvram_dump("scripts.ss_ip.sh",""); %></textarea>
				</div>
			</td>
		</tr>
		<tr>
			<td colspan="3" >
				<i class="icon-hand-right"></i> <a href="javascript:spoiler_toggle('script12')"><span>不走SS代理的WAN IP:</span></a>
				<div id="script12">
					<textarea rows="8" wrap="off" spellcheck="false" maxlength="314571" class="span12" name="scripts.ss_wan_ip.sh" style="font-family:'Courier New'; font-size:12px;"><% nvram_dump("scripts.ss_wan_ip.sh",""); %></textarea>
				</div>
			</td>
		</tr>
		<tr>
			<td colspan="3" >
				<i class="icon-hand-right"></i> <a href="javascript:spoiler_toggle('script10')"><span>强制走SS代理的域名:</span></a>
				<div id="script10">
					<textarea rows="8" wrap="off" spellcheck="false" maxlength="314571" class="span12" name="scripts.ss_dom.sh" style="font-family:'Courier New'; font-size:12px;"><% nvram_dump("scripts.ss_dom.sh",""); %></textarea>
				</div>
			</td>
		</tr>
		<tr>
			<td colspan="2">
				<center><input class="btn btn-primary" style="width: 200px" type="button" value="<#CTL_apply#>" onclick="applyRule()" /></center>
			</td>
		</tr>
	</table>
</div>
<div id="wnd_ss_log" style="display:none">
	<table width="100%" cellpadding="4" cellspacing="0" class="table">
		<tr>
			<td colspan="3" style="border-top: 0 none; padding-bottom: 0px;">
				<textarea rows="21" class="span12" style="height:377px; font-family:'Courier New', Courier, mono; font-size:13px;" readonly="readonly" wrap="off" id="textarea"><% nvram_dump("ssrplus.log",""); %></textarea>
			</td>
		</tr>
		<tr>
			<td width="15%" style="text-align: left; padding-bottom: 0px;">
				<input type="button" onClick="location.href=location.href" value="<#CTL_refresh#>" class="btn btn-primary" style="width: 200px">
			</td>
		</tr>
	</table>
</div>
</div>
</div>
</div>
</div>
</div>
</div>
</div>
</form>
<div id="footer"></div>
</div>
<form method="post" name="Trojan_action" action="">
	<input type="hidden" name="connect_action" value="">
</form>
</body>
</html>
