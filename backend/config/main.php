<?php
$params = array_merge(
    require(__DIR__ . '/../../common/config/params.php'),
    require(__DIR__ . '/../../common/config/params-local.php'),
    require(__DIR__ . '/params.php'),
    require(__DIR__ . '/params-local.php')
);

return [
    'id' => 'app-backend',
    'basePath' => dirname(__DIR__),
    'controllerNamespace' => 'backend\controllers',
    'bootstrap' => ['log'],
    /* yii2-admin 配置 + */
    'modules' => [
        "admin" => [
            "class" => "mdm\admin\Module",
        ],
        'redactor' => [
            'class' => 'yii\redactor\RedactorModule',
            'uploadDir' => './uploads',  // 比如这里可以填写 ./uploads
            'uploadUrl' => '图片可访问地址',
            'imageAllowExtensions'=>['jpg','png','gif']
        ],
    ],
    "aliases" => [
        "@mdm/admin" => "@vendor/mdmsoft/yii2-admin",
    ],
    /* yii2-admin 配置 - */
    //组件配置
    'components' => [
        'request' => [
            'csrfParam' => '_csrf-backend',
        ],
        'user' => [
//            'identityClass' => 'common\models\User',
            'identityClass' => 'backend\models\UserBackend',
            'enableAutoLogin' => true,
            //'identityCookie' => ['name' => '_identity-backend', 'httpOnly' => true],
        ],
        'session' => [
            // this is the name of the session cookie used for login on the backend
            'name' => 'advanced-backend',
        ],
        'log' => [
            'traceLevel' => YII_DEBUG ? 3 : 0,
            'targets' => [
                [
                    'class' => 'yii\log\FileTarget',
                    'levels' => ['error', 'warning'],
                ],
            ],
        ],
        'errorHandler' => [
            'errorAction' => 'site/error',
        ],
        /* url配置 + */
        'urlManager' => [
            //开启美化
            'enablePrettyUrl' => true,
            // 是否在URL中显示入口脚本。是对美化功能的进一步补充。
            'showScriptName' => false,
            // 是否启用严格解析，如启用严格解析，要求当前请求应至少匹配1个路由规则，
            // 否则认为是无效路由。
            // 这个选项仅在 enablePrettyUrl 启用后才有效。
            'enableStrictParsing' => true,
            // 指定续接在URL后面的一个后缀，如 .html 之类的。仅在 enablePrettyUrl 启用时有效。
            'suffix' => '',
            'rules' => [
                "<controller:\w+>/<id:\d+>"=>"<controller>/view",
                "<controller:\w+>/<action:\w+>"=>"<controller>/<action>",
                "<controller:\w+>/<.>"=>"<controller>/<.>",
                "<.>/<action:\w+>"=>"<.>/<action>",
                "<module:\w+>/<controller:\w+>/<action:\w+>"=>"<module>/<controller>/<action>"
            ],
        ],
        /* url配置 - */
        /* yii2-admin 配置 + */
        "authManager" => [
            "class" => 'yii\rbac\DbManager', //这里记得用单引号而不是双引号
            "defaultRoles" => ["guest"],
        ],
        /* yii2-admin 配置 - */
        /* 主题配置+ */
//        'view' => [
//            'theme' => [
//                // 'basePath' => '@app/themes/spring',
//                // 'baseUrl' => '@web/themes/spring',
//                'pathMap' => [
//                    '@app/views' => [
//                        '@app/themes/spring',
//                    ]
//                ],
//            ],
//        ],
        /* 主题配置- */
    ],
    'params' => $params,
//    'as access' => \backend\components\AccessControl::className(),
    /* yii2-admin 配置 + */
    'as access' => [
        'class' => 'mdm\admin\components\AccessControl',
        'allowActions' => [
            //这里是允许访问的路由
            'site/*'
            //'column/index',
        ]
    ],
    /* yii2-admin 配置 - */
    /* 主题行为+ */
//    'as theme' => [
//       // 'class' => 'backend\components\ThemeControl',
//    ],
    /* 主题行为- */

];
