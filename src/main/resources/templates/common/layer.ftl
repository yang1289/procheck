<#macro html page_title page_tab="">
<!DOCTYPE html>
<html lang="zh-CN">

<head>
    <!--
        ===
        This comment should NOT be removed.

        Charisma v2.0.0

        Copyright 2012-2014 Muhammad Usman
        Licensed under the Apache License v2.0
        http://www.apache.org/licenses/LICENSE-2.0

        http://usman.it
        http://twitter.com/halalit_usman
        ===
    -->
    
    <meta charset="utf-8">
    <title>${page_title}</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="Charisma, a fully featured, responsive, HTML5, Bootstrap admin template.">
    <meta name="author" content="Muhammad Usman">

    <!-- The styles -->
    <link href="/static/css/bootstrap-cerulean.min.css" rel="stylesheet">
    
    <link href="/static/css/charisma-app.css" rel="stylesheet">
    <link href='/static/css/fullcalendar/fullcalendar.css' rel='stylesheet'>
    <link href='/static/css/fullcalendar/fullcalendar.print.css' rel='stylesheet' media='print'>
    
    <link href='/static/css/chosen/chosen.min.css' rel='stylesheet'>
    <link href='/static/css/colorbox/colorbox.css' rel='stylesheet'>
    <link href='/static/css/responsive-tables/responsive-tables.css' rel='stylesheet'>
    <link href='/static/css/bootstrap-tour/bootstrap-tour.min.css' rel='stylesheet'>
    <link href='/static/css/jquery.noty.css' rel='stylesheet'>
    <link href='/static/css/noty_theme_default.css' rel='stylesheet'>
    <link href='/static/css/elfinder.min.css' rel='stylesheet'>
    <link href='/static/css/elfinder.theme.css' rel='stylesheet'>
    <link href='/static/css/jquery.iphone.toggle.css' rel='stylesheet'>
    <link href='/static/css/uploadify.css' rel='stylesheet'>
    <link href='/static/css/animate.min.css' rel='stylesheet'>

    <!-- jQuery -->
    <script src="/static/js/jquery.min.js"></script>

    <!-- The HTML5 shim, for IE6-8 support of HTML5 elements -->
    <!--[if lt IE 9]>
    <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
    <![endif]-->

    <!-- The fav icon 
    <link rel="shortcut icon" href="img/favicon.ico">-->
    <!-- external javascript -->

    <script src="/static/js/bootstrap.min.js"></script>

    <!-- library for cookie management -->
    <script src="/static/js/jquery.cookie.js"></script>

    <!-- calender plugin -->
    <script src='/static/js/moment/moment.min.js'></script>
    <script src='/static/js/fullcalendar/fullcalendar.min.js'></script>

    <!-- select or dropdown enhancer -->
    <script src="/static/js/chosen/chosen.jquery.min.js"></script>

    <!-- notification plugin -->
    <script src="/static/js/jquery.noty.js"></script>

    <!-- autogrowing textarea plugin -->
    <script src="/static/js/jquery.autogrow-textarea.js"></script>

    <!-- plugin for gallery image view -->
    <script src="/static/js/colorbox/jquery.colorbox-min.js"></script>

    <!-- data table plugin -->
    <script src='/static/js/jquery.dataTables.min.js'></script>

    <!-- library for making tables responsive -->
    <script src="/static/js/responsive-tables/responsive-tables.js"></script>

    <!-- history.js for cross-browser state change on ajax -->
    <script src="/static/js/jquery.history.js"></script>

    <!-- star rating plugin -->
    <script src="/static/js/jquery.raty.min.js"></script>

    <!-- multiple file upload plugin -->
    <script src="/static/js/jquery.uploadify-3.1.min.js"></script>

    <!-- for iOS style toggle switch -->
    <script src="/static/js/jquery.iphone.toggle.js"></script>

    <!-- application script for Charisma demo -->
    <script src="/static/js/charisma.js"></script>

</head>

<body>
<#include "./header.ftl">
<@header page_tab=page_tab/>
<div class="ch-container">
	<#nested/>
	
	
<#include "./footer.ftl"/>
<@footer/>
</div>





</body>
</html>
</#macro>