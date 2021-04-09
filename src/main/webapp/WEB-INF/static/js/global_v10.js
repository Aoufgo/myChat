;(function($){

/*鐢ㄦ埛淇℃伅鍙橀噺*/
var userInfo;

/*鐢ㄦ埛鍥炲～鏁版嵁甯愬彿鍙橀噺*/
var userDataUin = {"sc":0,"pl":0,"xx":0,"gr":0};

/*鎴戠殑娑堟伅褰撳墠璇锋眰鏈€鍚庝竴鏉℃暟鎹椂闂�*/
var lastTime = 0;

/*鍒ゆ柇鏄惁涓篒E*/
var isIE6 = /msie 6/i.test(navigator.userAgent),
  isIE7 = /msie 7/i.test(navigator.userAgent),
  isIE8 = /msie 8/i.test(navigator.userAgent);

/*鏈湴瀛樺偍*/
window.QQ = {};
QQ.localData = {
  userData: null,
  name: location.hostname,
  isLocalStorage: typeof localStorage == 'undefined'?false:true,
  init: function(){
      if (!this.userData) {
          try {
              this.userData = document.createElement('INPUT');
              this.userData.type = "hidden";
              this.userData.style.display = "none";
              this.userData.addBehavior ("#default#userData");
              document.body.appendChild(this.userData);
              var expires = new Date();
              expires.setDate(expires.getDate()+365);
              this.userData.expires = expires.toUTCString();
          } catch(e) {
              return false;
          }
      }
      return true;
  },
  set: function(key, value) {
      if(this.isLocalStorage){
          localStorage.setItem(key, value);
      }
      else if(this.init()){
          this.userData.load(this.name);
          this.userData.setAttribute(key, value);
          this.userData.save(this.name);
      }
  },
  get: function(key) {
      if(this.isLocalStorage){
          return localStorage.getItem(key);
      }
      else if(this.init()){
          this.userData.load(this.name);
          return this.userData.getAttribute(key)
      }
      return null;
  },
  remove: function(key) {
      if(this.isLocalStorage){
          localStorage.removeItem(key);
      }
      else if(this.init()){
          this.userData.load(this.name);
          this.userData.removeAttribute(key);
          this.userData.save(this.name);
      }
  }
};
QQ.Cookie={
  set:function(name,value,expires,path,domain){
      if(typeof expires=="undefined"){
          expires=new Date(new Date().getTime()+3600*1000);
      }
      document.cookie=name+"="+escape(value)+((expires)?"; expires="+expires.toGMTString():"")+((path)?"; path="+path:"; path=/")+((domain)?";domain="+domain:"");
  },
  get:function(name){
      var arr=document.cookie.match(new RegExp("(^| )"+name+"=([^;]*)(;|$)"));
      if(arr!=null){
          return unescape(arr[2]);
      }
      return null;
  },
  clear:function(name,path,domain){
      if(this.get(name)){
          document.cookie=name+"="+((path)?"; path="+path:"; path=/")+((domain)?"; domain="+domain:"")+";expires=Fri, 02-Jan-1970 00:00:00 GMT";
      }
  }
};

/*鑾峰彇URL涓殑鍙傛暟鍊�*/
var getQueryString = function(name){
  var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)", "i");
  var r = window.location.search.substr(1).match(reg);
  if (r != null) return unescape(r[2]); return null;
};

/*鑾峰彇鏃堕棿涓枃*/
var getTimeCN = function(ct,st){
  var serverTime  = new Date(st),//鏈嶅姟鍣ㄦ椂闂存埑
      conTime = new Date(ct),//鍐呭鏃堕棿
      time = 0;//鏃堕棿宸€�

  if(serverTime < conTime){
      return conTime;        
  };

  time = serverTime - conTime;
  if(time < 1000) return "\u521a\u521a";

  if(time > 86400){        
      var day = parseInt(time / (24 * 60 * 60));        
      if (day == 1){
          return "\u6628\u5929(" + conTime.getHours() + ":" + conTime.getMinutes() + ")";
      }else if (day < 30){
          return day + "\u5929\u524d";
      }else if (day < 360){
          var moth = parseInt(day / 30);
          return moth + "\u4e2a\u6708\u524d";
      }else{
          var year = parseInt(day / 360);      
          return year + "\u5e74\u524d";
      }
  }else if(time > 3600){
      var hour = parseInt(time / (60 * 60));
      return hour + "\u5c0f\u65f6\u524d";
  }else if(time > 60){
      var hour = parseInt(time / 60);
      return hour + "\u5206\u949f\u524d";
  }else{
      return time + "\u79d2\u524d";
}
};

/*鍏叡妯″潡*/
var userMod = function(img, name){//鐢ㄦ埛妯″潡
  var _userImg = $("#userImg"),
      _userNick = $("#userNick");
  _userImg.find("img").attr("src", img);
  _userNick.html(name + "<span></span>");
};
var navDw = function(){//瀵艰埅瀹氫綅
  var _id = document.getElementById("navMod"),
      _li = _id.getElementsByTagName("li");

  function navNow(i){        
    _li[i].className = "now";
  };

  //鎴戠殑鏀惰棌 
  // if(getQueryString("type") == null || getQueryString("type") == "Like"){
  //     navNow(0);
  //     $("#iLike").show();
  //     ExposureBoss(1604,'user_sc');//鎴戠殑鏀惰棌_鏇濆厜
  //     return false;
  // };

  //鎴戠殑璇勮
  if(getQueryString("type") == null || getQueryString("type") == "Comment"){
      navNow(0);
      $("#iComment").show();
      ExposureBoss(1604,'user_pl');//鎴戠殑璇勮_鏇濆厜
      return false;
  };

  //鎴戠殑娑堟伅
  if(getQueryString("type") == "News"){
      navNow(1);
      $("#iNews").show();
      ExposureBoss(1604,'user_xx');//鎴戠殑娑堟伅_鏇濆厜
      return false;
  };

  //涓汉璁剧疆
  if(getQueryString("type") == "Setup"){
      navNow(2);
      $("#iSetup").show();
      ExposureBoss(1604,'user_sz');//涓汉璁剧疆_鏇濆厜
      return false;
  };

  window.location.href = "//ilike.qq.com/index.htm";//涓婄嚎鏃舵敼涓篿ndex
};
var navJh = function(){//瀵艰埅浜や簰
  var _id = $("#navMod");

  _id.find(".now").attr("data-now","now");

  _id.find("li").each(function(idx){
      $(this).mouseenter(function(){
          _id.find(".now").removeClass("now");
          $(this).addClass("now");
      }).mouseleave(function(){
          $(this).removeClass("now");
      }).click(function(){
          if($(this).attr("data-now") == "now"){
              return false;
          };

          _id.find("li[data-now=now]").attr("data-now","");

          $(this).addClass("now").attr("data-now","now");

          $("#conBox > div").hide();
          $("#i" + $(this).attr("data-type")).show();

          if($(this).attr("data-type") == "Like"){
              //椤甸潰杩涘叆鍒ゆ柇鏄惁鐧诲綍
              //鏈櫥褰�
              if (!LoginHL.isLogin()) {
                  return false;
              }

              scConShow();

              registerZone2({bossZone:'usr_sctit'},1);//鎴戠殑鏀惰棌_鐐瑰嚮
              ExposureBoss(1604,'user_sc');//鎴戠殑鏀惰棌_鏇濆厜

              return false;
          };

          if($(this).attr("data-type") == "Comment"){
              //椤甸潰杩涘叆鍒ゆ柇鏄惁鐧诲綍
              //鏈櫥褰�
              if (!LoginHL.isLogin()) {
                  return false;
              }

              plConShow();

              registerZone2({bossZone:'usr_pltit'},1);//鎴戠殑璇勮_鐐瑰嚮
              ExposureBoss(1604,'user_pl');//鎴戠殑璇勮_鏇濆厜

              return false;
          };            

          if($(this).attr("data-type") == "News"){ 
              //椤甸潰杩涘叆鍒ゆ柇鏄惁鐧诲綍
              //鏈櫥褰�
              if (!LoginHL.isLogin()) {
                  return false;
              }

              xxConShow();

              registerZone2({bossZone:'usr_xxtit'},1);//鎴戠殑娑堟伅_鐐瑰嚮
              ExposureBoss(1604,'user_xx');//鎴戠殑娑堟伅_鏇濆厜

              return false;
          };

          if($(this).attr("data-type") == "Setup"){
              //椤甸潰杩涘叆鍒ゆ柇鏄惁鐧诲綍
              //鏈櫥褰�
              console.log('!LoginHL.isLogin()',!LoginHL.isLogin())
              if (!LoginHL.isLogin()) {
                  return false;
              }
            //   console.log('ss')
            //   console.log(userInfo)
              if (LoginHL.cookie('qq_openid') && userInfo.figureurl_2 && figureurl_2.nickname) {
                  grConShow(LoginHL.cookie('qq_openid'), userInfo.figureurl_2, userInfo.nickname);
              }

              registerZone2({bossZone:'usr_sztit'},1);//涓汉璁剧疆_鐐瑰嚮
              ExposureBoss(1604,'user_sz');//涓汉璁剧疆_鏇濆厜

              return false;
          };

      });
  });

  _id.mouseleave(function(){               
      _id.find("li[data-now=now]").addClass("now");                                          
  });
};
// 浠婃棩濂芥枃
var todayGoodArt = function(_url, ID) {
  var _ID = $("#" + ID),
      HTML = "";
  $.ajax({
      type:"GET",
      url:_url,
      dataType:"jsonp",
      success:function(DATA){                 
          if(DATA.code != 0){return false;};
          HTML = "<ul>" + liData(DATA) + "</ul>";
          function liData(DATA){                  
              var _HTML = "";
              $.each(DATA.data, function(idx){
                  _HTML = _HTML + 
                  '<li>' +
                      '<span class="con"><a href="' + DATA.data[idx].vurl + 'target="_blank">' +
                      DATA.data[idx].title +
                      '</a></span>' +
                      '<span class="num">' +
                          DATA.data[idx].update_time.slice(5, 10)
                      '</span>' +
                  '</li>';
              });
              return _HTML;
          };
          _ID.html(HTML); 
      }
  });
}

//鐬勪竴鐪�
var seeAndTop = function(_url,ID){
  var _ID = $("#" + ID),
      HTML = "";
  $.ajax({
      type:"GET",
      url:_url,
      dataType:"jsonp",
      success:function(DATA){                 
          if(DATA.code != 0){return false;};
          HTML = "<ul>" + liData(DATA) + "</ul>";             
          function liData(DATA){                  
              var _HTML = "";
              $.each(DATA.data,function(idx){
                  _HTML = _HTML + 
                  "<li>" +
                      "<span class=\"con\"><a href=\"//" + DATA.data[idx].url + "\" target=\"_blank\">" +
                      DATA.data[idx].lt +
                      "</a></span>" +
                      "<span class=\"" + (ID=="myyList" ? "time" : "num") + "\">" +
                      (ID=="myyList" ? DATA.data[idx].tsh : DATA.data[idx].numh) +
                      "</span>" +
                  "</li>";
              });
              return _HTML;
          };
          _ID.html(HTML); 
      }
  }); 
};
var gotoTop = function(topBtnID,rValue,bValue,initScrollTop){//鍥為《閮�
  var _initScrollTop = initScrollTop || 100,
      _topBtnID = document.getElementById(topBtnID);
      _topBtnID.style.cssText = "position:fixed;_position:absolute;right:" + rValue +
      "px;bottom:" + bValue + "px;display:none;";
  setInterval(function(){
      var _scrollTop = document.documentElement.scrollTop || document.body.scrollTop;     
      if(_scrollTop >= _initScrollTop){
          _topBtnID.style.display = "inline";     
          if(isIE6){
              _topBtnID.style.bottom = "auto";    
              _topBtnID.style.top = document.documentElement.clientHeight + _scrollTop - _topBtnID.clientHeight - bValue;
          };
      }else{          
          _topBtnID.style.display = "none";
      };
  },200);
  _topBtnID.onclick = function(){
      document.documentElement.scrollTop = 0;
      document.body.scrollTop = 0;
  };
};  

/*鎴戠殑鏀惰棌*/
var pageScript = function(){//鍒嗛〉
  function Page(container,fn,args,style){
      //瀛樺弬鏁�
      var container=this.container=container||null;
      this.fn=fn||function(){};

      //瀛� args閲岀殑灞炴€�
      var args=this.args=$.extend({
          pageCount:10,//鎬婚〉鐮�,榛樿10
          current:1,//褰撳墠椤电爜,榛樿1
          showPrev:true,//鏄惁鏄剧ず涓婁竴椤垫寜閽�
          showNext:true,//鏄惁鏄剧ず涓嬩竴椤垫寜閽�
          showTurn:true,//鏄惁鏄剧ず璺宠浆,榛樿鏄剧ず
          showSumNum:false,//鏄惁鏄剧ず鎬婚〉鐮�
          showNear:2,//鏄剧ず褰撳墠椤电爜鍓嶅灏戦〉鍜屽悗澶氬皯椤碉紝榛樿2
          pageSwap:true,//鏄惁鍚屾剰璋冨墏,榛樿鏄€傝皟鍓備細鏈€澶ф暟閲忔樉绀洪〉鐮併€備緥濡傚綋鍓嶉〉鐮佷箣鍓嶆棤椤电爜鍙互鏄剧ず銆傚垯浼氬鍔犱箣鍚庣殑椤电爜銆�
          align:'right'//瀵归綈鏂瑰紡銆傞粯璁ゅ彸瀵归綈.鍙€夛細left,right
      },args||{});
      
      var width=this.width=parseInt(this.container.css('width'))||parseInt(this.container.parent().css('width'));
      var height=this.height=30;//parseInt(this.obj.css('height'));

      var style=this.style=$.extend({
          "fontSize":14,//瀛椾綋澶у皬
          "width":width,//椤电爜鐩掑瓙鎬诲搴�
          "height":height,//椤电爜鎬婚珮搴︼紝榛樿20px
          "pagesMargin":6,//姣忎釜椤电爜鎴栨寜閽箣闂寸殑闂撮殧
          "paddL":0,//宸﹁竟鐣欑櫧
          "paddR":0,//鍙宠竟鐣欑櫧
          "borderColor":"#eaeaea",//杈圭嚎棰滆壊
          "currentColor":"#fff",//褰撳墠椤电爜鐨勫瓧浣撻鑹�
          "disableColor":"#bfbfbf",//涓嶅彲鐐瑰嚮鎸夐挳鐨勫瓧浣撻鑹�
          "disableBackColor":"#f2f2f2",//涓嶅彲鐐瑰嚮鎸夐挳鐨勮儗鏅壊
          "prevNextWidth":28,//涓婇〉涓嬮〉鐨勫搴�
          "pagecountWidth":28,//鍏辫澶氬皯椤电殑瀹藉害
          "trunWidth":122//璺宠浆妯″潡瀹藉害
      },style||{});
      
      if(!style.pageWidth)style.pageWidth=(function(){
              var sumWidth=style.width-(style.prevNextWidth+2+style.pagesMargin)*(Number(args.showPrev)+Number(args.showNext))-(style.pagecountWidth+style.pagesMargin)*Number(args.showSumNum)-(style.trunWidth+style.pagesMargin)*Number(args.showTurn);
              var sumLength=args.showNear*2+5;
              return parseInt(sumWidth/sumLength)-style.pagesMargin;
          })();//姣忎釜椤电爜鐨勫搴︺€傞粯璁ゆ寜鏈€澶ф憜鏀鹃噺璁＄畻   

      //璁剧疆瀹瑰櫒鏍峰紡
      this.container.css({'pading-left':style.paddL+'px','pading-right':style.paddR+'px','content':'','display':'block','clear':'both'});
      //寤虹珛鑷繁鐨勫鍣�
      this.container.html('<div></div>');
      this.obj=this.container.children();
      this.obj.css({'content':'','display':'block','clear':'both','float':args.align});
      //鍒濆鍖�
      this.init();
  }
  
  Page.prototype.init=function(){
      this.fillHtml();
      this.bindEvent();
  }
  
  //濉厖DOM
  Page.prototype.fillHtml=function(){
      var args=this.args;
      var obj=this.obj;
      if(args.current>args.pageCount||args.current<1)return;
      obj.empty();
              
      //涓婁竴椤�
      if(args.showPrev){
          if(args.current > 1){
              obj.append('<a href="javascript:;" class="prevPage">&lt;</a>');
          }else{
              obj.remove('.prevPage');
              obj.append('<span class="disabled">&lt;</span>');
          }
      }
      //涓棿椤电爜
      if(args.current != 1){
          obj.append('<a href="javascript:;" class="tcdNumber">'+1+'</a>');
      }else{
          obj.append('<span class="current">'+1+'</span>');
      }
      
      if(args.current > args.showNear+2){
          obj.append('<span class="hiding">...</span>');
      }
      
      var start = args.current>args.showNear+2?args.current-args.showNear:2,end = args.current+args.showNear>=args.pageCount?args.pageCount-1:args.current+args.showNear;
      
      if(args.pageSwap){
          var dstart=args.current-args.showNear-2;
          var dend=args.pageCount-1-args.current-args.showNear;
          if(dstart<1&&dend>1){
              end+=Math.min(dend,Math.abs(dstart-1));
          }else if(dstart>1&&dend<1){
              start-=Math.min(dstart,Math.abs(dend-1));
          }
      }
      
      for (;start <= end; start++) {
          if(start != args.current){
              obj.append('<a href="javascript:;" class="tcdNumber">'+ start +'</a>');
          }else{
              obj.append('<span class="current">'+ start +'</span>');
          }
      }
      
      if(args.current + 1 + args.showNear < args.pageCount){
          obj.append('<span class="hiding">...</span>');
      }
      
      if(args.current != args.pageCount&&args.pageCount!=1){
          obj.append('<a href="javascript:;" class="tcdNumber">'+args.pageCount+'</a>');
      }else if(args.current== args.pageCount&&args.pageCount!=1){
          obj.append('<span class="current">'+args.pageCount+'</span>');
      }
      //涓嬩竴椤�
      if(args.showNext){
          if(args.current== args.pageCount||args.pageCount==1){
              obj.remove('.nextPage');
              obj.append('<span class="disabled">&gt;</span>');
          }else{
              obj.append('<a href="javascript:;" class="nextPage">&gt;</a>');
          }
      }
      
      if(args.showSumNum){
          obj.append('<span class="pagecount">\u5171'+args.pageCount+'\u9875</span>');
      }
      //璺宠浆椤电爜
      if(args.showTurn){
          obj.append('<span class="countYe">\u8df3\u5230<input type="text" maxlength='+args.pageCount.toString().length+'>\u9875<a href="javascript:;" class="turndown">\u786e\u5b9a</a></span>');
      }
      this.setStyle();
      this.fn&&this.fn(args.current);
  };
  //娣诲姞鏍峰紡
  Page.prototype.setStyle=function(){
      var s=this.style;
      var marLR=s.pagesMargin;
      
      this.obj.children().css({'float':'left','margin-left':marLR+'px','text-align':'center'});
      
      this.obj.find('a').css({'text-decoration':'none','border':'1px solid '+s.borderColor});
  
      this.obj.find('a.prevPage').css({'width':s.prevNextWidth,'font-size':s.fontSize+'px','height':s.height-2+'px','line-height':s.height-2+'px'});
      this.obj.find('a.nextPage').css({'width':s.prevNextWidth,'font-size':s.fontSize+'px','height':s.height-2+'px','line-height':s.height-2+'px'});
  
      this.obj.find('a.turndown').css({'margin-left':'5px','display':'inline-block','width':'32px','height':s.height-2+'px','line-height':s.height-2+'px'});
      
      this.obj.find('span.current').css({'display':'inline-block','height':s.height+'px','line-height':s.height+'px','color':s.currentColor,'vertical-align':'middle','width':s.pageWidth+'px','background-color':'#fa5f5f'});
      
      this.obj.find('span.disabled').css({'display':'inline-block','height':s.height-2+'px','line-height':s.height-2+'px','color':s.disableColor,'background':s.disableBackColor,'border':'1px solid '+s.borderColor,'vertical-align':'middle','font-size':s.fontSize+'px','width':s.prevNextWidth+'px'});
      
      this.obj.find('span.pagecount').css({'width':s.pagecountWidth+'px','font-size':s.fontSize+'px','color':'#999','height':s.height+'px','line-height':s.height+'px'});
      
      this.obj.find('span.countYe').css({'color':'#4C4C4C','font-size':s.fontSize+'px','width':s.trunWidth+'px'});

      this.obj.find('input').css({'outline':'none','border':'1px solid #ddd','height':s.height-2+'px','line-height':s.height-2+'px','width':'28px',margin: '-1px 5px 0','vertical-align':'middle','text-align':'center'});
      
      this.obj.find('.tcdNumber').css({'width':s.pageWidth-2+'px','height':s.height-2+'px','line-height':s.height-2+'px'});
      this.obj.find('.hiding').css({'width':s.pageWidth+'px','height':s.height+'px'});                        
  };
          
  //缁戝畾浜嬩欢
  Page.prototype.bindEvent=function(){
      var obj=this.obj;
      var _this=this;
      
          obj.off("click");
          obj.on("click","a.tcdNumber",function(){
              //濡傛灉鏈櫥褰�
              if(!(QQ.Cookie.get("skey")) || !(QQ.Cookie.get("uin"))){
                  $("#oneKey").click();
                  return false;//鏈櫥褰曚笉鎵ц
              }else{
                  _this.args.current = parseInt($(this).text());
                  _this.fillHtml();
              }
          });
          //涓婁竴椤�
          obj.on("click","a.prevPage",function(){
              _this.args.current = parseInt(obj.children("span.current").text())-1;
              _this.fillHtml();
          });
          //涓嬩竴椤�
          obj.on("click","a.nextPage",function(){
              _this.args.current = parseInt(obj.children("span.current").text())+1;
              _this.fillHtml();
          });
          //璺宠浆
          obj.on("click","a.turndown",function(){
              var page = _this.args.current = Number(obj.children("span.countYe").children('input').val());
              if(page>_this.args.pageCount){
                  alert("\u9875\u7801\u9519\u8bef\u3001\u8bf7\u518d\u6b21\u8f93\u5165\uff01");
                  return;
              }
              _this.fillHtml();
          });
      }
      
  //缁戝畾鎴恓Query鎻掍欢
  $.fn.createPage=function(fn,args,style){
      var _this=this;
      new Page(_this,fn,args,style);
      return this;
  }
};
var scDataBtn = function(){//鏁版嵁灞曠ずBTN褰㈡€佸垏鎹�
  var _ID = $("#scDataMod"),
      lbBtn = $("#tab_lb"),
      kpBtn = $("#tab_kp");

  lbBtn.on("click",function(){
      $(this).css("background-position","-449px -73px");
      kpBtn.css("background-position","-527px -73px");
      _ID.find(".list").removeClass("kp").addClass("lb");        
  });

  kpBtn.on("click",function(){
      $(this).css("background-position","-381px -73px");
      lbBtn.css("background-position","-303px -73px");
      _ID.find(".list").removeClass("lb").addClass("kp");
  });
};
var scDataHtml = function(data){//鏁版嵁妯℃澘

  var _HTML = "",
      _type = "";    

  for(var i = 0;i < data.length;i++){

      if(data[i].oi && data[i].oi != undefined && data[i].oi != null){
          _type = "bigPic";
      }else{
          _type = "noPic"; 
      };

      _HTML = _HTML +
      "<li>" +
          "<div class=\"pt\">" + 
              "<div class=\"pic\">" +
                  (_type == "bigPic" ? "<a bosszone=\"usr_sclist\" href=\"//" + (data[i].url ? data[i].url : "#") + "\" target=\"_blank\">" + "<img src=\"" + (data[i].oi ? data[i].oi : "") + "\" />" + "</a>" : "<a bosszone=\"usr_sclist\" href=\"//" + (data[i].url ? data[i].url : "#") + "\" target=\"_blank\"></a>") +
              "</div>" + 
              "<div class=\"txt\">" +
                  "<a bosszone=\"usr_sclist\" href=\"//" + (data[i].url ? data[i].url : "#") + "\" target=\"_blank\">" + (data[i].lt ? data[i].lt : "") + "</a>" +
              "</div>" + 
              "<div class=\"source\">" + (data[i].fr ? data[i].fr : "") + "</div>" +
              "<div class=\"del\" data-url=\"" + data[i].url + "&ty=" + data[i].ty + "\">" +
                  "<a href=\"javascript:\">\u5220\u9664</a>" +
              "</div>" +
          "</div>" +
      "</li>";
  };

  return "<ul>" + _HTML + "</ul>";  
};
var scDataShow = function(){//鏁版嵁灞曠ず

  var serverTimestampUrl = "//i.match.qq.com/curtime?t=U",//鏈嶅姟鍣ㄦ椂闂存埑鎺ュ彛
      collectionDataUrl = "//i.match.qq.com/keep/g",//鐢ㄦ埛鏀惰棌鏁版嵁鎺ュ彛
      collectionNumUrl = "//i.match.qq.com/keep/c",//鏀惰棌鎬绘暟鎺ュ彛
      serverTimestamp = 0,//鏈嶅姟鍣ㄦ椂闂存埑鍙橀噺
      onePageNum = 12,//涓€椤垫樉绀烘暟鎹潯鏁�    
      pageNum = 0,//鎬婚〉鏁板彉閲�
      id = $("#scDataMod");

  $.ajax({//鏈嶅姟鍣ㄦ椂闂存埑
      type:"GET",
      url:serverTimestampUrl,
      dataType:"jsonp",
      success:function(DATA){                 
          if(DATA.code != 0){return false;};              
          serverTimestamp = DATA.data;                
      }
  });

  $.ajax({//鏄剧ず鏀惰浇鎬绘暟
      type:"GET",
      url:collectionNumUrl,
      dataType:"jsonp",
      success:function(DATA){             
          if(DATA.code != 0){return false;};
          var _div = "";

          //娓呯┖鏁版嵁 鎬绘暟 椤电爜
          id.find(".list").empty();
          id.find(".title h2 strong .num").html("0");
          $("#page").empty();            

          if(DATA.data != 0){
              id.find(".title h2 strong .num").html(DATA.data);
              pageNum = Math.ceil(parseInt(DATA.data) / onePageNum);

              //璁＄畻鏈夊嚑椤垫彃鍏ュ嚑涓┖DIV
              for(var i = 0;i < pageNum;i++){
                  _div = _div + "<div style=\"display:none;\"></div>";
              };
              id.find(".list").append(_div);

              //鍒涘缓椤电爜
              $('#page').createPage(function(n){                    

                  dataRequest(n-1);

                  //鍥炲埌椤甸潰椤堕儴
                  document.documentElement.scrollTop = 0;
                  document.body.scrollTop = 0;
              },{
                  pageCount:pageNum
              });   
          }
      }
  });

  //鏁版嵁璇锋眰
  var dataRequest = function(n){

      //濡傛灉鏈櫥褰曡皟鍑虹櫥褰曟
      if(!(QQ.Cookie.get("skey")) || !(QQ.Cookie.get("uin"))){
          $("#oneKey").click();//璋冨嚭鐧诲綍妗�
      };

      //濡傛灉鏁版嵁宸插瓨鍦紝涓嶅湪涓ゆ璇锋眰鏁版嵁
      if(id.find(".list > div").eq(n).html().length == 0){        
          var _sta = 0;

          if(n != 0){
              _sta = n * 12;
          };

          $.ajax({//鏀惰棌棣栧睆鏁版嵁灞曠ず
              type:"GET",
              url:collectionDataUrl + "?sta=" + _sta + "&num=12&ut=" + (serverTimestamp != 0 ? serverTimestamp : new Date().getTime()),//濡傛灉鏈嶅姟鍣ㄦ椂闂存埑鍙栦笉鍒帮紝鍒欑敤鏈湴鏃堕棿
              dataType:"jsonp",
              success:function(DATA){
                  if(DATA.code != 0){return false;};
                  $("#scDataMod .list > div").css("display","none");
                  $("#scDataMod .list > div").eq(n).css("display","block").html(scDataHtml(DATA.data));
              }
          });

      }else{
          $("#scDataMod .list > div").css("display","none");
          $("#scDataMod .list > div").eq(n).css("display","block");
      };
  };
};
var scDataDel = function(){//鏁版嵁鍒犻櫎 
  var _id = $("#scDataMod"),        
      cancelCollectionUrl = "//i.match.qq.com/keep/d";//鍙栨秷鏀惰棌鎺ュ彛

  _id.find(".list").on("click",".del",function(){

      //濡傛灉鏈櫥褰曡皟鍑虹櫥褰曟
      if(!(QQ.Cookie.get("skey")) || !(QQ.Cookie.get("uin"))){
          $("#oneKey").click();//璋冨嚭鐧诲綍妗�
      };

      var _url = cancelCollectionUrl + "?url=" + $(this).attr("data-url"),
          that = $(this);

      $.ajax({
          type:"GET",
          url:_url,
          dataType:"jsonp",
          success:function(DATA){                 
              if(DATA.code != 0){return false;};
              var _num = parseInt($("#scDataMod .title .num").html());
              $("#scDataMod .title .num").html(--_num);
              that.closest("li").addClass("delData");
          }
      });

      registerZone2({bossZone:'user_scdete'},1);//鍒犻櫎_鐐瑰嚮
  })
};



/*鎴戠殑娑堟伅*/
var xxDataHtml = function(data,st){//鏁版嵁妯℃澘

  var _HTML = "";

  for(var i = 0;i < data.messages.length;i++){

      var _id = data.messages[i].id,//娑堟伅ID
          _upusers = data.comments[_id].upusers == undefined ? 0 : data.comments[_id].upusers[0],//鐐硅禐鐢ㄦ埛ID
          _upusersLen = data.comments[_id].upusers == undefined ? 0 : data.comments[_id].upusers.length,//鐐硅禐鐢ㄦ埛鏁�
          _uID = data.comments[_id].userid,//璇勮鐢ㄦ埛
          _aID = data.messages[i].targetid;//鏂囩珷ID

      if(data.messages[i].tipstype == 4 && data.comments[_id].upusers.length == 0){continue;};

      _HTML = _HTML +
      "<li>" +
          "<div class=\"pt\">" + 
              "<div class=\"tx\">" +
                  "<img src=\"" + (data.messages[i].tipstype == 4 ? data.users[_upusers].head : data.users[_uID].head) + "\" />" +
              "</div>" +
              "<div class=\"box\">" + 
                  (data.messages[i].tipstype == 4 ? "<h3><strong>" + data.users[_upusers].nick + "</strong>" + (_upusersLen > 1 ? "\u7b49" + _upusersLen + "\u4eba" : "") + "\u70b9\u8d5e" : "<h3><strong>" + data.users[_uID].nick + "</strong>" + "\u56de\u590d") + "\u4e86\u4f60\u7684\u8bc4\u8bba<span>" + getTimeCN(data.messages[i].tipstime,st) + "</span></h3>" +
                  "<p>" + data.comments[_id].content + "</p>" + 
                  "<div class=\"zpt\">" +
                      "<div class=\"txt\">" +
                          "<a bosszone=\"user_xxlist\" href=\"" + data.articles[_aID].url + "\" target=\"_blank\">" + data.articles[_aID].title + "</a>" + 
                      "</div>" + 
                  "</div>" + 
              "</div>" +                               
          "</div>" +
      "</li>";
  };

  return _HTML;  
};
var xxDataShow = function(){//鏁版嵁灞曠ず

  var getUserIdUrl = "//coral.qq.com/user/0/comment/v2",//0 甯︾櫥闄嗘€�,鑾峰彇鐢ㄦ埛ID
      getUserMesUrl = "//coral.qq.com/user/<userid>/msg/v2?msgtype=web&msgid=",//鑾峰彇鐢ㄦ埛娑堟伅,鍏朵腑<userid>瑕佺敤userid姝ｅ垯鏇挎崲
      myUserId = "",//鎴戠殑鐢ㄦ埛ID棰勭暀鍙橀噺
      _id = $("#xxDataMod"),
      urlNum = 0,//璇锋眰鏁版嵁鎺ュ彛娆℃暟
      serverTimestampUrl = "//i.match.qq.com/curtime?t=U",//鏈嶅姟鍣ㄦ椂闂存埑鎺ュ彛        
      liNum = 0;//li璁℃暟

  //娓呯┖鏁版嵁 鎬绘暟
  _id.find(".list ul").empty();
  _id.find(".title h2 strong .num").html("0");   

  $.ajax({//鏈嶅姟鍣ㄦ椂闂存埑
      type:"GET",
      url:serverTimestampUrl,
      dataType:"jsonp",
      success:function(DATA){                 
          if(DATA.code != 0){
              //鎺ュ彛寮傚父鍒欎紶鏈湴鏃堕棿
              getData(parseInt(new Date().getTime()));
              return false;
          };
          getData(parseInt(DATA.data));         
      }
  });

  var getData = function(stt){

      $.ajax({//鑾峰彇鎴戠殑鐢ㄦ埛ID
          type:"GET",
          url:getUserIdUrl,
          dataType:"jsonp",
          success:function(DATA){             
              if(DATA.errCode != 0){
                  _id.find(".more").css("display","none");
                  return false;
              };

              myUserId = DATA.data.usermeta.userid;                        

              _id.find(".more > a").removeClass("end").html("\u52a0\u8f7d\u66f4\u591a\u6d88\u606f");

              _id.find(".more").off("click").on("click",function(){//鍔犺浇鏇村鏁版嵁鎸夐挳                    

                  //濡傛灉鏈櫥褰曡皟鍑虹櫥褰曟
                  if(!(QQ.Cookie.get("skey")) || !(QQ.Cookie.get("uin"))){
                      $("#oneKey").click();//璋冨嚭鐧诲綍妗�
                      return false;
                  };

                  $.ajax({//鑾峰彇鎴戠殑娑堟伅鏁版嵁
                      type:"GET",
                      url:getUserMesUrl.replace("<userid>",myUserId) + (lastTime != 0 ? lastTime : ""),
                      dataType:"jsonp",
                      success:function(DATA){
                          if(DATA.errCode != 0){
                              _id.find(".more").css("display","none");
                              return false;
                          };                            

                          lastTime = DATA.data.last;

                          liNum = liNum + DATA.data.messages.length;

                          //鍥炲～娑堟伅鎬绘暟,鍙娆¤姹傛暟鎹洖濉�
                          urlNum == 0 && _id.find(".title h2 strong .num").html(DATA.data.total);
                          urlNum++;

                          //娑堟伅鏁颁负0,闅愯棌鏇村BTN鍙婇€€鍑�
                          if(DATA.data.total > 0){
                              _id.find(".more").css("display","block");                           
                          }else{
                              _id.find(".more").css("display","none");
                              return false;
                          };

                          //娑堟伅鏁版嵁鍥炲～
                          _id.find(".list ul").append(xxDataHtml(DATA.data,stt));

                          if(liNum >= DATA.data.total){
                              _id.find(".more > a").addClass("end").html("\u6d88\u606f\u5df2\u5168\u90e8\u52a0\u8f7d\u5b8c\u6bd5");
                              _id.find(".more").off("click");
                          };

                      }
                  });

              }).click();//棣栧睆鏁版嵁鍔犺浇鎵ц
          }
      });
  };
};

/*涓汉璁剧疆*/
var userData = function(num,img,nick){//鐢ㄦ埛璧勬枡
  var _xxUserNum = $("#xxUserNum"),//鐢ㄦ埛鍙风爜
      _xxUserImg = $("#xxUserImg"),//鐢ㄦ埛鍥惧儚
      _xxUserNick = $("#xxUserNick"),//鐢ㄦ埛鏄电О
      _xxTx = $("#xxTx");//娑堟伅鎻愮ず寮€鍏�

  _xxUserNum.html(num);
  _xxUserImg.attr("src",img);
  _xxUserNick.html(nick);
};

/*鏀惰棌鍐呭灞曠ず*/
var scConShow = function(){
  //宸叉湁鏁版嵁涓旂敤鎴峰笎鍙锋病鏈夊垏鎹㈠彉鏇�
  if($("#scDataMod .list").html().length != 0 && userDataUin.sc == LoginHL.cookie('qq_openid')){return false;}

  pageScript();//鏀惰棌鏁版嵁鍒嗛〉
  scDataShow();//鏀惰棌椤垫暟鎹睍绀轰氦浜�
  scDataBtn();//鏀惰棌鏁版嵁灞曠ずBTN褰㈡€佸垏鎹�
  scDataDel();//鏀惰棌椤垫暟鎹垹闄�

  //璁板綍鏁版嵁璇锋眰甯愬彿
  userDataUin.sc = LoginHL.cookie('qq_openid');

};

/*璇勮鍐呭灞曠ず*/
var plConShow = function(){
  var _src = "//v.qq.com/txyp/grzx/newsindex.htm",
      _id = $("#commentIframe");

  //宸插姞杞絀frame涓旂敤鎴峰笎鍙锋病鏈夊垏鎹㈠彉鏇�
  if(_id.attr("src") != undefined && userDataUin.pl == LoginHL.cookie('qq_openid')){return false;}

  _id.attr("src",_src);

  //璁板綍鏁版嵁璇锋眰甯愬彿
  userDataUin.pl = LoginHL.cookie('qq_openid');
};

/*娑堟伅鍐呭灞曠ず*/
var xxConShow = function(){
  //宸叉湁鏁版嵁涓旂敤鎴峰笎鍙锋病鏈夊垏鎹㈠彉鏇�
  if($("#xxDataMod .list ul").html().length != 0 && userDataUin.xx == LoginHL.cookie('qq_openid')){return false;}

  lastTime = 0;//缃浂
  xxDataShow();//鎴戠殑娑堟伅鏁版嵁灞曠ず浜や簰

  //璁板綍鏁版嵁璇锋眰甯愬彿
  userDataUin.xx = LoginHL.cookie('qq_openid');
};

/*涓汉璁剧疆鍐呭灞曠ず*/
var grConShow = function(uin,face,nick){
  //宸叉湁鏁版嵁涓旂敤鎴峰笎鍙锋病鏈夊垏鎹㈠彉鏇�
  if($("#xxUserNum").html().length != 0 && userDataUin.gr == LoginHL.cookie('qq_openid')){return false;}

  // userData(uin,face.replace("&s=40&","&s=100&"),nick); 
  userData(uin,face.replace("&s=40&","&s=100&"),nick); 

  //璁板綍鏁版嵁璇锋眰甯愬彿
  userDataUin.gr = LoginHL.cookie('qq_openid');
};

/*鍩虹鍔熻兘鏂规硶鍚姩*/
var initFun = function(){
  //瀵艰埅瀹氫綅
  navDw();

  //瀵艰埅浜や簰
  navJh();

  //鐬勪竴鐪�
  // seeAndTop("//i.match.qq.com/keep/see?num=5","myyList");

  //浠婃棩濂芥枃 
  // seeAndTop("//i.match.qq.com/keep/top?num=5","jrhwList");
  todayGoodArt("//pacaio.match.qq.com/irs/rcd?cid=137&token=d0f13d594edfc180f5bf6b845456f3ea&id=&ext=top&num=5", "jrhwList");

  //鍥炲埌椤堕儴
  gotoTop("gotoTopBtn",50,100,200);

  //鐢ㄦ埛鐧婚檰鍚庢墽琛�
  window.haveLogon = function(face,nick,uin){
      console.log(face, nick, uin);
      var _navMod = $("#navMod");

      //鐢ㄦ埛妯″潡 澶村儚鍙婄敤鎴峰悕鍥炲～
      userMod(face, nick);
      
      //鍦ㄤ釜浜鸿缃〉涓墽琛�
      if(_navMod.find("li[data-now=now]").attr("data-type") == "Setup"){   
          grConShow(uin, face, nick);
          return false;
      };
      
      //鍦ㄦ垜鐨勬敹钘忛〉涓墽琛�
      if(_navMod.find("li[data-now=now]").attr("data-type") == "Like"){
          scConShow();
          return false;
      };          

      //鍦ㄦ垜鐨勮瘎璁洪〉涓墽琛�
      if(_navMod.find("li[data-now=now]").attr("data-type") == "Comment"){
          plConShow();
          return false;
      };

      //鍦ㄦ垜鐨勬秷鎭〉涓墽琛�
      if(_navMod.find("li[data-now=now]").attr("data-type") == "News"){
          xxConShow();
          return false;
      };
  };
  
  //鐧诲綍鎴愬姛鍥炶皟
  $(window).on('qqLogin',function(event, user){
      console.log('qqlogin', user);
      haveLogon(user.head.replace('http://', '//'), user.nick);
      
      $.ajax({
          url: 'https://graph.qq.com/user/get_user_info?access_token=' + LoginHL.cookie('qq_access_token') + '&oauth_consumer_key=' + LoginHL.cookie('qq_client_id') + '&openid=' + LoginHL.cookie('qq_openid'),
          success: function (userInfo) {
              console.log('鐢ㄦ埛淇℃伅: ', userInfo)
              userInfo = userInfo;
              
          }
      })
      
  });



  //椤甸潰杩涘叆鍒ゆ柇鏄惁鐧诲綍
  // if(!(QQ.Cookie.get("skey")) || !(QQ.Cookie.get("uin"))){
      //鏈櫥褰�
      // $("#oneKey").click();
  // };
};

//椤甸潰DOM鍔犺浇鍚庢墽琛�
$(document).ready(function(){
  //鍩虹鍔熻兘鏂规硶鍚姩
  initFun();
});

})(jQuery);