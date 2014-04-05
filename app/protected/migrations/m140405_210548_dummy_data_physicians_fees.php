<?php

class m140405_210548_dummy_data_physicians_fees extends CDbMigration
{
	public function up()
	{
		$this->insert('physician', array(
			'phyLic' => 'A',
			'phyLogin' => 'doc1',
			'phyPwd' => 'doc1',
			'phyName' => 'Gregory',
			'phyFamName' => 'House',
			'phyMidName' => '',
			'phyTitle' => 'MD',
			'phyEmail' => 'house@feecast.com',
		));
		$this->insert('physician', array(
			'phyLic' => 'B',
			'phyLogin' => 'doc2',
			'phyPwd' => 'doc2',
			'phyName' => 'Sheldon',
			'phyFamName' => 'Cooper',
			'phyMidName' => '',
			'phyTitle' => 'Dr.',
			'phyEmail' => 'sheldon@feecast.com',
		));
		$this->insert('physician', array(
			'phyLic' => 'C',
			'phyLogin' => 'doc3',
			'phyPwd' => 'doc3',
			'phyName' => 'John',
			'phyFamName' => 'Zoidberg',
			'phyMidName' => 'A.',
			'phyTitle' => 'Dr.',
			'phyEmail' => 'sheldon@feecast.com',
		));
		$this->insert('fees', array(
			'center_id' => 1,
			'patient_id' => 3,
			'physician_id' => 1,
			'cash_price' => 3000,
			'patient_price' => 2500
		));

		$this->insert('fees', array(
			'center_id' => 1,
			'patient_id' => 3,
			'physician_id' => 2,
			'cash_price' => 6000,
			'patient_price' => 4000
		));

		$this->insert('fees', array(
			'center_id' => 1,
			'patient_id' => 3,
			'physician_id' => 3,
			'cash_price' => 8000,
			'patient_price' => 2000
		));

	}

	public function down()
	{
		$this->execute('TRUNCATE TABLE physician');
		$this->execute('TRUNCATE TABLE fees');
	}

}