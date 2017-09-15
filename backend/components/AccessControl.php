<?php
namespace backend\components;

use Yii;
use yii\web\ForbiddenHttpException;

class AccessControl extends \yii\base\ActionFilter
{
    public function beforeAction ($action)
    {
        //获取当前路由和uid
        $actionId = $action->getUniqueId();
        $actionId = '/'.$actionId;
        $user = Yii::$app->getUser();
        $userId = $user->id;
        //获取当前用户的权限
        $routes = [];
        $manager = Yii::$app->getAuthManager();
        foreach($manager->getPermissionsByUser($userId) as $name=>$value){
            if($name[0] === '/'){
                $routes[] =$name;
            }
        }
        //判断当前路由是否在用户权限组中
        if(in_array($actionId,$routes)){
            return true;
        }
        $this->denyAccess($user);
    }

    /**
     * 拒绝访问
     * 如果是访客则跳转登录，已登录跳403
     */
    protected function denyAccess($user)
    {
        if ($user->getIsGuest()) {
            $user->loginRequired();
        } else {
            throw new ForbiddenHttpException('不允许访问.');
        }
    }

}