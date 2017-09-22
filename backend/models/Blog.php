<?php

namespace backend\models;

use common\models\Column;
use Yii;

/**
 * This is the model class for table "blog".
 *
 * @property integer $id
 * @property string $title
 * @property string $content
 * @property integer $views
 * @property string $created_at
 * @property string $updated_at
 */
class Blog extends \yii\db\ActiveRecord
{
    public $column_name;

    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'blog';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [[ 'content','title','column_id'], 'required'],
            [['content','title'], 'string'],
            [['column_id'], 'integer'],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'title' => '标题',
            'content' => '内容',
            'column_id' => '栏目',
            'views' => '点击量',
            'created_at' => '创建时间',
            'updated_at' => '修改时间',
        ];
    }

    //获取所有column
    public function getAllColumns()
    {
        return Column::find()->select(['name','id'])->indexBy('id')->asArray()->column();
    }

    //blog-column 关联
    public function getColumn()
    {
        return $this->hasOne(Column::className(),['id'=>'column_id']);
    }

}
