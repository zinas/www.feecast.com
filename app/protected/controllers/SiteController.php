<?php

class SiteController extends Controller
{
	var $layout = '//layouts/bootstrap-single-column';
	/**
	 * Declares class-based actions.
	 */
	public function actions()
	{
		return array(
			// captcha action renders the CAPTCHA image displayed on the contact page
			'captcha'=>array(
				'class'=>'CCaptchaAction',
				'backColor'=>0xFFFFFF,
			),
			// page action renders "static" pages stored under 'protected/views/site/pages'
			// They can be accessed via: index.php?r=site/page&view=FileName
			'page'=>array(
				'class'=>'CViewAction',
			),
		);
	}

	/**
	 * This is the default 'index' action that is invoked
	 * when an action is not explicitly requested by users.
	 */
	public function actionIndex()
	{
		$this->layout = '//layouts/bootstrap-single-column';
		$this->render('index');
	}

	public function actionSignup()
	{
		$this->layout = '//layouts/bootstrap-single-column-container';
		$this->render('signup');
	}

	public function actionLogin()
	{
		$identity=new UserIdentity(Yii::app()->request->getPost('username'),Yii::app()->request->getPost('password'));
		$identity->authenticate();
		if($identity->authenticate()) {
		    Yii::app()->user->login($identity);
		    $this->redirect(Yii::app()->request->urlReferrer);
		} else {
		    echo 'Wrong username or password';
		}
	}

	public function actionLogout() {
		Yii::app()->user->logout();
		$this->redirect(array('site/index'));
	}

	/**
	 * This is the action to handle external exceptions.
	 */
	public function actionError()
	{
		$this->layout = '//layouts/bootstrap-naked';
		if($error=Yii::app()->errorHandler->error)
		{
			//CVarDumper::dump($error, 10, true);
			if(Yii::app()->request->isAjaxRequest)
				echo $error['message'];
			else {
				$this->render('error', $error);
			}
		}
	}
}