<#include "./common/layer.ftl">
<@head page_title="首页"/>
<@css></@css>
<@js></@js>
<@body>
 <div class="row">
 	<#include "./common/left_menu.ftl"/>
 	<@left_menu/>
	<div id="content" class="col-lg-10 col-sm-10">
	    <!-- content starts -->
			<div>
				<ul class="breadcrumb">
					<li>
						<a href="/index">主页</a>
					</li>

				</ul>
			</div>

			<#if role=="student">
				<div class="row">
					<div class="col-md-3 col-sm-3 col-xs-6">
						<a data-toggle="tooltip" title="${applying!}正在申请中" class="well top-block" href="/project/applying">
							<i class="glyphicon glyphicon-user blue"></i>
							<div>申请中</div>
							<span class="notification">${applying!}</span>
						</a>
					</div>
					<div class="col-md-3 col-sm-3 col-xs-6">
						<a data-toggle="tooltip" title="${success!}申请成功" class="well top-block" href="/project/success">
							<i class="glyphicon glyphicon-user blue"></i>
							<div>申请成功</div>
							<span class="notification">${success!}</span>
						</a>
					</div>
				</div>
			</#if>
			<#if role=="adviser"||role=="fpgroup"||role=="cpgroup">
				<div class="row">
					<div class="col-md-3 col-sm-3 col-xs-6">
						<a data-toggle="tooltip" title="${check!}个需要审核" class="well top-block" href="/project/checklist">
							<i class="glyphicon glyphicon-th-list blue"></i>
							<div>需审核</div>
							<span class="notification">${check!}</span>
						</a>
					</div>
				</div>
			</#if>
			<#if role=="dsoAdmin">
				<div class="row">
					<div class="col-md-3 col-sm-3 col-xs-6">
						<a data-toggle="tooltip" title="${check!}个需要审核" class="well top-block" href="/project/checklist">
							<i class="glyphicon glyphicon-th-list blue"></i>
							<div>需审核</div>
							<span class="notification">${check!}</span>
						</a>
					</div>
                    <div class="col-md-3 col-sm-3 col-xs-6">
                        <a data-toggle="tooltip" title="${publish!}个需要发布" class="well top-block" href="/project/publish">
                            <i class="glyphicon glyphicon-th-list blue"></i>
                            <div>需发布</div>
                            <span class="notification">${publish!}</span>
                        </a>
                    </div>
				</div>
			</#if>
			<#if role=="visitor">
			    <p>欢迎访问项目审核系统</p>
			</#if>


		</div>
 	</div>
 <!-- content ends -->
 </div>
 </@body>