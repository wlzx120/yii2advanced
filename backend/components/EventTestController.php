<?php

namespace backend\components;

class EventTestController extends \yii\web\Controller
{
//    const EVENT_TEST = 'event_test' ;
//    const EVENT_TEST2 = 'event_test2' ;
//
//    public function init()
//    {
//        parent::init();
//        $this->on(self::EVENT_TEST,[$this,'doEvent']);
//        $this->on(self::EVENT_TEST2,[$this,'doEvent2']);
//    }

    //事件1
    public static function doEvent()
    {
        echo 'This is a event test';
    }

    //事件2
    public static function doEvent2()
    {
        echo '22222222';
    }

//    public function actionIndex()
//    {
//        return  $this->trigger(self::EVENT_TEST);
//    }
//
//    public function actionIndex2()
//    {
//        return  $this->trigger(self::EVENT_TEST2);
//    }

}
