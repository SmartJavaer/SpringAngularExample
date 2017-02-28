<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html ng-app="angularspring">

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <link href="/static/bootstrap/css/bootstrap.min.css" rel="stylesheet" media="screen">
</head>

<body ng-controller="MainController">

<div class="navbar navbar-fixed">
    <div class="navbar-inner">
        <a class="brand" href="#">
            <msg key="title"></msg>
        </a>
        <ul class="nav">
            <li ng-class="activeWhen(path()=='/person')">
                <a href="#/person">Personen</a>
            </li>
            <li ng-class="activeWhen(path()=='/admin')">
                <a href="#/admin">Administration</a>
            </li>
        </ul>
        <ul class="nav nav-pills pull-right">
            <li ng-class="activeWhen(language()=='de')">
                <a ng-click="setLanguage('de')">中文</a>
            </li>
            <li ng-class="activeWhen(language()=='en')">
                <a ng-click="setLanguage('en')">English</a>
            </li>
        </ul>
        <p class="navbar-text pull-right" style="margin-right: 5em" ng-show="user.name">
            <a ng-click="logout()">Logout</a>
        </p>

        <p class="navbar-text pull-right" style="margin-right: 5em" ng-show="user.name">
            Welcome {{user.name}}
        </p>
    </div>
</div>

<div class="container">
    <div ng-class="'alert alert-'+message().type" ng-show="message().show">
        <button type="button" class="close" ng-click="message().show=false">×</button>
        <msg key-expr="message().text"></msg>
    </div>

    <div class="modal" style="display: none" id="login">
        <div class="modal-header">
            <a class="close" data-dismiss="modal">x</a>

            <h3>Login</h3>
        </div>
        <div class="modal-body">
            <label>See applicationContext.xml for valid username/password.</label>
            <div class="control-group">
                <label class="control-label" for="username">Username</label>

                <div class="controls">
                    <input id="username" ng-model="username"/>
                </div>
            </div>
            <div class="control-group">
                <label class="control-label" for="password">Password</label>

                <div class="controls">
                    <input type="password" id="password" ng-model="password"/>
                </div>
            </div>
        </div>
        <div class="modal-footer">
            <a ng-click="login()" class="btn btn-primary">Login</a>
            <a data-dismiss="modal" class="btn">Cancel</a>
        </div>
    </div>

    <ng-view></ng-view>
</div>
<script type="text/javascript" src="/static/js/jquery-1.8.2.min.js"></script>
<script type="text/javascript" src="/static/js/jquery.i18n.properties-min-1.0.9.js"></script>
<script type="text/javascript" src="/static/js/angular0.js"></script>
<script type="text/javascript" src="/static/js/init.js"></script>
<script type="text/javascript" src="/static/js/controller.js"></script>
<script type="text/javascript" src="/static/js/i18n.js"></script>
<script type="text/javascript" src="/static/js/base64.js"></script>
<script type="text/javascript" src="/static/bootstrap/js/bootstrap.min.js"></script>

</body>
</html>