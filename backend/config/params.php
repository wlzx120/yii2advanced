<?php
return [
    'adminEmail' => 'admin@example.com',

    /* 图片上传插件webuploader + */
    'webuploader' => [
        // 后端处理图片的地址，value 是相对的地址
        'uploadUrl' => 'column/upload',
        // 多文件分隔符
        'delimiter' => ',',
        // 基本配置
        'baseConfig' => [
            'defaultImage' => 'http://img1.imgtn.bdimg.com/it/u=2056478505,162569476&fm=26&gp=0.jpg',
            'disableGlobalDnd' => true,
            'accept' => [
                'title' => 'Images',
                'extensions' => 'gif,jpg,jpeg,bmp,png',
                'mimeTypes' => 'image/*',
            ],
            'pick' => [
                'multiple' => false,
            ],
        ],
    ],
    Yii::$app->params['webuploader']['uploadUrl'],      // 配置图片上传使用的方法
    'domain' => 'http://admin.yii2advanced.com',       // 访问图片的域名拼接
    'imageUploadRelativePath' => './uploads/images/', // 图片默认上传的目录
    'imageUploadSuccessPath' => '/uploads/images/', // 图片上传成功后，路径前缀
    /* 图片上传插件webuploader - */

];
