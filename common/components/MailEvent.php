<?php

namespace common\components;

use yii\base\Component;
use yii\base\Event;

class MailEvent extends Event
{
    public $email;

    public $subject;

    public $content;
}