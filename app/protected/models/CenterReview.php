<?php

/**
 * This is the model class for table "center_review".
 *
 */
class CenterReview extends CActiveRecord
{
	/**
	 * @return string the associated database table name
	 */
	public function tableName()
	{
		return 'center_review';
	}

	/**
	 * @return array validation rules for model attributes.
	 */
	public function rules()
	{
		// NOTE: you should only define rules for those attributes that
		// will receive user inputs.
		return array(
			array('center, user, rating, dateCreated', 'required'),
			array('center, user, rating', 'numerical', 'integerOnly'=>true),
			array('comment', 'length', 'max'=>500),
			array('dateMod', 'safe'),
			// The following rule is used by search().
			// @todo Please remove those attributes that should not be searched.
			array('id, center, user, rating, comment, dateCreated, dateMod', 'safe', 'on'=>'search'),
		);
	}

	/**
	 * @return array relational rules.
	 */
	public function relations()
	{
		return array(
			'center' => array(self::BELONGS_TO, 'Center', 'center'),
			'patient' => array(self::BELONGS_TO, 'Patient', 'user'),
		);
	}

	/**
	 * @return array customized attribute labels (name=>label)
	 */
	public function attributeLabels()
	{
		return array(
			'id' => 'ID',
			'center' => 'Center',
			'user' => 'Patient',
			'rating' => 'Rating',
			'comment' => 'Comment',
			'dateCreated' => 'Date Created',
			'dateMod' => 'Date Modified',
		);
	}

	/**
	 * Returns the static model of the specified AR class.
	 * Please note that you should have this exact method in all your CActiveRecord descendants!
	 * @param string $className active record class name.
	 * @return CenterReview the static model class
	 */
	public static function model($className=__CLASS__)
	{
		return parent::model($className);
	}
}
