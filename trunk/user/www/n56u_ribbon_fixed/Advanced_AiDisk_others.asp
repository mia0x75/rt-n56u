<!DOCTYPE html>
<html>
<head>
<title><#Web_Title#> - <#menu5_4_3#></title>
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
var $j = jQuery.noConflict();

$j(document).ready(function() {
	init_itoggle('enable_samba', change_smb_enabled);
	init_itoggle('enable_ftp', <table width="100%" id="tbl_nfsd" cellpadding="4" cellspacing="0" class="table" style="display:none;">
                                        <tr>
                                            <th colspan="2" style="background-color: #E3E3E3;"><#StorageNFSD#></th>
                                        </tr>
                                        <tr>
                                            <th width="50%">
                                                <#StorageEnableNFSD#>
                                            </th>
                                            <td>
                                                <div class="main_itoggle">
                                                    <div id="nfsd_enable_on_of">
                                                        <input type="checkbox" id="nfsd_enable_fake" <% nvram_match_x("", "nfsd_enable", "1", "value=1 checked"); %><% nvram_match_x("", "nfsd_enable", "0", "value=0"); %>>
                                                    </div>
                                                </div>

                                                <div style="position: absolute; margin-left: -10000px;">
                                                    <input type="radio" name="nfsd_enable" id="nfsd_enable_1" value="1" <% nvram_match_x("", "nfsd_enable", "1", "checked"); %>/><#checkbox_Yes#>
                                                    <input type="radio" name="nfsd_enable" id="nfsd_enable_0" value="0" <% nvram_match_x("", "nfsd_enable", "0", "checked"); %>/><#checkbox_No#>
                                                </div>
                                            </td>
                                        </tr>
                                    </table>

                                    <table width="100%" id="tbl_minidlna" cellpadding="4" cellspacing="0" class="table" style="display:none;">
                                        <tr>
                                            <th colspan="3" style="background-color: #E3E3E3;"><#UPnPMediaServer#></th>
                                        </tr>
                                        <tr>
                                            <th width="50%">
                                                <#StorageEnableDLNA#>
                                            </th>
                                            <td>
                                                <div class="main_itoggle">
                                                    <div id="apps_dms_on_of">
                                                        <input type="checkbox" id="apps_dms_fake" <% nvram_match_x("", "apps_dms", "1", "value=1 checked"); %><% nvram_match_x("", "apps_dms", "0", "value=0"); %>>
                                                    </div>
                                                </div>

                                                <div style="position: absolute; margin-left: -10000px;">
                                                    <input type="radio" name="apps_dms" id="apps_dms_1" value="1" onclick="change_dms_enabled();" <% nvram_match_x("", "apps_dms", "1", "checked"); %>/><#checkbox_Yes#>
                                                    <input type="radio" name="apps_dms" id="apps_dms_0" value="0" onclick="change_dms_enabled();" <% nvram_match_x("", "apps_dms", "0", "checked"); %>/><#checkbox_No#>
                                                </div>
                                            </td>
                                            <td width="15%">
                                                <a href="javascript:on_dms_link();" id="web_dms_link">Web status</a>
                                            </td>
                                        </tr>
                                        <tr id="row_dms_src1">
                                            <th>
                                                <#StorageSourceDLNA#>
                                            </th>
                                            <td colspan="2">
                                                <div id="share_list1" class="alert alert-info ddown-list"></div>
                                                <div class="input-append">
                                                    <input type="text" name="dlna_src1" class="input" maxlength="255" size="32" value="<% nvram_get_x("", "dlna_src1"); %>" style="float:left; width: 260px"/>
                                                    <button class="btn btn-chevron" id="chevron1" type="button" onclick="pull_usb_share_list(this, 0);" title="Select common (or audio) share"><i class="icon icon-chevron-down"></i></button>
                                                </div>
                                            </td>
                                        </tr>
                                        <tr id="row_dms_src2">
                                            <th>
                                                <#StorageSourceDLNA#>
                                            </th>
                                            <td colspan="2">
                                                <div id="share_list2" class="alert alert-info ddown-list"></div>
                                                <div class="input-append">
                                                    <input type="text" name="dlna_src2" class="input" maxlength="255" size="32" value="<% nvram_get_x("", "dlna_src2"); %>" style="float:left; width: 260px"/>
                                                    <button class="btn btn-chevron" id="chevron2" type="button" onclick="pull_usb_share_list(this, 1);" title="Select share for video"><i class="icon icon-chevron-down"></i></button>
                                                </div>
                                            </td>
                                        </tr>
                                        <tr id="row_dms_src3">
                                            <th>
                                                <#StorageSourceDLNA#>
                                            </th>
                                            <td colspan="2">
                                                <div id="share_list3" class="alert alert-info ddown-list"></div>
                                                <div class="input-append">
                                                    <input type="text" name="dlna_src3" class="input" maxlength="255" size="32" value="<% nvram_get_x("", "dlna_src3"); %>" style="float:left; width: 260px"/>
                                                    <button class="btn btn-chevron" id="chevron3" type="button" onclick="pull_usb_share_list(this, 2);" title="Select share for pictures"><i class="icon icon-chevron-down"></i></button>
                                                </div>
                                            </td>
                                        </tr>
                                        <tr id="row_dms_dnew">
                                            <th width="50%">
                                                <#StorageRescanDLNA#>
                                            </th>
                                            <td>
                                                <select name="dlna_rescan" class="input">
                                                    <option value="0" <% nvram_match_x("", "dlna_rescan", "0", "selected"); %>><#StorageRescanItem0#></option>
                                                    <option value="1" <% nvram_match_x("", "dlna_rescan", "1", "selected"); %>><#StorageRescanItem1#></option>
                                                    <option value="2" <% nvram_match_x("", "dlna_rescan", "2", "selected"); %>><#StorageRescanItem2#></option>
                                                </select>
                                            </td>
                                            <td>
                                                <input type="submit" maxlength="15" class="btn btn-info" onClick="return onSubmitApply('dlna_rescan');" size="15" name="" value="Rescan!"/>
                                            </td>
                                        </tr>
                                        <tr id="row_dms_disc">
                                            <th>
                                                <#StorageNotifyDLNA#>
                                            </th>
                                            <td colspan="2">
                                                <input type="text" name="dlna_disc" class="input" maxlength="5" size="5" value="<% nvram_get_x("", "dlna_disc"); %>" onkeypress="return is_number(this,event);"/>
                                            </td>
                                        </tr>
                                        <tr id="row_dms_root">
                                            <th>
                                                <#StorageRootDLNA#>
                                            </th>
                                            <td colspan="2">
                                                <select name="dlna_root" class="input">
                                                    <option value="0" <% nvram_match_x("", "dlna_root", "0", "selected"); %>><#checkbox_No#></option>
                                                    <option value="1" <% nvram_match_x("", "dlna_root", "1", "selected"); %>>Browse Folders</option>
                                                    <option value="2" <% nvram_match_x("", "dlna_root", "2", "selected"); %>>Music</option>
                                                    <option value="3" <% nvram_match_x("", "dlna_root", "3", "selected"); %>>Video</option>
                                                    <option value="4" <% nvram_match_x("", "dlna_root", "4", "selected"); %>>Pictures</option>
                                                </select>
                                            </td>
                                        </tr>
                                        <tr id="row_dms_sort">
                                            <th>
                                                <#StorageSortDLNA#>
                                            </th>
                                            <td colspan="2">
                                                <select name="dlna_sort" class="input">
                                                    <option value="0" <% nvram_match_x("", "dlna_sort", "0", "selected"); %>><#checkbox_No#></option>
                                                    <option value="1" <% nvram_match_x("", "dlna_sort", "1", "selected"); %>><#checkbox_Yes#></option>
                                                </select>
                                            </td>
                                        </tr>
                                    </table>

                                    <table width="100%" id="tbl_itunes" cellpadding="4" cellspacing="0" class="table" style="display:none;">
                                        <tr>
                                            <th colspan="3" style="background-color: #E3E3E3;"><#StorageFFly#></th>
                                        </tr>
                                        <tr>
                                            <th width="50%">
                                                <#StorageEnableFFly#>
                                            </th>
                                            <td>
                                                <div class="main_itoggle">
                                                    <div id="apps_itunes_on_of">
                                                        <input type="checkbox" id="apps_itunes_fake" <% nvram_match_x("", "apps_itunes", "1", "value=1 checked"); %><% nvram_match_x("", "apps_itunes", "0", "value=0"); %>>

                                                    </div>
                                                </div>

                                                <div style="position: absolute; margin-left: -10000px;">
                                                    <input type="radio" name="apps_itunes" id="apps_itunes_1" value="1" <% nvram_match_x("", "apps_itunes", "1", "checked"); %>/><#checkbox_Yes#>
                                                    <input type="radio" name="apps_itunes" id="apps_itunes_0" value="0" <% nvram_match_x("", "apps_itunes", "0", "checked"); %>/><#checkbox_No#>
                                                </div>
                                            </td>
                                            <td width="15%">
                                                <a href="javascript:on_ffly_link();" id="web_ffly_link"><#WebControl#></a>
                                            </td>
                                        </tr>
                                    </table>

                                    <table width="100%" id="tbl_trmd" cellpadding="4" cellspacing="0" class="table" style="display:none;">
                                        <tr>
                                            <th colspan="3" style="background-color: #E3E3E3;"><#StorageTorrent#></th>
                                        </tr>
                                        <tr>
                                            <th width="50%">
                                                <a class="help_tooltip" href="javascript:void(0);" onmouseover="openTooltip(this,17,11);"><#StorageEnableTRMD#></a>
                                            </th>
                                            <td colspan="2">
                                                <div class="main_itoggle">
                                                    <div id="trmd_enable_on_of">
                                                        <input type="checkbox" id="trmd_enable_fake" <% nvram_match_x("", "trmd_enable", "1", "value=1 checked"); %><% nvram_match_x("", "trmd_enable", "0", "value=0"); %>>
                                                    </div>
                                                </div>

                                                <div style="position: absolute; margin-left: -10000px;">
                                                    <input type="radio" name="trmd_enable" id="trmd_enable_1" value="1" onclick="change_trmd_enabled();" <% nvram_match_x("", "trmd_enable", "1", "checked"); %>/><#checkbox_Yes#>
                                                    <input type="radio" name="trmd_enable" id="trmd_enable_0" value="0" onclick="change_trmd_enabled();" <% nvram_match_x("", "trmd_enable", "0", "checked"); %>/><#checkbox_No#>
                                                </div>
                                            </td>
                                        </tr>
                                        <tr id="row_trmd_pport">
                                            <th>
                                                <#StoragePPortTRMD#>
                                            </th>
                                            <td colspan="2">
                                                <input type="text" maxlength="5" size="5" name="trmd_pport" class="input" value="<% nvram_get_x("", "trmd_pport"); %>" onkeypress="return is_number(this,event);"/>
                                            </td>
                                        </tr>
                                        <tr id="row_trmd_rport">
                                            <th width="50%">
                                                <#StorageRPortTRMD#>
                                            </th>
                                            <td>
                                               <input type="text" maxlength="5" size="5" name="trmd_rport" class="input" value="<% nvram_get_x("", "trmd_rport"); %>" onkeypress="return is_number(this,event);"/>
                                            </td>
                                            <td>
                                               <a href="javascript:on_rpc_link();" id="web_rpc_link"><#WebControl#></a>
                                            </td>
                                        </tr>
                                    </table>

                                    <table width="100%" id="tbl_aria" cellpadding="4" cellspacing="0" class="table" style="display:none;">
                                        <tr>
                                            <th colspan="3" style="background-color: #E3E3E3;"><#StorageAria#></th>
                                        </tr>
                                        <tr>
                                            <th width="50%">
                                                <a class="help_tooltip" href="javascript:void(0);" onmouseover="openTooltip(this,17,12);"><#StorageEnableAria#></a>
                                            </th>
                                            <td colspan="2">
                                                <div class="main_itoggle">
                                                    <div id="aria_enable_on_of">
                                                        <input type="checkbox" id="aria_enable_fake" <% nvram_match_x("", "aria_enable", "1", "value=1 checked"); %><% nvram_match_x("", "aria_enable", "0", "value=0"); %>>
                                                    </div>
                                                </div>

                                                <div style="position: absolute; margin-left: -10000px;">
                                                    <input type="radio" name="aria_enable" id="aria_enable_1" value="1" onclick="change_aria_enabled();" <% nvram_match_x("", "aria_enable", "1", "checked"); %>/><#checkbox_Yes#>
                                                    <input type="radio" name="aria_enable" id="aria_enable_0" value="0" onclick="change_aria_enabled();" <% nvram_match_x("", "aria_enable", "0", "checked"); %>/><#checkbox_No#>
                                                </div>
                                            </td>
                                        </tr>
                                        <tr id="row_aria_pport">
                                            <th>
                                                <#StoragePPortTRMD#>
                                            </th>
                                            <td colspan="2">
                                                <input type="text" maxlength="5" size="5" name="aria_pport" class="input" value="<% nvram_get_x("", "aria_pport"); %>" onkeypress="return is_number(this,event);"/>
                                            </td>
                                        </tr>
                                        <tr id="row_aria_rport">
                                            <th width="50%">
                                                <#StorageRPortTRMD#>
                                            </th>
                                            <td>
                                               <input type="text" maxlength="5" size="5" name="aria_rport" class="input" value="<% nvram_get_x("", "aria_rport"); %>" onkeypress="return is_number(this,event);"/>
                                            </td>
                                            <td>
                                               <a href="javascript:on_aria_link();" id="web_aria_link"><#WebControl#></a>
                                            </td>
                                        </tr>
                                    </table>

                                    <table width="100%" cellpadding="4" cellspacing="0" class="table">
                                        <tr>
                                            <td style="border-top: 0 none;">
                                                <center><input class="btn btn-primary" style="width: 219px" onclick="applyRule();" type="button" value="<#CTL_apply#>" /></center>
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
</body>
</html>
