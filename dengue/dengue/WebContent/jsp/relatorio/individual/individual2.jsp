<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<HTML>
<HEAD>
<META http-equiv="Content-Type" content="text/html; charset=UTF-8">
<META http-equiv="X-UA-Compatible" content="IE=8">
<% String urlBase = request.getContextPath(); %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="h" %>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<STYLE type="text/css">

body {margin-top: 0px;margin-left: 0px;}

#page_1 {position:relative; overflow: hidden;margin: 30px 0px 4px 37px;padding: 0px;border: none;width: 756px;}
#page_1 #id_1 {border:none;margin: 0px 0px 0px 12px;padding: 0px;border:none;width: 704px;overflow: hidden;}
#page_1 #id_2 {border:none;margin: 0px 0px 0px 7px;padding: 0px;border:none;width: 706px;overflow: hidden;}
#page_1 #id_2 #id_2_1 {float:left;border:none;margin: 0px 0px 0px 0px;padding: 0px;border:none;width: 22px;overflow: hidden;}
#page_1 #id_2 #id_2_2 {float:left;border:none;margin: 0px 0px 0px 0px;padding: 0px;border:none;width: 684px;overflow: hidden;}
#page_1 #id_2 #id_2_2 #id_2_2_1 {border:none;margin: 0px 0px 0px 0px;padding: 0px;border:none;width: 668px;overflow: hidden;}
#page_1 #id_2 #id_2_2 #id_2_2_1 #id_2_2_1_1 {float:left;border:none;margin: 0px 0px 0px 0px;padding: 0px;border:none;width: 386px;overflow: hidden;}
#page_1 #id_2 #id_2_2 #id_2_2_1 #id_2_2_1_2 {float:left;border:none;margin: 30px 0px 0px 0px;padding: 0px;border:none;width: 282px;overflow: hidden;}
#page_1 #id_2 #id_2_2 #id_2_2_2 {border:none;margin: 0px 0px 0px 4px;padding: 0px;border:none;width: 680px;overflow: hidden;}
#page_1 #id_3 {border:none;margin: 0px 0px 0px 12px;padding: 0px;border:none;width: 744px;overflow: hidden;}
#page_1 #id_3 #id_3_1 {float:left;border:none;margin: 0px 0px 0px 0px;padding: 0px;border:none;width: 14px;overflow: hidden;}
#page_1 #id_3 #id_3_2 {float:left;border:none;margin: 21px 0px 0px 9px;padding: 0px;border:none;width: 721px;overflow: hidden;}
#page_1 #id_3 #id_3_2 #id_3_2_1 {border:none;margin: 0px 0px 0px 14px;padding: 0px;border:none;width: 707px;overflow: hidden;}
#page_1 #id_3 #id_3_2 #id_3_2_2 {border:none;margin: 4px 0px 0px 0px;padding: 0px;border:none;width: 721px;overflow: hidden;}
#page_1 #id_3 #id_3_2 #id_3_2_2 #id_3_2_2_1 {float:left;border:none;margin: 0px 0px 0px 0px;padding: 0px;border:none;width: 325px;overflow: hidden;}
#page_1 #id_3 #id_3_2 #id_3_2_2 #id_3_2_2_2 {float:left;border:none;margin: 16px 0px 0px 0px;padding: 0px;border:none;width: 396px;overflow: hidden;}
#page_1 #id_3 #id_3_2 #id_3_2_3 {border:none;margin: 0px 0px 0px 15px;padding: 0px;border:none;width: 327px;overflow: hidden;}
#page_1 #id_4 {border:none;margin: 19px 0px 0px 36px;padding: 0px;border:none;width: 660px;overflow: hidden;}

#page_1 #dimg1 {position:absolute;top:50px;left:0px;z-index:-1;width:723px;height:1023px;}
#page_1 #dimg1 #img1 {width:723px;height:1023px;}




#page_2 {position:relative; overflow: hidden;margin: 0px 0px 290px 0px;padding: 0px;border: none;width: 793px;}
#page_2 #id_1 {border:none;margin: 0px 0px 0px 48px;padding: 0px;border:none;width: 745px;overflow: hidden;}
#page_2 #id_1 #id_1_1 {float:left;border:none;margin: 0px 0px 0px 0px;padding: 0px;border:none;width: 14px;overflow: hidden;}
#page_2 #id_1 #id_1_2 {float:left;border:none;margin: 45px 0px 0px 14px;padding: 0px;border:none;width: 717px;overflow: hidden;}
#page_2 #id_1 #id_1_2 #id_1_2_1 {border:none;margin: 0px 0px 0px 16px;padding: 0px;border:none;width: 701px;overflow: hidden;}
#page_2 #id_1 #id_1_2 #id_1_2_2 {border:none;margin: 0px 0px 0px 2px;padding: 0px;border:none;width: 651px;overflow: hidden;}
#page_2 #id_1 #id_1_2 #id_1_2_2 #id_1_2_2_1 {float:left;border:none;margin: 2px 0px 0px 0px;padding: 0px;border:none;width: 185px;overflow: hidden;}
#page_2 #id_1 #id_1_2 #id_1_2_2 #id_1_2_2_2 {float:left;border:none;margin: 0px 0px 0px 0px;padding: 0px;border:none;width: 466px;overflow: hidden;}
#page_2 #id_1 #id_1_2 #id_1_2_3 {border:none;margin: 0px 0px 0px 0px;padding: 0px;border:none;width: 717px;overflow: hidden;}
#page_2 #id_2 {border:none;margin: 8px 0px 0px 0px;padding: 0px;border:none;width: 793px;overflow: hidden;}
#page_2 #id_3 {border:none;margin: 0px 0px 0px 47px;padding: 0px;border:none;width: 746px;overflow: hidden;}
#page_2 #id_3 #id_3_1 {float:left;border:none;margin: 0px 0px 0px 0px;padding: 0px;border:none;width: 14px;overflow: hidden;}
#page_2 #id_3 #id_3_2 {float:left;border:none;margin: 265px 0px 0px 13px;padding: 0px;border:none;width: 260px;overflow: hidden;}
#page_2 #id_3 #id_3_3 {float:left;border:none;margin: 263px 0px 0px 0px;padding: 0px;border:none;width: 459px;overflow: hidden;}

#page_2 #dimg1 {position:absolute;top:44px;left:40px;z-index:-1;width:720px;height:761px;}
#page_2 #dimg1 #img1 {width:720px;height:761px;}




.ft0{font: bold 11px 'Arial';line-height: 14px;}
.ft1{font: bold 15px 'Arial';line-height: 18px;}
.ft2{font: 1px 'Arial';line-height: 12px;}
.ft3{font: 1px 'Arial';line-height: 9px;}
.ft4{font: bold 13px 'Arial';line-height: 16px;}
.ft5{font: bold 11px 'Arial';line-height: 11px;}
.ft6{font: bold 11px 'Arial';line-height: 13px;}
.ft7{font: bold 12px 'Arial';line-height: 15px;}
.ft8{font: 12px 'Arial';line-height: 8px;}
.ft9{font: 11px 'Arial';line-height: 13px;}
.ft10{font: 11px 'Arial';line-height: 14px;}
.ft11{font: bold 11px 'Arial';line-height: 14px;position: relative; bottom: 4px;}
.ft12{font: 11px 'Arial';line-height: 14px;position: relative; bottom: 2px;}
.ft13{font: 16px 'Arial';line-height: 18px;}
.ft14{font: 1px 'Arial';line-height: 1px;}
.ft15{font: bold 11px 'Arial';line-height: 14px;position: relative; bottom: -1px;}
.ft16{font: bold 16px 'Arial';line-height: 19px;position: relative; bottom: 3px;}
.ft17{font: bold 16px 'Arial';line-height: 19px;}
.ft18{font: 1px 'Arial';line-height: 14px;}
.ft19{font: 1px 'Arial';line-height: 13px;}
.ft20{font: bold 11px 'Arial';line-height: 13px;position: relative; bottom: -1px;}
.ft21{font: 1px 'Arial';line-height: 17px;}
.ft22{font: 9px 'Arial';line-height: 12px;}
.ft23{font: 8px 'Arial';line-height: 10px;}
.ft24{font: 1px 'Arial';line-height: 8px;}
.ft25{font: 8px 'Arial';line-height: 8px;}
.ft26{font: bold 11px 'Arial';line-height: 8px;position: relative; bottom: 7px;}
.ft27{font: italic 8px 'Arial';line-height: 8px;}
.ft28{font: 1px 'Arial';line-height: 6px;}
.ft29{font: 13px 'Arial';line-height: 16px;}
.ft30{font: 8px 'Arial';line-height: 6px;}
.ft31{font: italic 8px 'Arial';line-height: 10px;}
.ft32{font: 1px 'Arial';line-height: 4px;}
.ft33{font: 1px 'Arial';line-height: 10px;}
.ft34{font: bold 11px 'Arial';line-height: 12px;}
.ft35{font: 11px 'Arial';line-height: 12px;}
.ft36{font: 8px 'Arial';line-height: 7px;}
.ft37{font: 1px 'Arial';line-height: 7px;}
.ft38{font: 8px 'Arial';line-height: 9px;}
.ft39{font: 1px 'Arial';line-height: 11px;}
.ft40{font: bold 11px 'Arial';line-height: 14px;position: relative; bottom: 2px;}
.ft41{font: bold 9px 'Arial';line-height: 11px;}
.ft42{font: 1px 'Arial';line-height: 15px;}
.ft43{font: bold 10px 'Arial';line-height: 12px;}
.ft44{font: 10px 'Arial';line-height: 13px;}
.ft45{font: bold 11px 'Arial';line-height: 14px;position: relative; bottom: -2px;}
.ft46{font: bold 11px 'Arial';line-height: 9px;}
.ft47{font: 11px 'Arial';line-height: 9px;}
.ft48{font: 11px 'Arial';line-height: 8px;}
.ft49{font: bold 10px 'Arial';line-height: 12px;position: relative; bottom: 4px;}
.ft50{font: 11px 'Arial';line-height: 11px;}
.ft51{font: 10px 'Arial';line-height: 11px;}
.ft52{font: 9px 'Arial';line-height: 11px;}
.ft53{font: bold 9px 'Arial';line-height: 11px;position: relative; bottom: 2px;}
.ft54{font: 11px 'Arial';line-height: 14px;position: relative; bottom: -2px;}
.ft55{font: 1px 'Arial';line-height: 3px;}
.ft56{font: 1px 'Arial';line-height: 5px;}
.ft57{font: 1px 'Arial';line-height: 2px;}
.ft58{font: 16px 'Arial';line-height: 17px;}
.ft59{font: italic 11px 'Arial';line-height: 14px;}
.ft60{font: bold 13px 'Arial';line-height: 17px;}
.ft61{font: 13px 'Arial';line-height: 17px;}
.ft62{font: bold 11px 'Arial';line-height: 10px;}
.ft63{font: 11px 'Arial';line-height: 14px;position: relative; bottom: 5px;}
.ft64{font: 16px 'Arial';line-height: 18px;position: relative; bottom: -3px;}
.ft65{font: 16px 'Arial';line-height: 14px;}
.ft66{font: 16px 'Arial';line-height: 13px;}

.p0{text-align: left;margin-top: 0px;margin-bottom: 0px;white-space: nowrap;}
.p1{text-align: left;padding-left: 132px;margin-top: 0px;margin-bottom: 0px;white-space: nowrap;}
.p2{text-align: left;padding-left: 3px;margin-top: 0px;margin-bottom: 0px;white-space: nowrap;}
.p3{text-align: left;padding-left: 21px;margin-top: 0px;margin-bottom: 0px;white-space: nowrap;}
.p4{text-align: left;padding-left: 59px;margin-top: 0px;margin-bottom: 0px;white-space: nowrap;}
.p5{text-align: left;padding-right: 3px;margin-top: 0px;margin-bottom: 0px;}
.p6{text-align: left;margin-top: 0px;margin-bottom: 0px;-webkit-transform: rotate(270deg);-moz-transform: rotate(270deg);filter: progid:DXImageTransform.Microsoft.BasicImage(rotation=3);direction: rtl;block-progression: lr;width:104px;height:14px;}
.p7{text-align: left;margin-top: 0px;margin-bottom: 0px;-webkit-transform: rotate(270deg);-moz-transform: rotate(270deg);filter: progid:DXImageTransform.Microsoft.BasicImage(rotation=3);direction: rtl;block-progression: lr;width:176px;height:14px;}
.p8{text-align: left;margin-top: 0px;margin-bottom: 0px;-webkit-transform: rotate(270deg);-moz-transform: rotate(270deg);filter: progid:DXImageTransform.Microsoft.BasicImage(rotation=3);direction: rtl;block-progression: lr;width:163px;height:14px;}
.p9{text-align: left;margin-top: 0px;margin-bottom: 0px;-webkit-transform: rotate(270deg);-moz-transform: rotate(270deg);filter: progid:DXImageTransform.Microsoft.BasicImage(rotation=3);direction: rtl;block-progression: lr;width:236px;height:14px;}
.p10{text-align: left;padding-left: 7px;margin-top: 10px;margin-bottom: 0px;}
.p11{text-align: right;padding-right: 49px;margin-top: 0px;margin-bottom: 0px;}
.p12{text-align: left;padding-left: 7px;margin-top: 8px;margin-bottom: 0px;}
.p13{text-align: left;padding-left: 229px;margin-top: 0px;margin-bottom: 0px;}
.p14{text-align: left;padding-left: 6px;margin-top: 4px;margin-bottom: 0px;}
.p15{text-align: left;padding-left: 10px;margin-top: 0px;margin-bottom: 0px;}
.p16{text-align: left;padding-left: 6px;margin-top: 7px;margin-bottom: 0px;}
.p17{text-align: left;padding-left: 7px;margin-top: 23px;margin-bottom: 0px;}
.p18{text-align: right;padding-right: 14px;margin-top: 10px;margin-bottom: 0px;white-space: nowrap;}
.p19{text-align: left;padding-right: 16px;margin-top: 0px;margin-bottom: 0px;white-space: nowrap;}
.p20{text-align: center;margin-top: 0px;margin-bottom: 0px;white-space: nowrap;}
.p21{text-align: left;padding-left: 1px;margin-top: 0px;margin-bottom: 0px;white-space: nowrap;}
.p22{text-align: left;padding-left: 15px;margin-top: 0px;margin-bottom: 0px;white-space: nowrap;}
.p23{text-align: right;padding-right: 1px;margin-top: 0px;margin-bottom: 0px;white-space: nowrap;}
.p24{text-align: right;padding-right: 13px;margin-top: 0px;margin-bottom: 0px;white-space: nowrap;}
.p25{text-align: right;padding-right: 10px;margin-top: 0px;margin-bottom: 0px;white-space: nowrap;}
.p26{text-align: right;padding-right: 5px;margin-top: 0px;margin-bottom: 0px;white-space: nowrap;}
.p27{text-align: left;padding-left: 16px;margin-top: 0px;margin-bottom: 0px;white-space: nowrap;}
.p28{text-align: left;margin-top: 0px;margin-bottom: 0px;white-space: nowrap;}
.p29{text-align: right;padding-right: 8px;margin-top: 0px;margin-bottom: 0px;white-space: nowrap;}
.p30{text-align: right;padding-right: 3px;margin-top: 0px;margin-bottom: 0px;white-space: nowrap;}
.p31{text-align: right;padding-right: 9px;margin-top: 0px;margin-bottom: 0px;white-space: nowrap;}
.p32{text-align: right;padding-right: 15px;margin-top: 0px;margin-bottom: 0px;white-space: nowrap;}
.p33{text-align: right;padding-right: 4px;margin-top: 0px;margin-bottom: 0px;white-space: nowrap;}
.p34{text-align: right;padding-right: 17px;margin-top: 0px;margin-bottom: 0px;white-space: nowrap;}
.p35{text-align: center;padding-right: 7px;margin-top: 0px;margin-bottom: 0px;white-space: nowrap;}
.p36{text-align: left;padding-left: 13px;margin-top: 0px;margin-bottom: 0px;white-space: nowrap;}
.p37{text-align: center;padding-right: 12px;margin-top: 0px;margin-bottom: 0px;white-space: nowrap;}
.p38{text-align: right;padding-right: 12px;margin-top: 0px;margin-bottom: 0px;white-space: nowrap;}
.p39{text-align: right;padding-right: 20px;margin-top: 0px;margin-bottom: 0px;white-space: nowrap;}
.p40{text-align: center;padding-right: 9px;margin-top: 0px;margin-bottom: 0px;white-space: nowrap;}
.p41{text-align: right;padding-right: 2px;margin-top: 0px;margin-bottom: 0px;white-space: nowrap;}
.p42{text-align: right;padding-right: 7px;margin-top: 0px;margin-bottom: 0px;white-space: nowrap;}
.p43{text-align: left;padding-left: 19px;margin-top: 0px;margin-bottom: 0px;white-space: nowrap;}
.p44{text-align: left;padding-left: 4px;margin-top: 0px;margin-bottom: 0px;white-space: nowrap;}
.p45{text-align: center;padding-right: 10px;margin-top: 0px;margin-bottom: 0px;white-space: nowrap;}
.p46{text-align: left;padding-left: 9px;margin-top: 0px;margin-bottom: 0px;white-space: nowrap;}
.p47{text-align: left;padding-left: 14px;margin-top: 0px;margin-bottom: 0px;white-space: nowrap;}
.p48{text-align: left;padding-left: 2px;margin-top: 0px;margin-bottom: 0px;white-space: nowrap;}
.p49{text-align: center;padding-left: 2px;margin-top: 0px;margin-bottom: 0px;white-space: nowrap;}
.p50{text-align: center;padding-right: 5px;margin-top: 0px;margin-bottom: 0px;white-space: nowrap;}
.p51{text-align: left;padding-left: 11px;margin-top: 0px;margin-bottom: 0px;white-space: nowrap;}
.p52{text-align: right;padding-right: 6px;margin-top: 0px;margin-bottom: 0px;white-space: nowrap;}
.p53{text-align: left;padding-left: 6px;margin-top: 0px;margin-bottom: 0px;white-space: nowrap;}
.p54{text-align: center;padding-left: 3px;margin-top: 0px;margin-bottom: 0px;white-space: nowrap;}
.p55{text-align: left;padding-left: 30px;margin-top: 0px;margin-bottom: 0px;white-space: nowrap;}
.p56{text-align: left;padding-left: 8px;margin-top: 0px;margin-bottom: 0px;white-space: nowrap;}
.p57{text-align: center;padding-left: 19px;margin-top: 0px;margin-bottom: 0px;white-space: nowrap;}
.p58{text-align: center;padding-right: 2px;margin-top: 0px;margin-bottom: 0px;white-space: nowrap;}
.p59{text-align: left;padding-left: 7px;margin-top: 0px;margin-bottom: 0px;white-space: nowrap;}
.p60{text-align: right;padding-right: 41px;margin-top: 0px;margin-bottom: 0px;white-space: nowrap;}
.p61{text-align: right;padding-right: 11px;margin-top: 0px;margin-bottom: 0px;white-space: nowrap;}
.p62{text-align: left;padding-left: 10px;margin-top: 0px;margin-bottom: 0px;white-space: nowrap;}
.p63{text-align: center;padding-right: 3px;margin-top: 0px;margin-bottom: 0px;white-space: nowrap;}
.p64{text-align: center;padding-left: 9px;margin-top: 0px;margin-bottom: 0px;white-space: nowrap;}
.p65{text-align: left;padding-left: 29px;margin-top: 0px;margin-bottom: 0px;white-space: nowrap;}
.p66{text-align: left;padding-left: 5px;margin-top: 0px;margin-bottom: 0px;white-space: nowrap;}
.p67{text-align: right;padding-right: 18px;margin-top: 0px;margin-bottom: 0px;white-space: nowrap;}
.p68{text-align: right;padding-right: 21px;margin-top: 0px;margin-bottom: 0px;white-space: nowrap;}
.p69{text-align: right;padding-right: 31px;margin-top: 0px;margin-bottom: 0px;white-space: nowrap;}
.p70{text-align: right;padding-right: 22px;margin-top: 0px;margin-bottom: 0px;white-space: nowrap;}
.p71{text-align: left;margin-top: 0px;margin-bottom: 0px;-webkit-transform: rotate(270deg);-moz-transform: rotate(270deg);filter: progid:DXImageTransform.Microsoft.BasicImage(rotation=3);direction: rtl;block-progression: lr;width:178px;height:14px;}
.p72{text-align: left;padding-left: 64px;margin-top: 6px;margin-bottom: 0px;}
.p73{text-align: left;padding-left: 4px;margin-top: 0px;margin-bottom: 0px;}
.p74{text-align: left;padding-left: 8px;margin-top: 1px;margin-bottom: 0px;}
.p75{text-align: left;padding-left: 62px;margin-top: 0px;margin-bottom: 0px;}
.p76{text-align: left;padding-left: 77px;margin-top: 1px;margin-bottom: 0px;}
.p77{text-align: left;margin-top: 18px;margin-bottom: 0px;}
.p78{text-align: left;padding-left: 28px;padding-right: 97px;margin-top: 0px;margin-bottom: 0px;}
.p79{text-align: right;padding-right: 19px;margin-top: 0px;margin-bottom: 0px;white-space: nowrap;}
.p80{text-align: left;margin-top: 0px;margin-bottom: 0px;-webkit-transform: rotate(270deg);-moz-transform: rotate(270deg);filter: progid:DXImageTransform.Microsoft.BasicImage(rotation=3);direction: rtl;block-progression: lr;width:366px;height:14px;}
.p81{text-align: left;padding-left: 107px;margin-top: 0px;margin-bottom: 0px;}
.p82{text-align: left;padding-right: 61px;margin-top: 5px;margin-bottom: 0px;text-indent: 12px;}
.p83{text-align: left;padding-left: 33px;padding-right: 79px;margin-top: 0px;margin-bottom: 0px;text-indent: -13px;}
.p84{text-align: left;padding-left: 3px;margin-top: 0px;margin-bottom: 0px;}
.p85{text-align: left;padding-left: 13px;margin-top: 19px;margin-bottom: 0px;}
.p86{text-align: left;margin-top: 15px;margin-bottom: 0px;}
.p87{text-align: left;padding-left: 18px;margin-top: 7px;margin-bottom: 0px;}
.p88{text-align: left;padding-left: 4px;margin-top: 6px;margin-bottom: 0px;}
.p89{text-align: left;padding-left: 71px;margin-top: 7px;margin-bottom: 0px;}
.p90{text-align: left;margin-top: 0px;margin-bottom: 0px;}
.p91{text-align: right;padding-right: 23px;margin-top: 0px;margin-bottom: 0px;white-space: nowrap;}
.p92{text-align: left;padding-left: 12px;margin-top: 0px;margin-bottom: 0px;white-space: nowrap;}
.p93{text-align: right;padding-right: 30px;margin-top: 0px;margin-bottom: 0px;white-space: nowrap;}
.p94{text-align: right;padding-right: 24px;margin-top: 0px;margin-bottom: 0px;white-space: nowrap;}
.p95{text-align: right;padding-right: 234px;margin-top: 0px;margin-bottom: 0px;}
.p96{text-align: left;padding-left: 55px;margin-top: 6px;margin-bottom: 0px;}
.p97{text-align: left;margin-top: 0px;margin-bottom: 0px;-webkit-transform: rotate(270deg);-moz-transform: rotate(270deg);filter: progid:DXImageTransform.Microsoft.BasicImage(rotation=3);direction: rtl;block-progression: lr;width:332px;height:14px;}
.p98{text-align: left;padding-left: 2px;margin-top: 0px;margin-bottom: 0px;}
.p99{text-align: left;padding-left: 1px;margin-top: 27px;margin-bottom: 0px;}
.p100{text-align: left;margin-top: 25px;margin-bottom: 0px;}
.p101{text-align: left;padding-left: 280px;margin-top: 0px;margin-bottom: 0px;}
.p102{text-align: left;padding-left: 88px;margin-top: 0px;margin-bottom: 0px;white-space: nowrap;}
.p103{text-align: left;padding-left: 89px;margin-top: 0px;margin-bottom: 0px;white-space: nowrap;}

.td0{padding: 0px;margin: 0px;width: 0px;vertical-align: bottom;}
.td1{padding: 0px;margin: 0px;width: 172px;vertical-align: bottom;}
.td2{padding: 0px;margin: 0px;width: 222px;vertical-align: bottom;}
.td3{padding: 0px;margin: 0px;width: 138px;vertical-align: bottom;}
.td4{padding: 0px;margin: 0px;width: 149px;vertical-align: bottom;}
.td5{padding: 0px;margin: 0px;width: 149px;vertical-align: bottom;background: #d9d9d9;}
.td6{padding: 0px;margin: 0px;width: 360px;vertical-align: bottom;}
.td7{padding: 0px;margin: 0px;width: 14px;vertical-align: bottom;}
.td8{padding: 0px;margin: 0px;width: 28px;vertical-align: bottom;}
.td9{padding: 0px;margin: 0px;width: 86px;vertical-align: bottom;}
.td10{padding: 0px;margin: 0px;width: 122px;vertical-align: bottom;}
.td11{padding: 0px;margin: 0px;width: 17px;vertical-align: bottom;}
.td12{padding: 0px;margin: 0px;width: 15px;vertical-align: bottom;}
.td13{padding: 0px;margin: 0px;width: 12px;vertical-align: bottom;}
.td14{padding: 0px;margin: 0px;width: 34px;vertical-align: bottom;}
.td15{padding: 0px;margin: 0px;width: 5px;vertical-align: bottom;}
.td16{padding: 0px;margin: 0px;width: 35px;vertical-align: bottom;}
.td17{padding: 0px;margin: 0px;width: 25px;vertical-align: bottom;}
.td18{padding: 0px;margin: 0px;width: 19px;vertical-align: bottom;}
.td19{padding: 0px;margin: 0px;width: 20px;vertical-align: bottom;}
.td20{padding: 0px;margin: 0px;width: 30px;vertical-align: bottom;}
.td21{padding: 0px;margin: 0px;width: 42px;vertical-align: bottom;}
.td22{padding: 0px;margin: 0px;width: 154px;vertical-align: bottom;}
.td23{padding: 0px;margin: 0px;width: 94px;vertical-align: bottom;}
.td24{padding: 0px;margin: 0px;width: 18px;vertical-align: bottom;}
.td25{padding: 0px;margin: 0px;width: 24px;vertical-align: bottom;}
.td26{padding: 0px;margin: 0px;width: 21px;vertical-align: bottom;}
.td27{padding: 0px;margin: 0px;width: 41px;vertical-align: bottom;}
.td28{padding: 0px;margin: 0px;width: 16px;vertical-align: bottom;}
.td29{padding: 0px;margin: 0px;width: 7px;vertical-align: bottom;}
.td30{padding: 0px;margin: 0px;width: 77px;vertical-align: bottom;}
.td31{padding: 0px;margin: 0px;width: 50px;vertical-align: bottom;}
.td32{padding: 0px;margin: 0px;width: 29px;vertical-align: bottom;}
.td33{padding: 0px;margin: 0px;width: 13px;vertical-align: bottom;}
.td34{padding: 0px;margin: 0px;width: 22px;vertical-align: bottom;}
.td35{padding: 0px;margin: 0px;width: 68px;vertical-align: bottom;}
.td36{padding: 0px;margin: 0px;width: 90px;vertical-align: bottom;}
.td37{padding: 0px;margin: 0px;width: 58px;vertical-align: bottom;}
.td38{padding: 0px;margin: 0px;width: 49px;vertical-align: bottom;}
.td39{padding: 0px;margin: 0px;width: 64px;vertical-align: bottom;}
.td40{padding: 0px;margin: 0px;width: 127px;vertical-align: bottom;}
.td41{padding: 0px;margin: 0px;width: 75px;vertical-align: bottom;}
.td42{padding: 0px;margin: 0px;width: 37px;vertical-align: bottom;}
.td43{padding: 0px;margin: 0px;width: 60px;vertical-align: bottom;}
.td44{padding: 0px;margin: 0px;width: 89px;vertical-align: bottom;}
.td45{padding: 0px;margin: 0px;width: 6px;vertical-align: bottom;}
.td46{padding: 0px;margin: 0px;width: 201px;vertical-align: bottom;}
.td47{padding: 0px;margin: 0px;width: 228px;vertical-align: bottom;}
.td48{padding: 0px;margin: 0px;width: 236px;vertical-align: bottom;}
.td49{padding: 0px;margin: 0px;width: 215px;vertical-align: bottom;}
.td50{padding: 0px;margin: 0px;width: 159px;vertical-align: bottom;}
.td51{padding: 0px;margin: 0px;width: 65px;vertical-align: bottom;}
.td52{padding: 0px;margin: 0px;width: 165px;vertical-align: bottom;}
.td53{padding: 0px;margin: 0px;width: 47px;vertical-align: bottom;}
.td54{padding: 0px;margin: 0px;width: 126px;vertical-align: bottom;}
.td55{padding: 0px;margin: 0px;width: 118px;vertical-align: bottom;}
.td56{padding: 0px;margin: 0px;width: 54px;vertical-align: bottom;}
.td57{padding: 0px;margin: 0px;width: 130px;vertical-align: bottom;}
.td58{padding: 0px;margin: 0px;width: 102px;vertical-align: bottom;}
.td59{padding: 0px;margin: 0px;width: 32px;vertical-align: bottom;}
.td60{padding: 0px;margin: 0px;width: 140px;vertical-align: bottom;}
.td61{padding: 0px;margin: 0px;width: 113px;vertical-align: bottom;}
.td62{padding: 0px;margin: 0px;width: 59px;vertical-align: bottom;}
.td63{padding: 0px;margin: 0px;width: 56px;vertical-align: bottom;}
.td64{padding: 0px;margin: 0px;width: 151px;vertical-align: bottom;}
.td65{padding: 0px;margin: 0px;width: 168px;vertical-align: bottom;}
.td66{padding: 0px;margin: 0px;width: 87px;vertical-align: bottom;}
.td67{padding: 0px;margin: 0px;width: 46px;vertical-align: bottom;}
.td68{padding: 0px;margin: 0px;width: 81px;vertical-align: bottom;}
.td69{padding: 0px;margin: 0px;width: 74px;vertical-align: bottom;}
.td70{padding: 0px;margin: 0px;width: 92px;vertical-align: bottom;}
.td71{padding: 0px;margin: 0px;width: 176px;vertical-align: bottom;}
.td72{padding: 0px;margin: 0px;width: 152px;vertical-align: bottom;}
.td73{padding: 0px;margin: 0px;width: 364px;vertical-align: bottom;}
.td74{padding: 0px;margin: 0px;width: 98px;vertical-align: bottom;}
.td75{padding: 0px;margin: 0px;width: 146px;vertical-align: bottom;}
.td76{padding: 0px;margin: 0px;width: 83px;vertical-align: bottom;}
.td77{padding: 0px;margin: 0px;width: 109px;vertical-align: bottom;}
.td78{padding: 0px;margin: 0px;width: 66px;vertical-align: bottom;}
.td79{padding: 0px;margin: 0px;width: 57px;vertical-align: bottom;}
.td80{padding: 0px;margin: 0px;width: 170px;vertical-align: bottom;}
.td81{padding: 0px;margin: 0px;width: 219px;vertical-align: bottom;}
.td82{padding: 0px;margin: 0px;width: 229px;vertical-align: bottom;}
.td83{padding: 0px;margin: 0px;width: 112px;vertical-align: bottom;}
.td84{padding: 0px;margin: 0px;width: 8px;vertical-align: bottom;}
.td85{padding: 0px;margin: 0px;width: 195px;vertical-align: bottom;}
.td86{border-bottom: #000000 1px solid;padding: 0px;margin: 0px;width: 5px;vertical-align: bottom;}
.td87{border-bottom: #000000 1px solid;padding: 0px;margin: 0px;width: 12px;vertical-align: bottom;}
.td88{padding: 0px;margin: 0px;width: 242px;vertical-align: bottom;}
.td89{border-left: #000000 1px solid;padding: 0px;margin: 0px;width: 4px;vertical-align: bottom;}
.td90{border-right: #000000 1px solid;padding: 0px;margin: 0px;width: 11px;vertical-align: bottom;}
.td91{padding: 0px;margin: 0px;width: 143px;vertical-align: bottom;}
.td92{border-left: #000000 1px solid;border-bottom: #000000 1px solid;padding: 0px;margin: 0px;width: 4px;vertical-align: bottom;}
.td93{border-right: #000000 1px solid;border-bottom: #000000 1px solid;padding: 0px;margin: 0px;width: 11px;vertical-align: bottom;}
.td94{padding: 0px;margin: 0px;width: 125px;vertical-align: bottom;}
.td95{padding: 0px;margin: 0px;width: 200px;vertical-align: bottom;}
.td96{padding: 0px;margin: 0px;width: 208px;vertical-align: bottom;}
.td97{padding: 0px;margin: 0px;width: 9px;vertical-align: bottom;}
.td98{padding: 0px;margin: 0px;width: 4px;vertical-align: bottom;}
.td99{padding: 0px;margin: 0px;width: 3px;vertical-align: bottom;}
.td100{padding: 0px;margin: 0px;width: 220px;vertical-align: bottom;}
.td101{padding: 0px;margin: 0px;width: 1px;vertical-align: bottom;}
.td102{padding: 0px;margin: 0px;width: 91px;vertical-align: bottom;}
.td103{border-right: #000000 1px solid;padding: 0px;margin: 0px;width: 7px;vertical-align: bottom;}
.td104{border-right: #000000 1px solid;border-top: #000000 1px solid;border-bottom: #000000 1px solid;padding: 0px;margin: 0px;width: 12px;vertical-align: bottom;}
.td105{padding: 0px;margin: 0px;width: 69px;vertical-align: bottom;}
.td106{border-bottom: #000000 1px solid;padding: 0px;margin: 0px;width: 1px;vertical-align: bottom;background: #000000;}
.td107{padding: 0px;margin: 0px;width: 107px;vertical-align: bottom;}
.td108{padding: 0px;margin: 0px;width: 1px;vertical-align: bottom;background: #000000;}
.td109{border-bottom: #000000 1px solid;padding: 0px;margin: 0px;width: 8px;vertical-align: bottom;}
.td110{border-bottom: #000000 1px solid;padding: 0px;margin: 0px;width: 9px;vertical-align: bottom;}
.td111{border-left: #000000 1px solid;border-right: #000000 1px solid;border-bottom: #000000 1px solid;padding: 0px;margin: 0px;width: 15px;vertical-align: bottom;}
.td112{padding: 0px;margin: 0px;width: 270px;vertical-align: bottom;}
.td113{border-bottom: #000000 1px solid;padding: 0px;margin: 0px;width: 16px;vertical-align: bottom;}
.td114{border-left: #000000 1px solid;border-right: #000000 1px solid;padding: 0px;margin: 0px;width: 14px;vertical-align: bottom;}
.td115{padding: 0px;margin: 0px;width: 204px;vertical-align: bottom;}
.td116{border-left: #000000 1px solid;border-right: #000000 1px solid;border-bottom: #000000 1px solid;padding: 0px;margin: 0px;width: 14px;vertical-align: bottom;}
.td117{border-right: #000000 1px solid;border-top: #000000 1px solid;border-bottom: #000000 1px solid;padding: 0px;margin: 0px;width: 15px;vertical-align: bottom;}
.td118{border-top: #000000 1px solid;padding: 0px;margin: 0px;width: 17px;vertical-align: bottom;}
.td119{padding: 0px;margin: 0px;width: 185px;vertical-align: bottom;}
.td120{padding: 0px;margin: 0px;width: 43px;vertical-align: bottom;}
.td121{border-right: #000000 1px solid;border-bottom: #000000 1px solid;padding: 0px;margin: 0px;width: 38px;vertical-align: bottom;}
.td122{border-right: #000000 1px solid;padding: 0px;margin: 0px;width: 36px;vertical-align: bottom;}
.td123{border-right: #000000 1px solid;border-bottom: #000000 1px solid;padding: 0px;margin: 0px;width: 39px;vertical-align: bottom;}
.td124{border-bottom: #000000 1px solid;padding: 0px;margin: 0px;width: 20px;vertical-align: bottom;}
.td125{border-bottom: #000000 1px solid;padding: 0px;margin: 0px;width: 19px;vertical-align: bottom;}
.td126{border-bottom: #000000 1px solid;padding: 0px;margin: 0px;width: 33px;vertical-align: bottom;}
.td127{padding: 0px;margin: 0px;width: 317px;vertical-align: bottom;}
.td128{padding: 0px;margin: 0px;width: 244px;vertical-align: bottom;}
.td129{padding: 0px;margin: 0px;width: 133px;vertical-align: bottom;}
.td130{padding: 0px;margin: 0px;width: 61px;vertical-align: bottom;}
.td131{padding: 0px;margin: 0px;width: 11px;vertical-align: bottom;}
.td132{padding: 0px;margin: 0px;width: 53px;vertical-align: bottom;}
.td133{padding: 0px;margin: 0px;width: 2px;vertical-align: bottom;}
.td134{border-left: #000000 1px solid;border-bottom: #000000 1px solid;padding: 0px;margin: 0px;width: 7px;vertical-align: bottom;}
.td135{border-right: #000000 1px solid;border-bottom: #000000 1px solid;padding: 0px;margin: 0px;width: 7px;vertical-align: bottom;}
.td136{border-bottom: #000000 1px solid;padding: 0px;margin: 0px;width: 14px;vertical-align: bottom;}
.td137{padding: 0px;margin: 0px;width: 44px;vertical-align: bottom;}
.td138{border-bottom: #000000 1px solid;padding: 0px;margin: 0px;width: 6px;vertical-align: bottom;}
.td139{border-right: #000000 1px solid;padding: 0px;margin: 0px;width: 5px;vertical-align: bottom;}
.td140{border-right: #000000 1px solid;border-bottom: #000000 1px solid;padding: 0px;margin: 0px;width: 13px;vertical-align: bottom;}
.td141{padding: 0px;margin: 0px;width: 63px;vertical-align: bottom;}
.td142{border-right: #000000 1px solid;padding: 0px;margin: 0px;width: 2px;vertical-align: bottom;}
.td143{border-right: #000000 1px solid;padding: 0px;margin: 0px;width: 109px;vertical-align: bottom;}
.td144{border-right: #000000 1px solid;border-bottom: #000000 1px solid;padding: 0px;margin: 0px;width: 8px;vertical-align: bottom;}
.td145{border-right: #000000 1px solid;padding: 0px;margin: 0px;width: 10px;vertical-align: bottom;}
.td146{padding: 0px;margin: 0px;width: 55px;vertical-align: bottom;}
.td147{padding: 0px;margin: 0px;width: 193px;vertical-align: bottom;}
.td148{padding: 0px;margin: 0px;width: 88px;vertical-align: bottom;}
.td149{border-right: #000000 1px solid;border-top: #000000 1px solid;border-bottom: #000000 1px solid;padding: 0px;margin: 0px;width: 13px;vertical-align: bottom;}
.td150{border-left: #000000 1px solid;border-right: #000000 1px solid;padding: 0px;margin: 0px;width: 15px;vertical-align: bottom;background: #000000;}
.td151{border-right: #000000 1px solid;padding: 0px;margin: 0px;width: 1px;vertical-align: bottom;background: #000000;}
.td152{border-left: #000000 1px solid;padding: 0px;margin: 0px;width: 16px;vertical-align: bottom;}
.td153{border-right: #000000 1px solid;padding: 0px;margin: 0px;width: 1px;vertical-align: bottom;}
.td154{padding: 0px;margin: 0px;width: 342px;vertical-align: bottom;}
.td155{border-left: #000000 1px solid;border-right: #000000 1px solid;border-bottom: #000000 1px solid;padding: 0px;margin: 0px;width: 17px;vertical-align: bottom;}
.td156{padding: 0px;margin: 0px;width: 199px;vertical-align: bottom;}
.td157{border-bottom: #000000 1px solid;padding: 0px;margin: 0px;width: 1px;vertical-align: bottom;}
.td158{border-bottom: #000000 1px solid;padding: 0px;margin: 0px;width: 17px;vertical-align: bottom;}
.td159{border-right: #000000 1px solid;padding: 0px;margin: 0px;width: 13px;vertical-align: bottom;}
.td160{border-right: #000000 1px solid;padding: 0px;margin: 0px;width: 16px;vertical-align: bottom;}
.td161{border-top: #000000 1px solid;padding: 0px;margin: 0px;width: 14px;vertical-align: bottom;}
.td162{padding: 0px;margin: 0px;width: 72px;vertical-align: bottom;}
.td163{padding: 0px;margin: 0px;width: 78px;vertical-align: bottom;}
.td164{border-top: #000000 1px solid;border-bottom: #000000 1px solid;padding: 0px;margin: 0px;width: 1px;vertical-align: bottom;background: #000000;}
.td165{border-right: #000000 1px solid;border-bottom: #000000 1px solid;padding: 0px;margin: 0px;width: 16px;vertical-align: bottom;}
.td166{padding: 0px;margin: 0px;width: 124px;vertical-align: bottom;}
.td167{padding: 0px;margin: 0px;width: 164px;vertical-align: bottom;}
.td168{padding: 0px;margin: 0px;width: 116px;vertical-align: bottom;}
.td169{padding: 0px;margin: 0px;width: 134px;vertical-align: bottom;}
.td170{padding: 0px;margin: 0px;width: 10px;vertical-align: bottom;}
.td171{padding: 0px;margin: 0px;width: 27px;vertical-align: bottom;}
.td172{padding: 0px;margin: 0px;width: 117px;vertical-align: bottom;}
.td173{padding: 0px;margin: 0px;width: 129px;vertical-align: bottom;}
.td174{padding: 0px;margin: 0px;width: 100px;vertical-align: bottom;}
.td175{padding: 0px;margin: 0px;width: 76px;vertical-align: bottom;}
.td176{border-left: #000000 1px solid;border-right: #000000 1px solid;border-top: #000000 1px solid;padding: 0px;margin: 0px;width: 15px;vertical-align: bottom;}
.td177{border-bottom: #000000 1px solid;padding: 0px;margin: 0px;width: 11px;vertical-align: bottom;}
.td178{border-right: #000000 1px solid;padding: 0px;margin: 0px;width: 14px;vertical-align: bottom;}
.td179{border-right: #000000 1px solid;border-top: #000000 1px solid;border-bottom: #000000 1px solid;padding: 0px;margin: 0px;width: 14px;vertical-align: bottom;}
.td180{border-right: #000000 1px solid;border-top: #000000 1px solid;padding: 0px;margin: 0px;width: 13px;vertical-align: bottom;}
.td181{padding: 0px;margin: 0px;width: 31px;vertical-align: bottom;}
.td182{border-left: #000000 1px solid;padding: 0px;margin: 0px;width: 10px;vertical-align: bottom;}
.td183{border-right: #000000 1px solid;padding: 0px;margin: 0px;width: 4px;vertical-align: bottom;}
.td184{border-right: #000000 1px solid;padding: 0px;margin: 0px;width: 6px;vertical-align: bottom;}
.td185{border-left: #000000 1px solid;border-bottom: #000000 1px solid;padding: 0px;margin: 0px;width: 10px;vertical-align: bottom;}
.td186{border-right: #000000 1px solid;border-bottom: #000000 1px solid;padding: 0px;margin: 0px;width: 4px;vertical-align: bottom;}
.td187{border-bottom: #000000 1px solid;padding: 0px;margin: 0px;width: 65px;vertical-align: bottom;}
.td188{padding: 0px;margin: 0px;width: 135px;vertical-align: bottom;}
.td189{border-bottom: #000000 1px solid;padding: 0px;margin: 0px;width: 21px;vertical-align: bottom;}
.td190{border-bottom: #000000 1px solid;padding: 0px;margin: 0px;width: 58px;vertical-align: bottom;}
.td191{border-bottom: #000000 1px solid;padding: 0px;margin: 0px;width: 10px;vertical-align: bottom;}
.td192{border-right: #e6e6e6 1px solid;border-bottom: #e6e6e6 1px solid;padding: 0px;margin: 0px;width: 25px;vertical-align: bottom;background: #e6e6e6;}
.td193{border-bottom: #e6e6e6 1px solid;padding: 0px;margin: 0px;width: 18px;vertical-align: bottom;background: #e6e6e6;}
.td194{padding: 0px;margin: 0px;width: 67px;vertical-align: bottom;}
.td195{border-bottom: #000000 1px solid;padding: 0px;margin: 0px;width: 15px;vertical-align: bottom;}
.td196{padding: 0px;margin: 0px;width: 82px;vertical-align: bottom;}
.td197{border-right: #000000 1px solid;padding: 0px;margin: 0px;width: 74px;vertical-align: bottom;}
.td198{border-right: #000000 1px solid;border-bottom: #000000 1px solid;padding: 0px;margin: 0px;width: 14px;vertical-align: bottom;}
.td199{border-left: #000000 1px solid;border-right: #000000 1px solid;padding: 0px;margin: 0px;width: 15px;vertical-align: bottom;}
.td200{border-right: #000000 1px solid;padding: 0px;margin: 0px;width: 8px;vertical-align: bottom;}
.td201{border-right: #000000 1px solid;padding: 0px;margin: 0px;width: 48px;vertical-align: bottom;}
.td202{padding: 0px;margin: 0px;width: 45px;vertical-align: bottom;}
.td203{border-right: #000000 1px solid;border-bottom: #000000 1px solid;padding: 0px;margin: 0px;width: 29px;vertical-align: bottom;}
.td204{padding: 0px;margin: 0px;width: 205px;vertical-align: bottom;}
.td205{padding: 0px;margin: 0px;width: 119px;vertical-align: bottom;}
.td206{padding: 0px;margin: 0px;width: 71px;vertical-align: bottom;}
.td207{padding: 0px;margin: 0px;width: 190px;vertical-align: bottom;}

.tr0{height: 12px;}
.tr1{height: 28px;}
.tr2{height: 21px;}
.tr3{height: 9px;}
.tr4{height: 20px;}
.tr5{height: 7px;}
.tr6{height: 11px;}
.tr7{height: 4px;}
.tr8{height: 13px;}
.tr9{height: 19px;}
.tr10{height: 24px;}
.tr11{height: 14px;}
.tr12{height: 26px;}
.tr13{height: 17px;}
.tr14{height: 30px;}
.tr15{height: 8px;}
.tr16{height: 6px;}
.tr17{height: 10px;}
.tr18{height: 23px;}
.tr19{height: 22px;}
.tr20{height: 35px;}
.tr21{height: 15px;}
.tr22{height: 33px;}
.tr23{height: 34px;}
.tr24{height: 25px;}
.tr25{height: 36px;}
.tr26{height: 18px;}
.tr27{height: 29px;}
.tr28{height: 3px;}
.tr29{height: 16px;}
.tr30{height: 5px;}
.tr31{height: 2px;}
.tr32{height: 31px;}
.tr33{height: 1px;}
.tr34{height: 27px;}
.tr35{height: 50px;}
.tr36{height: 40px;}

.t0{width: 681px;margin-left: 23px;font: bold 11px 'Arial';}
.t1{width: 282px;font: 16px 'Arial';}
.t2{width: 680px;font: 16px 'Arial';}
.t3{width: 560px;margin-left: 6px;font: bold 11px 'Arial';}
.t4{width: 613px;font: 11px 'Arial';}
.t5{width: 310px;margin-top: 2px;font: 11px 'Arial';}
.t6{width: 228px;margin-left: 5px;font: bold 10px 'Arial';}
.t7{width: 327px;font: 16px 'Arial';}
.t8{width: 660px;font: 11px 'Arial';}
.t9{width: 466px;font: 11px 'Arial';}
.t10{width: 679px;margin-left: 1px;font: 16px 'Arial';}
.t11{width: 395px;margin-top: 2px;font: 11px 'Arial';}

</STYLE>
</HEAD>

<BODY>
<DIV id="page_1">
<DIV id="dimg1">
<IMG src="images/Dengue_images/Dengue1x1.jpg" id="img1">
</DIV>


<DIV id="id_1">
<TABLE cellpadding=0 cellspacing=0 class="t0">
<TR>
	<TD class="tr0 td0"></TD>
	<TD rowspan=3 class="tr1 td1"><P class="p0 ft0">República Federativa do Brasil</P></TD>
	<TD rowspan=2 class="tr2 td2"><P class="p1 ft1">SINAN</P></TD>
	<TD class="tr0 td3"><P class="p0 ft2">&nbsp;</P></TD>
	<TD class="tr0 td4"><P class="p0 ft2">&nbsp;</P></TD>
</TR>
<TR>
	<TD class="tr3 td0"></TD>
	<TD class="tr3 td3"><P class="p0 ft3">&nbsp;</P></TD>
	<TD rowspan=3 class="tr4 td5"><P class="p2 ft4">Nº F<c:out value="${notificacaoInvestigativa.id}"></c:out>-I<c:out value="${notificacaoInvestigativa.investigador.id}"></c:out></P></TD>
</TR>
<TR>
	<TD class="tr5 td0"></TD>
	<TD colspan=2 rowspan=2 class="tr6 td6"><P class="p0 ft5">SISTEMA DE INFORMAÇÃO DE AGRAVOS DE NOTIFICAÇÃO</P></TD>
</TR>
<TR>
	<TD class="tr7 td0"></TD>
	<TD rowspan=2 class="tr8 td1"><P class="p3 ft6">Ministério da Saúde</P></TD>
</TR>
<TR>
	<TD class="tr3 td0"></TD>
	<TD rowspan=2 class="tr2 td2"><P class="p4 ft0">FICHA DE INVESTIGAÇÃO</P></TD>
	<TD rowspan=2 class="tr2 td3"><P class="p0 ft1">DENGUE</P></TD>
	<TD class="tr3 td5"><P class="p0 ft3">&nbsp;</P></TD>
</TR>
<TR>
	<TD class="tr0 td0"></TD>
	<TD class="tr0 td1"><P class="p0 ft2">&nbsp;</P></TD>
	<TD class="tr0 td4"><P class="p0 ft2">&nbsp;</P></TD>
</TR>
</TABLE>
<P class="p5 ft8"><SPAN class="ft7">CASO SUSPEITO: </SPAN>Paciente com <SPAN class="ft7">febre </SPAN>com duração máxima de 7 dias, acompanhada de pelo menos <SPAN class="ft7">dois dos seguintes sintomas</SPAN>: cefaléia, dor retroorbital, mialgia, artralgia, prostração, exantema e com exposição à área com transmissão de dengue ou com presença de Aedes aegypti nos últimos quinze dias.</P>
</DIV>
<DIV id="id_2">
<DIV id="id_2_1">
<!--[if lte IE 7]><P style="margin-left:0px;margin-top:0px;margin-right:-90px;margin-bottom:0px;" class="p6 ft0"><![endif]--><!--[if gte IE 8]><P style="margin-left:-90px;margin-top:0px;margin-right:0px;margin-bottom:90px;" class="p6 ft0"><![endif]--><![if ! IE]><P style="margin-left:-45px;margin-top:45px;margin-right:-45px;margin-bottom:45px;" class="p6 ft0"><![endif]>Dados Gerais</P>
<!--[if lte IE 7]><P style="margin-left:0px;margin-top:0px;margin-right:-162px;margin-bottom:0px;" class="p7 ft0"><![endif]--><!--[if gte IE 8]><P style="margin-left:-162px;margin-top:0px;margin-right:0px;margin-bottom:162px;" class="p7 ft0"><![endif]--><![if ! IE]><P style="margin-left:-81px;margin-top:131px;margin-right:-81px;margin-bottom:81px;" class="p7 ft0"><![endif]>Notificação Individual</P>
<!--[if lte IE 7]><P style="margin-left:1px;margin-top:0px;margin-right:-150px;margin-bottom:0px;" class="p8 ft0"><![endif]--><!--[if gte IE 8]><P style="margin-left:-148px;margin-top:0px;margin-right:-1px;margin-bottom:149px;" class="p8 ft0"><![endif]--><![if ! IE]><P style="margin-left:-74px;margin-top:175px;margin-right:-75px;margin-bottom:74px;" class="p8 ft0"><![endif]>Dados de Residência</P>
<!--[if lte IE 7]><P style="margin-left:8px;margin-top:0px;margin-right:-230px;margin-bottom:0px;" class="p9 ft0"><![endif]--><!--[if gte IE 8]><P style="margin-left:-214px;margin-top:0px;margin-right:-8px;margin-bottom:222px;" class="p9 ft0"><![endif]--><![if ! IE]><P style="margin-left:-103px;margin-top:151px;margin-right:-119px;margin-bottom:111px;" class="p9 ft0"><![endif]>Dados laboratoriais&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Inv.</P>
</DIV>
<DIV id="id_2_2">
<DIV id="id_2_2_1">
<DIV id="id_2_2_1_1">
<P class="p10 ft9"><SPAN class="ft6">1 </SPAN>Tipo de Notificação</P>
<P class="p11 ft10">2 - Individual</P>
<P class="p12 ft10"><SPAN class="ft0">2 </SPAN>Agravo/doença</P>
<P class="p13 ft1">DENGUE</P>
<P class="p14 ft10"><SPAN class="ft11">4 </SPAN><SPAN class="ft12">UF </SPAN><SPAN class="ft0">&nbsp;&nbsp;&nbsp;&nbsp;5 </SPAN>&nbsp;&nbsp;Município de Notificação</P>
<P class="p15 ft13"><c:out value="${notificacaoInvestigativa.dadosGerais.cidade.estado.sigla}"></c:out>&nbsp;&nbsp;&nbsp;&nbsp;<c:out value="${notificacaoInvestigativa.dadosGerais.cidade.descricao}"></c:out></P>
<P class="p16 ft10"><SPAN class="ft0">6 </SPAN>Unidade de Saúde (ou outra fonte notificadora)</P>
<span style="margin-top:0px; margin-left:10px;" class=""><c:out value="${notificacaoInvestigativa.dadosGerais.unidadeSaude.nome_fantasia}"></c:out></span>
<P class="p17 ft10" style="margin-top: 8px !important;"><SPAN class="ft0">8 </SPAN>Nome do Paciente</P>
</DIV>
<DIV id="id_2_2_1_2">
<TABLE cellpadding=0 cellspacing=0 class="t1">
<TR>
	<TD class="tr9 td7"><P class="p0 ft14">&nbsp;</P></TD>
	<TD class="tr9 td8"><P class="p0 ft14">&nbsp;</P></TD>
	<TD colspan=4 class="tr9 td9"><P class="p18 ft10">Código (CID10)</P></TD>
	<TD colspan=5 class="tr9 td10"><P class="p19 ft10"><SPAN class="ft15">3 </SPAN>Data da Notificação</P></TD>
	<TD class="tr9 td11"><P class="p0 ft14">&nbsp;</P></TD>
	<TD class="tr9 td12"><P class="p0 ft14">&nbsp;</P></TD>
</TR>
<TR>
	<TD class="tr10 td7"><P class="p0 ft14">&nbsp;</P></TD>
	<TD class="tr10 td8"><P class="p0 ft14">&nbsp;</P></TD>
	<TD class="tr10 td13"><P class="p0 ft14">&nbsp;</P></TD>
	<TD class="tr10 td14"><P class="p20 ft1">A 90</P></TD>
	<TD class="tr10 td15"><P class="p0 ft14">&nbsp;</P></TD>
	<TD class="tr10 td16"><P class="p0 ft14">&nbsp;</P></TD>
	<TD class="tr10 td8"><P class="p0 ft14">&nbsp;</P></TD>
	<TD class="tr10 td17"><P class="p21 ft13"><SPAN class="ft16"></SPAN></P></TD>
	<TD class="tr10 td18"><P class="p22 ft13"><c:out value="${notificacaoInvestigativa.dadosGerais.dataNotificacaoFormatada}"></c:out></P></TD>
	<TD class="tr10 td19"><P class="p23 ft17"></P></TD>
	<TD class="tr10 td20"><P class="p24 ft13"></P></TD>
	<TD class="tr10 td11"><P class="p25 ft13"></P></TD>
	<TD class="tr10 td12"><P class="p26 ft13"></P></TD>
</TR>
<TR>
	<TD class="tr11 td7"><P class="p0 ft18">&nbsp;</P></TD>
	<TD class="tr11 td8"><P class="p0 ft18">&nbsp;</P></TD>
	<TD class="tr11 td13"><P class="p0 ft18">&nbsp;</P></TD>
	<TD class="tr11 td14"><P class="p0 ft18">&nbsp;</P></TD>
	<TD class="tr11 td15"><P class="p0 ft18">&nbsp;</P></TD>
	<TD class="tr11 td16"><P class="p0 ft18">&nbsp;</P></TD>
	<TD class="tr11 td8"><P class="p0 ft18">&nbsp;</P></TD>
	<TD class="tr11 td17"><P class="p0 ft18">&nbsp;</P></TD>
	<TD colspan=4 class="tr11 td9"><P class="p22 ft10">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Código (IBGE)</P></TD>
	<TD class="tr11 td12"><P class="p0 ft18">&nbsp;</P></TD>
</TR>
<TR>
	<TD class="tr10 td7"><P class="p0 ft14">&nbsp;</P></TD>
	<TD class="tr10 td8"><P class="p0 ft14">&nbsp;</P></TD>
	<TD class="tr10 td13"><P class="p0 ft14">&nbsp;</P></TD>
	<TD class="tr10 td14"><P class="p0 ft14">&nbsp;</P></TD>
	<TD class="tr10 td15"><P class="p0 ft14">&nbsp;</P></TD>
	<TD class="tr10 td16"><P class="p0 ft14">&nbsp;</P></TD>
	<TD class="tr10 td8"><P class="p0 ft14">&nbsp;</P></TD>
	<TD class="tr10 td17"><P class="p0 ft14">&nbsp;</P></TD>
	<TD class="tr10 td18"><P class="p27 ft13">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <c:out value="${notificacaoInvestigativa.dadosGerais.cidade.ibge_codigo}"></c:out></P></TD>
	<TD class="tr10 td19"><P class="p28 ft13"></P></TD>
	<TD class="tr10 td20"><P class="p25 ft13"></P></TD>
	<TD class="tr10 td11"><P class="p29 ft13"></P></TD>
	<TD class="tr10 td12"><P class="p30 ft13"></P></TD>
</TR>
<TR>
	<TD colspan=2 class="tr8 td21"><P class="p31 ft9">Código</P></TD>
	<TD class="tr8 td13"><P class="p0 ft19">&nbsp;</P></TD>
	<TD class="tr8 td14"><P class="p0 ft19">&nbsp;</P></TD>
	<TD class="tr8 td15"><P class="p0 ft19">&nbsp;</P></TD>
	<TD class="tr8 td16"><P class="p0 ft19">&nbsp;</P></TD>
	<TD colspan=7 class="tr8 td22"><P class="p28 ft9"><SPAN class="ft20">&nbsp;&nbsp;7 </SPAN>Data dos Primeiros Sintomas</P></TD>
</TR>
<TR>
	<TD class="tr12 td7">
	<P class="p28 ft13">
		<span style="position:absolute; margin-top:-20px;"><c:out value="${notificacaoInvestigativa.dadosGerais.unidadeSaude.codigo_cnes}"></c:out>
		</span>
	</P></TD>
	<TD class="tr12 td8"><P class="p29 ft13"></P></TD>
	<TD class="tr12 td13"><P class="p28 ft13"></P></TD>
	<TD class="tr12 td14"><P class="p32 ft13"></P></TD>
	<TD class="tr12 td15"><P class="p28 ft13"></P></TD>
	<TD class="tr12 td16"><P class="p32 ft13"></P></TD>
	<TD class="tr12 td8"><P class="p28 ft13"></P></TD>
	<TD class="tr12 td17"><P class="p30 ft17"></P></TD>
	<TD class="tr12 td18"><P class="p26 ft13" style="margin-bottom: 5px !important;"><c:out value="${notificacaoInvestigativa.dadosGerais.dataPrimeirosSintomasFormatada}"></c:out></P></TD>
	<TD class="tr12 td19"><P class="p33 ft17"></P></TD>
	<TD class="tr12 td20"><P class="p34 ft13"></P></TD>
	<TD class="tr12 td11"><P class="p18 ft13"></P></TD>
	<TD class="tr12 td12"><P class="p31 ft13"></P></TD>
</TR>
<TR>
	<TD class="tr13 td7"><P class="p0 ft21">&nbsp;</P></TD>
	<TD class="tr13 td8"><P class="p0 ft21">&nbsp;</P></TD>
	<TD class="tr13 td13"><P class="p0 ft21">&nbsp;</P></TD>
	<TD class="tr13 td14"><P class="p0 ft21">&nbsp;</P></TD>
	<TD class="tr13 td15"><P class="p0 ft21">&nbsp;</P></TD>
	<TD class="tr13 td16"><P class="p0 ft21">&nbsp;</P></TD>
	<TD class="tr13 td8"><P class="p29 ft0">9</P></TD>
	<TD colspan=4 class="tr13 td23"><P class="p0 ft22">Data de Nascimento</P></TD>
	<TD class="tr13 td11"><P class="p0 ft21">&nbsp;</P></TD>
	<TD class="tr13 td12"><P class="p0 ft21">&nbsp;</P></TD>
</TR>
</TABLE>
</DIV>
</DIV>
<DIV id="id_2_2_2">
<TABLE cellpadding=0 cellspacing=0 class="t2">
<TR>
	<td style="position:absolute; width: 600px;"><c:out value="${notificacaoInvestigativa.paciente.nome}"></c:out></td>
	<TD class="tr2 td7"><P class="p0 ft14">&nbsp;</P></TD>
	<TD class="tr2 td24"><P class="p0 ft14">&nbsp;</P></TD>
	<TD class="tr2 td25"><P class="p0 ft14">&nbsp;</P></TD>
	<TD class="tr2 td13"><P class="p0 ft14">&nbsp;</P></TD>
	<TD class="tr2 td26"><P class="p0 ft14">&nbsp;</P></TD>
	<TD colspan=3 rowspan=2 class="tr14 td27"><P class="p35 ft23">1 - Hora</P></TD>
	<TD class="tr2 td28"><P class="p0 ft14">&nbsp;</P></TD>
	<TD class="tr2 td18"><P class="p0 ft14">&nbsp;</P></TD>
	<TD class="tr2 td29"><P class="p0 ft14">&nbsp;</P></TD>
	<TD class="tr2 td12"><P class="p0 ft14">&nbsp;</P></TD>
	<TD class="tr2 td17"><P class="p0 ft14">&nbsp;</P></TD>
	<TD class="tr2 td25"><P class="p0 ft14">&nbsp;</P></TD>
	<TD class="tr2 td17"><P class="p0 ft14">&nbsp;</P></TD>
	<TD colspan=2 rowspan=2 class="tr14 td30"><P class="p36 ft10">Gestante</P></TD>
	<TD class="tr2 td31"><P class="p0 ft14">&nbsp;</P></TD>
	<TD class="tr2 td7"><P class="p0 ft14">&nbsp;</P></TD>
	<TD class="tr2 td19"><P class="p0 ft14">&nbsp;</P></TD>
	<TD class="tr2 td32"><P class="p0 ft14">&nbsp;</P></TD>
	<TD class="tr2 td15"><P class="p0 ft14">&nbsp;</P></TD>
	<TD class="tr2 td33"><P class="p0 ft14">&nbsp;</P></TD>
	<TD class="tr2 td8"><P class="p0 ft14">&nbsp;</P></TD>
	<TD class="tr2 td33"><P class="p0 ft14">&nbsp;</P></TD>
	<TD rowspan=2 class="tr14 td32"><P class="p28 ft0">13</P></TD>
	<TD class="tr2 td11"><P class="p37 ft13"></P></TD>
	<TD class="tr2 td34"><P class="p18 ft17"></P></TD>
	<TD class="tr2 td18"><P class="p21 ft13"></P></TD>
	<TD class="tr2 td24"><P class="p38 ft17"></P></TD>
	<TD class="tr2 td15"><P class="p28 ft13"></P></TD>
	<TD class="tr2 td12"><P class="p0 ft14">&nbsp;</P></TD>
	<TD class="tr2 td19"><P class="p32 ft13"></P></TD>
	<TD class="tr2 td17"><P class="p39 ft13"></P></TD>
</TR>
<TR>
	<TD colspan=4 rowspan=2 class="tr13 td35"><P class="p0 ft10"><SPAN class="ft15">10 </SPAN>(ou) Idade</P></TD>
	<TD class="tr3 td26"><P class="p0 ft3">&nbsp;</P></TD>
	<TD rowspan=2 class="tr13 td28"><P class="p21 ft0">11</P></TD>
	<TD colspan=5 rowspan=2 class="tr13 td36"><P class="p40 ft23"><SPAN class="ft10">Sexo </SPAN>M - Masculino</P></TD>
	<TD class="tr3 td17"><P class="p0 ft3">&nbsp;</P></TD>
	<TD class="tr3 td31"><P class="p0 ft3">&nbsp;</P></TD>
	<TD class="tr3 td7"><P class="p0 ft3">&nbsp;</P></TD>
	<TD class="tr3 td19"><P class="p0 ft3">&nbsp;</P></TD>
	<TD class="tr3 td32"><P class="p0 ft3">&nbsp;</P></TD>
	<TD class="tr3 td15"><P class="p0 ft3">&nbsp;</P></TD>
	<TD class="tr3 td33"><P class="p0 ft3">&nbsp;</P></TD>
	<TD class="tr3 td8"><P class="p0 ft3">&nbsp;</P></TD>
	<TD class="tr3 td33"><P class="p0 ft3">&nbsp;</P></TD>
	<TD colspan=3 rowspan=2 class="tr13 td37"><P class="p25 ft10">Raça/Cor</P></TD>
	<TD class="tr3 td24"><P class="p0 ft3">&nbsp;</P></TD>
	<TD class="tr3 td15"><P class="p0 ft3">&nbsp;</P></TD>
	<TD class="tr3 td12"><P class="p0 ft3">&nbsp;</P></TD>
	<TD class="tr3 td19"><P class="p0 ft3">&nbsp;</P></TD>
	<TD class="tr3 td17"><P class="p0 ft3">&nbsp;</P></TD>
</TR>
<TR>
	<TD class="tr15 td26"><P class="p0 ft24">&nbsp;</P></TD>
	<TD colspan=3 class="tr15 td27"><P class="p37 ft25">2 - Dia</P></TD>
	<TD class="tr15 td17"><P class="p0 ft24">&nbsp;</P></TD>
	<TD colspan=2 class="tr15 td30"><P class="p0 ft27"><SPAN class="ft26">12 </SPAN><NOBR>1-1ºTrimestre</NOBR></P></TD>
	<TD class="tr15 td31"><P class="p0 ft27"><NOBR>2-2ºTrimestre</NOBR></P></TD>
	<TD class="tr15 td7"><P class="p0 ft24">&nbsp;</P></TD>
	<TD colspan=2 class="tr15 td38"><P class="p0 ft27"><NOBR>3-3ºTrimestre</NOBR></P></TD>
	<TD class="tr15 td15"><P class="p0 ft24">&nbsp;</P></TD>
	<TD class="tr15 td33"><P class="p0 ft24">&nbsp;</P></TD>
	<TD class="tr15 td8"><P class="p0 ft24">&nbsp;</P></TD>
	<TD class="tr15 td33"><P class="p0 ft24">&nbsp;</P></TD>
	<TD class="tr15 td32"><P class="p0 ft24">&nbsp;</P></TD>
	<TD class="tr15 td24"><P class="p0 ft24">&nbsp;</P></TD>
	<TD class="tr15 td15"><P class="p0 ft24">&nbsp;</P></TD>
	<TD class="tr15 td12"><P class="p0 ft24">&nbsp;</P></TD>
	<TD class="tr15 td19"><P class="p0 ft24">&nbsp;</P></TD>
	<TD class="tr15 td17"><P class="p0 ft24">&nbsp;</P></TD>
</TR>
<TR>
	<TD class="tr16 td7"><P class="p0 ft28">&nbsp;</P></TD>
	<TD rowspan=3 class="tr4 td24"><P class="p41 ft29"></P></TD>
	<TD rowspan=3 class="tr4 td25"><P class="p42 ft29"></P></TD>
	<TD class="tr16 td13"><P class="p0 ft28">&nbsp;</P></TD>
	<TD class="tr16 td26"><P class="p0 ft28">&nbsp;</P></TD>
	<TD colspan=3 rowspan=2 class="tr17 td27"><P class="p40 ft23">3 - Mês</P></TD>
	<TD class="tr16 td28"><P class="p0 ft28">&nbsp;</P></TD>
	<TD class="tr16 td18"><P class="p0 ft28">&nbsp;</P></TD>
	<TD class="tr16 td29"><P class="p0 ft28">&nbsp;</P></TD>
	<TD colspan=3 class="tr16 td39"><P class="p2 ft30">F - Feminino</P></TD>
	<TD class="tr16 td17"><P class="p0 ft28">&nbsp;</P></TD>
	<TD colspan=3 rowspan=2 class="tr17 td40"><P class="p43 ft31">4- Idade gestacional Ignorada</P></TD>
	<TD colspan=2 rowspan=2 class="tr17 td14"><P class="p26 ft31"><NOBR>5-Não</NOBR></P></TD>
	<TD colspan=4 rowspan=2 class="tr17 td41"><P class="p29 ft31">6- Não se aplica</P></TD>
	<TD class="tr16 td33"><P class="p0 ft28">&nbsp;</P></TD>
	<TD colspan=3 rowspan=2 class="tr17 td35"><P class="p25 ft31"><NOBR>1-Branca</NOBR></P></TD>
	<TD colspan=2 rowspan=2 class="tr17 td42"><P class="p21 ft31"><NOBR>2-Preta</NOBR></P></TD>
	<TD class="tr16 td15"><P class="p0 ft28">&nbsp;</P></TD>
	<TD colspan=3 rowspan=2 class="tr17 td43"><P class="p37 ft31"><NOBR>3-Amarela</NOBR></P></TD>
</TR>
<TR>
	<TD class="tr7 td7"><P class="p0 ft32">&nbsp;</P></TD>
	<TD class="tr7 td13"><P class="p0 ft32">&nbsp;</P></TD>
	<TD class="tr7 td26"><P class="p0 ft32">&nbsp;</P></TD>
	<TD class="tr7 td28"><P class="p0 ft32">&nbsp;</P></TD>
	<TD class="tr7 td18"><P class="p0 ft32">&nbsp;</P></TD>
	<TD class="tr7 td29"><P class="p0 ft32">&nbsp;</P></TD>
	<TD colspan=3 rowspan=2 class="tr11 td39"><P class="p44 ft23">I - Ignorado</P></TD>
	<TD class="tr7 td17"><P class="p0 ft32">&nbsp;</P></TD>
	<TD class="tr7 td33"><P class="p0 ft32">&nbsp;</P></TD>
	<TD class="tr7 td15"><P class="p0 ft32">&nbsp;</P></TD>
</TR>
<TR>
	<TD class="tr17 td7"><P class="p0 ft33">&nbsp;</P></TD>
	<TD class="tr17 td13"><P class="p0 ft33">&nbsp;</P></TD>
	<TD class="tr17 td26"><P class="p0 ft33">&nbsp;</P></TD>
	<TD colspan=3 class="tr17 td27"><P class="p45 ft23">4 - Ano</P></TD>
	<TD class="tr17 td28"><P class="p0 ft33">&nbsp;</P></TD>
	<TD class="tr17 td18"><P class="p0 ft33">&nbsp;</P></TD>
	<TD class="tr17 td29"><P class="p0 ft33">&nbsp;</P></TD>
	<TD class="tr17 td17"><P class="p0 ft33">&nbsp;</P></TD>
	<TD colspan=2 class="tr17 td30"><P class="p43 ft31"><NOBR>9-Ignorado</NOBR></P></TD>
	<TD class="tr17 td31"><P class="p0 ft33">&nbsp;</P></TD>
	<TD class="tr17 td7"><P class="p0 ft33">&nbsp;</P></TD>
	<TD class="tr17 td19"><P class="p0 ft33">&nbsp;</P></TD>
	<TD class="tr17 td32"><P class="p0 ft33">&nbsp;</P></TD>
	<TD class="tr17 td15"><P class="p0 ft33">&nbsp;</P></TD>
	<TD class="tr17 td33"><P class="p0 ft33">&nbsp;</P></TD>
	<TD class="tr17 td8"><P class="p0 ft33">&nbsp;</P></TD>
	<TD class="tr17 td33"><P class="p0 ft33">&nbsp;</P></TD>
	<TD colspan=3 class="tr17 td35"><P class="p18 ft31"><NOBR>4-Parda</NOBR></P></TD>
	<TD colspan=3 class="tr17 td21"><P class="p21 ft31"><NOBR>5-Indígena</NOBR></P></TD>
	<TD colspan=3 class="tr17 td43"><P class="p46 ft31">9- Ignorado</P></TD>
</TR>
<TR>
	<TD colspan=5 class="tr0 td44"><P class="p0 ft35"><SPAN class="ft34">14 </SPAN>Escolaridade</P></TD>
	<TD class="tr0 td45"><P class="p0 ft2">&nbsp;</P></TD>
	<TD class="tr0 td7"><P class="p0 ft2">&nbsp;</P></TD>
	<TD class="tr0 td26"><P class="p0 ft2">&nbsp;</P></TD>
	<TD class="tr0 td28"><P class="p0 ft2">&nbsp;</P></TD>
	<TD class="tr0 td18"><P class="p0 ft2">&nbsp;</P></TD>
	<TD class="tr0 td29"><P class="p0 ft2">&nbsp;</P></TD>
	<TD class="tr0 td12"><P class="p0 ft2">&nbsp;</P></TD>
	<TD class="tr0 td17"><P class="p0 ft2">&nbsp;</P></TD>
	<TD class="tr0 td25"><P class="p0 ft2">&nbsp;</P></TD>
	<TD class="tr0 td17"><P class="p0 ft2">&nbsp;</P></TD>
	<TD class="tr0 td16"><P class="p0 ft2">&nbsp;</P></TD>
	<TD colspan=8 rowspan=2 class="tr9 td46"><P class="p42 ft23"><NOBR>2-4ª</NOBR> série completa do EF (antigo primário ou 1º grau)</P></TD>
	<TD class="tr0 td33"><P class="p0 ft2">&nbsp;</P></TD>
	<TD class="tr0 td32"><P class="p0 ft2">&nbsp;</P></TD>
	<TD class="tr0 td11"><P class="p0 ft2">&nbsp;</P></TD>
	<TD class="tr0 td34"><P class="p0 ft2">&nbsp;</P></TD>
	<TD class="tr0 td18"><P class="p0 ft2">&nbsp;</P></TD>
	<TD class="tr0 td24"><P class="p0 ft2">&nbsp;</P></TD>
	<TD class="tr0 td15"><P class="p0 ft2">&nbsp;</P></TD>
	<TD class="tr0 td12"><P class="p0 ft2">&nbsp;</P></TD>
	<TD class="tr0 td19"><P class="p0 ft2">&nbsp;</P></TD>
	<TD class="tr0 td17"><P class="p0 ft2">&nbsp;</P></TD>
</TR>
<TR>
	<TD colspan=4 class="tr5 td35"><P class="p47 ft36"><NOBR>0-Analfabeto</NOBR></P></TD>
	<TD colspan=12 class="tr5 td47"><P class="p2 ft36"><NOBR>1-1ª</NOBR> a 4ª série incompleta do EF (antigo primário ou 1º grau)</P></TD>
	<TD class="tr5 td33"><P class="p0 ft37">&nbsp;</P></TD>
	<TD class="tr5 td32"><P class="p0 ft37">&nbsp;</P></TD>
	<TD class="tr5 td11"><P class="p0 ft37">&nbsp;</P></TD>
	<TD class="tr5 td34"><P class="p0 ft37">&nbsp;</P></TD>
	<TD class="tr5 td18"><P class="p0 ft37">&nbsp;</P></TD>
	<TD class="tr5 td24"><P class="p0 ft37">&nbsp;</P></TD>
	<TD class="tr5 td15"><P class="p0 ft37">&nbsp;</P></TD>
	<TD class="tr5 td12"><P class="p0 ft37">&nbsp;</P></TD>
	<TD class="tr5 td19"><P class="p0 ft37">&nbsp;</P></TD>
	<TD class="tr5 td17"><P class="p0 ft37">&nbsp;</P></TD>
</TR>
<TR>
	<TD colspan=14 class="tr3 td48"><P class="p47 ft38"><NOBR>3-5ª</NOBR> à 8ª série incompleta do EF (antigo ginásio ou 1º grau)</P></TD>
	<TD colspan=7 class="tr3 td49"><P class="p0 ft38"><NOBR>4-Ensino</NOBR> fundamental completo (antigo ginásio ou 1º grau)</P></TD>
	<TD class="tr3 td15"><P class="p0 ft3">&nbsp;</P></TD>
	<TD colspan=8 class="tr3 td50"><P class="p48 ft38"><NOBR>5-Ensino</NOBR> médio incompleto (antigo colegial</P></TD>
	<TD colspan=4 class="tr3 td51"><P class="p39 ft38">ou 2º grau )</P></TD>
</TR>
<TR>
	<TD colspan=10 class="tr6 td52"><P class="p47 ft23"><NOBR>6-Ensino</NOBR> médio completo (antigo colegial</P></TD>
	<TD colspan=3 class="tr6 td53"><P class="p48 ft23">ou 2º grau )</P></TD>
	<TD colspan=4 class="tr6 td54"><P class="p44 ft23"><NOBR>7-Educação</NOBR> superior incompleta</P></TD>
	<TD colspan=5 class="tr6 td55"><P class="p49 ft23"><NOBR>8-Educação</NOBR> superior completa</P></TD>
	<TD colspan=3 class="tr6 td56"><P class="p46 ft23"><NOBR>9-Ignorado</NOBR></P></TD>
	<TD colspan=3 class="tr6 td35"><P class="p50 ft23">10- Não se aplica</P></TD>
	<TD class="tr6 td18"><P class="p0 ft39">&nbsp;</P></TD>
	<TD class="tr6 td24"><P class="p0 ft39">&nbsp;</P></TD>
	<TD class="tr6 td15"><P class="p0 ft39">&nbsp;</P></TD>
	<TD class="tr6 td12"><P class="p0 ft39">&nbsp;</P></TD>
	<TD class="tr6 td19"><P class="p0 ft39">&nbsp;</P></TD>
	<TD class="tr6 td17"><P class="p0 ft39">&nbsp;</P></TD>
</TR>
<TR>
	<TD colspan=8 class="tr18 td57"><P class="p0 ft10"><SPAN class="ft0">15 </SPAN>Número do Cartão SUS</P></TD>
	<TD class="tr18 td28"><P class="p0 ft14">&nbsp;</P></TD>
	<TD class="tr18 td18"><P class="p0 ft14">&nbsp;</P></TD>
	<TD class="tr18 td29"><P class="p0 ft14">&nbsp;</P></TD>
	<TD class="tr18 td12"><P class="p0 ft14">&nbsp;</P></TD>
	<TD class="tr18 td17"><P class="p0 ft14">&nbsp;</P></TD>
	<TD class="tr18 td25"><P class="p0 ft14">&nbsp;</P></TD>
	<TD colspan=3 class="tr18 td58"><P class="p21 ft10"><SPAN class="ft40">16 </SPAN>Nome da mãe</P></TD>
	<TD class="tr18 td31"><P class="p0 ft14">&nbsp;</P></TD>
	<TD class="tr18 td7"><P class="p0 ft14">&nbsp;</P></TD>
	<TD class="tr18 td19"><P class="p0 ft14">&nbsp;</P></TD>
	<TD class="tr18 td32"><P class="p0 ft14">&nbsp;</P></TD>
	<TD class="tr18 td15"><P class="p0 ft14">&nbsp;</P></TD>
	<TD class="tr18 td33"><P class="p0 ft14">&nbsp;</P></TD>
	<TD class="tr18 td8"><P class="p0 ft14">&nbsp;</P></TD>
	<TD class="tr18 td33"><P class="p0 ft14">&nbsp;</P></TD>
	<TD class="tr18 td32"><P class="p0 ft14">&nbsp;</P></TD>
	<TD class="tr18 td11"><P class="p0 ft14">&nbsp;</P></TD>
	<TD class="tr18 td34"><P class="p0 ft14">&nbsp;</P></TD>
	<TD class="tr18 td18"><P class="p0 ft14">&nbsp;</P></TD>
	<TD class="tr18 td24"><P class="p0 ft14">&nbsp;</P></TD>
	<TD class="tr18 td15"><P class="p0 ft14">&nbsp;</P></TD>
	<TD class="tr18 td12"><P class="p0 ft14">&nbsp;</P></TD>
	<TD class="tr18 td19"><P class="p0 ft14">&nbsp;</P></TD>
	<TD class="tr18 td17"><P class="p0 ft14">&nbsp;</P></TD>
</TR>
<TR>
	<TD class="tr19 td7"><P class="p51 ft13"></P></TD>
	<TD class="tr19 td24"><P class="p41 ft13"></P></TD>
	<TD class="tr19 td25"><P class="p25 ft13"></P></TD>
	<TD class="tr19 td13"><P class="p52 ft13"></P></TD>
	<TD class="tr19 td26"><P class="p38 ft13"></P></TD>
	<TD class="tr19 td45"><P class="p41 ft13"></P></TD>
	<TD class="tr19 td7"><P class="p28 ft13"></P></TD>
	<TD class="tr19 td26"><P class="p52 ft13"></P></TD>
	<TD class="tr19 td28"><P class="p52 ft13"></P></TD>
	<TD class="tr19 td18"><P class="p53 ft13"></P></TD>
	<TD class="tr19 td29"><P class="p2 ft13"></P></TD>
	<TD class="tr19 td12"><P class="p28 ft13"></P></TD>
	<TD class="tr19 td17"><P class="p31 ft13"></P></TD>
	<TD class="tr19 td25"><P class="p2 ft13"></P></TD>
	<TD class="tr19 td17"><P class="p0 ft14">&nbsp;</P></TD>
	<TD class="tr19 td16"><P class="p0 ft14">&nbsp;</P></TD>
	<TD class="tr19 td21"><P class="p0 ft14">&nbsp;</P></TD>
	<TD class="tr19 td31"><P class="p0 ft14">&nbsp;</P></TD>
	<TD class="tr19 td7"><P class="p0 ft14">&nbsp;</P></TD>
	<TD class="tr19 td19"><P class="p0 ft14">&nbsp;</P></TD>
	<TD class="tr19 td32"><P class="p0 ft14">&nbsp;</P></TD>
	<TD class="tr19 td15"><P class="p0 ft14">&nbsp;</P></TD>
	<TD class="tr19 td33"><P class="p0 ft14">&nbsp;</P></TD>
	<TD class="tr19 td8"><P class="p0 ft14">&nbsp;</P></TD>
	<TD class="tr19 td33"><P class="p0 ft14">&nbsp;</P></TD>
	<TD class="tr19 td32"><P class="p0 ft14">&nbsp;</P></TD>
	<TD class="tr19 td11"><P class="p0 ft14">&nbsp;</P></TD>
	<TD class="tr19 td34"><P class="p0 ft14">&nbsp;</P></TD>
	<TD class="tr19 td18"><P class="p0 ft14">&nbsp;</P></TD>
	<TD class="tr19 td24"><P class="p0 ft14">&nbsp;</P></TD>
	<TD class="tr19 td15"><P class="p0 ft14">&nbsp;</P></TD>
	<TD class="tr19 td12"><P class="p0 ft14">&nbsp;</P></TD>
	<TD class="tr19 td19"><P class="p0 ft14">&nbsp;</P></TD>
	<TD class="tr19 td17"><P class="p0 ft14">&nbsp;</P></TD>
</TR>
<TR>
	<TD colspan=2 class="tr9 td59"><P class="p23 ft0">17 <SPAN class="ft10">UF</SPAN></P></TD>
	<TD colspan=9 class="tr9 td60"><P class="p54 ft22"><SPAN class="ft41">18 </SPAN>Município de Residência</P></TD>
	<TD class="tr9 td12"><P class="p0 ft14">&nbsp;</P></TD>
	<TD class="tr9 td17"><P class="p0 ft14">&nbsp;</P></TD>
	<TD class="tr9 td25"><P class="p0 ft14">&nbsp;</P></TD>
	<TD class="tr9 td17"><P class="p0 ft14">&nbsp;</P></TD>
	<TD class="tr9 td16"><P class="p0 ft14">&nbsp;</P></TD>
	<TD class="tr9 td21"><P class="p0 ft14">&nbsp;</P></TD>
	<TD colspan=4 class="tr9 td61"><P class="p55 ft10">Código (IBGE)</P></TD>
	<TD class="tr9 td15"><P class="p0 ft14">&nbsp;</P></TD>
	<TD class="tr9 td33"><P class="p0 ft14">&nbsp;</P></TD>
	<TD class="tr9 td8"><P class="p42 ft0">19</P></TD>
	<TD colspan=2 class="tr9 td21"><P class="p0 ft10">Distrito</P></TD>
	<TD class="tr9 td11"><P class="p0 ft14">&nbsp;</P></TD>
	<TD class="tr9 td34"><P class="p0 ft14">&nbsp;</P></TD>
	<TD class="tr9 td18"><P class="p0 ft14">&nbsp;</P></TD>
	<TD class="tr9 td24"><P class="p0 ft14">&nbsp;</P></TD>
	<TD class="tr9 td15"><P class="p0 ft14">&nbsp;</P></TD>
	<TD class="tr9 td12"><P class="p0 ft14">&nbsp;</P></TD>
	<TD class="tr9 td19"><P class="p0 ft14">&nbsp;</P></TD>
	<TD class="tr9 td17"><P class="p0 ft14">&nbsp;</P></TD>
</TR>
<TR>
	<TD class="tr4 td7"><P class="p0 ft14">&nbsp;</P></TD>
	<TD class="tr4 td24"><P class="p38 ft13"></P></TD>
	<TD class="tr4 td25"><P class="p0 ft14">&nbsp;</P></TD>
	<TD class="tr4 td13"><P class="p0 ft14">&nbsp;</P></TD>
	<TD class="tr4 td26"><P class="p0 ft14">&nbsp;</P></TD>
	<TD class="tr4 td45"><P class="p0 ft14">&nbsp;</P></TD>
	<TD class="tr4 td7"><P class="p0 ft14">&nbsp;</P></TD>
	<TD class="tr4 td26"><P class="p0 ft14">&nbsp;</P></TD>
	<TD class="tr4 td28"><P class="p0 ft14">&nbsp;</P></TD>
	<TD class="tr4 td18"><P class="p0 ft14">&nbsp;</P></TD>
	<TD class="tr4 td29"><P class="p0 ft14">&nbsp;</P></TD>
	<TD class="tr4 td12"><P class="p0 ft14">&nbsp;</P></TD>
	<TD class="tr4 td17"><P class="p0 ft14">&nbsp;</P></TD>
	<TD class="tr4 td25"><P class="p0 ft14">&nbsp;</P></TD>
	<TD class="tr4 td17"><P class="p0 ft14">&nbsp;</P></TD>
	<TD class="tr4 td16"><P class="p0 ft14">&nbsp;</P></TD>
	<TD class="tr4 td21"><P class="p0 ft14">&nbsp;</P></TD>
	<TD class="tr4 td31"><P class="p52 ft13"></P></TD>
	<TD class="tr4 td7"><P class="p28 ft13"></P></TD>
	<TD class="tr4 td19"><P class="p28 ft13"></P></TD>
	<TD class="tr4 td32"><P class="p25 ft13"></P></TD>
	<TD class="tr4 td15"><P class="p0 ft14">&nbsp;</P></TD>
	<TD class="tr4 td33"><P class="p48 ft13"></P></TD>
	<TD class="tr4 td8"><P class="p0 ft14">&nbsp;</P></TD>
	<TD class="tr4 td33"><P class="p0 ft14">&nbsp;</P></TD>
	<TD class="tr4 td32"><P class="p0 ft14">&nbsp;</P></TD>
	<TD class="tr4 td11"><P class="p0 ft14">&nbsp;</P></TD>
	<TD colspan=3 rowspan=2 class="tr20 td62"><P class="p18 ft10">Código</P></TD>
	<TD class="tr4 td15"><P class="p0 ft14">&nbsp;</P></TD>
	<TD class="tr4 td12"><P class="p0 ft14">&nbsp;</P></TD>
	<TD class="tr4 td19"><P class="p0 ft14">&nbsp;</P></TD>
	<TD class="tr4 td17"><P class="p0 ft14">&nbsp;</P></TD>
</TR>
<TR>
	<TD colspan=3 class="tr21 td63"><P class="p0 ft10"><SPAN class="ft15">20 </SPAN>Bairro</P></TD>
	<TD class="tr21 td13"><P class="p0 ft42">&nbsp;</P></TD>
	<TD class="tr21 td26"><P class="p0 ft42">&nbsp;</P></TD>
	<TD class="tr21 td45"><P class="p0 ft42">&nbsp;</P></TD>
	<TD class="tr21 td7"><P class="p0 ft42">&nbsp;</P></TD>
	<TD class="tr21 td26"><P class="p0 ft42">&nbsp;</P></TD>
	<TD class="tr21 td28"><P class="p0 ft42">&nbsp;</P></TD>
	<TD class="tr21 td18"><P class="p0 ft42">&nbsp;</P></TD>
	<TD class="tr21 td29"><P class="p0 ft42">&nbsp;</P></TD>
	<TD class="tr21 td12"><P class="p0 ft42">&nbsp;</P></TD>
	<TD colspan=5 class="tr21 td64"><P class="p21 ft44"><SPAN class="ft43">21 </SPAN>Logradouro (rua, avenida,...)</P></TD>
	<TD class="tr21 td31"><P class="p0 ft42">&nbsp;</P></TD>
	<TD class="tr21 td7"><P class="p0 ft42">&nbsp;</P></TD>
	<TD class="tr21 td19"><P class="p0 ft42">&nbsp;</P></TD>
	<TD class="tr21 td32"><P class="p0 ft42">&nbsp;</P></TD>
	<TD class="tr21 td15"><P class="p0 ft42">&nbsp;</P></TD>
	<TD class="tr21 td33"><P class="p0 ft42">&nbsp;</P></TD>
	<TD class="tr21 td8"><P class="p0 ft42">&nbsp;</P></TD>
	<TD class="tr21 td33"><P class="p0 ft42">&nbsp;</P></TD>
	<TD class="tr21 td32"><P class="p0 ft42">&nbsp;</P></TD>
	<TD class="tr21 td11"><P class="p0 ft42">&nbsp;</P></TD>
	<TD class="tr21 td15"><P class="p0 ft42">&nbsp;</P></TD>
	<TD class="tr21 td12"><P class="p0 ft42">&nbsp;</P></TD>
	<TD class="tr21 td19"><P class="p0 ft42">&nbsp;</P></TD>
	<TD class="tr21 td17"><P class="p0 ft42">&nbsp;</P></TD>
</TR>
<TR>
	<TD colspan=3 rowspan=2 class="tr22 td63"><P class="p21 ft10"><SPAN class="ft0">22 </SPAN>Número</P></TD>
	<TD class="tr2 td13"><P class="p0 ft14">&nbsp;</P></TD>
	<TD colspan=10 rowspan=2 class="tr22 td65"><P class="p56 ft10"><SPAN class="ft0">23 </SPAN>Complemento (apto., casa, ...)</P></TD>
	<TD class="tr2 td17"><P class="p0 ft14">&nbsp;</P></TD>
	<TD class="tr2 td16"><P class="p0 ft14">&nbsp;</P></TD>
	<TD class="tr2 td21"><P class="p0 ft14">&nbsp;</P></TD>
	<TD class="tr2 td31"><P class="p0 ft14">&nbsp;</P></TD>
	<TD class="tr2 td7"><P class="p0 ft14">&nbsp;</P></TD>
	<TD class="tr2 td19"><P class="p0 ft14">&nbsp;</P></TD>
	<TD class="tr2 td32"><P class="p0 ft14">&nbsp;</P></TD>
	<TD class="tr2 td15"><P class="p0 ft14">&nbsp;</P></TD>
	<TD class="tr2 td33"><P class="p0 ft14">&nbsp;</P></TD>
	<TD colspan=4 rowspan=2 class="tr22 td66"><P class="p56 ft10"><SPAN class="ft15">24 </SPAN>Geo campo 1</P></TD>
	<TD class="tr2 td34"><P class="p0 ft14">&nbsp;</P></TD>
	<TD class="tr2 td18"><P class="p25 ft13"></P></TD>
	<TD class="tr2 td24"><P class="p29 ft13"></P></TD>
	<TD class="tr2 td15"><P class="p0 ft14">&nbsp;</P></TD>
	<TD class="tr2 td12"><P class="p29 ft13"></P></TD>
	<TD class="tr2 td19"><P class="p31 ft13"></P></TD>
	<TD class="tr2 td17"><P class="p18 ft13"></P></TD>
</TR>
<TR>
	<TD class="tr0 td13"><P class="p0 ft2">&nbsp;</P></TD>
	<TD class="tr0 td17"><P class="p0 ft2">&nbsp;</P></TD>
	<TD class="tr0 td16"><P class="p0 ft2">&nbsp;</P></TD>
	<TD class="tr0 td21"><P class="p0 ft2">&nbsp;</P></TD>
	<TD class="tr0 td31"><P class="p0 ft2">&nbsp;</P></TD>
	<TD class="tr0 td7"><P class="p0 ft2">&nbsp;</P></TD>
	<TD class="tr0 td19"><P class="p0 ft2">&nbsp;</P></TD>
	<TD class="tr0 td32"><P class="p0 ft2">&nbsp;</P></TD>
	<TD class="tr0 td15"><P class="p0 ft2">&nbsp;</P></TD>
	<TD class="tr0 td33"><P class="p0 ft2">&nbsp;</P></TD>
	<TD class="tr0 td34"><P class="p0 ft2">&nbsp;</P></TD>
	<TD class="tr0 td18"><P class="p0 ft2">&nbsp;</P></TD>
	<TD class="tr0 td24"><P class="p0 ft2">&nbsp;</P></TD>
	<TD class="tr0 td15"><P class="p0 ft2">&nbsp;</P></TD>
	<TD class="tr0 td12"><P class="p0 ft2">&nbsp;</P></TD>
	<TD class="tr0 td19"><P class="p0 ft2">&nbsp;</P></TD>
	<TD class="tr0 td17"><P class="p0 ft2">&nbsp;</P></TD>
</TR>
<TR>
	<TD colspan=5 class="tr23 td44"><P class="p21 ft10"><SPAN class="ft45">25 </SPAN>Geo campo 2</P></TD>
	<TD class="tr23 td45"><P class="p0 ft14">&nbsp;</P></TD>
	<TD class="tr23 td7"><P class="p0 ft14">&nbsp;</P></TD>
	<TD class="tr23 td26"><P class="p0 ft14">&nbsp;</P></TD>
	<TD class="tr23 td28"><P class="p0 ft14">&nbsp;</P></TD>
	<TD class="tr23 td18"><P class="p0 ft14">&nbsp;</P></TD>
	<TD class="tr23 td29"><P class="p0 ft14">&nbsp;</P></TD>
	<TD class="tr23 td12"><P class="p0 ft14">&nbsp;</P></TD>
	<TD class="tr23 td17"><P class="p0 ft14">&nbsp;</P></TD>
	<TD colspan=4 class="tr23 td54"><P class="p44 ft10"><SPAN class="ft0">26 </SPAN>Ponto de Referência</P></TD>
	<TD class="tr23 td31"><P class="p0 ft14">&nbsp;</P></TD>
	<TD class="tr23 td7"><P class="p0 ft14">&nbsp;</P></TD>
	<TD class="tr23 td19"><P class="p0 ft14">&nbsp;</P></TD>
	<TD class="tr23 td32"><P class="p0 ft14">&nbsp;</P></TD>
	<TD class="tr23 td15"><P class="p0 ft14">&nbsp;</P></TD>
	<TD class="tr23 td33"><P class="p0 ft14">&nbsp;</P></TD>
	<TD class="tr23 td8"><P class="p0 ft14">&nbsp;</P></TD>
	<TD class="tr23 td33"><P class="p0 ft14">&nbsp;</P></TD>
	<TD colspan=2 class="tr23 td67"><P class="p57 ft41">27</P></TD>
	<TD class="tr23 td34"><P class="p23 ft10">CEP</P></TD>
	<TD class="tr23 td18"><P class="p0 ft14">&nbsp;</P></TD>
	<TD class="tr23 td24"><P class="p0 ft14">&nbsp;</P></TD>
	<TD class="tr23 td15"><P class="p0 ft14">&nbsp;</P></TD>
	<TD class="tr23 td12"><P class="p0 ft14">&nbsp;</P></TD>
	<TD class="tr23 td19"><P class="p0 ft14">&nbsp;</P></TD>
	<TD class="tr23 td17"><P class="p0 ft14">&nbsp;</P></TD>
</TR>
<TR>
	<TD rowspan=2 class="tr1 td7"><P class="p21 ft0">28</P></TD>
	<TD colspan=5 rowspan=2 class="tr1 td68"><P class="p41 ft10">(DDD) Telefone</P></TD>
	<TD class="tr9 td7"><P class="p0 ft14">&nbsp;</P></TD>
	<TD class="tr9 td26"><P class="p0 ft14">&nbsp;</P></TD>
	<TD class="tr9 td28"><P class="p0 ft14">&nbsp;</P></TD>
	<TD class="tr9 td18"><P class="p0 ft14">&nbsp;</P></TD>
	<TD class="tr9 td29"><P class="p0 ft14">&nbsp;</P></TD>
	<TD class="tr9 td12"><P class="p0 ft14">&nbsp;</P></TD>
	<TD colspan=3 rowspan=2 class="tr1 td69"><P class="p58 ft10"><SPAN class="ft15">29 </SPAN>Zona</P></TD>
	<TD class="tr9 td16"><P class="p0 ft14">&nbsp;</P></TD>
	<TD class="tr9 td21"><P class="p0 ft14">&nbsp;</P></TD>
	<TD class="tr9 td31"><P class="p0 ft14">&nbsp;</P></TD>
	<TD class="tr9 td7"><P class="p0 ft14">&nbsp;</P></TD>
	<TD class="tr9 td19"><P class="p0 ft14">&nbsp;</P></TD>
	<TD class="tr9 td32"><P class="p0 ft14">&nbsp;</P></TD>
	<TD class="tr9 td15"><P class="p0 ft14">&nbsp;</P></TD>
	<TD class="tr9 td33"><P class="p0 ft14">&nbsp;</P></TD>
	<TD class="tr9 td8"><P class="p0 ft14">&nbsp;</P></TD>
	<TD class="tr9 td33"><P class="p0 ft14">&nbsp;</P></TD>
	<TD class="tr9 td32"><P class="p0 ft14">&nbsp;</P></TD>
	<TD class="tr9 td11"><P class="p23 ft13"></P></TD>
	<TD class="tr9 td34"><P class="p30 ft13"></P></TD>
	<TD class="tr9 td18"><P class="p41 ft13"></P></TD>
	<TD class="tr9 td24"><P class="p28 ft13"></P></TD>
	<TD class="tr9 td15"><P class="p0 ft14">&nbsp;</P></TD>
	<TD class="tr9 td12"><P class="p59 ft13">-</P></TD>
	<TD class="tr9 td19"><P class="p42 ft13"></P></TD>
	<TD class="tr9 td17"><P class="p38 ft13"></P></TD>
</TR>
<TR>
	<TD class="tr3 td7"><P class="p0 ft3">&nbsp;</P></TD>
	<TD class="tr3 td26"><P class="p0 ft3">&nbsp;</P></TD>
	<TD class="tr3 td28"><P class="p0 ft3">&nbsp;</P></TD>
	<TD class="tr3 td18"><P class="p0 ft3">&nbsp;</P></TD>
	<TD class="tr3 td29"><P class="p0 ft3">&nbsp;</P></TD>
	<TD class="tr3 td12"><P class="p0 ft3">&nbsp;</P></TD>
	<TD class="tr3 td16"><P class="p0 ft3">&nbsp;</P></TD>
	<TD colspan=2 rowspan=2 class="tr13 td70"><P class="p60 ft10">2 - Rural</P></TD>
	<TD class="tr3 td7"><P class="p0 ft3">&nbsp;</P></TD>
	<TD colspan=9 class="tr3 td71"><P class="p48 ft47"><SPAN class="ft46">30 </SPAN>País (se residente fora do Brasil)</P></TD>
	<TD class="tr3 td18"><P class="p0 ft3">&nbsp;</P></TD>
	<TD class="tr3 td24"><P class="p0 ft3">&nbsp;</P></TD>
	<TD class="tr3 td15"><P class="p0 ft3">&nbsp;</P></TD>
	<TD class="tr3 td12"><P class="p0 ft3">&nbsp;</P></TD>
	<TD class="tr3 td19"><P class="p0 ft3">&nbsp;</P></TD>
	<TD class="tr3 td17"><P class="p0 ft3">&nbsp;</P></TD>
</TR>
<TR>
	<TD class="tr15 td7"><P class="p0 ft24">&nbsp;</P></TD>
	<TD rowspan=2 class="tr24 td24"><P class="p61 ft13"></P></TD>
	<TD rowspan=2 class="tr24 td25"><P class="p19 ft13"></P></TD>
	<TD rowspan=2 class="tr24 td13"><P class="p29 ft13"></P></TD>
	<TD rowspan=2 class="tr24 td26"><P class="p31 ft13"></P></TD>
	<TD class="tr15 td45"><P class="p0 ft24">&nbsp;</P></TD>
	<TD rowspan=2 class="tr24 td7"><P class="p31 ft13"></P></TD>
	<TD rowspan=2 class="tr24 td26"><P class="p25 ft13"></P></TD>
	<TD rowspan=2 class="tr24 td28"><P class="p52 ft13"></P></TD>
	<TD rowspan=2 class="tr24 td18"><P class="p62 ft13"></P></TD>
	<TD class="tr15 td29"><P class="p0 ft24">&nbsp;</P></TD>
	<TD rowspan=2 class="tr24 td12"><P class="p44 ft13"></P></TD>
	<TD class="tr15 td17"><P class="p0 ft24">&nbsp;</P></TD>
	<TD class="tr15 td25"><P class="p0 ft24">&nbsp;</P></TD>
	<TD colspan=2 class="tr15 td43"><P class="p46 ft48">1 - Urbana</P></TD>
	<TD class="tr15 td7"><P class="p0 ft24">&nbsp;</P></TD>
	<TD class="tr15 td19"><P class="p0 ft24">&nbsp;</P></TD>
	<TD class="tr15 td32"><P class="p0 ft24">&nbsp;</P></TD>
	<TD class="tr15 td15"><P class="p0 ft24">&nbsp;</P></TD>
	<TD class="tr15 td33"><P class="p0 ft24">&nbsp;</P></TD>
	<TD class="tr15 td8"><P class="p0 ft24">&nbsp;</P></TD>
	<TD class="tr15 td33"><P class="p0 ft24">&nbsp;</P></TD>
	<TD class="tr15 td32"><P class="p0 ft24">&nbsp;</P></TD>
	<TD class="tr15 td11"><P class="p0 ft24">&nbsp;</P></TD>
	<TD class="tr15 td34"><P class="p0 ft24">&nbsp;</P></TD>
	<TD class="tr15 td18"><P class="p0 ft24">&nbsp;</P></TD>
	<TD class="tr15 td24"><P class="p0 ft24">&nbsp;</P></TD>
	<TD class="tr15 td15"><P class="p0 ft24">&nbsp;</P></TD>
	<TD class="tr15 td12"><P class="p0 ft24">&nbsp;</P></TD>
	<TD class="tr15 td19"><P class="p0 ft24">&nbsp;</P></TD>
	<TD class="tr15 td17"><P class="p0 ft24">&nbsp;</P></TD>
</TR>
<TR>
	<TD class="tr13 td7"><P class="p0 ft21">&nbsp;</P></TD>
	<TD class="tr13 td45"><P class="p0 ft21">&nbsp;</P></TD>
	<TD class="tr13 td29"><P class="p0 ft21">&nbsp;</P></TD>
	<TD class="tr13 td17"><P class="p0 ft21">&nbsp;</P></TD>
	<TD class="tr13 td25"><P class="p0 ft21">&nbsp;</P></TD>
	<TD colspan=4 class="tr13 td72"><P class="p46 ft10">3 - Periurbana 9 - Ignorado</P></TD>
	<TD class="tr13 td7"><P class="p0 ft21">&nbsp;</P></TD>
	<TD class="tr13 td19"><P class="p0 ft21">&nbsp;</P></TD>
	<TD class="tr13 td32"><P class="p0 ft21">&nbsp;</P></TD>
	<TD class="tr13 td15"><P class="p0 ft21">&nbsp;</P></TD>
	<TD class="tr13 td33"><P class="p0 ft21">&nbsp;</P></TD>
	<TD class="tr13 td8"><P class="p0 ft21">&nbsp;</P></TD>
	<TD class="tr13 td33"><P class="p0 ft21">&nbsp;</P></TD>
	<TD class="tr13 td32"><P class="p0 ft21">&nbsp;</P></TD>
	<TD class="tr13 td11"><P class="p0 ft21">&nbsp;</P></TD>
	<TD class="tr13 td34"><P class="p0 ft21">&nbsp;</P></TD>
	<TD class="tr13 td18"><P class="p0 ft21">&nbsp;</P></TD>
	<TD class="tr13 td24"><P class="p0 ft21">&nbsp;</P></TD>
	<TD class="tr13 td15"><P class="p0 ft21">&nbsp;</P></TD>
	<TD class="tr13 td12"><P class="p0 ft21">&nbsp;</P></TD>
	<TD class="tr13 td19"><P class="p0 ft21">&nbsp;</P></TD>
	<TD class="tr13 td17"><P class="p0 ft21">&nbsp;</P></TD>
</TR>
<TR>
	<TD class="tr10 td7"><P class="p0 ft14">&nbsp;</P></TD>
	<TD class="tr10 td24"><P class="p0 ft14">&nbsp;</P></TD>
	<TD class="tr10 td25"><P class="p0 ft14">&nbsp;</P></TD>
	<TD class="tr10 td13"><P class="p0 ft14">&nbsp;</P></TD>
	<TD class="tr10 td26"><P class="p0 ft14">&nbsp;</P></TD>
	<TD class="tr10 td45"><P class="p0 ft14">&nbsp;</P></TD>
	<TD class="tr10 td7"><P class="p0 ft14">&nbsp;</P></TD>
	<TD class="tr10 td26"><P class="p0 ft14">&nbsp;</P></TD>
	<TD class="tr10 td28"><P class="p0 ft14">&nbsp;</P></TD>
	<TD colspan=16 class="tr10 td73"><P class="p0 ft1">Dados laboratoriais e conclusão (dengue clássico)</P></TD>
	<TD class="tr10 td32"><P class="p0 ft14">&nbsp;</P></TD>
	<TD class="tr10 td11"><P class="p0 ft14">&nbsp;</P></TD>
	<TD class="tr10 td34"><P class="p0 ft14">&nbsp;</P></TD>
	<TD class="tr10 td18"><P class="p0 ft14">&nbsp;</P></TD>
	<TD class="tr10 td24"><P class="p0 ft14">&nbsp;</P></TD>
	<TD class="tr10 td15"><P class="p0 ft14">&nbsp;</P></TD>
	<TD class="tr10 td12"><P class="p0 ft14">&nbsp;</P></TD>
	<TD class="tr10 td19"><P class="p0 ft14">&nbsp;</P></TD>
	<TD class="tr10 td17"><P class="p0 ft14">&nbsp;</P></TD>
</TR>
<TR>
	<TD colspan=2 class="tr13 td59"><P class="p47 ft0">31</P></TD>
	<TD colspan=6 class="tr13 td74"><P class="p41 ft22">Data da Investigação</P></TD>
	<TD class="tr13 td28"><P class="p0 ft21">&nbsp;</P></TD>
	<TD class="tr13 td18"><P class="p0 ft21">&nbsp;</P></TD>
	<TD class="tr13 td29"><P class="p0 ft21">&nbsp;</P></TD>
	<TD class="tr13 td12"><P class="p0 ft21">&nbsp;</P></TD>
	<TD colspan=3 class="tr13 td69"><P class="p63 ft10"><SPAN class="ft0">32 </SPAN>Ocupação</P></TD>
	<TD class="tr13 td16"><P class="p0 ft21">&nbsp;</P></TD>
	<TD class="tr13 td21"><P class="p0 ft21">&nbsp;</P></TD>
	<TD class="tr13 td31"><P class="p0 ft21">&nbsp;</P></TD>
	<TD class="tr13 td7"><P class="p0 ft21">&nbsp;</P></TD>
	<TD class="tr13 td19"><P class="p0 ft21">&nbsp;</P></TD>
	<TD class="tr13 td32"><P class="p0 ft21">&nbsp;</P></TD>
	<TD class="tr13 td15"><P class="p0 ft21">&nbsp;</P></TD>
	<TD class="tr13 td33"><P class="p0 ft21">&nbsp;</P></TD>
	<TD class="tr13 td8"><P class="p0 ft21">&nbsp;</P></TD>
	<TD class="tr13 td33"><P class="p0 ft21">&nbsp;</P></TD>
	<TD class="tr13 td32"><P class="p0 ft21">&nbsp;</P></TD>
	<TD class="tr13 td11"><P class="p0 ft21">&nbsp;</P></TD>
	<TD class="tr13 td34"><P class="p0 ft21">&nbsp;</P></TD>
	<TD class="tr13 td18"><P class="p0 ft21">&nbsp;</P></TD>
	<TD class="tr13 td24"><P class="p0 ft21">&nbsp;</P></TD>
	<TD class="tr13 td15"><P class="p0 ft21">&nbsp;</P></TD>
	<TD class="tr13 td12"><P class="p0 ft21">&nbsp;</P></TD>
	<TD class="tr13 td19"><P class="p0 ft21">&nbsp;</P></TD>
	<TD class="tr13 td17"><P class="p0 ft21">&nbsp;</P></TD>
</TR>
<TR>
	<TD class="tr2 td7"><P class="p0 ft14">&nbsp;</P></TD>
	<TD class="tr2 td24"><P class="p0 ft14">&nbsp;</P></TD>
	<TD class="tr2 td25"><P class="p25 ft13"></P></TD>
	<TD class="tr2 td13"><P class="p23 ft17"></P></TD>
	<TD class="tr2 td26"><P class="p33 ft13"></P></TD>
	<TD class="tr2 td45"><P class="p0 ft14">&nbsp;</P></TD>
	<TD class="tr2 td7"><P class="p49 ft17"></P></TD>
	<TD class="tr2 td26"><P class="p52 ft13"></P></TD>
	<TD class="tr2 td28"><P class="p30 ft13"></P></TD>
	<TD class="tr2 td18"><P class="p47 ft13"></P></TD>
	<TD class="tr2 td29"><P class="p0 ft14">&nbsp;</P></TD>
	<TD class="tr2 td12"><P class="p0 ft14">&nbsp;</P></TD>
	<TD class="tr2 td17"><P class="p0 ft14">&nbsp;</P></TD>
	<TD class="tr2 td25"><P class="p0 ft14">&nbsp;</P></TD>
	<TD class="tr2 td17"><P class="p0 ft14">&nbsp;</P></TD>
	<TD class="tr2 td16"><P class="p0 ft14">&nbsp;</P></TD>
	<TD class="tr2 td21"><P class="p0 ft14">&nbsp;</P></TD>
	<TD colspan=4 rowspan=2 class="tr25 td61"><P class="p64 ft7">Exame NS1</P></TD>
	<TD class="tr2 td15"><P class="p0 ft14">&nbsp;</P></TD>
	<TD class="tr2 td33"><P class="p0 ft14">&nbsp;</P></TD>
	<TD class="tr2 td8"><P class="p0 ft14">&nbsp;</P></TD>
	<TD class="tr2 td33"><P class="p0 ft14">&nbsp;</P></TD>
	<TD class="tr2 td32"><P class="p0 ft14">&nbsp;</P></TD>
	<TD class="tr2 td11"><P class="p0 ft14">&nbsp;</P></TD>
	<TD class="tr2 td34"><P class="p0 ft14">&nbsp;</P></TD>
	<TD class="tr2 td18"><P class="p0 ft14">&nbsp;</P></TD>
	<TD class="tr2 td24"><P class="p0 ft14">&nbsp;</P></TD>
	<TD class="tr2 td15"><P class="p0 ft14">&nbsp;</P></TD>
	<TD class="tr2 td12"><P class="p0 ft14">&nbsp;</P></TD>
	<TD class="tr2 td19"><P class="p0 ft14">&nbsp;</P></TD>
	<TD class="tr2 td17"><P class="p0 ft14">&nbsp;</P></TD>
</TR>
<TR>
	<TD colspan=9 class="tr21 td75"><P class="p2 ft7">Exame Sorológico (IgM)</P></TD>
	<TD class="tr21 td18"><P class="p0 ft42">&nbsp;</P></TD>
	<TD class="tr21 td29"><P class="p0 ft42">&nbsp;</P></TD>
	<TD colspan=4 rowspan=2 class="tr10 td44"><P class="p53 ft10"><SPAN class="ft0">34 </SPAN>Resultado</P></TD>
	<TD class="tr21 td16"><P class="p0 ft42">&nbsp;</P></TD>
	<TD class="tr21 td21"><P class="p0 ft42">&nbsp;</P></TD>
	<TD class="tr21 td15"><P class="p0 ft42">&nbsp;</P></TD>
	<TD class="tr21 td33"><P class="p0 ft42">&nbsp;</P></TD>
	<TD class="tr21 td8"><P class="p0 ft42">&nbsp;</P></TD>
	<TD class="tr21 td33"><P class="p0 ft42">&nbsp;</P></TD>
	<TD colspan=4 rowspan=2 class="tr10 td66"><P class="p54 ft44"><SPAN class="ft49">36 </SPAN>Resultado</P></TD>
	<TD class="tr21 td24"><P class="p0 ft42">&nbsp;</P></TD>
	<TD class="tr21 td15"><P class="p0 ft42">&nbsp;</P></TD>
	<TD class="tr21 td12"><P class="p0 ft42">&nbsp;</P></TD>
	<TD class="tr21 td19"><P class="p0 ft42">&nbsp;</P></TD>
	<TD class="tr21 td17"><P class="p0 ft42">&nbsp;</P></TD>
</TR>
<TR>
	<TD colspan=5 rowspan=2 class="tr8 td44"><P class="p59 ft22"><SPAN class="ft41">33 </SPAN>Data da Coleta</P></TD>
	<TD class="tr3 td45"><P class="p0 ft3">&nbsp;</P></TD>
	<TD class="tr3 td7"><P class="p0 ft3">&nbsp;</P></TD>
	<TD class="tr3 td26"><P class="p0 ft3">&nbsp;</P></TD>
	<TD class="tr3 td28"><P class="p0 ft3">&nbsp;</P></TD>
	<TD class="tr3 td18"><P class="p0 ft3">&nbsp;</P></TD>
	<TD class="tr3 td29"><P class="p0 ft3">&nbsp;</P></TD>
	<TD class="tr3 td16"><P class="p0 ft3">&nbsp;</P></TD>
	<TD class="tr3 td21"><P class="p0 ft3">&nbsp;</P></TD>
	<TD colspan=5 rowspan=2 class="tr8 td55"><P class="p65 ft9"><SPAN class="ft6">35 </SPAN>Data da Coleta</P></TD>
	<TD class="tr3 td33"><P class="p0 ft3">&nbsp;</P></TD>
	<TD class="tr3 td8"><P class="p0 ft3">&nbsp;</P></TD>
	<TD class="tr3 td33"><P class="p0 ft3">&nbsp;</P></TD>
	<TD class="tr3 td24"><P class="p0 ft3">&nbsp;</P></TD>
	<TD class="tr3 td15"><P class="p0 ft3">&nbsp;</P></TD>
	<TD class="tr3 td12"><P class="p0 ft3">&nbsp;</P></TD>
	<TD class="tr3 td19"><P class="p0 ft3">&nbsp;</P></TD>
	<TD class="tr3 td17"><P class="p0 ft3">&nbsp;</P></TD>
</TR>
<TR>
	<TD class="tr7 td45"><P class="p0 ft32">&nbsp;</P></TD>
	<TD class="tr7 td7"><P class="p0 ft32">&nbsp;</P></TD>
	<TD class="tr7 td26"><P class="p0 ft32">&nbsp;</P></TD>
	<TD class="tr7 td28"><P class="p0 ft32">&nbsp;</P></TD>
	<TD class="tr7 td18"><P class="p0 ft32">&nbsp;</P></TD>
	<TD class="tr7 td29"><P class="p0 ft32">&nbsp;</P></TD>
	<TD class="tr7 td12"><P class="p0 ft32">&nbsp;</P></TD>
	<TD colspan=3 rowspan=2 class="tr8 td69"><P class="p21 ft9">1 - Reagente</P></TD>
	<TD class="tr7 td16"><P class="p0 ft32">&nbsp;</P></TD>
	<TD class="tr7 td21"><P class="p0 ft32">&nbsp;</P></TD>
	<TD class="tr7 td33"><P class="p0 ft32">&nbsp;</P></TD>
	<TD class="tr7 td8"><P class="p0 ft32">&nbsp;</P></TD>
	<TD class="tr7 td33"><P class="p0 ft32">&nbsp;</P></TD>
	<TD colspan=3 rowspan=2 class="tr8 td35"><P class="p22 ft9">1- Positivo</P></TD>
	<TD class="tr7 td18"><P class="p0 ft32">&nbsp;</P></TD>
	<TD colspan=4 rowspan=2 class="tr8 td37"><P class="p66 ft22">2- Negativo</P></TD>
	<TD class="tr7 td17"><P class="p0 ft32">&nbsp;</P></TD>
</TR>
<TR>
	<TD class="tr3 td7"><P class="p0 ft3">&nbsp;</P></TD>
	<TD class="tr3 td24"><P class="p0 ft3">&nbsp;</P></TD>
	<TD rowspan=2 class="tr4 td25"><P class="p67 ft13"></P></TD>
	<TD class="tr3 td13"><P class="p0 ft3">&nbsp;</P></TD>
	<TD rowspan=2 class="tr4 td26"><P class="p24 ft13"></P></TD>
	<TD class="tr3 td45"><P class="p0 ft3">&nbsp;</P></TD>
	<TD class="tr3 td7"><P class="p0 ft3">&nbsp;</P></TD>
	<TD rowspan=2 class="tr4 td26"><P class="p19 ft13"></P></TD>
	<TD rowspan=2 class="tr4 td28"><P class="p21 ft13"></P></TD>
	<TD rowspan=2 class="tr4 td18"><P class="p66 ft13"></P></TD>
	<TD class="tr3 td29"><P class="p0 ft3">&nbsp;</P></TD>
	<TD class="tr3 td12"><P class="p0 ft3">&nbsp;</P></TD>
	<TD colspan=3 class="tr3 td40"><P class="p0 ft47">2 - Não Reagente</P></TD>
	<TD rowspan=2 class="tr4 td7"><P class="p25 ft13"></P></TD>
	<TD class="tr3 td19"><P class="p0 ft3">&nbsp;</P></TD>
	<TD rowspan=2 class="tr4 td32"><P class="p68 ft13"></P></TD>
	<TD class="tr3 td15"><P class="p0 ft3">&nbsp;</P></TD>
	<TD rowspan=2 class="tr4 td33"><P class="p62 ft13"></P></TD>
	<TD rowspan=2 class="tr4 td8"><P class="p29 ft13"></P></TD>
	<TD rowspan=2 class="tr4 td33"><P class="p23 ft13"></P></TD>
	<TD class="tr3 td18"><P class="p0 ft3">&nbsp;</P></TD>
	<TD class="tr3 td17"><P class="p0 ft3">&nbsp;</P></TD>
</TR>
<TR>
	<TD class="tr6 td7"><P class="p0 ft39">&nbsp;</P></TD>
	<TD class="tr6 td24"><P class="p0 ft39">&nbsp;</P></TD>
	<TD class="tr6 td13"><P class="p0 ft39">&nbsp;</P></TD>
	<TD class="tr6 td45"><P class="p0 ft39">&nbsp;</P></TD>
	<TD class="tr6 td7"><P class="p0 ft39">&nbsp;</P></TD>
	<TD class="tr6 td29"><P class="p0 ft39">&nbsp;</P></TD>
	<TD class="tr6 td12"><P class="p0 ft39">&nbsp;</P></TD>
	<TD colspan=6 class="tr6 td46"><P class="p21 ft50">3 - Inconclusivo 4 - Não Realizado</P></TD>
	<TD class="tr6 td19"><P class="p0 ft39">&nbsp;</P></TD>
	<TD class="tr6 td15"><P class="p0 ft39">&nbsp;</P></TD>
	<TD colspan=4 class="tr6 td66"><P class="p22 ft51">3- Inconclusivo</P></TD>
	<TD colspan=5 class="tr6 td76"><P class="p53 ft52">4 - Não realizado</P></TD>
</TR>
<TR>
	<TD colspan=7 class="tr26 td77"><P class="p59 ft7">Isolamento Viral</P></TD>
	<TD class="tr26 td26"><P class="p0 ft14">&nbsp;</P></TD>
	<TD class="tr26 td28"><P class="p0 ft14">&nbsp;</P></TD>
	<TD colspan=5 rowspan=2 class="tr27 td36"><P class="p47 ft10"><SPAN class="ft0">38 </SPAN>Resultado</P></TD>
	<TD class="tr26 td17"><P class="p0 ft14">&nbsp;</P></TD>
	<TD class="tr26 td16"><P class="p0 ft14">&nbsp;</P></TD>
	<TD colspan=2 class="tr26 td70"><P class="p32 ft7"><NOBR>RT-PCR</NOBR></P></TD>
	<TD class="tr26 td7"><P class="p0 ft14">&nbsp;</P></TD>
	<TD class="tr26 td19"><P class="p0 ft14">&nbsp;</P></TD>
	<TD class="tr26 td32"><P class="p0 ft14">&nbsp;</P></TD>
	<TD class="tr26 td15"><P class="p0 ft14">&nbsp;</P></TD>
	<TD class="tr26 td33"><P class="p0 ft14">&nbsp;</P></TD>
	<TD class="tr26 td8"><P class="p0 ft14">&nbsp;</P></TD>
	<TD colspan=4 rowspan=2 class="tr27 td68"><P class="p40 ft10"><SPAN class="ft40">40 </SPAN>Resultado</P></TD>
	<TD class="tr26 td18"><P class="p0 ft14">&nbsp;</P></TD>
	<TD class="tr26 td24"><P class="p0 ft14">&nbsp;</P></TD>
	<TD class="tr26 td15"><P class="p0 ft14">&nbsp;</P></TD>
	<TD class="tr26 td12"><P class="p0 ft14">&nbsp;</P></TD>
	<TD class="tr26 td19"><P class="p0 ft14">&nbsp;</P></TD>
	<TD class="tr26 td17"><P class="p0 ft14">&nbsp;</P></TD>
</TR>
<TR>
	<TD colspan=5 rowspan=2 class="tr19 td44"><P class="p56 ft22"><SPAN class="ft53">37 </SPAN>Data da coleta</P></TD>
	<TD class="tr6 td45"><P class="p0 ft39">&nbsp;</P></TD>
	<TD class="tr6 td7"><P class="p0 ft39">&nbsp;</P></TD>
	<TD class="tr6 td26"><P class="p0 ft39">&nbsp;</P></TD>
	<TD class="tr6 td28"><P class="p0 ft39">&nbsp;</P></TD>
	<TD class="tr6 td17"><P class="p0 ft39">&nbsp;</P></TD>
	<TD class="tr6 td16"><P class="p0 ft39">&nbsp;</P></TD>
	<TD colspan=4 rowspan=2 class="tr19 td54"><P class="p25 ft10"><SPAN class="ft0">39 </SPAN>Data da Coleta</P></TD>
	<TD class="tr6 td32"><P class="p0 ft39">&nbsp;</P></TD>
	<TD class="tr6 td15"><P class="p0 ft39">&nbsp;</P></TD>
	<TD class="tr6 td33"><P class="p0 ft39">&nbsp;</P></TD>
	<TD class="tr6 td8"><P class="p0 ft39">&nbsp;</P></TD>
	<TD class="tr6 td18"><P class="p0 ft39">&nbsp;</P></TD>
	<TD class="tr6 td24"><P class="p0 ft39">&nbsp;</P></TD>
	<TD class="tr6 td15"><P class="p0 ft39">&nbsp;</P></TD>
	<TD class="tr6 td12"><P class="p0 ft39">&nbsp;</P></TD>
	<TD class="tr6 td19"><P class="p0 ft39">&nbsp;</P></TD>
	<TD class="tr6 td17"><P class="p0 ft39">&nbsp;</P></TD>
</TR>
<TR>
	<TD class="tr6 td45"><P class="p0 ft39">&nbsp;</P></TD>
	<TD class="tr6 td7"><P class="p0 ft39">&nbsp;</P></TD>
	<TD class="tr6 td26"><P class="p0 ft39">&nbsp;</P></TD>
	<TD class="tr6 td28"><P class="p0 ft39">&nbsp;</P></TD>
	<TD colspan=4 class="tr6 td78"><P class="p47 ft50">1- Positivo</P></TD>
	<TD class="tr6 td25"><P class="p0 ft39">&nbsp;</P></TD>
	<TD colspan=2 class="tr6 td43"><P class="p21 ft50">2- Negativo</P></TD>
	<TD class="tr6 td32"><P class="p0 ft39">&nbsp;</P></TD>
	<TD class="tr6 td15"><P class="p0 ft39">&nbsp;</P></TD>
	<TD class="tr6 td33"><P class="p0 ft39">&nbsp;</P></TD>
	<TD class="tr6 td8"><P class="p0 ft39">&nbsp;</P></TD>
	<TD class="tr6 td33"><P class="p0 ft39">&nbsp;</P></TD>
	<TD colspan=3 class="tr6 td35"><P class="p18 ft50">1 - Positivo</P></TD>
	<TD colspan=4 class="tr6 td79"><P class="p0 ft51">2 - Negativo</P></TD>
	<TD class="tr6 td19"><P class="p0 ft39">&nbsp;</P></TD>
	<TD class="tr6 td17"><P class="p0 ft39">&nbsp;</P></TD>
</TR>
<TR>
	<TD class="tr9 td7"><P class="p0 ft14">&nbsp;</P></TD>
	<TD class="tr9 td24"><P class="p26 ft13"></P></TD>
	<TD class="tr9 td25"><P class="p0 ft14">&nbsp;</P></TD>
	<TD class="tr9 td13"><P class="p23 ft13"></P></TD>
	<TD class="tr9 td26"><P class="p0 ft14">&nbsp;</P></TD>
	<TD class="tr9 td45"><P class="p0 ft14">&nbsp;</P></TD>
	<TD class="tr9 td7"><P class="p30 ft13"></P></TD>
	<TD class="tr9 td26"><P class="p33 ft13"></P></TD>
	<TD class="tr9 td28"><P class="p28 ft13"></P></TD>
	<TD colspan=5 class="tr9 td36"><P class="p47 ft10">3- Inconclusivo</P></TD>
	<TD colspan=3 class="tr9 td58"><P class="p48 ft10">4 - Não realizado</P></TD>
	<TD class="tr9 td31"><P class="p69 ft13"></P></TD>
	<TD class="tr9 td7"><P class="p52 ft13"></P></TD>
	<TD class="tr9 td19"><P class="p0 ft14">&nbsp;</P></TD>
	<TD class="tr9 td32"><P class="p19 ft13"></P></TD>
	<TD class="tr9 td15"><P class="p23 ft13"></P></TD>
	<TD class="tr9 td33"><P class="p0 ft14">&nbsp;</P></TD>
	<TD class="tr9 td8"><P class="p70 ft13"></P></TD>
	<TD class="tr9 td33"><P class="p0 ft14">&nbsp;</P></TD>
	<TD colspan=9 class="tr9 td80"><P class="p50 ft22">3 - Inconclusivo 4 - Não Realizado</P></TD>
</TR>
</TABLE>
<TABLE cellpadding=0 cellspacing=0 class="t3">
<TR>
	<TD class="tr21 td81"><P class="p0 ft14">&nbsp;</P></TD>
	<TD class="tr21 td82"><P class="p0 ft7">Histopatologia</P></TD>
	<TD class="tr21 td83"><P class="p0 ft7">Imunohistoquímica</P></TD>
</TR>
<TR>
	<TD class="tr12 td81"><P class="p0 ft10"><SPAN class="ft0">41 </SPAN>Sorotipo</P></TD>
	<TD class="tr12 td82"><P class="p21 ft0"><SPAN class="ft15">42 </SPAN>Resultado</P></TD>
	<TD class="tr12 td83"><P class="p56 ft0"><SPAN class="ft45">43 </SPAN>Resultado</P></TD>
</TR>
</TABLE>
</DIV>
</DIV>
</DIV>
<DIV id="id_3">
<DIV id="id_3_1">
<!--[if lte IE 7]><P style="margin-left:0px;margin-top:0px;margin-right:-164px;margin-bottom:0px;" class="p71 ft0"><![endif]--><!--[if gte IE 8]><P style="margin-left:-164px;margin-top:0px;margin-right:0px;margin-bottom:164px;" class="p71 ft0"><![endif]--><![if ! IE]><P style="margin-left:-82px;margin-top:82px;margin-right:-82px;margin-bottom:82px;" class="p71 ft0"><![endif]>Conclusão</P>
</DIV>
<DIV id="id_3_2">
<DIV id="id_3_2_1">
<TABLE cellpadding=0 cellspacing=0 class="t4">
<TR>
	<TD colspan=2 rowspan=2 class="tr4 td64"><P class="p0 ft10"><SPAN class="ft0">44 </SPAN>Classificação</P></TD>
	<TD class="tr6 td84"><P class="p0 ft39">&nbsp;</P></TD>
	<TD class="tr6 td85"><P class="p0 ft39">&nbsp;</P></TD>
	<TD class="tr17 td86"><P class="p0 ft33">&nbsp;</P></TD>
	<TD class="tr17 td87"><P class="p0 ft33">&nbsp;</P></TD>
	<TD colspan=3 rowspan=3 class="tr18 td88"><P class="p51 ft10"><SPAN class="ft0">45 </SPAN>Critério de Confirmação/Descarte</P></TD>
</TR>
<TR>
	<TD class="tr3 td84"><P class="p0 ft3">&nbsp;</P></TD>
	<TD class="tr3 td85"><P class="p0 ft3">&nbsp;</P></TD>
	<TD class="tr3 td89"><P class="p0 ft3">&nbsp;</P></TD>
	<TD class="tr3 td90"><P class="p0 ft3">&nbsp;</P></TD>
</TR>
<TR>
	<TD rowspan=3 class="tr11 td84"><P class="p0 ft10">1</P></TD>
	<TD rowspan=3 class="tr11 td91"><P class="p21 ft10">- Dengue Clássico</P></TD>
	<TD rowspan=3 class="tr11 td84"><P class="p0 ft10">3</P></TD>
	<TD rowspan=3 class="tr11 td85"><P class="p21 ft10"><NOBR>-<SPAN class="ft54">-</SPAN>Febre</NOBR> Hemorrágica do Dengue - FHD</P></TD>
	<TD class="tr28 td89"><P class="p0 ft55">&nbsp;</P></TD>
	<TD class="tr28 td90"><P class="p0 ft55">&nbsp;</P></TD>
</TR>
<TR>
	<TD class="tr28 td92"><P class="p0 ft55">&nbsp;</P></TD>
	<TD class="tr28 td93"><P class="p0 ft55">&nbsp;</P></TD>
	<TD class="tr7 td17"><P class="p0 ft32">&nbsp;</P></TD>
	<TD class="tr7 td94"><P class="p0 ft32">&nbsp;</P></TD>
	<TD class="tr7 td70"><P class="p0 ft32">&nbsp;</P></TD>
</TR>
<TR>
	<TD class="tr5 td15"><P class="p0 ft37">&nbsp;</P></TD>
	<TD colspan=2 rowspan=2 class="tr9 td42"><P class="p23 ft10">1</P></TD>
	<TD rowspan=2 class="tr9 td94"><P class="p48 ft10">- Laboratório</P></TD>
	<TD rowspan=2 class="tr9 td70"><P class="p0 ft22">3 - Em Investigação</P></TD>
</TR>
<TR>
	<TD class="tr0 td84"><P class="p0 ft35">2</P></TD>
	<TD class="tr0 td91"><P class="p21 ft35">- Dengue com Complicações</P></TD>
	<TD class="tr0 td84"><P class="p0 ft35">4</P></TD>
	<TD colspan=2 class="tr0 td95"><P class="p21 ft35">- Síndrome do Choque da Dengue - SCD</P></TD>
</TR>
<TR>
	<TD class="tr11 td84"><P class="p0 ft14">&nbsp;</P></TD>
	<TD class="tr11 td91"><P class="p0 ft14">&nbsp;</P></TD>
	<TD colspan=3 class="tr11 td96"><P class="p0 ft10">5- Descartado</P></TD>
	<TD colspan=2 class="tr11 td42"><P class="p23 ft10">2</P></TD>
	<TD class="tr11 td94"><P class="p48 ft10">- <NOBR>Clínico-Epidemiológico</NOBR></P></TD>
	<TD class="tr11 td70"><P class="p0 ft14">&nbsp;</P></TD>
</TR>
</TABLE>
<P class="p72 ft4">Os casos de dengue com complicações, FHD e SCD: preencher a página seguinte.</P>
</DIV>
<DIV id="id_3_2_2">
<DIV id="id_3_2_2_1">
<P class="p73 ft7">Local Provável de Infecção (no período de 15 dias)</P>
<P class="p74 ft10"><SPAN class="ft15">46 </SPAN>O caso é autóctone do município de residência?</P>
<TABLE cellpadding=0 cellspacing=0 class="t5">
<TR>
	<TD class="tr4 td84"><P class="p0 ft14">&nbsp;</P></TD>
	<TD class="tr4 td97"><P class="p0 ft14">&nbsp;</P></TD>
	<TD class="tr4 td98"><P class="p0 ft14">&nbsp;</P></TD>
	<TD class="tr4 td99"><P class="p0 ft14">&nbsp;</P></TD>
	<TD class="tr4 td78"><P class="p0 ft14">&nbsp;</P></TD>
	<TD colspan=6 class="tr4 td100"><P class="p48 ft10"><NOBR>1-Sim</NOBR> <NOBR>2-Não</NOBR> <NOBR>3-Indeterminado</NOBR></P></TD>
</TR>
<TR>
	<TD class="tr7 td84"><P class="p0 ft32">&nbsp;</P></TD>
	<TD colspan=2 class="tr7 td33"><P class="p0 ft32">&nbsp;</P></TD>
	<TD class="tr7 td99"><P class="p0 ft32">&nbsp;</P></TD>
	<TD class="tr7 td78"><P class="p0 ft32">&nbsp;</P></TD>
	<TD class="tr7 td36"><P class="p0 ft32">&nbsp;</P></TD>
	<TD class="tr7 td11"><P class="p0 ft32">&nbsp;</P></TD>
	<TD class="tr7 td15"><P class="p0 ft32">&nbsp;</P></TD>
	<TD class="tr7 td101"><P class="p0 ft32">&nbsp;</P></TD>
	<TD class="tr7 td102"><P class="p0 ft32">&nbsp;</P></TD>
	<TD class="tr7 td28"><P class="p0 ft32">&nbsp;</P></TD>
</TR>
<TR>
	<TD class="tr26 td103"><P class="p0 ft14">&nbsp;</P></TD>
	<TD colspan=2 class="tr29 td104"><P class="p28 ft41">49</P></TD>
	<TD colspan=2 class="tr26 td105"><P class="p0 ft10">Município</P></TD>
	<TD class="tr26 td36"><P class="p0 ft14">&nbsp;</P></TD>
	<TD class="tr26 td11"><P class="p0 ft14">&nbsp;</P></TD>
	<TD class="tr26 td15"><P class="p0 ft14">&nbsp;</P></TD>
	<TD class="tr13 td106"><P class="p0 ft14">&nbsp;</P></TD>
	<TD colspan=2 class="tr26 td107"><P class="p27 ft10">Código (IBGE)</P></TD>
</TR>
<TR>
	<TD class="tr6 td84"><P class="p0 ft39">&nbsp;</P></TD>
	<TD class="tr6 td97"><P class="p0 ft39">&nbsp;</P></TD>
	<TD class="tr6 td98"><P class="p0 ft39">&nbsp;</P></TD>
	<TD class="tr6 td99"><P class="p0 ft39">&nbsp;</P></TD>
	<TD class="tr6 td78"><P class="p0 ft39">&nbsp;</P></TD>
	<TD rowspan=2 class="tr26 td36"><P class="p0 ft14">&nbsp;</P></TD>
	<TD rowspan=2 class="tr26 td11"><P class="p0 ft14">&nbsp;</P></TD>
	<TD rowspan=2 class="tr26 td15"><P class="p0 ft14">&nbsp;</P></TD>
	<TD class="tr6 td108"><P class="p0 ft39">&nbsp;</P></TD>
	<TD colspan=2 rowspan=2 class="tr26 td107"><P class="p31 ft13">    </P></TD>
</TR>
<TR>
	<TD class="tr16 td109"><P class="p0 ft28">&nbsp;</P></TD>
	<TD class="tr16 td110"><P class="p0 ft28">&nbsp;</P></TD>
	<TD class="tr5 td98"><P class="p0 ft37">&nbsp;</P></TD>
	<TD class="tr5 td99"><P class="p0 ft37">&nbsp;</P></TD>
	<TD class="tr5 td78"><P class="p0 ft37">&nbsp;</P></TD>
	<TD class="tr5 td101"><P class="p0 ft37">&nbsp;</P></TD>
</TR>
<TR>
	<TD colspan=2 rowspan=2 class="tr11 td111"><P class="p23 ft0">52</P></TD>
	<TD class="tr17 td98"><P class="p0 ft33">&nbsp;</P></TD>
	<TD rowspan=2 class="tr21 td99"><P class="p0 ft14">&nbsp;</P></TD>
	<TD colspan=6 rowspan=2 class="tr21 td112"><P class="p0 ft10">Doença Relacionada ao Trabalho</P></TD>
	<TD class="tr3 td113"><P class="p0 ft3">&nbsp;</P></TD>
</TR>
<TR>
	<TD class="tr30 td98"><P class="p0 ft56">&nbsp;</P></TD>
	<TD class="tr30 td114"><P class="p0 ft56">&nbsp;</P></TD>
</TR>
<TR>
	<TD colspan=5 rowspan=2 class="tr8 td36"><P class="p30 ft9">1</P></TD>
	<TD colspan=5 rowspan=2 class="tr8 td115"><P class="p0 ft9">- Sim 2 - Não 9 - Ignorado</P></TD>
	<TD class="tr17 td116"><P class="p0 ft33">&nbsp;</P></TD>
</TR>
<TR>
	<TD class="tr31 td28"><P class="p0 ft57">&nbsp;</P></TD>
</TR>
<TR>
	<TD class="tr13 td103"><P class="p0 ft14">&nbsp;</P></TD>
	<TD colspan=3 class="tr21 td117"><P class="p33 ft41">54</P></TD>
	<TD class="tr13 td78"><P class="p0 ft10">Data do Óbito</P></TD>
	<TD class="tr13 td36"><P class="p0 ft14">&nbsp;</P></TD>
	<TD class="tr29 td118"><P class="p30 ft0">55</P></TD>
	<TD colspan=4 class="tr13 td61"><P class="p48 ft10">Data do Encerramento</P></TD>
</TR>
</TABLE>
</DIV>
<DIV id="id_3_2_2_2">
<P class="p75 ft10"><SPAN class="ft0">47 </SPAN>UF <SPAN class="ft0">48 </SPAN>País</P>
<P class="p76 ft13"></P>
<TABLE cellpadding=0 cellspacing=0 class="t6">
<TR>
	<TD rowspan=2 class="tr4 td119"><P class="p0 ft10"><SPAN class="ft0">50 </SPAN>Distrito</P></TD>
	<TD class="tr29 td120"><P class="p0 ft44"><SPAN class="ft43">51 </SPAN>Bairro</P></TD>
</TR>
<TR>
	<TD class="tr7 td120"><P class="p0 ft32">&nbsp;</P></TD>
</TR>
</TABLE>
<P class="p77 ft10"><SPAN class="ft0">53 </SPAN>Evolução do Caso</P>
<P class="p78 ft10"><NOBR>1-Cura</NOBR> 2- Óbito por dengue 3- Óbito por outras causas 4- Óbito em investigação 9- Ignorado</P>
</DIV>
</DIV>
<DIV id="id_3_2_3">
<TABLE cellpadding=0 cellspacing=0 class="t7">
<TR>
	<TD class="tr13 td121"><P class="p67 ft58"></P></TD>
	<TD class="tr26 td122"><P class="p34 ft13"></P></TD>
	<TD class="tr26 td18"><P class="p28 ft13"></P></TD>
	<TD class="tr26 td19"><P class="p28 ft13"></P></TD>
	<TD class="tr26 td42"><P class="p67 ft13"></P></TD>
	<TD class="tr26 td25"><P class="p0 ft14">&nbsp;</P></TD>
	<TD class="tr13 td121"><P class="p67 ft58"></P></TD>
	<TD class="tr13 td123"><P class="p79 ft58"></P></TD>
	<TD class="tr13 td124"><P class="p28 ft58"></P></TD>
	<TD class="tr13 td125"><P class="p28 ft58"></P></TD>
	<TD class="tr13 td126"><P class="p24 ft58"></P></TD>
</TR>
</TABLE>
</DIV>
</DIV>
</DIV>
<DIV id="id_4">
<TABLE cellpadding=0 cellspacing=0 class="t8">
<TR>
	<TD class="tr13 td127"><P class="p0 ft10">Dengue</P></TD>
	<TD class="tr13 td128"><P class="p0 ft10">Sinan NET / Sinan <SPAN class="ft59">Online</SPAN></P></TD>
	<TD class="tr13 td14"><P class="p0 ft10">SVS</P></TD>
	<TD class="tr13 td51"><P class="p28 ft10">21/01/2011</P></TD>
</TR>
</TABLE>
</DIV>
</DIV>
<DIV id="page_2">
<DIV id="dimg1">
<IMG src="images/Dengue_images/Dengue2x1.jpg" id="img1">
</DIV>


<DIV id="id_1">
<DIV id="id_1_1">
<!--[if lte IE 7]><P style="margin-left:0px;margin-top:0px;margin-right:-352px;margin-bottom:0px;" class="p80 ft0"><![endif]--><!--[if gte IE 8]><P style="margin-left:-352px;margin-top:0px;margin-right:0px;margin-bottom:352px;" class="p80 ft0"><![endif]--><![if ! IE]><P style="margin-left:-176px;margin-top:176px;margin-right:-176px;margin-bottom:176px;" class="p80 ft0"><![endif]>Dados Clínicos- dengue com complicações, FHD e SCD</P>
</DIV>
<DIV id="id_1_2">
<DIV id="id_1_2_1">
<P class="p81 ft1">Dados clínicos (dengue com complicações, FHD e SCD)</P>
<P class="p82 ft61">A <SPAN class="ft60">FHD </SPAN>em geral <NOBR>desenvolve-se</NOBR> entre o 3º e o 5º dia de doença, quando há o recrudescimento da febre. A presença de dor abdominal intensa, hepatomegalia dolorosa, hipotermia com sudorese, letargia/agitação,</P>
<P class="p83 ft29">cianose, arritmias, hipotensão arterial/postural, vômitos persistentes, manifestações neurológicas são indicadores de que o paciente pode evoluir para FHD ou para um quadro mais grave de dengue.</P>
</DIV>
<DIV id="id_1_2_2">
<DIV id="id_1_2_2_1">
<P class="p84 ft10"><SPAN class="ft0">56 </SPAN>Manifestações Hemorrágicas?</P>
<P class="p85 ft10">1- Sim 2- Não 9- Ignorado</P>
<P class="p86 ft44"><SPAN class="ft43">58 </SPAN>Houve extravasamento plasmático?</P>
<P class="p87 ft10"><NOBR>1-Sim</NOBR> <NOBR>2-Não</NOBR> <NOBR>9-Ignorado</NOBR></P>
<P class="p88 ft10"><SPAN class="ft0">60 </SPAN>Plaquetas (menor)</P>
<P class="p89 ft13">     </P>
</DIV>
<DIV id="id_1_2_2_2">
<TABLE cellpadding=0 cellspacing=0 class="t9">
<TR>
	<TD colspan=2 class="tr16 td113"><P class="p0 ft28">&nbsp;</P></TD>
	<TD colspan=5 rowspan=2 class="tr13 td76"><P class="p0 ft10">Se sim, quais?</P></TD>
	<TD class="tr5 td13"><P class="p0 ft37">&nbsp;</P></TD>
	<TD class="tr5 td33"><P class="p0 ft37">&nbsp;</P></TD>
	<TD colspan=5 rowspan=2 class="tr13 td129"><P class="p0 ft10">1- Sim 2- Não 9- Ignorado</P></TD>
	<TD class="tr5 td97"><P class="p0 ft37">&nbsp;</P></TD>
	<TD class="tr5 td29"><P class="p0 ft37">&nbsp;</P></TD>
	<TD class="tr5 td130"><P class="p0 ft37">&nbsp;</P></TD>
	<TD class="tr5 td131"><P class="p0 ft37">&nbsp;</P></TD>
	<TD class="tr5 td7"><P class="p0 ft37">&nbsp;</P></TD>
	<TD class="tr5 td132"><P class="p0 ft37">&nbsp;</P></TD>
	<TD class="tr5 td8"><P class="p0 ft37">&nbsp;</P></TD>
	<TD class="tr5 td101"><P class="p0 ft37">&nbsp;</P></TD>
	<TD class="tr5 td11"><P class="p0 ft37">&nbsp;</P></TD>
	<TD class="tr5 td133"><P class="p0 ft37">&nbsp;</P></TD>
	<TD class="tr5 td45"><P class="p0 ft37">&nbsp;</P></TD>
</TR>
<TR>
	<TD colspan=2 class="tr17 td114"><P class="p23 ft62">57</P></TD>
	<TD class="tr17 td13"><P class="p0 ft33">&nbsp;</P></TD>
	<TD class="tr17 td33"><P class="p0 ft33">&nbsp;</P></TD>
	<TD class="tr17 td97"><P class="p0 ft33">&nbsp;</P></TD>
	<TD class="tr17 td29"><P class="p0 ft33">&nbsp;</P></TD>
	<TD class="tr17 td130"><P class="p0 ft33">&nbsp;</P></TD>
	<TD class="tr17 td131"><P class="p0 ft33">&nbsp;</P></TD>
	<TD class="tr17 td7"><P class="p0 ft33">&nbsp;</P></TD>
	<TD colspan=6 rowspan=3 class="tr1 td107"><P class="p44 ft10">Petéquias</P></TD>
</TR>
<TR>
	<TD class="tr28 td134"><P class="p0 ft55">&nbsp;</P></TD>
	<TD class="tr28 td135"><P class="p0 ft55">&nbsp;</P></TD>
	<TD class="tr7 td45"><P class="p0 ft32">&nbsp;</P></TD>
	<TD class="tr28 td136"><P class="p0 ft55">&nbsp;</P></TD>
	<TD class="tr7 td84"><P class="p0 ft32">&nbsp;</P></TD>
	<TD class="tr7 td7"><P class="p0 ft32">&nbsp;</P></TD>
	<TD class="tr7 td27"><P class="p0 ft32">&nbsp;</P></TD>
	<TD class="tr7 td13"><P class="p0 ft32">&nbsp;</P></TD>
	<TD class="tr7 td33"><P class="p0 ft32">&nbsp;</P></TD>
	<TD class="tr7 td99"><P class="p0 ft32">&nbsp;</P></TD>
	<TD class="tr28 td136"><P class="p0 ft55">&nbsp;</P></TD>
	<TD class="tr7 td137"><P class="p0 ft32">&nbsp;</P></TD>
	<TD class="tr7 td78"><P class="p0 ft32">&nbsp;</P></TD>
	<TD class="tr28 td138"><P class="p0 ft55">&nbsp;</P></TD>
	<TD class="tr28 td110"><P class="p0 ft55">&nbsp;</P></TD>
	<TD colspan=2 rowspan=2 class="tr26 td35"><P class="p44 ft10">Metrorragia</P></TD>
	<TD class="tr7 td131"><P class="p0 ft32">&nbsp;</P></TD>
	<TD class="tr28 td136"><P class="p0 ft55">&nbsp;</P></TD>
</TR>
<TR>
	<TD class="tr11 td84"><P class="p0 ft14">&nbsp;</P></TD>
	<TD class="tr11 td84"><P class="p0 ft14">&nbsp;</P></TD>
	<TD class="tr11 td139"><P class="p0 ft14">&nbsp;</P></TD>
	<TD class="tr8 td140"><P class="p0 ft19">&nbsp;</P></TD>
	<TD colspan=3 class="tr11 td141"><P class="p44 ft10">Epistaxe</P></TD>
	<TD class="tr11 td13"><P class="p0 ft14">&nbsp;</P></TD>
	<TD class="tr11 td33"><P class="p0 ft14">&nbsp;</P></TD>
	<TD class="tr11 td142"><P class="p0 ft14">&nbsp;</P></TD>
	<TD class="tr8 td140"><P class="p0 ft19">&nbsp;</P></TD>
	<TD colspan=2 class="tr11 td143"><P class="p66 ft10">Gengivorragia</P></TD>
	<TD class="tr8 td138"><P class="p0 ft19">&nbsp;</P></TD>
	<TD class="tr8 td144"><P class="p0 ft19">&nbsp;</P></TD>
	<TD class="tr11 td145"><P class="p0 ft14">&nbsp;</P></TD>
	<TD class="tr8 td140"><P class="p0 ft19">&nbsp;</P></TD>
</TR>
<TR>
	<TD class="tr19 td84"><P class="p0 ft14">&nbsp;</P></TD>
	<TD class="tr19 td84"><P class="p0 ft14">&nbsp;</P></TD>
	<TD class="tr19 td45"><P class="p0 ft14">&nbsp;</P></TD>
	<TD class="tr19 td7"><P class="p0 ft14">&nbsp;</P></TD>
	<TD class="tr19 td84"><P class="p0 ft14">&nbsp;</P></TD>
	<TD colspan=2 class="tr19 td146"><P class="p48 ft10">Hematúria</P></TD>
	<TD class="tr19 td13"><P class="p0 ft14">&nbsp;</P></TD>
	<TD class="tr19 td33"><P class="p0 ft14">&nbsp;</P></TD>
	<TD class="tr19 td99"><P class="p0 ft14">&nbsp;</P></TD>
	<TD class="tr19 td7"><P class="p0 ft14">&nbsp;</P></TD>
	<TD colspan=6 class="tr19 td147"><P class="p53 ft10">Sangramento Gastrointestinal</P></TD>
	<TD class="tr19 td131"><P class="p0 ft14">&nbsp;</P></TD>
	<TD class="tr19 td7"><P class="p0 ft14">&nbsp;</P></TD>
	<TD colspan=6 class="tr19 td107"><P class="p2 ft22">Prova do Laço Positiva</P></TD>
</TR>
<TR>
	<TD class="tr5 td84"><P class="p0 ft37">&nbsp;</P></TD>
	<TD class="tr5 td84"><P class="p0 ft37">&nbsp;</P></TD>
	<TD class="tr5 td45"><P class="p0 ft37">&nbsp;</P></TD>
	<TD class="tr5 td7"><P class="p0 ft37">&nbsp;</P></TD>
	<TD colspan=5 class="tr5 td148"><P class="p0 ft37">&nbsp;</P></TD>
	<TD colspan=3 class="tr5 td130"><P class="p0 ft37">&nbsp;</P></TD>
	<TD class="tr5 td78"><P class="p0 ft37">&nbsp;</P></TD>
	<TD class="tr5 td45"><P class="p0 ft37">&nbsp;</P></TD>
	<TD class="tr5 td97"><P class="p0 ft37">&nbsp;</P></TD>
	<TD class="tr5 td29"><P class="p0 ft37">&nbsp;</P></TD>
	<TD class="tr5 td130"><P class="p0 ft37">&nbsp;</P></TD>
	<TD class="tr5 td131"><P class="p0 ft37">&nbsp;</P></TD>
	<TD class="tr5 td7"><P class="p0 ft37">&nbsp;</P></TD>
	<TD class="tr5 td132"><P class="p0 ft37">&nbsp;</P></TD>
	<TD class="tr5 td8"><P class="p0 ft37">&nbsp;</P></TD>
	<TD class="tr5 td101"><P class="p0 ft37">&nbsp;</P></TD>
	<TD class="tr5 td11"><P class="p0 ft37">&nbsp;</P></TD>
	<TD class="tr5 td133"><P class="p0 ft37">&nbsp;</P></TD>
	<TD class="tr5 td45"><P class="p0 ft37">&nbsp;</P></TD>
</TR>
<TR>
	<TD class="tr30 td84"><P class="p0 ft56">&nbsp;</P></TD>
	<TD class="tr30 td84"><P class="p0 ft56">&nbsp;</P></TD>
	<TD class="tr30 td139"><P class="p0 ft56">&nbsp;</P></TD>
	<TD rowspan=2 class="tr11 td149"><P class="p41 ft41">59</P></TD>
	<TD colspan=8 rowspan=2 class="tr29 td4"><P class="p0 ft10">Se sim, Evidenciado por:</P></TD>
	<TD class="tr30 td78"><P class="p0 ft56">&nbsp;</P></TD>
	<TD class="tr30 td45"><P class="p0 ft56">&nbsp;</P></TD>
	<TD class="tr30 td97"><P class="p0 ft56">&nbsp;</P></TD>
	<TD class="tr30 td29"><P class="p0 ft56">&nbsp;</P></TD>
	<TD class="tr30 td130"><P class="p0 ft56">&nbsp;</P></TD>
	<TD class="tr30 td131"><P class="p0 ft56">&nbsp;</P></TD>
	<TD class="tr30 td7"><P class="p0 ft56">&nbsp;</P></TD>
	<TD class="tr30 td132"><P class="p0 ft56">&nbsp;</P></TD>
	<TD class="tr30 td8"><P class="p0 ft56">&nbsp;</P></TD>
	<TD class="tr30 td101"><P class="p0 ft56">&nbsp;</P></TD>
	<TD class="tr30 td150"><P class="p0 ft56">&nbsp;</P></TD>
	<TD class="tr30 td151"><P class="p0 ft56">&nbsp;</P></TD>
	<TD class="tr30 td45"><P class="p0 ft56">&nbsp;</P></TD>
</TR>
<TR>
	<TD class="tr6 td84"><P class="p0 ft39">&nbsp;</P></TD>
	<TD class="tr6 td84"><P class="p0 ft39">&nbsp;</P></TD>
	<TD class="tr6 td139"><P class="p0 ft39">&nbsp;</P></TD>
	<TD class="tr6 td78"><P class="p0 ft39">&nbsp;</P></TD>
	<TD class="tr6 td45"><P class="p0 ft39">&nbsp;</P></TD>
	<TD class="tr6 td97"><P class="p0 ft39">&nbsp;</P></TD>
	<TD class="tr6 td29"><P class="p0 ft39">&nbsp;</P></TD>
	<TD class="tr6 td130"><P class="p0 ft39">&nbsp;</P></TD>
	<TD class="tr6 td131"><P class="p0 ft39">&nbsp;</P></TD>
	<TD class="tr6 td7"><P class="p0 ft39">&nbsp;</P></TD>
	<TD class="tr6 td132"><P class="p0 ft39">&nbsp;</P></TD>
	<TD class="tr6 td8"><P class="p0 ft39">&nbsp;</P></TD>
	<TD class="tr6 td101"><P class="p0 ft39">&nbsp;</P></TD>
	<TD class="tr6 td152"><P class="p0 ft39">&nbsp;</P></TD>
	<TD class="tr6 td153"><P class="p0 ft39">&nbsp;</P></TD>
	<TD class="tr6 td45"><P class="p0 ft39">&nbsp;</P></TD>
</TR>
<TR>
	<TD class="tr16 td103"><P class="p0 ft28">&nbsp;</P></TD>
	<TD class="tr16 td84"><P class="p0 ft28">&nbsp;</P></TD>
	<TD class="tr16 td45"><P class="p0 ft28">&nbsp;</P></TD>
	<TD class="tr16 td7"><P class="p0 ft28">&nbsp;</P></TD>
	<TD class="tr16 td84"><P class="p0 ft28">&nbsp;</P></TD>
	<TD class="tr16 td7"><P class="p0 ft28">&nbsp;</P></TD>
	<TD class="tr16 td27"><P class="p0 ft28">&nbsp;</P></TD>
	<TD colspan=15 rowspan=2 class="tr21 td154"><P class="p0 ft10"><NOBR>1-Hemoconcentração</NOBR> <NOBR>2-Derrames</NOBR> cavitários <NOBR>3-Hipoproteinemia</NOBR></P></TD>
	<TD colspan=2 class="tr30 td155"><P class="p0 ft56">&nbsp;</P></TD>
	<TD class="tr16 td45"><P class="p0 ft28">&nbsp;</P></TD>
</TR>
<TR>
	<TD class="tr3 td103"><P class="p0 ft3">&nbsp;</P></TD>
	<TD class="tr3 td84"><P class="p0 ft3">&nbsp;</P></TD>
	<TD class="tr3 td45"><P class="p0 ft3">&nbsp;</P></TD>
	<TD class="tr3 td7"><P class="p0 ft3">&nbsp;</P></TD>
	<TD class="tr3 td84"><P class="p0 ft3">&nbsp;</P></TD>
	<TD class="tr3 td7"><P class="p0 ft3">&nbsp;</P></TD>
	<TD class="tr3 td27"><P class="p0 ft3">&nbsp;</P></TD>
	<TD colspan=2 class="tr3 td18"><P class="p0 ft3">&nbsp;</P></TD>
	<TD class="tr3 td45"><P class="p0 ft3">&nbsp;</P></TD>
</TR>
<TR>
	<TD class="tr11 td84"><P class="p0 ft14">&nbsp;</P></TD>
	<TD class="tr11 td84"><P class="p0 ft14">&nbsp;</P></TD>
	<TD class="tr11 td45"><P class="p0 ft14">&nbsp;</P></TD>
	<TD class="tr11 td7"><P class="p0 ft14">&nbsp;</P></TD>
	<TD class="tr11 td84"><P class="p0 ft14">&nbsp;</P></TD>
	<TD class="tr8 td136"><P class="p0 ft19">&nbsp;</P></TD>
	<TD colspan=8 rowspan=2 class="tr12 td156"><P class="p48 ft10">No Caso de FHD/SCD Especificar</P></TD>
	<TD class="tr11 td97"><P class="p0 ft14">&nbsp;</P></TD>
	<TD class="tr11 td29"><P class="p0 ft14">&nbsp;</P></TD>
	<TD class="tr11 td130"><P class="p0 ft14">&nbsp;</P></TD>
	<TD class="tr11 td131"><P class="p0 ft14">&nbsp;</P></TD>
	<TD class="tr11 td7"><P class="p0 ft14">&nbsp;</P></TD>
	<TD class="tr11 td132"><P class="p0 ft14">&nbsp;</P></TD>
	<TD class="tr11 td8"><P class="p0 ft14">&nbsp;</P></TD>
	<TD class="tr8 td157"><P class="p0 ft19">&nbsp;</P></TD>
	<TD class="tr8 td158"><P class="p0 ft19">&nbsp;</P></TD>
	<TD class="tr11 td133"><P class="p0 ft14">&nbsp;</P></TD>
	<TD class="tr11 td45"><P class="p0 ft14">&nbsp;</P></TD>
</TR>
<TR>
	<TD class="tr0 td84"><P class="p0 ft2">&nbsp;</P></TD>
	<TD class="tr0 td84"><P class="p0 ft2">&nbsp;</P></TD>
	<TD class="tr0 td45"><P class="p0 ft2">&nbsp;</P></TD>
	<TD class="tr0 td7"><P class="p0 ft2">&nbsp;</P></TD>
	<TD class="tr0 td103"><P class="p0 ft2">&nbsp;</P></TD>
	<TD class="tr0 td159"><P class="p23 ft34">61</P></TD>
	<TD class="tr0 td97"><P class="p0 ft2">&nbsp;</P></TD>
	<TD class="tr0 td29"><P class="p0 ft2">&nbsp;</P></TD>
	<TD class="tr0 td130"><P class="p0 ft2">&nbsp;</P></TD>
	<TD class="tr0 td131"><P class="p0 ft2">&nbsp;</P></TD>
	<TD class="tr0 td7"><P class="p0 ft2">&nbsp;</P></TD>
	<TD class="tr0 td132"><P class="p0 ft2">&nbsp;</P></TD>
	<TD class="tr0 td8"><P class="p0 ft2">&nbsp;</P></TD>
	<TD class="tr0 td108"><P class="p0 ft2">&nbsp;</P></TD>
	<TD class="tr0 td160"><P class="p0 ft2">&nbsp;</P></TD>
	<TD class="tr0 td133"><P class="p0 ft2">&nbsp;</P></TD>
	<TD class="tr0 td45"><P class="p0 ft2">&nbsp;</P></TD>
</TR>
<TR>
	<TD colspan=5 rowspan=3 class="tr12 td137"><P class="p2 ft10">mm<SPAN class="ft63">3</SPAN></P></TD>
	<TD rowspan=3 class="tr24 td161"><P class="p0 ft14">&nbsp;</P></TD>
	<TD rowspan=3 class="tr12 td27"><P class="p0 ft14">&nbsp;</P></TD>
	<TD rowspan=2 class="tr11 td13"><P class="p0 ft14">&nbsp;</P></TD>
	<TD colspan=4 rowspan=2 class="tr11 td69"><P class="p21 ft10">1 - Grau I</P></TD>
	<TD colspan=2 rowspan=2 class="tr11 td162"><P class="p0 ft10">2 - Grau II</P></TD>
	<TD colspan=3 rowspan=2 class="tr11 td30"><P class="p0 ft10">3 - Grau III</P></TD>
	<TD colspan=3 rowspan=2 class="tr11 td163"><P class="p0 ft10">4 - Grau IV</P></TD>
	<TD rowspan=3 class="tr12 td8"><P class="p0 ft14">&nbsp;</P></TD>
	<TD class="tr28 td164"><P class="p0 ft55">&nbsp;</P></TD>
	<TD class="tr7 td165"><P class="p0 ft32">&nbsp;</P></TD>
	<TD class="tr30 td133"><P class="p0 ft56">&nbsp;</P></TD>
	<TD class="tr30 td45"><P class="p0 ft56">&nbsp;</P></TD>
</TR>
<TR>
	<TD class="tr3 td101"><P class="p0 ft3">&nbsp;</P></TD>
	<TD class="tr3 td11"><P class="p0 ft3">&nbsp;</P></TD>
	<TD class="tr3 td133"><P class="p0 ft3">&nbsp;</P></TD>
	<TD class="tr3 td45"><P class="p0 ft3">&nbsp;</P></TD>
</TR>
<TR>
	<TD class="tr0 td13"><P class="p0 ft2">&nbsp;</P></TD>
	<TD class="tr0 td33"><P class="p0 ft2">&nbsp;</P></TD>
	<TD colspan=3 class="tr0 td130"><P class="p0 ft2">&nbsp;</P></TD>
	<TD colspan=2 class="tr0 td162"><P class="p0 ft2">&nbsp;</P></TD>
	<TD colspan=2 class="tr0 td28"><P class="p0 ft2">&nbsp;</P></TD>
	<TD class="tr0 td130"><P class="p0 ft2">&nbsp;</P></TD>
	<TD colspan=3 class="tr0 td163"><P class="p0 ft2">&nbsp;</P></TD>
	<TD class="tr0 td101"><P class="p0 ft2">&nbsp;</P></TD>
	<TD class="tr0 td11"><P class="p0 ft2">&nbsp;</P></TD>
	<TD class="tr0 td133"><P class="p0 ft2">&nbsp;</P></TD>
	<TD class="tr0 td45"><P class="p0 ft2">&nbsp;</P></TD>
</TR>
</TABLE>
</DIV>
</DIV>
<DIV id="id_1_2_3">
<P class="p90 ft10"><SPAN class="ft0">62 </SPAN>No Caso de Dengue com complicações, que tipo de complicações?</P>
<TABLE cellpadding=0 cellspacing=0 class="t10">
<TR>
	<TD class="tr15 td11"><P class="p0 ft24">&nbsp;</P></TD>
	<TD rowspan=2 class="tr6 td166"><P class="p0 ft51"><NOBR>1-Alterações</NOBR> neurológicas</P></TD>
	<TD class="tr15 td131"><P class="p0 ft24">&nbsp;</P></TD>
	<TD colspan=6 rowspan=2 class="tr6 td167"><P class="p91 ft52"><NOBR>2-Disfunção</NOBR> cardiorrespiratória</P></TD>
	<TD colspan=10 rowspan=2 class="tr6 td168"><P class="p29 ft52"><NOBR>3-Insuficiência</NOBR> hepática</P></TD>
	<TD colspan=7 rowspan=2 class="tr6 td169"><P class="p92 ft52"><NOBR>4-Plaquetas</NOBR> &lt;20.000 mm3</P></TD>
	<TD class="tr15 td26"><P class="p0 ft24">&nbsp;</P></TD>
	<TD class="tr15 td19"><P class="p0 ft24">&nbsp;</P></TD>
	<TD class="tr15 td24"><P class="p0 ft24">&nbsp;</P></TD>
	<TD class="tr5 td158"><P class="p0 ft37">&nbsp;</P></TD>
	<TD class="tr15 td170"><P class="p0 ft24">&nbsp;</P></TD>
	<TD class="tr15 td171"><P class="p0 ft24">&nbsp;</P></TD>
</TR>
<TR>
	<TD class="tr28 td11"><P class="p0 ft55">&nbsp;</P></TD>
	<TD class="tr28 td131"><P class="p0 ft55">&nbsp;</P></TD>
	<TD class="tr28 td26"><P class="p0 ft55">&nbsp;</P></TD>
	<TD class="tr28 td19"><P class="p0 ft55">&nbsp;</P></TD>
	<TD class="tr28 td24"><P class="p0 ft55">&nbsp;</P></TD>
	<TD class="tr28 td11"><P class="p0 ft55">&nbsp;</P></TD>
	<TD class="tr28 td170"><P class="p0 ft55">&nbsp;</P></TD>
	<TD class="tr28 td171"><P class="p0 ft55">&nbsp;</P></TD>
</TR>
<TR>
	<TD class="tr11 td11"><P class="p0 ft18">&nbsp;</P></TD>
	<TD class="tr11 td166"><P class="p0 ft10"><NOBR>5-Hemorragia</NOBR> digestiva</P></TD>
	<TD colspan=6 class="tr11 td172"><P class="p46 ft10"><NOBR>6-Derrames</NOBR> cavitários</P></TD>
	<TD colspan=8 class="tr11 td173"><P class="p19 ft10"><NOBR>7-Leucometria</NOBR> &lt; 1000</P></TD>
	<TD colspan=11 class="tr11 td95"><P class="p38 ft44"><NOBR>8-Não</NOBR> se enquadra nos critérios de FHD</P></TD>
	<TD class="tr11 td19"><P class="p0 ft18">&nbsp;</P></TD>
	<TD class="tr11 td24"><P class="p0 ft18">&nbsp;</P></TD>
	<TD class="tr11 td11"><P class="p0 ft18">&nbsp;</P></TD>
	<TD class="tr11 td170"><P class="p0 ft18">&nbsp;</P></TD>
	<TD class="tr11 td171"><P class="p0 ft18">&nbsp;</P></TD>
</TR>
<TR>
	<TD class="tr11 td11"><P class="p0 ft18">&nbsp;</P></TD>
	<TD class="tr11 td166"><P class="p0 ft18">&nbsp;</P></TD>
	<TD class="tr11 td131"><P class="p0 ft18">&nbsp;</P></TD>
	<TD class="tr11 td15"><P class="p0 ft18">&nbsp;</P></TD>
	<TD class="tr11 td12"><P class="p0 ft18">&nbsp;</P></TD>
	<TD class="tr11 td12"><P class="p0 ft18">&nbsp;</P></TD>
	<TD colspan=3 class="tr11 td173"><P class="p0 ft18">&nbsp;</P></TD>
	<TD class="tr11 td170"><P class="p0 ft18">&nbsp;</P></TD>
	<TD class="tr11 td33"><P class="p0 ft18">&nbsp;</P></TD>
	<TD class="tr11 td99"><P class="p0 ft18">&nbsp;</P></TD>
	<TD class="tr11 td7"><P class="p0 ft18">&nbsp;</P></TD>
	<TD class="tr11 td97"><P class="p0 ft18">&nbsp;</P></TD>
	<TD class="tr11 td24"><P class="p0 ft18">&nbsp;</P></TD>
	<TD class="tr11 td98"><P class="p0 ft18">&nbsp;</P></TD>
	<TD class="tr11 td45"><P class="p0 ft18">&nbsp;</P></TD>
	<TD class="tr11 td7"><P class="p0 ft18">&nbsp;</P></TD>
	<TD colspan=2 rowspan=4 class="tr32 td174"><P class="p23 ft22">Município do Hospital</P></TD>
	<TD class="tr11 td133"><P class="p0 ft18">&nbsp;</P></TD>
	<TD class="tr11 td33"><P class="p0 ft18">&nbsp;</P></TD>
	<TD class="tr11 td99"><P class="p0 ft18">&nbsp;</P></TD>
	<TD class="tr11 td20"><P class="p0 ft18">&nbsp;</P></TD>
	<TD class="tr11 td29"><P class="p0 ft18">&nbsp;</P></TD>
	<TD class="tr11 td98"><P class="p0 ft18">&nbsp;</P></TD>
	<TD colspan=4 class="tr11 td175"><P class="p0 ft18">&nbsp;</P></TD>
	<TD class="tr11 td170"><P class="p0 ft18">&nbsp;</P></TD>
	<TD class="tr11 td171"><P class="p0 ft18">&nbsp;</P></TD>
</TR>
<TR>
	<TD rowspan=3 class="tr29 td176"><P class="p23 ft0">63</P></TD>
	<TD rowspan=3 class="tr13 td166"><P class="p0 ft10">Ocorreu Hospitalização?</P></TD>
	<TD class="tr16 td177"><P class="p0 ft28">&nbsp;</P></TD>
	<TD class="tr16 td86"><P class="p0 ft28">&nbsp;</P></TD>
	<TD rowspan=2 class="tr6 td178"><P class="p0 ft39">&nbsp;</P></TD>
	<TD rowspan=3 class="tr21 td179"><P class="p41 ft0">64</P></TD>
	<TD colspan=3 rowspan=3 class="tr13 td173"><P class="p0 ft10">Data da Internação</P></TD>
	<TD rowspan=2 class="tr6 td170"><P class="p0 ft39">&nbsp;</P></TD>
	<TD rowspan=2 class="tr6 td33"><P class="p0 ft39">&nbsp;</P></TD>
	<TD rowspan=2 class="tr6 td142"><P class="p0 ft39">&nbsp;</P></TD>
	<TD rowspan=3 class="tr29 td180"><P class="p23 ft0">65</P></TD>
	<TD colspan=3 rowspan=3 class="tr13 td181"><P class="p48 ft10">UF</P></TD>
	<TD rowspan=2 class="tr6 td139"><P class="p0 ft39">&nbsp;</P></TD>
	<TD rowspan=3 class="tr21 td149"><P class="p23 ft0">66</P></TD>
	<TD class="tr5 td133"><P class="p0 ft37">&nbsp;</P></TD>
	<TD class="tr5 td33"><P class="p0 ft37">&nbsp;</P></TD>
	<TD class="tr5 td99"><P class="p0 ft37">&nbsp;</P></TD>
	<TD class="tr5 td20"><P class="p0 ft37">&nbsp;</P></TD>
	<TD class="tr5 td29"><P class="p0 ft37">&nbsp;</P></TD>
	<TD class="tr5 td98"><P class="p0 ft37">&nbsp;</P></TD>
	<TD colspan=5 rowspan=3 class="tr13 td9"><P class="p92 ft10">Código (IBGE)</P></TD>
	<TD class="tr5 td171"><P class="p0 ft37">&nbsp;</P></TD>
</TR>
<TR>
	<TD class="tr7 td182"><P class="p0 ft32">&nbsp;</P></TD>
	<TD class="tr7 td183"><P class="p0 ft32">&nbsp;</P></TD>
	<TD class="tr7 td133"><P class="p0 ft32">&nbsp;</P></TD>
	<TD class="tr7 td33"><P class="p0 ft32">&nbsp;</P></TD>
	<TD class="tr7 td99"><P class="p0 ft32">&nbsp;</P></TD>
	<TD class="tr7 td20"><P class="p0 ft32">&nbsp;</P></TD>
	<TD class="tr7 td29"><P class="p0 ft32">&nbsp;</P></TD>
	<TD class="tr7 td98"><P class="p0 ft32">&nbsp;</P></TD>
	<TD class="tr7 td171"><P class="p0 ft32">&nbsp;</P></TD>
</TR>
<TR>
	<TD class="tr16 td182"><P class="p0 ft28">&nbsp;</P></TD>
	<TD class="tr16 td183"><P class="p0 ft28">&nbsp;</P></TD>
	<TD class="tr16 td178"><P class="p0 ft28">&nbsp;</P></TD>
	<TD class="tr16 td170"><P class="p0 ft28">&nbsp;</P></TD>
	<TD class="tr16 td33"><P class="p0 ft28">&nbsp;</P></TD>
	<TD class="tr16 td142"><P class="p0 ft28">&nbsp;</P></TD>
	<TD class="tr16 td139"><P class="p0 ft28">&nbsp;</P></TD>
	<TD class="tr16 td133"><P class="p0 ft28">&nbsp;</P></TD>
	<TD class="tr16 td33"><P class="p0 ft28">&nbsp;</P></TD>
	<TD class="tr16 td99"><P class="p0 ft28">&nbsp;</P></TD>
	<TD class="tr16 td20"><P class="p0 ft28">&nbsp;</P></TD>
	<TD class="tr16 td184"><P class="p0 ft28">&nbsp;</P></TD>
	<TD class="tr16 td98"><P class="p0 ft28">&nbsp;</P></TD>
	<TD class="tr16 td171"><P class="p0 ft28">&nbsp;</P></TD>
</TR>
<TR>
	<TD class="tr31 td111"><P class="p0 ft57">&nbsp;</P></TD>
	<TD class="tr28 td166"><P class="p0 ft55">&nbsp;</P></TD>
	<TD class="tr31 td185"><P class="p0 ft57">&nbsp;</P></TD>
	<TD class="tr31 td186"><P class="p0 ft57">&nbsp;</P></TD>
	<TD class="tr28 td12"><P class="p0 ft55">&nbsp;</P></TD>
	<TD class="tr28 td12"><P class="p0 ft55">&nbsp;</P></TD>
	<TD class="tr28 td45"><P class="p0 ft55">&nbsp;</P></TD>
	<TD rowspan=3 class="tr2 td187"><P class="p42 ft17"> <SPAN class="ft64"> </SPAN></P></TD>
	<TD class="tr28 td37"><P class="p0 ft55">&nbsp;</P></TD>
	<TD class="tr28 td170"><P class="p0 ft55">&nbsp;</P></TD>
	<TD class="tr28 td33"><P class="p0 ft55">&nbsp;</P></TD>
	<TD class="tr28 td142"><P class="p0 ft55">&nbsp;</P></TD>
	<TD class="tr31 td140"><P class="p0 ft57">&nbsp;</P></TD>
	<TD class="tr28 td97"><P class="p0 ft55">&nbsp;</P></TD>
	<TD class="tr28 td24"><P class="p0 ft55">&nbsp;</P></TD>
	<TD class="tr28 td98"><P class="p0 ft55">&nbsp;</P></TD>
	<TD class="tr28 td45"><P class="p0 ft55">&nbsp;</P></TD>
	<TD class="tr28 td7"><P class="p0 ft55">&nbsp;</P></TD>
	<TD class="tr28 td17"><P class="p0 ft55">&nbsp;</P></TD>
	<TD class="tr28 td41"><P class="p0 ft55">&nbsp;</P></TD>
	<TD class="tr28 td133"><P class="p0 ft55">&nbsp;</P></TD>
	<TD class="tr28 td33"><P class="p0 ft55">&nbsp;</P></TD>
	<TD class="tr28 td99"><P class="p0 ft55">&nbsp;</P></TD>
	<TD class="tr28 td20"><P class="p0 ft55">&nbsp;</P></TD>
	<TD class="tr28 td184"><P class="p0 ft55">&nbsp;</P></TD>
	<TD class="tr28 td98"><P class="p0 ft55">&nbsp;</P></TD>
	<TD class="tr28 td26"><P class="p0 ft55">&nbsp;</P></TD>
	<TD class="tr28 td19"><P class="p0 ft55">&nbsp;</P></TD>
	<TD class="tr28 td24"><P class="p0 ft55">&nbsp;</P></TD>
	<TD class="tr28 td11"><P class="p0 ft55">&nbsp;</P></TD>
	<TD class="tr28 td170"><P class="p0 ft55">&nbsp;</P></TD>
	<TD class="tr28 td171"><P class="p0 ft55">&nbsp;</P></TD>
</TR>
<TR>
	<TD rowspan=2 class="tr9 td11"><P class="p0 ft14">&nbsp;</P></TD>
	<TD colspan=2 rowspan=2 class="tr9 td188"><P class="p21 ft10">1 - Sim 2 - Não 9 - Ignorado</P></TD>
	<TD class="tr33 td15"><P class="p0 ft14">&nbsp;</P></TD>
	<TD class="tr33 td12"><P class="p0 ft14">&nbsp;</P></TD>
	<TD class="tr33 td12"><P class="p0 ft14">&nbsp;</P></TD>
	<TD class="tr33 td45"><P class="p0 ft14">&nbsp;</P></TD>
	<TD class="tr33 td37"><P class="p0 ft14">&nbsp;</P></TD>
	<TD class="tr33 td170"><P class="p0 ft14">&nbsp;</P></TD>
	<TD class="tr33 td33"><P class="p0 ft14">&nbsp;</P></TD>
	<TD class="tr33 td99"><P class="p0 ft14">&nbsp;</P></TD>
	<TD class="tr33 td7"><P class="p0 ft14">&nbsp;</P></TD>
	<TD class="tr33 td97"><P class="p0 ft14">&nbsp;</P></TD>
	<TD class="tr33 td24"><P class="p0 ft14">&nbsp;</P></TD>
	<TD class="tr33 td98"><P class="p0 ft14">&nbsp;</P></TD>
	<TD class="tr33 td45"><P class="p0 ft14">&nbsp;</P></TD>
	<TD class="tr33 td7"><P class="p0 ft14">&nbsp;</P></TD>
	<TD class="tr33 td17"><P class="p0 ft14">&nbsp;</P></TD>
	<TD class="tr33 td41"><P class="p0 ft14">&nbsp;</P></TD>
	<TD class="tr33 td133"><P class="p0 ft14">&nbsp;</P></TD>
	<TD class="tr33 td33"><P class="p0 ft14">&nbsp;</P></TD>
	<TD class="tr33 td99"><P class="p0 ft14">&nbsp;</P></TD>
	<TD class="tr33 td20"><P class="p0 ft14">&nbsp;</P></TD>
	<TD class="tr33 td184"><P class="p0 ft14">&nbsp;</P></TD>
	<TD class="tr33 td98"><P class="p0 ft14">&nbsp;</P></TD>
	<TD class="tr33 td26"><P class="p0 ft14">&nbsp;</P></TD>
	<TD class="tr33 td19"><P class="p0 ft14">&nbsp;</P></TD>
	<TD class="tr33 td24"><P class="p0 ft14">&nbsp;</P></TD>
	<TD class="tr33 td11"><P class="p0 ft14">&nbsp;</P></TD>
	<TD class="tr33 td170"><P class="p0 ft14">&nbsp;</P></TD>
	<TD class="tr33 td171"><P class="p0 ft14">&nbsp;</P></TD>
</TR>
<TR>
	<TD class="tr26 td15"><P class="p0 ft14">&nbsp;</P></TD>
	<TD class="tr26 td12"><P class="p0 ft14">&nbsp;</P></TD>
	<TD colspan=2 class="tr13 td189"><P class="p28 ft58"></P></TD>
	<TD class="tr13 td190"><P class="p42 ft58">  </P></TD>
	<TD class="tr13 td191"><P class="p0 ft21">&nbsp;</P></TD>
	<TD class="tr26 td33"><P class="p0 ft14">&nbsp;</P></TD>
	<TD colspan=3 class="tr13 td192"><P class="p26 ft58"></P></TD>
	<TD class="tr13 td193"><P class="p0 ft21">&nbsp;</P></TD>
	<TD class="tr26 td98"><P class="p0 ft14">&nbsp;</P></TD>
	<TD class="tr26 td45"><P class="p0 ft14">&nbsp;</P></TD>
	<TD class="tr26 td7"><P class="p0 ft14">&nbsp;</P></TD>
	<TD class="tr26 td17"><P class="p0 ft14">&nbsp;</P></TD>
	<TD class="tr26 td41"><P class="p0 ft14">&nbsp;</P></TD>
	<TD class="tr26 td133"><P class="p0 ft14">&nbsp;</P></TD>
	<TD class="tr26 td33"><P class="p0 ft14">&nbsp;</P></TD>
	<TD class="tr26 td99"><P class="p0 ft14">&nbsp;</P></TD>
	<TD class="tr26 td20"><P class="p0 ft14">&nbsp;</P></TD>
	<TD class="tr26 td184"><P class="p0 ft14">&nbsp;</P></TD>
	<TD class="tr26 td98"><P class="p0 ft14">&nbsp;</P></TD>
	<TD class="tr26 td26"><P class="p26 ft13"></P></TD>
	<TD class="tr26 td19"><P class="p26 ft13"></P></TD>
	<TD class="tr26 td24"><P class="p30 ft13"></P></TD>
	<TD class="tr26 td11"><P class="p23 ft13"></P></TD>
	<TD class="tr26 td170"><P class="p0 ft14">&nbsp;</P></TD>
	<TD class="tr26 td171"><P class="p67 ft13"></P></TD>
</TR>
<TR>
	<TD class="tr16 td11"><P class="p0 ft28">&nbsp;</P></TD>
	<TD class="tr16 td166"><P class="p0 ft28">&nbsp;</P></TD>
	<TD class="tr16 td131"><P class="p0 ft28">&nbsp;</P></TD>
	<TD class="tr16 td15"><P class="p0 ft28">&nbsp;</P></TD>
	<TD class="tr16 td12"><P class="p0 ft28">&nbsp;</P></TD>
	<TD class="tr16 td12"><P class="p0 ft28">&nbsp;</P></TD>
	<TD class="tr16 td45"><P class="p0 ft28">&nbsp;</P></TD>
	<TD class="tr16 td51"><P class="p0 ft28">&nbsp;</P></TD>
	<TD class="tr16 td37"><P class="p0 ft28">&nbsp;</P></TD>
	<TD class="tr16 td170"><P class="p0 ft28">&nbsp;</P></TD>
	<TD class="tr16 td33"><P class="p0 ft28">&nbsp;</P></TD>
	<TD class="tr16 td99"><P class="p0 ft28">&nbsp;</P></TD>
	<TD class="tr16 td7"><P class="p0 ft28">&nbsp;</P></TD>
	<TD class="tr16 td97"><P class="p0 ft28">&nbsp;</P></TD>
	<TD colspan=5 class="tr16 td194"><P class="p0 ft28">&nbsp;</P></TD>
	<TD class="tr16 td41"><P class="p0 ft28">&nbsp;</P></TD>
	<TD colspan=2 class="tr30 td195"><P class="p0 ft56">&nbsp;</P></TD>
	<TD class="tr16 td99"><P class="p0 ft28">&nbsp;</P></TD>
	<TD colspan=5 rowspan=3 class="tr18 td196"><P class="p29 ft10">(DDD) Telefone</P></TD>
	<TD class="tr16 td24"><P class="p0 ft28">&nbsp;</P></TD>
	<TD class="tr16 td11"><P class="p0 ft28">&nbsp;</P></TD>
	<TD class="tr16 td170"><P class="p0 ft28">&nbsp;</P></TD>
	<TD class="tr16 td171"><P class="p0 ft28">&nbsp;</P></TD>
</TR>
<TR>
	<TD class="tr30 td158"><P class="p0 ft56">&nbsp;</P></TD>
	<TD rowspan=2 class="tr13 td166"><P class="p0 ft10">Nome do Hospital</P></TD>
	<TD class="tr16 td131"><P class="p0 ft28">&nbsp;</P></TD>
	<TD class="tr16 td15"><P class="p0 ft28">&nbsp;</P></TD>
	<TD class="tr16 td12"><P class="p0 ft28">&nbsp;</P></TD>
	<TD class="tr16 td12"><P class="p0 ft28">&nbsp;</P></TD>
	<TD class="tr16 td45"><P class="p0 ft28">&nbsp;</P></TD>
	<TD class="tr16 td51"><P class="p0 ft28">&nbsp;</P></TD>
	<TD class="tr16 td37"><P class="p0 ft28">&nbsp;</P></TD>
	<TD class="tr16 td170"><P class="p0 ft28">&nbsp;</P></TD>
	<TD class="tr16 td33"><P class="p0 ft28">&nbsp;</P></TD>
	<TD class="tr16 td99"><P class="p0 ft28">&nbsp;</P></TD>
	<TD class="tr16 td7"><P class="p0 ft28">&nbsp;</P></TD>
	<TD class="tr16 td97"><P class="p0 ft28">&nbsp;</P></TD>
	<TD colspan=5 rowspan=2 class="tr13 td194"><P class="p93 ft10">Código</P></TD>
	<TD class="tr16 td197"><P class="p0 ft28">&nbsp;</P></TD>
	<TD colspan=2 rowspan=2 class="tr29 td198"><P class="p41 ft0">68</P></TD>
	<TD rowspan=2 class="tr13 td99"><P class="p0 ft21">&nbsp;</P></TD>
	<TD class="tr16 td24"><P class="p0 ft28">&nbsp;</P></TD>
	<TD class="tr16 td11"><P class="p0 ft28">&nbsp;</P></TD>
	<TD class="tr16 td170"><P class="p0 ft28">&nbsp;</P></TD>
	<TD class="tr16 td171"><P class="p0 ft28">&nbsp;</P></TD>
</TR>
<TR>
	<TD class="tr6 td199"><P class="p41 ft5">67</P></TD>
	<TD class="tr6 td131"><P class="p0 ft39">&nbsp;</P></TD>
	<TD class="tr6 td15"><P class="p0 ft39">&nbsp;</P></TD>
	<TD class="tr6 td12"><P class="p0 ft39">&nbsp;</P></TD>
	<TD class="tr6 td12"><P class="p0 ft39">&nbsp;</P></TD>
	<TD class="tr6 td45"><P class="p0 ft39">&nbsp;</P></TD>
	<TD class="tr6 td51"><P class="p0 ft39">&nbsp;</P></TD>
	<TD class="tr6 td37"><P class="p0 ft39">&nbsp;</P></TD>
	<TD class="tr6 td170"><P class="p0 ft39">&nbsp;</P></TD>
	<TD class="tr6 td33"><P class="p0 ft39">&nbsp;</P></TD>
	<TD class="tr6 td99"><P class="p0 ft39">&nbsp;</P></TD>
	<TD class="tr6 td7"><P class="p0 ft39">&nbsp;</P></TD>
	<TD class="tr6 td200"><P class="p0 ft39">&nbsp;</P></TD>
	<TD class="tr6 td197"><P class="p0 ft39">&nbsp;</P></TD>
	<TD class="tr6 td24"><P class="p0 ft39">&nbsp;</P></TD>
	<TD class="tr6 td11"><P class="p0 ft39">&nbsp;</P></TD>
	<TD class="tr6 td170"><P class="p0 ft39">&nbsp;</P></TD>
	<TD class="tr6 td171"><P class="p0 ft39">&nbsp;</P></TD>
</TR>
<TR>
	<TD class="tr33 td111"><P class="p0 ft14">&nbsp;</P></TD>
	<TD class="tr31 td166"><P class="p0 ft57">&nbsp;</P></TD>
	<TD class="tr31 td131"><P class="p0 ft57">&nbsp;</P></TD>
	<TD class="tr31 td15"><P class="p0 ft57">&nbsp;</P></TD>
	<TD class="tr31 td12"><P class="p0 ft57">&nbsp;</P></TD>
	<TD class="tr31 td12"><P class="p0 ft57">&nbsp;</P></TD>
	<TD class="tr31 td45"><P class="p0 ft57">&nbsp;</P></TD>
	<TD class="tr31 td51"><P class="p0 ft57">&nbsp;</P></TD>
	<TD class="tr31 td37"><P class="p0 ft57">&nbsp;</P></TD>
	<TD class="tr31 td170"><P class="p0 ft57">&nbsp;</P></TD>
	<TD class="tr31 td33"><P class="p0 ft57">&nbsp;</P></TD>
	<TD class="tr31 td99"><P class="p0 ft57">&nbsp;</P></TD>
	<TD class="tr31 td7"><P class="p0 ft57">&nbsp;</P></TD>
	<TD class="tr31 td200"><P class="p0 ft57">&nbsp;</P></TD>
	<TD class="tr31 td24"><P class="p0 ft57">&nbsp;</P></TD>
	<TD class="tr31 td98"><P class="p0 ft57">&nbsp;</P></TD>
	<TD class="tr31 td45"><P class="p0 ft57">&nbsp;</P></TD>
	<TD class="tr31 td7"><P class="p0 ft57">&nbsp;</P></TD>
	<TD class="tr31 td17"><P class="p0 ft57">&nbsp;</P></TD>
	<TD class="tr31 td41"><P class="p0 ft57">&nbsp;</P></TD>
	<TD class="tr31 td133"><P class="p0 ft57">&nbsp;</P></TD>
	<TD class="tr31 td33"><P class="p0 ft57">&nbsp;</P></TD>
	<TD class="tr31 td99"><P class="p0 ft57">&nbsp;</P></TD>
	<TD class="tr31 td20"><P class="p0 ft57">&nbsp;</P></TD>
	<TD class="tr31 td29"><P class="p0 ft57">&nbsp;</P></TD>
	<TD class="tr31 td98"><P class="p0 ft57">&nbsp;</P></TD>
	<TD class="tr31 td26"><P class="p0 ft57">&nbsp;</P></TD>
	<TD class="tr31 td19"><P class="p0 ft57">&nbsp;</P></TD>
	<TD class="tr31 td24"><P class="p0 ft57">&nbsp;</P></TD>
	<TD class="tr31 td11"><P class="p0 ft57">&nbsp;</P></TD>
	<TD class="tr31 td170"><P class="p0 ft57">&nbsp;</P></TD>
	<TD class="tr31 td171"><P class="p0 ft57">&nbsp;</P></TD>
</TR>
<TR>
	<TD class="tr11 td11"><P class="p0 ft18">&nbsp;</P></TD>
	<TD class="tr11 td166"><P class="p0 ft18">&nbsp;</P></TD>
	<TD class="tr11 td131"><P class="p0 ft18">&nbsp;</P></TD>
	<TD class="tr11 td15"><P class="p0 ft18">&nbsp;</P></TD>
	<TD class="tr11 td12"><P class="p0 ft18">&nbsp;</P></TD>
	<TD class="tr11 td12"><P class="p0 ft18">&nbsp;</P></TD>
	<TD class="tr11 td45"><P class="p0 ft18">&nbsp;</P></TD>
	<TD class="tr11 td51"><P class="p0 ft18">&nbsp;</P></TD>
	<TD class="tr11 td37"><P class="p0 ft18">&nbsp;</P></TD>
	<TD colspan=5 class="tr11 td201"><P class="p0 ft18">&nbsp;</P></TD>
	<TD colspan=2 class="tr11 td34"><P class="p30 ft65"></P></TD>
	<TD colspan=3 class="tr11 td202"><P class="p29 ft65"> </P></TD>
	<TD class="tr11 td41"><P class="p94 ft65">  </P></TD>
	<TD class="tr11 td133"><P class="p0 ft18">&nbsp;</P></TD>
	<TD colspan=2 class="tr8 td113"><P class="p28 ft66"></P></TD>
	<TD class="tr8 td203"><P class="p18 ft66"></P></TD>
	<TD class="tr11 td29"><P class="p0 ft18">&nbsp;</P></TD>
	<TD class="tr11 td98"><P class="p0 ft18">&nbsp;</P></TD>
	<TD class="tr11 td26"><P class="p23 ft65"> </P></TD>
	<TD class="tr11 td19"><P class="p52 ft65"></P></TD>
	<TD class="tr11 td24"><P class="p29 ft65"></P></TD>
	<TD colspan=2 class="tr11 td171"><P class="p33 ft65"> </P></TD>
	<TD class="tr11 td171"><P class="p32 ft65"></P></TD>
</TR>
</TABLE>
</DIV>
</DIV>
</DIV>
<DIV id="id_2">
<P class="p95 ft1">Informações complementares e observações</P>
<P class="p96 ft4">Observações Adicionais</P>
</DIV>
<DIV id="id_3">
<DIV id="id_3_1">
<!--[if lte IE 7]><P style="margin-left:0px;margin-top:0px;margin-right:-318px;margin-bottom:0px;" class="p97 ft0"><![endif]--><!--[if gte IE 8]><P style="margin-left:-318px;margin-top:0px;margin-right:0px;margin-bottom:318px;" class="p97 ft0"><![endif]--><![if ! IE]><P style="margin-left:-159px;margin-top:159px;margin-right:-159px;margin-bottom:159px;" class="p97 ft0"><![endif]>Investigador</P>
</DIV>
<DIV id="id_3_2">
<P class="p98 ft10">Município/Unidade de Saúde</P>
<P class="p99 ft10">Nome</P>
<P class="p100 ft10">Dengue</P>
</DIV>
<DIV id="id_3_3">
<P class="p101 ft10">Cód. da Unid. de Saúde</P>
<TABLE cellpadding=0 cellspacing=0 class="t11">
<TR>
	<TD class="tr34 td204"><P class="p0 ft14">&nbsp;</P></TD>
	<TD class="tr34 td205"><P class="p102 ft13"> </P></TD>
	<TD class="tr34 td206"><P class="p28 ft13">   </P></TD>
</TR>
<TR>
	<TD class="tr13 td204"><P class="p2 ft10">Função</P></TD>
	<TD colspan=2 class="tr13 td207"><P class="p102 ft10">Assinatura</P></TD>
</TR>
<TR>
	<TD rowspan=2 class="tr35 td204"><P class="p0 ft10">Sinan NET / Sinan <SPAN class="ft59">Online</SPAN></P></TD>
	<TD class="tr36 td205"><P class="p103 ft10">SVS</P></TD>
	<TD class="tr36 td206"><P class="p41 ft10">21/01/2011</P></TD>
</TR>
<TR>
	<TD class="tr17 td205"><P class="p0 ft33">&nbsp;</P></TD>
	<TD class="tr17 td206"><P class="p0 ft33">&nbsp;</P></TD>
</TR>
</TABLE>
</DIV>
</DIV>
</DIV>
</BODY>
</HTML>
