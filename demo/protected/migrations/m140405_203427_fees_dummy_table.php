<?php

class m140405_203427_fees_dummy_table extends CDbMigration
{
	public function up()
	{
		$this->execute("
CREATE TABLE `fees` (
`id` int(11) NOT NULL AUTO_INCREMENT,
`center_id` int(11) NOT NULL,
`patient_id` int(11) NOT NULL,
`physician_id` int(11) NOT NULL,
`cash_price` double NOT NULL,
`patient_price` double NOT NULL,
PRIMARY KEY (`id`),
KEY `center_id` (`center_id`),
KEY `patient_id` (`patient_id`),
KEY `physician_id` (`physician_id`),
CONSTRAINT `fees_ibfk_3` FOREIGN KEY (`physician_id`) REFERENCES `physician` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
CONSTRAINT `fees_ibfk_1` FOREIGN KEY (`center_id`) REFERENCES `center` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
CONSTRAINT `fees_ibfk_2` FOREIGN KEY (`patient_id`) REFERENCES `patient` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION)
ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='This is a fake table, only to use until the real fees are in place'
");
	}

	public function down()
	{
		$this->dropTable('fees');
	}
}