var host,policyBase64,accessid,signature,expire,key,secret,dir;
var xmlhttp=new XMLHttpRequest();
function getPolicy() {
    xmlhttp.open("GET","/aliyunoss/policy",false);
    xmlhttp.send(null);
    var obj = eval ("(" + xmlhttp.responseText+ ")");
    host = obj['host']
    policyBase64 = obj['policy']
    accessid = obj['accessid']
    signature = obj['signature']
    expire = parseInt(obj['expire'])
    key = obj['dir']
    secret=obj['secret']
}
function upload_handler(blobInfo,success,failure) {
    var now  = Date.parse(new Date()) / 1000;
    if(expire<now+3||!expire){
        getPolicy()
    }
    var formdata;
    console.log(blobInfo.filename());
    formdata = new FormData();

    formdata.append('OSSAccessKeyId', accessid);
    formdata.append('policy', policyBase64);
    formdata.append('signature', signature);
    formdata.append('key', key+"/"+blobInfo.filename());
    formdata.append('success_action_status', "200");
    formdata.append('file', blobInfo.blob());
    $.ajax({
        url:host,
        data:formdata,
        processData: false,//默认true，设置为 false，不需要进行序列化处理
        cache: false,//设置为false将不会从浏览器缓存中加载请求信息
        async: false,//发送同步请求
        contentType: false,//避免服务器不能正常解析文件---------具体的可以查下这些参数的含义
        type:"POST",
        success:function (data,textStatus,request) {
            success(host+"/"+key+"/"+blobInfo.filename());
        }
    })
}
