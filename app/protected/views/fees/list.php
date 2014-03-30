<?php $this->widget('application.widgets.SearchTripleWidget'); ?>

<div class="row">
    <div class="col-sm-9">
        <?php $this->widget('application.widgets.FeesListWidget', array(
            'fees' => $fees,
            'terms' => $terms

        )); ?>
    </div>
    <div class="col-sm-3">

        <div class="detailed mt">
            <h4>Compare vs.</h4>
            <div class="recent-activity">
                <div class="activity-icon bg-theme"><i class="fa fa-trophy"></i></div>
                <div class="activity-panel">
                    <h5>Recommended Price</h5>
                    <p>$4,500</p>
                </div>

                <div class="activity-icon bg-theme02"><i class="fa fa-hospital-o"></i></div>
                <div class="activity-panel">
                    <h5>Hospitals</h5>
                    <p>$7,500 - $21,500</p>
                </div>

                <div class="activity-icon bg-theme04"><i class="fa fa-ambulance"></i></div>
                <div class="activity-panel">
                    <h5>Providers in other areas</h5>
                    <p>$2,000 - $2,700</p>
                </div>
            </div>
        </div>


<!--         <div class="darkblue-panel pn">
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
 -->    </div>