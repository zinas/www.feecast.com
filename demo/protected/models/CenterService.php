<?php

/**
 * This is the model class for table "center_services".
 *
 */
class CenterService extends CActiveRecord
{
	/**
	 * @return string the associated database table name
	 */
	public function tableName()
	{
		return 'center_services';
	}

	/**
	 * @return array validation rules for model attributes.
	 */
	public function rules()
	{
		// NOTE: you should only define rules for those attributes that
		// will receive user inputs.
		return array(
			array('center', 'required'),
			array('center, cpt', 'numerical', 'integerOnly'=>true),
			array('highLevelDesc', 'length', 'max'=>45),
			// The following rule is used by search().
			// @todo Please remove those attributes that should not be searched.
			array('id, center, cpt, highLevelDesc', 'safe', 'on'=>'search'),
		);
	}

	/**
	 * @return array relational rules.
	 */
	public function relations()
	{
		return array(
			'center' => array(self::BELONGS_TO, 'Center', 'center'),
			'cpt' => array(self::BELONGS_TO, 'Cpt', 'cpt'),
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
			'cpt' => 'Cpt',
			'highLevelDesc' => 'Description',
		);
	}

	/**
	 * Returns the static model of the specified AR class.
	 * Please note that you should have this exact method in all your CActiveRecord descendants!
	 * @param string $className active record class name.
	 * @return CenterService the static model class
	 */
	public static function model($className=__CLASS__)
	{
		return parent::model($className);
	}
}
