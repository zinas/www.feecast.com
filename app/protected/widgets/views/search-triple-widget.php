<form role="form" method="POST" action="<?php echo Yii::app()->createUrl('fees/search') ?>">
    <div class="row form-group">
        <div class="col-sm-4">
            <div class="left-inner-addon-lg ">
                <i class="fa fa-medkit"></i>
                <input type="text" value="<?php echo Yii::app()->searchState->getTerm('search-need')?>" name="search-need" class="form-control input-lg" id="search-need" placeholder="Describe need or enter CPT code">
            </div>
        </div>
         <div class="col-sm-4">
            <div class="left-inner-addon-lg ">
                <i class="fa fa-stethoscope"></i>
                <input type="text" value="<?php echo Yii::app()->searchState->getTerm('search-provider')?>" name="search-provider" class="form-control input-lg" id="search-provider" placeholder="Health insurance provider">
            </div>
        </div>
        <div class="col-sm-4">
            <div class="left-inner-addon-lg ">
                <i class="fa fa-map-marker"></i>
                <input type="text" value="<?php echo Yii::app()->searchState->getTerm('search-location')?>" name="search-location" class="form-control input-lg" id="search-location" placeholder="Location">
            </div>
        </div>
    </div>
</form>