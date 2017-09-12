<?php

use yii\db\Migration;
use yii\db\Schema;

class m170912_014011_add_role_to_user_table extends Migration
{
    // Use up()/down() to run migration code without a transaction.
    public function up()
    {
        $this->addColumn('{{%user}}','role',Schema::TYPE_INTEGER .'(1) NOT NULL DEFAULT "0" COMMENT "角色等级"');
    }

    public function down()
    {
        $this->dropColumn('{{%user}}','role');
    }

}
