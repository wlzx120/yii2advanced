<?php
return [
    'vendorPath' => dirname(dirname(__DIR__)) . '/vendor',
    //配置语言
    'language'=>'zh-CN',
    //配置时区
    'timeZone'=>'Asia/Shanghai',
    //组件配置
    'components' => [
        //配置缓存
        'cache' => [
            'class' => 'yii\caching\FileCache',
        ],
        //配置数据库
        'db' => [
            'class' => 'yii\db\Connection',
            'dsn' => 'mysql:host=localhost;dbname=yii2advanced',
            'username' => 'root',
            'password' => '',
            'charset' => 'utf8',
        ],
       //配置邮件
        'mailer' => [
            'class' => 'yii\swiftmailer\Mailer',
            'viewPath' => '@common/mail',
            'useFileTransport' => false,
            'transport' => [
                'class' => 'Swift_SmtpTransport',
                'host' => 'smtp.163.com',
                'username' => 'wlzx120@163.com',
                'password' => 'csg123456',        //如果是163邮箱，此处要填授权码
                'port' => '25',
                'encryption' => 'tls',
            ],
            'messageConfig'=>[
                'charset'=>'UTF-8',
                'from'=>['wlzx120@163.com'=>'yii2博客站']
            ],
        ],
        //authManager有PhpManager和DbManager两种方式,
        //PhpManager将权限关系保存在文件里,这里使用的是DbManager方式,将权限关系保存在数据库.
        "authManager" => [
            "class" => 'yii\rbac\DbManager',
        ],
    ],


];
