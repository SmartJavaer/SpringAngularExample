<%@ page contentType="text/html;charset=utf-8" pageEncoding="utf-8" trimDirectiveWhitespaces="true" %>
<!DOCTYPE html>
<html ng-app="myApp" lang="zh-CN">
<head>
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no"/>
    <title>常用工具</title>
    <link rel="icon" href="/favicon.ico" mce_href="/favicon.ico"
          type="image/x-icon"/>
    <link href="static/css/bootstrap3.5min.css" rel="stylesheet" type="text/css"/>
    <link href="static/css/mainmin.css" rel="stylesheet" type="text/css"/>
    <script src="static/js/angular.js"></script>
    <script src="static/js/jquery-1.11.3.min.js" type="text/javascript"></script>
    <script src="static/js/bootstrap3.5min.js" type="text/javascript"></script>
    <script src="static/js/ZeroClipboard.min.js" type="text/javascript"></script>
</head>
<body ng-controller="myCtrl">
<div class="navbar navbar-default navbar-static-top navbar-fixed-top">
    <div class="jz container">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar"
                    aria-expanded="false" aria-controls="navbar">
                <span class="sr-only">支付前端常用工具集合</span> <span class="icon-bar"></span><span class="icon-bar">
                </span><span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="tools.jsp">支付前端常用工具集合</a>
        </div>
    </div>
</div>
<div class="container">
    <div class="row">
        <div class="col-md-12 col10main">
            <div class="accordion" id="accordion2">
                <div class="accordion-group">
                    <ul class="nav nav-tabs hbflag">
                        <li role="presentation" ng-repeat="uiPage in UIPages" ng-class="{active:isActive(uiPage)}"
                            ng-click="selectUIPage(uiPage);"><a>{{uiPage.title}}</a></li>
                    </ul>
                    <div class="alert alert-success alert-dismissible" role="alert" ng-show="currUIPage.showHint">
                        <button type="button" class="close" data-dismiss="alert" aria-label="Close"
                                ng-click="currUIPage.showHint=false;">
                            <span aria-hidden="true">&times;</span></button>
                        {{currUIPage.hint}}
                    </div>

                    <div class="panel">
                        <form id="form1" class="form-horizontal" action="/urlencode/" method="post">
                            <div class="form-group">
                                <div class="col-sm-12">
                                    <textarea class="form-control" id="codeone" rows="12" ng-model="codeone"
                                              placeholder="请输入你要编码/解码的内容"></textarea>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-sm-12">
                                    <span ng-repeat="btn in currUIPage.buttons">
                                    <button type="button" class="{{btn.class}}" ng-click="this.$eval(btn.click)">
                                        {{btn.caption}}
                                    </button>
                                    </span>
                                    <button type="button" class="btn btn-danger"
                                            onclick="codeone.value='';codetwo.value='';codeone.select();">
                                        清空输入框
                                    </button>
                                    <span id="copyallcode" class="btn btn-success"
                                          data-clipboard-target="codetwo">复制结果</span>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-sm-12">
                                    <textarea class="form-control" id="codetwo" rows="12" ng-model="codetwo"
                                              placeholder="处理后的结果"></textarea>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-sm-12">
                                    <div class="alert alert-success alert-dismissible text-center" id="copycodeall"
                                         role="alert">
                                        <strong>复制成功!</strong> &nbsp;&nbsp;已经成功复制到剪切板&nbsp;&nbsp;可直接粘贴到任意地方.
                                    </div>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
                <div class="accordion-group">
                    <div class="accordion-heading">
                        <a class="list-group-item list-group-item-warning" data-toggle="collapse">
                            {{currUIPage.warning.title}}</a>
                    </div>
                    <div class="in collapse bs-docs-demoexample">
                        <h4 style="color: #66be8c;">
                            {{currUIPage.warning.header}}</h4>
                        <br/>
                        <div ng-bind-html="currUIPage.warning.body">
                        </div>

                    </div>
                </div>
                <br/>
            </div>
        </div>
    </div>
</div>

<a class="gotop" href="#" title="返回顶部" style="display: none;"><span class="arrow"></span>
    <span class="arrow lit"></span></a>
<script>
    var app = angular.module('myApp', []);
    app.config(function ($sceProvider) {
        $sceProvider.enabled(false);
    });
    app.controller('myCtrl', function ($scope) {
        $scope.codeone = "";
        $scope.codetwo = "";

        $scope.UIPages = [
            {
                id: "urlencode",
                title: 'URL编码/解码',
                hint: 'URL在线编码解码工具（UrlEncode编码 和 UrlDecode解码）',
                showHint: true,
                buttons: [{
                    caption: "UrlEncode编码",
                    class: "btn btn-success",
                    click: "UrlEncode()"
                }, {
                    caption: "UrlDecode解码",
                    class: "btn btn-success",
                    click: "UrlDecode()"
                }],
                warning: {
                    title: '在线URL编码解码工具',
                    header: 'URL在线编码解码',
                    body: '<h5>1,本功能实现将Url进行：UrlEncode编码 和 UrlDecode解码</h5><h5>2,对Url进行编码后可以将一些特殊字符和汉字变为Encode编码格式 </h5>'
                }
            }, {
                id: "utf8",
                title: 'UTF-8编码转换',
                hint: '在线UTF-8编码转换工具（可以把中文转换成UTF-8编码，同时也支持把UTF-8编码过的还原成中文）',
                showHint: true,
                buttons: [{
                    caption: "中文 转换 UTF-8",
                    class: "btn btn-success",
                    click: "ConvUtf()"
                }, {
                    caption: "UTF-8 还原 中文",
                    class: "btn btn-success",
                    click: "ResChinese()"
                }],
                warning: {
                    title: '在线UTF8编码解码工具',
                    header: 'UTF8在线编码解码',
                    body: '<h5>1,可以帮助你把中文转换成UTF-8编码形式,同时也支持把UTF-8编码过的字符还原成中文</h5><h5>2,将字符串转换为UTF-8形式,解决在网络传输过程中出现的字符乱码,同时可跨平台使用</h5><h5>3,本站不会记录您的任何信息,请放心使用</h5>'
                }
            }, {
                id: "unicode",
                title: 'Unicode/ASCII编码互转',
                hint: 'Unicode编码转换（为您提供ASCII与Unicode互转，Unicode与中文互转，中文转换为&#XXXX形式）',
                showHint: true,
                buttons: [{
                    caption: "中文 转换 Unicode",
                    class: "btn btn-success",
                    click: "ChineseToUnicode()"
                }, {
                    caption: "Unicode 转换 中文",
                    class: "btn btn-success",
                    click: "UnicodeToChinese()"
                }, {
                    caption: "Unicode 转换 ASCII",
                    class: "btn btn-success",
                    click: "UnicodeToASCII()"
                }, {
                    caption: "ASCII 转换 Unicode",
                    class: "btn btn-success",
                    click: "UnicodeToChinese()"
                }, {
                    caption: "中文转换&#XXXX",
                    class: "btn btn-success",
                    click: "ChineseTo4X()"
                }],
                warning: {
                    title: '在线Unicode编码转换工具',
                    header: 'Unicode编码在线转换,中文转换&#XXXX形式',
                    body: '<h5>1,将Unicode编码转换为您提供ASCII与Unicode互转</h5><h5>2,实现功能：Unicode与中文互转,Unicode转ASCII,ASCII转Unicode,中文转Unicode,Unicode转中文</h5>'
                }
            }, {
                id: "urlcode",
                title: 'Url网址16进制加密',
                hint: 'URL网址16进制加密工具（注：加密后拷贝到地址栏回车即可看到效果）',
                showHint: true,
                buttons: [
                    {
                        caption: "加密处理",
                        class: "btn btn-success",
                        click: "urlCrypt()"
                    }],
                warning: {
                    title: '在线URL网址16进制加密工具',
                    header: '16进制在线加密工具',
                    body: '<h5>1,将字符转换为16进制的字符,可在传输过程中避免出现特殊字符带来的困扰，一般浏览器地址栏会把中文默认转为16进制字符</h5><h5>2,在进行Url重写时,可对网址进行编码加密,避免特殊字符,加密后的网址依然能在浏览器地址栏直接打开</h5><h5>例如:原网址为http:<br>进行16进制转换后:http:<br>两种形式的网址在浏览器都可正常打开</h5>'
                }
            }
        ];

        $scope.currUIPage = $scope.UIPages[0];
        //选择页面
        $scope.selectUIPage = function (uiPage) {
            uiPage.showHint = true;
            $scope.currUIPage = uiPage;
        };
        //判断页面是否激活
        $scope.isActive = function (uiPage) {
            return $scope.currUIPage == uiPage;
        };
        //UrlEncode编码
        $scope.UrlEncode = function () {
            $scope.codetwo = encodeURIComponent($scope.codeone);
        };
        //UrlDecode解码
        $scope.UrlDecode = function () {
            $scope.codetwo = decodeURIComponent($scope.codeone);
        };
        //中文 转换 UTF-8
        $scope.ConvUtf = function () {
            $scope.codetwo = $scope.codeone.replace(/[^\u0000-\u00FF]/g, function ($0) {
                return escape($0).replace(/(%u)(\w { 4 })/gi, "&#x$2; ")
            });
        };
        //UTF-8 还原 中文
        $scope.ResChinese = function () {
            $scope.codetwo = unescape($scope.codeone.replace(/&#x/g, '%u').replace(/; /g, ''));
        };

        //中文 转换 Unicode
        $scope.ChineseToUnicode = function () {
            var str = $scope.codeone;
            var value = '';
            for (var i = 0; i < str.length; i++) {
                value += '\\u' + left_zero_4(parseInt(str.charCodeAt(i)).toString(16));
            }
            $scope.codetwo = value;
        };
        //【Unicode转换中文】和【ASCII转换Unicode】
        $scope.UnicodeToChinese = function () {
            var str = $scope.codeone;
            str = str.replace(/(\\u)(\w{1,4})/gi, function ($0) {
                return (String.fromCharCode(parseInt((escape($0).replace(/(%5Cu)(\w{1,4})/g, "$2")), 16)));
            });
            str = str.replace(/(&#x)(\w{1,4});/gi, function ($0) {
                return String.fromCharCode(parseInt(escape($0).replace(/(%26%23x)(\w{1,4})(%3B)/g, "$2"), 16));
            });
            str = str.replace(/(&#)(\d{1,6});/gi, function ($0) {
                return String.fromCharCode(parseInt(escape($0).replace(/(%26%23)(\d{1,6})(%3B)/g, "$2")));
            });

            $scope.codetwo = str;

        };

        //Unicode 转换 ASCII
        $scope.UnicodeToASCII = function () {
            var str = $scope.codeone;
            var value = '';
            for (var i = 0; i < str.length; i++)
                value += '&#' + str.charCodeAt(i) + ';';
            $scope.codetwo = value;

        };

        function left_zero_4(str) {
            if (str != null && str != '' && str != 'undefined') {
                if (str.length == 2) {
                    return '00' + str;
                }
            }
            return str;
        }

        //中文转换&#XXXX
        $scope.ChineseTo4X = function () {
            var str = $scope.codeone;
            var value = '';
            for (var i = 0; i < str.length; i++) {
                value += '\&#x' + left_zero_4(parseInt(str.charCodeAt(i)).toString(16)) + ';';
            }
            $scope.codetwo = value;

        };
        //URL网址16进制加密
        $scope.urlCrypt = function () {
            var str2 = '';
            str = $('#codeone').val();
            str3 = str.substring(0, 7);
            if (str3 == 'http://') {
                str2 = 'http://';
                str = str.substring(7, str.length);
            }
            for (i = 0; i < str.length; i++) {
                if (str.charCodeAt(i) == '47') str2 += '/';
                else if (str.charCodeAt(i) == '63') str2 += '?';
                else if (str.charCodeAt(i) == '38') str2 += '&';
                else if (str.charCodeAt(i) == '61') str2 += '=';
                else if (str.charCodeAt(i) == '58') str2 += ':';
                else str2 += '%' + str.charCodeAt(i).toString(16);
            }
            $('#codetwo').val(str2);
        };
    });
</script>
<script type="text/javascript">
    $(function () {
        var qcloud = {};
        $('[_t_nav]').hover(function () {
                var _nav = $(this).attr('_t_nav');
                clearTimeout(qcloud[_nav + '_timer']);
                qcloud[_nav + '_timer'] = setTimeout(function () {
                    $('#' + _nav).stop(true, true).fadeIn(100);
                }, 0);
            },
            function () {
                var _nav = $(this).attr('_t_nav');
                clearTimeout(qcloud[_nav + '_timer']);
                qcloud[_nav + '_timer'] = setTimeout(function () {
                    $('#' + _nav).stop(true, true).fadeOut(0);
                }, 100);
            });
        /*跳转*/
        var goTop = $('.gotop');
        goTop.fadeOut();
        $(window, document).scroll(function () {
            $(this).scrollTop() > 100 ? goTop.fadeIn() : goTop.fadeOut();
        });
        /*
         * 初始化按钮的loading功能，点击后将显示Loading字样，并且按钮被disabled掉，无法连续点击，防止二次提交
         * 超过3秒后按钮将恢复原状
         */
        $('button[data-loading-text]').click(function () {
            var btn = $(this).button('loading');
            setTimeout(function () {
                btn.button('reset');
            }, 3000);
        });
    });
    // 定义一个新的复制对象
    var clip = new ZeroClipboard($("#copyallcode"), {
        moviePath: "static/js/ZeroClipboard.swf"
    });
    // 复制内容到剪贴板成功后的操作
    clip.on('complete', function (client, args) {
        var brdge = $("#global-zeroclipboard-html-bridge");
        brdge.attr("title", "复制成功！").tooltip("fixTitle").tooltip("show").attr("title", "复制到剪贴板").tooltip("fixTitle");
    });
</script>

</body>
</html>