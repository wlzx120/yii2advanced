<?php

use yii\helpers\Html;


/* @var $this yii\web\View */
/* @var $model common\models\Column */

$this->title = '添加栏目';
$this->params['breadcrumbs'][] = ['label' => 'Columns', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="column-create">

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
