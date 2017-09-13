<?php

use yii\db\Migration;
use yii\db\mysql\Schema;

class m170912_093533_create_table_column extends Migration
{
    public function up()
    {
        $this->createTable('column', [
            'id' => $this->primaryKey(),
            'name' => $this->string(255),
            'created_at' => $this->string(11),
            'updated_at' => $this->string(11),
        ]);
    }

    public function down()
    {
        $this->dropTable('column');
    }

}
