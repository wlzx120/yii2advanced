<?php

namespace common\models;

use backend\models\Blog;
use Yii;

/**
 * This is the model class for table "column".
 *
 * @property integer $id
 * @property string $name
 * @property string $created_at
 * @property string $updated_at
 */
class Column extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'column';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['name'], 'required'],
            [['name'], 'string', 'max' => 255],
            [['created_at', 'updated_at'], 'string', 'max' => 11],
            [['file'], 'string', 'max' => 255],

        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'name' => '栏目名称',
            'created_at' => '添加时间',
            'updated_at' => '更新时间t',
        ];
    }

    // column-blog 关联
    public function getColumn()
    {
        return $this->hasMany(Blog::className(),['column_id'=>'id']);
    }

}
