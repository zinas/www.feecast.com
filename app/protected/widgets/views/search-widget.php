<form class="form-inline" role="form" method="POST" action="<?php echo Yii::app()->createUrl('fees/list') ?>">
    <div class="form-group">
        <div class="left-inner-addon-lg ">
            <i class="fa fa-medkit"></i>
            <input type="text" class="form-control input-lg" id="search-need" name="search-need" placeholder="Loading data, please wait...">
        </div>
    </div>
    <div class="form-group">
        <button class="btn-theme btn-lg btn">Search</button>
    </div>
</form>