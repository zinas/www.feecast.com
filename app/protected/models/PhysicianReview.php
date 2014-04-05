<?php

/**
 * This is the model class for table "phys_review".
 *
 */
class PhysicianReview extends CActiveRecord
{
	/**
	 * @return string the associated database table name
	 */
	public function tableName()
	{
		return 'phys_review';
	}

	/**
	 * @return array validation rules for model attributes.
	 */
	public function rules()
	{
		// NOTE: you should only define rules for those attributes that
		// will receive user inputs.
		return array(
			array('physician, user, dateCreated', 'required'),
			array('physician, user, rating', 'numerical', 'integerOnly'=>true),
			array('comment', 'length', 'max'=>500),
			array('dateMod', 'safe'),
			// The following rule is used by search().
			// @todo Please remove those attributes that should not be searched.
			array('id, physician, user, rating, comment, dateCreated, dateMod', 'safe', 'on'=>'search'),
		);
	}

	/**
	 * @return array relational rules.
	 */
	public function relations()
	{
		return array(
			'physician' => array(self::BELONGS_TO, 'Physician', 'physician'),
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
			'physician' => 'Physician',
			'user' => 'User',
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
	 * @return PhysicianReview the static model class
	 */
	public static function model($className=__CLASS__)
	{
		return parent::model($className);
	}
}
