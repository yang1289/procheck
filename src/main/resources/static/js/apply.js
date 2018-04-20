function addUser(rownum) {
    var td=$("#user_"+rownum).find("td").eq(-1).html("");
    console.log(td);
    rownum++;
    var row=$("#user");
    row.append('<tr id="user_'+rownum+'">' +
                '<td><input type="text" name="applyusers['+rownum+'].applyName" class="form-control" value=""/></td>' +
                '<td><input type="text" name="applyusers['+rownum+'].applyMajor" class="form-control" value=""/></td>'+
                '<td><input type="text" name="applyusers['+rownum+'].applyNumber" class="form-control" value=""/></td>'+
                '<td><input type="text" name="applyusers['+rownum+'].applyGrade" class="form-control" value=""/></td>'+
                '<td><button class="btn btn-info" onclick="addUser('+rownum+')" type="button"><i class="glyphicon glyphicon-plus"></i></button>'+
                ' <button class="btn btn-warning" onclick="deleteUser('+rownum+')" type="button"><i class="glyphicon glyphicon-minus"></i></button></td>'+
                '</tr>');

}

function deleteUser(rownum){
    var tr=$("#user_"+rownum).remove();
    rownum--;
    if(rownum==0){
        $("#user_"+rownum).find("td").eq(-1).html('<button class="btn btn-info" onclick="addUser('+rownum+')" type="button"><i class="glyphicon glyphicon-plus"></i></button>'+
            ' <button class="btn btn-warning" type="button"><i class="glyphicon glyphicon-minus"></i></button>')
    }else{
        $("#user_"+rownum).find("td").eq(-1).html('<button class="btn btn-info" onclick="addUser('+rownum+')" type="button"><i class="glyphicon glyphicon-plus"></i></button>'+
            ' <button class="btn btn-warning" onclick="deleteUser('+rownum+')" type="button"><i class="glyphicon glyphicon-minus"></i></button>')
    }

}
function addProgressPlan(rownum) {
    var td=$("#progressplan_"+rownum).find("td").eq(-1).html("");
    console.log(td);
    rownum++;
    var row=$("#progressplan");
    row.append('<tr id="progressplan_'+rownum+'">' +
        '<td><input type="text" name="progressPlans['+rownum+'].time" class="form-control dateTime" readonly  value=""/></td>' +
        '<td><input type="text" name="progressPlans['+rownum+'].event" class="form-control" value=""/></td>'+
        '<td><input type="text" name="progressPlans['+rownum+'].remark" class="form-control" value=""/></td>'+
        '<td><button class="btn btn-info" onclick="addProgressPlan('+rownum+'),dateTime()" type="button"><i class="glyphicon glyphicon-plus"></i></button>'+
        ' <button class="btn btn-warning" onclick="deleteProgressPlan('+rownum+')" type="button"><i class="glyphicon glyphicon-minus"></i></button></td>'+
        '</tr>');

}

function deleteProgressPlan(rownum) {
    var tr=$("#progressplan_"+rownum).remove();
    rownum--;
    if(rownum==0){
        $("#progressplan_"+rownum).find("td").eq(-1).html('<button class="btn btn-info" onclick="addProgressPlan('+rownum+'),dateTime()" type="button"><i class="glyphicon glyphicon-plus"></i></button>'+
            ' <button class="btn btn-warning" type="button"><i class="glyphicon glyphicon-minus"></i></button>')
    }else{
        $("#progressplan_"+rownum).find("td").eq(-1).html('<button class="btn btn-info" onclick="addProgress('+rownum+')" type="button"><i class="glyphicon glyphicon-plus"></i></button>'+
            ' <button class="btn btn-warning" onclick="deleteProgressPlan('+rownum+')" type="button"><i class="glyphicon glyphicon-minus"></i></button>')
    }
}
function addExpenditure(rownum) {
    var td=$("#expenditure_"+rownum).find("td").eq(-1).html("");
    console.log(td);
    rownum++;
    var row=$("#expenditure");
    row.append('<tr id="expenditure_'+rownum+'">' +
        '<td><input type="text" name="expenditures['+rownum+'].description" class="form-control" value=""/></td>' +
        '<td><input type="number" name="expenditures['+rownum+'].money" class="form-control" value="0" /></td>'+
        '<td><input type="text" name="expenditures['+rownum+'].remark" class="form-control" value=""/></td>'+
        '<td><button class="btn btn-info" onclick="addExpenditure('+rownum+')" type="button"><i class="glyphicon glyphicon-plus"></i></button>'+
        ' <button class="btn btn-warning" onclick="deleteExpenditure('+rownum+')" type="button"><i class="glyphicon glyphicon-minus"></i></button></td>'+
        '</tr>');

}

function deleteExpenditure(rownum) {
    var tr=$("#expenditure_"+rownum).remove();
    rownum--;
    if(rownum==0){
        $("#expenditure_"+rownum).find("td").eq(-1).html('<button class="btn btn-info" onclick="addExpenditure('+rownum+')" type="button"><i class="glyphicon glyphicon-plus"></i></button>'+
            ' <button class="btn btn-warning" type="button"><i class="glyphicon glyphicon-minus"></i></button>')
    }else{
        $("#expenditure_"+rownum).find("td").eq(-1).html('<button class="btn btn-info" onclick="addExpenditure('+rownum+')" type="button"><i class="glyphicon glyphicon-plus"></i></button>'+
            ' <button class="btn btn-warning" onclick="deleteExpenditure('+rownum+')" type="button"><i class="glyphicon glyphicon-minus"></i></button>')
    }
}

function saveUsers() {
    $("#save_modal").modal("show");
}

function saveBase() {
    var ok=true;
    var projectname=$("#projectName").val();
    var adviser=$("#adviser").val();
    var jobtitle=$("#jobTitle").val();
    var libname=$("#libName").val();
    var teachunit=$("#teachUnit").val();
    if(projectname.length==0){
        $("#message").html("<div class='alert alert-warning' role='alert'>项目名称不能为空</div>")
        ok=false;
    }
    if(ok){
        $("#save_modal").modal("show");
    }else{
        $("#save_modal").modal("hide");
    }
}

function saveStep3(){
    var searchCondition=$("#searchCondition").val();
    var searchPlan=$("#searchPlan").val();
    var createPoint=$("#createPoint").val();
    var searchConditionSupport=$("#searchConditionSupport").val();
    var achievementMethod=$("#achievementMethod").val();
    var ok=true;
    // if(searchCondition.length==0){
    //     $("#message").html("<div class='alert alert-warning' role='alert'>研究现状不能为空</div>");
    //     ok=false;
    // }
    // if(searchPlan.length==0){
    //     $("#message").html("<div class='alert alert-warning' role='alert'>研究方案不能为空</div>");
    //     ok=false;
    // }
    // if(createPoint.length==0){
    //     $("#message").html("<div class='alert alert-warning' role='alert'>创新点不能为空</div>");
    //     ok=false;
    // }
    // if(searchConditionSupport.length==0){
    //     $("#message").html("<div class='alert alert-warning' role='alert'>研究工作的条件保障不能为空</div>");
    //     ok=false;
    // }
    // if(achievementMethod.length==0){
    //     $("#message").html("<div class='alert alert-warning' role='alert'>拟提供成果及成果形式不能为空</div>");
    //     ok=false;
    // }
    if(ok){
        $("#save_modal").modal("show");
    }else{
        $("#save_modal").modal("hide");
    }
}

function saveStep4(){
    $("#save_modal").modal("show");
}

function saveStep5(){
    $("#save_modal").modal("show");
}