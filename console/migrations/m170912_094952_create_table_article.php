<?php

use yii\db\Migration;

class m170912_094952_create_table_article extends Migration
{
    public function up()
    {
        $this->createTable('article', [
            'id' => $this->primaryKey(),
            'title' => $this->string(255)->notNull(),
            'column' => $this->integer(2)->notNull(),
            'content' => $this->text()->notNull(),
            'author' => $this->string(255)->notNull(),
            'created_at' => $this->string(11)->notNull(),
            'updated_at' => $this->string(11)->notNull()
        ]);
    }

    public function down()
    {
        $this->dropTable('article');
    }
}
