<div class="jumbotron">
    <div class="container main-search-form">

        <div class="">
            <h3>Click an area of the body to see treatment prices</h3>
            <img src="<?php echo Yii::app()->request->baseUrl; ?>/images/body.png" />
        </div>

        <div class="search-text">
            <h3>OR</h3>
            <?php $this->widget('application.widgets.SearchWidget'); ?>
        </div>
    </div>
</div>
