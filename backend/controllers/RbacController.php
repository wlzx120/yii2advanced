<?php

namespace backend\controllers;
use Yii;
use yii\web\Controller;

class RbacController extends \yii\web\Controller
{
    public function actionInit()
    {
        //权限类
        $auth = Yii::$app->authManager;
        //创建博客列表权限
        $blogIndex = $auth->createPermission('/blog/index');
        $blogIndex->description = '博客列表';
        $auth->add($blogIndex);
        //创建博客管理者角色
        $blogManager = $auth->createRole('博客管理员');
        $auth->add($blogManager);
        //角色和权限关联
        $auth->addChild($blogManager,$blogIndex);
        //用户和角色关联,给id为1的用户分配管理员角色
        $auth->assign($blogManager,1);
    }

    public function actionInit2()
    {
        //权限类
        $auth = Yii::$app->authManager;
        //创建博客权限
        $blogView = $auth->createPermission('/blog/view');
        $auth->add($blogView);
        $blogCreate = $auth->createPermission('/blog/create');
        $auth->add($blogCreate);
        $blogUpdate = $auth->createPermission('/blog/update');
        $auth->add($blogUpdate);
        $blogDelete = $auth->createPermission('/blog/delete');
        $auth->add($blogDelete);
        //角色和权限关联
        $blogManager = $auth->getRole('博客管理员');
        $auth->addChild($blogManager,$blogView);
        $auth->addChild($blogManager,$blogCreate);
        $auth->addChild($blogManager,$blogUpdate);
        $auth->addChild($blogManager,$blogDelete);
    }




}
