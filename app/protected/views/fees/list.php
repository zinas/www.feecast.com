<?php $this->widget('application.widgets.SearchTripleWidget'); ?>
<div class="row">
    <div class="col-sm-9">
        <?php $this->widget('application.widgets.FeesListWidget', array(
            'extended' => $extended,
            'fees' => $fees,
            'need' => Yii::app()->request->getPost('search-need')

        )); ?>
    </div>
    <div class="col-sm-3">
        <div class="darkblue-panel pn">
            <div class="darkblue-header">
                <h5>Compare</h5>
            </div>
            <h1 class="mt"><i class="fa fa-hospital-o fa-3x"></i></h1>
            <p>vs. hospitals</p>
            <footer>
                <div class="centered">
                    <h5><i class="fa fa-trophy"></i> $3000 - $4500</h5>
                </div>
            </footer>
        </div>
        <br>
        <div class="darkblue-panel pn">
            <div class="darkblue-header">
                <h5>Compare</h5>
            </div>
            <h1 class="mt"><i class="fa fa-ambulance fa-3x"></i></h1>
            <p>vs. other providers</p>
            <footer>
                <div class="centered">
                    <h5><i class="fa fa-trophy"></i> $666 - $999</h5>
                </div>
            </footer>
        </div>
    </div>