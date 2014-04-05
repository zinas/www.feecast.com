<?php

class m140405_161305_add_image_column_to_centers extends CDbMigration
{
	public function up()
	{
		$this->addColumn('center', 'logo', 'VARCHAR(255) NULL');
	}

	public function down()
	{
		$this->dropColumn('center', 'logo');
	}
}