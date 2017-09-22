<?php

use yii\helpers\Html;
use yii\grid\GridView;

/* @var $this yii\web\View */
/* @var $searchModel backend\models\BlogSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = 'Blogs';
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="blog-index">
    <p>
        <?= Html::a('创建 Blog', ['create'], ['class' => 'btn btn-success']) ?>
        <?= Html::a('批量删除', "javascript:void(0);", ['class' => 'btn btn-success gridview']) ?>
    </p>
    <?= GridView::widget([
        'options' => ['class' => 'grid-view','style'=>'overflow:auto', 'id' => 'grid'],
        'dataProvider' => $dataProvider,
        'filterModel' => $searchModel,
        'tableOptions' => ['class' => 'table  table-bordered table-hover'],
        'columns' => [
            [
                'class' => 'yii\grid\CheckboxColumn',
                'name' => 'id',
            ],
            'id',
            'title',
            [
                'attribute'=>'column_name',
                'label'=>'栏目',
                'value'=>'column.name',
            ],
            'views',
            'created_at',
            'updated_at',
            [
                "header" => "操作",
                'class' => 'yii\grid\ActionColumn'
            ],
        ],
    ]); ?>
<?php
//批量删除JS
$this->registerJs('
$(".gridview").on("click", function () {
var keys = $("#grid").yiiGridView("getSelectedRows");
$.post("delete-all",{ids:keys},function(data){
    if(data){
        location.reload();
        alert(data);
    }else{
        alert("请选择要删除的对象");
    }
 });
});
');
?>


</div>

