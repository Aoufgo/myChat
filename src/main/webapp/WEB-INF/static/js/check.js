$(function (){
    //为表单添加提交事件
    $("form").submit(function (){

        //对表单数据验证
        //验证用户名
        var userName= checkusename();
        console.log(userName)
        //验证密码
        var userPassword=checkusepassword();
        console.log(userPassword)
        //验证手机号
        var userPhone=checkuserPhone();
        console.log(userPhone)
        //如果用户名和密码都验证通过，提交表单
        if (userName && userPassword && userPhone){
            return true;
        }else{
            //拦截表单数据的提交
            return false;
        }

    });


    //验证管理员名称   只能为字母，数字，中文，至少为4位最多10位
    function checkusename(){
        //获取管理员文本框内容
        var userName= $("#userName").val().trim();
        if (userName==""){
            $("#msg").html("名称不能为空").css("color","red");
            return false;
        }
        //只能为字母，数字，中文，至少为4位最多10位
        var reg=/^[A-z0-9\u4e00-\u9fa5]{2,10}$/;
        if (!reg.test(userName)){
            $("#msg").html("只能为字母，数字，中文，至少为2位最多10位").css("color","red")
            return false;
        }

        var f;//记录ajax请求校验的结果
        $.ajax({
            //配置请求路径
            url:"user",
            //请求方式 get  post
            type:"get",
            //请求参数 data  携带数据 json字符串: {键:值，键:值}
            data :{"method":"checkUsers","userName":userName},
            //请求成功,回调success函数 在函数中定义参数，接受服务器响应的内容
            success:function (resp){
                if (resp=="true"){
                    $("#msg").html("名称已存在，请重新输入");
                    $("#msg").css("color","red");
                    f=false;
                }else {
                    $("#msg").html("名称可以使用")
                    $("#msg").css("color","green")
                    f=true;
                }
            },
            async : false,     //设置是否为异步  ture:异步 false:同步
            //请求失败，回调error函数
            error:function (){
            }
        });
        //表示验证通过
        return f;



    }

    //验证密码  字母，数字 8-15位
    function checkusepassword(){
        //获取输入的密码
        var userPassword=$("#userPassword").val();

        if (userPassword==""){
            $("#msg1").html("密码不能为空").css("color","red");
            return false;
        }

        var reg=/^[A-z0-9]{8,15}$/;
        if (!reg.test(userPassword)){
            $("#msg1").html("密码只能为字母，数字，至少为8位最多15位").css("color","red");
            return false;
        }
        $("#msg1").html("密码可用").css("color","green");
        return true;
    }

    //验证两次密码是否一致
    function checkPassEqual(){
        var userPassword = $("#userPassword").val();
        var userPassword2 = $("#userPassword2").val();
        if (userPassword2 == ''){
            $("#msg3").html("两次密码不一致").css("color","red");
            return false;
        }if (userPassword != userPassword2) {
            $("#msg3").html("密码不一致").css("color", "red");
            return false;
        }
        $("#msg3").html("密码一致").css("color","green");
        return true;
    }

    //验证手机号 第一位只能为1，总位数为11位，第二位 3，4，5，6，7，8，9
    function checkuserPhone(){
        //获取输入的手机号
        var userPhone= $("#userPhone").val();
        if (userPhone==""){
            $("#msg2").html("手机号不能为空").css("color","red");
            return false;
        }
        var reg=/^1[3-9][0-9]{9}$/;
        if (!reg.test(userPhone)){
            $("#msg2").html("手机号格式不正确，请重新输入").css("color","red");
            return false;
        }
        $("#msg2").html("");
        return true;
    }

    //为管理员文本框添加改变事件
    $("#userName").blur(function (){
        checkusename()
    })
    //为密码框添加失去焦点事件
    $("#userPassword").blur(function (){
        checkusepassword()
    })
    $("#userPassword2").blur(function (){
        checkPassEqual()
    })
    //为手机号框添加改变事件
    $("#userPhone").change(function (){
        checkuserPhone()
    })
});