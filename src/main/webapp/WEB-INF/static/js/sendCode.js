var count=60;//倒计时
var i;

//倒计时方法
function countDown() {
    count--;
    //设置按钮文字为:59秒后再次发送
    $("#sendCode").html(count);
    //计时为0时，结束计时器
    if (count<=0){
        //设置按钮可以被点击
        $("#sendCode").html("发送");
        $("#sendCode").attr("disabled",false);
        clearInterval(i)
    }
}
$(function (){
    //为发送验证码的按钮添加点击事件
    $("#sendCode").click(function (){
        //获取手机号
        var userPhone= $("#userPhone").val();
        if (userPhone!==""){
            //向服务器发送请求，让服务器向获取的手机号发送验证码
            $.ajax({
                url : "user/sendCode",
                type: "post",
                data:{"userPhone":userPhone},
                success : function (resp){
                    console.log(resp)//响应的结果位json字符串
                    //将json字符串转换为json对象
                    var json= JSON.parse(resp);
                    var result= json.result;
                    if (result===false)
                        layer.msg("发送失败",{icon:2})
                    else {
                        layer.msg("发送成功",{icon:1})
                        //设置按钮不能被点击
                        $("#sendCode").attr("disabled",true);
                        //计时器
                        //setInterval(code,time):code执行的语句  time:间隔的时间
                        i= setInterval("countDown()",1000);
                    }
                },
                error:function () {
                    layer.msg("请求失败",{icon:2})
                }
            })


        }else {
            layer.msg("请输入手机号!")
        }
    })

})