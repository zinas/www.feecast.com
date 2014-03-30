<div class="jumbotron">
    <div class="container main-search-form">

        <div class="body-map">
            <h3>Click an area of the body to see treatment prices</h3>
            <img src="<?php echo Yii::app()->request->baseUrl; ?>/images/body.png" />

            <div data-toggle="tooltip" title="Shoulder" class="body-point body-point-1" data-url="<?php echo Yii::app()->createUrl('fees/list') ?>" data-cpt="PUNCTURE DRAINAGE OF LESION (10160)"></div>
            <div data-toggle="tooltip" title="Breast" class="body-point body-point-2" data-url="<?php echo Yii::app()->createUrl('fees/list') ?>" data-cpt="PUNCTURE DRAINAGE OF LESION (10160)"></div>
            <div data-toggle="tooltip" title="Cardiovascular" class="body-point body-point-3" data-url="<?php echo Yii::app()->createUrl('fees/list') ?>" data-cpt="PUNCTURE DRAINAGE OF LESION (10160)"></div>
            <div data-toggle="tooltip" title="Gynecology" class="body-point body-point-4" data-url="<?php echo Yii::app()->createUrl('fees/list') ?>" data-cpt="PUNCTURE DRAINAGE OF LESION (10160)"></div>
            <div data-toggle="tooltip" title="Hernia - Includes Mesh" class="body-point body-point-5" data-url="<?php echo Yii::app()->createUrl('fees/list') ?>" data-cpt="PUNCTURE DRAINAGE OF LESION (10160)"></div>
            <div data-toggle="tooltip" title="Urology" class="body-point body-point-6" data-url="<?php echo Yii::app()->createUrl('fees/list') ?>" data-cpt="PUNCTURE DRAINAGE OF LESION (10160)"></div>
            <div data-toggle="tooltip" title="Knee" class="body-point body-point-7" data-url="<?php echo Yii::app()->createUrl('fees/list') ?>" data-cpt="PUNCTURE DRAINAGE OF LESION (10160)"></div>
            <div data-toggle="tooltip" title="Foot and Angle" class="body-point body-point-8" data-url="<?php echo Yii::app()->createUrl('fees/list') ?>" data-cpt="PUNCTURE DRAINAGE OF LESION (10160)"></div>
            <div data-toggle="tooltip" title="Neck" class="body-point body-point-9" data-url="<?php echo Yii::app()->createUrl('fees/list') ?>" data-cpt="PUNCTURE DRAINAGE OF LESION (10160)"></div>
            <div data-toggle="tooltip" title="Spine" class="body-point body-point-10" data-url="<?php echo Yii::app()->createUrl('fees/list') ?>" data-cpt="PUNCTURE DRAINAGE OF LESION (10160)"></div>
            <div data-toggle="tooltip" title="Elbow" class="body-point body-point-11" data-url="<?php echo Yii::app()->createUrl('fees/list') ?>" data-cpt="PUNCTURE DRAINAGE OF LESION (10160)"></div>
            <div data-toggle="tooltip" title="Hip" class="body-point body-point-12" data-url="<?php echo Yii::app()->createUrl('fees/list') ?>" data-cpt="PUNCTURE DRAINAGE OF LESION (10160)"></div>
            <div data-toggle="tooltip" title="Wrist / Hand" class="body-point body-point-13" data-url="<?php echo Yii::app()->createUrl('fees/list') ?>" data-cpt="PUNCTURE DRAINAGE OF LESION (10160)"></div>
            <div data-toggle="tooltip" title="Ankle" class="body-point body-point-14" data-url="<?php echo Yii::app()->createUrl('fees/list') ?>" data-cpt="PUNCTURE DRAINAGE OF LESION (10160)"></div>
            <div data-toggle="tooltip" title="Nose" class="body-point body-point-15" data-url="<?php echo Yii::app()->createUrl('fees/list') ?>" data-cpt="PUNCTURE DRAINAGE OF LESION (10160)"></div>
            <div data-toggle="tooltip" title="Eye" class="body-point body-point-16" data-url="<?php echo Yii::app()->createUrl('fees/list') ?>" data-cpt="PUNCTURE DRAINAGE OF LESION (10160)"></div>
            <div data-toggle="tooltip" title="Ear" class="body-point body-point-17" data-url="<?php echo Yii::app()->createUrl('fees/list') ?>" data-cpt="PUNCTURE DRAINAGE OF LESION (10160)"></div>
            <div data-toggle="tooltip" title="Throat" class="body-point body-point-18" data-url="<?php echo Yii::app()->createUrl('fees/list') ?>" data-cpt="PUNCTURE DRAINAGE OF LESION (10160)"></div>
            <div data-toggle="tooltip" title="Arthroscopy" class="body-point body-point-19" data-url="<?php echo Yii::app()->createUrl('fees/list') ?>" data-cpt="PUNCTURE DRAINAGE OF LESION (10160)"></div>
            <div data-toggle="tooltip" title="Fractures" class="body-point body-point-20" data-url="<?php echo Yii::app()->createUrl('fees/list') ?>" data-cpt="PUNCTURE DRAINAGE OF LESION (10160)"></div>
            <div data-toggle="tooltip" title="Hardware Removal" class="body-point body-point-21" data-url="<?php echo Yii::app()->createUrl('fees/list') ?>" data-cpt="PUNCTURE DRAINAGE OF LESION (10160)"></div>
            <div data-toggle="tooltip" title="Miscellaneous" class="body-point body-point-22" data-url="<?php echo Yii::app()->createUrl('fees/list') ?>" data-cpt="PUNCTURE DRAINAGE OF LESION (10160)"></div>
            <div data-toggle="tooltip" title="Pain" class="body-point body-point-23" data-url="<?php echo Yii::app()->createUrl('fees/list') ?>" data-cpt="PUNCTURE DRAINAGE OF LESION (10160)"></div>
            <div data-toggle="tooltip" title="General Surgery" class="body-point body-point-24" data-url="<?php echo Yii::app()->createUrl('fees/list') ?>" data-cpt="PUNCTURE DRAINAGE OF LESION (10160)"></div>
        </div>

        <div class="search-text">
            <h3>OR</h3>
            <?php $this->widget('application.widgets.SearchWidget'); ?>
        </div>
    </div>
</div>

<?php

