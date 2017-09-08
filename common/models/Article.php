<?php

namespace common\models;

use Yii;

/**
 * This is the model class for table "article".
 *
 * @property string $id
 * @property string $title
 * @property string $content
 * @property string $author
 * @property string $add_time
 * @property string $update_time
 * @property integer $column
 */
class Article extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'article';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['title', 'content', 'author', 'add_time', 'column'], 'required'],
            [['content'], 'string'],
            [['column'], 'integer'],
            [['title', 'author'], 'string', 'max' => 255],
            [['add_time', 'update_time'], 'string', 'max' => 11],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'title' => 'Title',
            'content' => 'Content',
            'author' => 'Author',
            'add_time' => 'Add Time',
            'update_time' => 'Update Time',
            'column' => 'Column',
        ];
    }
}
