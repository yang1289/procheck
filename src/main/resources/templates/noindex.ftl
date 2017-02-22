<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="author" content="fyunli">

    
    <title>Task Manager | Home</title>
	<link href="static/css/bootstrap.min.css" rel="stylesheet">

    <!-- Bootstrap core CSS -->
    

   <!--[if lt IE 9]>
		<script src="static/js/html5shiv.min.js"></script>
		<script src="static/js/respond.min.js"></script>
	<![endif]-->
</head>

<body>

<div role="navigation">
		<div class="navbar navbar-inverse">
			<a href="/" class="navbar-brand">Procheck</a>
			<div class="navbar-collapse collapse">
				<ul class="nav navbar-nav">
					<li><a href="new-task">New task</a></li>
					<li><a href="all-tasks">All tasks</a></li>
				</ul>
			</div>
		</div>
</div>

<div class="container text-center" id="taskDiv">
		<h3>My Task</h3>
		<br />
		
			<#if mode=='MODE_HOME'>
				<div class="jumbotron text-center">
					<h1>Welcome to task manager</h1>
				</div>
			<#elseif mode=='MODE_TASK'>
			
				<div class="table-responsive">
					<table class="table table-striped table-bordered">
						<thead>
							<tr>
								<th>id</th>
								<th>Name</th>
								<th>Description</th>
								<th>data created</th>
								<th>Finished</th>
								<th></th>
								<th></th>
							</tr>
						</thead>
						<tbody>
							<#list tasks as task>
								<tr>
									<td>${task.id}</td>
									<td>${task.name}</td>
									<td>${task.description}</td>
									<td>${task.dataCreated?string("yyyy-MM-dd HH:mm:ss")} </td>
									<td>${task.finished?c}</td>
									<td><a href="update-task?id=${task.id}"><span
											class="glyphicon glyphicon-pencil"></span></a></td>
									<td><a href="delete-task?id=${task.id}"><span
											class="glyphicon glyphicon-trash"></span></a></td>
								</tr>
							</#list>
						</tbody>
					</table>
				</div>
			<#elseif mode=='MODE_NEW'||mode=='MODE_UPDATE'>
			
				<div class="container text-center">
					<h3>Manage Task</h3>
					<hr>
					<form class="form-horizontal" method="POST" action="save-task">
						<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
						<input type="hidden" name="id" value="<#if task??>${task.id}</#if>" />
						<div class="form-group">
							<label class="control-label col-md-3">Name</label>
							<div class="col-md-7">
								<input type="text" class="form-control" name="name"
									value="<#if task??>${task.name}</#if>" />
							</div>
						</div>
						<div class="form-group">
							<label class="control-label col-md-3">Description</label>
							<div class="col-md-7">
								<input type="text" class="form-control" name="description"
									value="<#if task??>${task.description}</#if>" />
							</div>
						</div>
						<div class="form-group">
							<label class="control-label col-md-3">Finished</label>
							<div class="col-md-7">
								<input type="radio" class="col-sm-1" name="finished"
									value="true"<#if task??><#if task.finished>checked</#if></#if> />
								<div class="col-sm-1">Yes</div>
								<input type="radio" class="col-sm-1" name="finished"
									value="false" <#if task??><#if !task.finished&&task??>checked</#if></#if>/>
								<div class="col-sm-1">No</div>
							</div>
						</div>
						<div class="form-group">
							<input type="submit" class="btn btn-primary" value="Save" />
						</div>
					</form>
				</div>
			<#else>
				no Message
			</#if>
		

	

	<script src="static/js/jquery-3.1.1.min.js"></script>
	<script src="static/js/bootstrap.min.js"></script>
</body>
</html>