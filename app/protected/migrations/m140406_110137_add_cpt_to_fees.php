<?php

class m140406_110137_add_cpt_to_fees extends CDbMigration
{
	// Use safeUp/safeDown to do migration with transaction
	public function safeUp()
	{
		$this->addColumn('fees', 'cpt_id', 'INT NOT NULL DEFAULT 1');
		$this->createIndex("cpt_index", "fees", "cpt_id");
		$this->addForeignKey("cpt_fk", "fees", "cpt_id", "cpt", "id", "NO ACTION", "NO ACTION");
	}

	public function safeDown()
	{
		$this->dropForeignKey("cpt_fk", "fees");
		$this->dropIndex("cpt_index", "fees");
		$this->dropColumn("fees", "cpt_id");
	}
}