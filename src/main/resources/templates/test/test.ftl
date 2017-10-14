<#include "common/layer.ftl">
<@head page_title="角色配置"/>
<@css>
<link href="/static/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/codemirror/5.25.0/codemirror.min.css">
<link href="/static/froala_editor/css/froala_editor.pkgd.min.css" rel="stylesheet" type="text/css" />
<link href="/static/froala_editor/css/themes/gray.min.css" rel="stylesheet" type="text/css" />
<link href="/static/froala_editor/css/froala_style.min.css" rel="stylesheet" type="text/css" />
</@css>
<@js>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/codemirror/5.25.0/codemirror.min.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/codemirror/5.25.0/mode/xml/xml.min.js"></script>

<!-- Include Editor JS files. -->
<script type="text/javascript" src="/static/froala_editor/js/froala_editor.pkgd.min.js"></script>
<script type="text/javascript" src="/static/froala_editor/js/languages/zh_cn.js"></script>
</@js>
<@body>
<div class="row">
    <#include "common/left_menu.ftl"/>
    <@left_menu/>
    <div id="content" class="col-lg-10 col-sm-10">
        <div>
            <ul class="breadcrumb">
                <li>
                    <a href="/index">主页</a>
                </li>
                <li>
                    <a href="/project/edit">修改项目</a>
                </li>
                <li>
                    <a href="/project/applystep1?method=edit">步骤一</a>
                </li>
                <li>
                    <a href="/project/applystep2?method=edit">步骤二</a>
                </li>
                <li>
                    <a href="/project/applystep3?method=edit">步骤三</a>
                </li>
                <li>
                    <a href="/project/applystep4?method=edit">步骤四</a>
                </li>
                <li>
                    <a href="/project/applystep5?method=edit">步骤五</a>
                </li>
            </ul>
        </div>
        <script src="/static/js/apply.js" type="text/javascript"></script>
        <div id="alert"><div class="alert alert-warning" role="alert"></div></div>
        <div id="froala_editor">

        </div>

        <script>
            $(function(){
                $("#froala_editor").froalaEditor({
                    language:'zh_cn',
                    toolbarButtons: ['fullscreen', 'bold', 'italic', 'underline', 'strikeThrough', 'subscript', 'superscript', '|', 'fontFamily', 'fontSize', 'color', 'inlineStyle', 'paragraphStyle', '|', 'paragraphFormat', 'align', 'formatOL', 'formatUL', 'outdent', 'indent', 'quote', '-', 'insertLink', 'insertTable', '|', 'emoticons', 'specialCharacters', 'insertHR', 'selectAll', 'clearFormatting', '|', 'print', 'help', 'html', '|', 'undo', 'redo'],
                })
            })
        </script>
        <!-- content ends -->
    </div><!--/#content.col-md-0-->
</div><!--/fluid-row-->
</@body>