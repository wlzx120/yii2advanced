<?php

namespace backend\controllers;

use Illuminate\Support\Facades\Request;
use Yii;
use common\models\Column;
use common\models\ColumnSearch;
use yii\web\Controller;
use yii\web\NotFoundHttpException;
use yii\filters\VerbFilter;
use common\components\Upload;
use yii\web\Response;
use common\components\MailEvent;

/**
 * ColumnController implements the CRUD actions for Column model.
 */
class ColumnController extends Controller
{
    //定义事件
    const EVENT_TEST = 'event_test';
    const EVENT_EMAIL = 'event_email';
    public function init()
    {
        parent::init();
        //事件绑定
        $this->on(self::EVENT_TEST,['backend\components\EventTestController','doEvent']);
        $this->on(self::EVENT_EMAIL,['common\models\Mail','sendEmail']);
    }
    /**
     * @inheritdoc
     */
    public function behaviors()
    {
        return [
            //通过行为实现rbac
//            'as access' => [
//                'class' => 'backend\components\AccessControl',
//            ],
            'verbs' => [
                'class' => VerbFilter::className(),
                'actions' => [
                    'delete' => ['POST'],
                ],
            ],
        ];
    }

    /**
     * Lists all Column models.
     * @return mixed
     */
    public function actionIndex()
    {
        $searchModel = new ColumnSearch();
        $dataProvider = $searchModel->search(Yii::$app->request->queryParams);

        return $this->render('index', [
            'searchModel' => $searchModel,
            'dataProvider' => $dataProvider,
        ]);
    }

    /**
     * Displays a single Column model.
     * @param integer $id
     * @return mixed
     */
    public function actionView($id)
    {
        return $this->render('view', [
            'model' => $this->findModel($id),
        ]);
    }

    /**
     * Creates a new Column model.
     * If creation is successful, the browser will be redirected to the 'view' page.
     * @return mixed
     */
    public function actionCreate()
    {
        $model = new Column();

        if ($model->load(Yii::$app->request->post()) && $model->save()) {
            return $this->redirect(['view', 'id' => $model->id]);
        } else {
            return $this->render('create', [
                'model' => $model,
            ]);
        }
    }

    /**
     * Updates an existing Column model.
     * If update is successful, the browser will be redirected to the 'view' page.
     * @param integer $id
     * @return mixed
     */
    public function actionUpdate($id)
    {
        $model = $this->findModel($id);

        if ($model->load(Yii::$app->request->post()) && $model->save()) {
            return $this->redirect(['view', 'id' => $model->id]);
        } else {
            return $this->render('update', [
                'model' => $model,
            ]);
        }
    }

    /**
     * Deletes an existing Column model.
     * If deletion is successful, the browser will be redirected to the 'index' page.
     * @param integer $id
     * @return mixed
     */
    public function actionDelete($id)
    {
        $this->findModel($id)->delete();

        return $this->redirect(['index']);
    }

    /**
     * Finds the Column model based on its primary key value.
     * If the model is not found, a 404 HTTP exception will be thrown.
     * @param integer $id
     * @return Column the loaded model
     * @throws NotFoundHttpException if the model cannot be found
     */
    protected function findModel($id)
    {
        if (($model = Column::findOne($id)) !== null) {
            return $model;
        } else {
            throw new NotFoundHttpException('The requested page does not exist.');
        }
    }

    //文件上传
    public function actionUpload()
    {
        try {
            Yii::$app->response->format = Response::FORMAT_JSON;

            $model = new Upload();
            $info = $model->upImage();

            if ($info && is_array($info)) {
                return $info;
            } else {
                return ['code' => 1, 'msg' => 'error'];
            }
        } catch (\Exception $e) {
            return ['code' => 1, 'msg' => $e->getMessage()];
        }
    }

    public function actionTest()
    {
        return $this->trigger(self::EVENT_TEST);
    }

    public function actionSendEmail()
    {
        // 触发邮件事件
        $event = new MailEvent;
        $event->email = '270077706@qq.com';
        $event->subject = '事件邮件测试';
        $event->content = '邮件测试内容';
        $this->trigger(self::EVENT_EMAIL, $event);
    }


}
