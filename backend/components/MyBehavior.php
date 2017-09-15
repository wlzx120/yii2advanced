<?php
namespace backend\components;

use Yii;

class MyBehavior extends \yii\base\ActionFilter
{
    public function beforeAction ($action)
    {
        return true;
    }

    public function isGuest ()
    {
        return Yii::$app->user->isGuest;
    }

}