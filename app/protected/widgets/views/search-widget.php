<form class="form-inline" role="form" method="POST" action="<?php echo Yii::app()->createUrl('fees/search') ?>">
    <div class="form-group">
        <input type="text" class="form-control input-lg" id="search-need" placeholder="Enter keyword or CPT code to descibe need (e.g. Colonoscopy or 44388)">
    </div>
    <div class="form-group">
        <button class="btn-theme btn-lg btn">Search</button>
    </div>
</form>
<!--
<form role="form" method="POST" action="<?php echo Yii::app()->createUrl('fees/search') ?>">
    <div class="row form-group">
        <div class="col-sm-4">
            <input type="text" name="search-need" class="form-control" id="search-need" placeholder="Describe need or enter CPT code">
        </div>
         <div class="col-sm-4">
            <input type="text" name="search-provider" class="form-control" id="search-provider" placeholder="Health insurance provider">
        </div>
        <div class="col-sm-4">
            <input type="text" name="search-location" class="form-control" id="search-location" placeholder="Location">
        </div>
    </div>
    <div class="row form-group">
        <div class="col-sm-4 col-sm-offset-4">
            <button class="btn-primary btn-large btn form-control">Search</button>
        </div>
    </div>
</form>
 -->