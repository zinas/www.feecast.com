<?php

/**
 * This is the model class for table "center_msg".
 *
 */
class CenterMessage extends CActiveRecord
{
	/**
	 * @return string the associated database table name
	 */
	public function tableName()
	{
		return 'center_msg';
	}

	/**
	 * @return array validation rules for model attributes.
	 */
	public function rules()
	{
		// NOTE: you should only define rules for those attributes that
		// will receive user inputs.
		return array(
			array('center, patient, dateAsked, question', 'required'),
			array('center, patient, cpt, replyTo', 'numerical', 'integerOnly'=>true),
			array('oper', 'length', 'max'=>256),
			array('question', 'length', 'max'=>500),
			// The following rule is used by search().
			// @todo Please remove those attributes that should not be searched.
			array('id, center, patient, dateAsked, cpt, oper, question, replyTo', 'safe', 'on'=>'search'),
		);
	}

	/**
	 * @return array relational rules.
	 */
	public function relations()
	{
		return array(
			'center' => array(self::BELONGS_TO, 'Center', 'center'),
			'patient' => array(self::BELONGS_TO, 'Patient', 'patient'),
			'cpt' => array(self::BELONGS_TO, 'Cpt', 'cpt'),
			'replyTo' => array(self::BELONGS_TO, 'CenterMessage', 'replyTo'),
			'replies' => array(self::HAS_MANY, 'CenterMessage', 'replyTo'),
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
			'patient' => 'Patient',
			'dateAsked' => 'Date Asked',
			'cpt' => 'Cpt',
			'oper' => 'Operator',
			'question' => 'Question',
			'replyTo' => 'Reply To',
		);
	}

	/**
	 * Returns the static model of the specified AR class.
	 * Please note that you should have this exact method in all your CActiveRecord descendants!
	 * @param string $className active record class name.
	 * @return CenterMessage the static model class
	 */
	public static function model($className=__CLASS__)
	{
		return parent::model($className);
	}
}
