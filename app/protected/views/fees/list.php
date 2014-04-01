<?php $hasInsuranceInfo=Yii::app()->user->hasInsuranceInfo; ?>
<div class="row">
    <div class="col-sm-9">
        <div class="content-panel" style="margin-bottom: 10px;">
            <table class="table">
                <thead>
                    <tr>
                        <th>Price Range</th>
                        <th>Location</th>
                        <th></th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>
                            <input
                                type="text"
                                class="my-slider"
                                value=""
                                data-slider-min="100"
                                data-slider-max="25000"
                                data-slider-step="100"
                                data-slider-value="[100,25000]" style="">

                        </td>
                        <td><input type="text" placeholder="Location"></td>
                        <td><button class="btn btn-xs btn-primary">Filter Fees</button></td>
                    </tr>
                </tbody>
            </table>
        </div>
        <div id="no-more-tables" class="content-panel">
            <h2>Fee details</h2>
            <h4 class="theme"></h4>

            <div class="adv-table">
                <table cellpadding="0" cellspacing="0" border="0" class="table cf" id="fees-list">
                    <thead class="cf">
                        <tr>
                            <th style="min-width: 40px;"></th>
                            <th>Facility</th>
                            <th>Location</th>
                            <th class="text-center">Your Price</th>
                        <?php if ($hasInsuranceInfo===true) { ?>
                            <th></th>
                        <?php } ?>
                        </tr>
                    </thead>
                    <tbody>
                    <?php foreach ($fees as $fee) { ?>
                        <tr>
                            <td style="height: 44px;" class="text-center">
                                <i class="call-to-action theme fa fa-plus-circle fa-2x"></i>
                                <i class="rev-call-to-action theme fa fa-minus-circle fa-2x"></i>
                            </td>
                            <td data-title="Facility"><?php echo $fee['facility']?></td>
                            <td data-title="Location"><?php echo $fee['location']?></td>
                            <td class="text-center" data-title="Your Price">
                                <div class="price-info">
                                <?php if ($hasInsuranceInfo) { ?>
                                    <span class="theme-prominent"><?php echo $fee['userPrice']?></span>
                                <?php } else { ?>
                                    <a data-toggle="modal" href="#insurance-info-modal">Enter insurance info</a>
                                    <?php if (Yii::app()->user->isGuest) { ?>
                                        <p style="margin:0; padding: 0;">or</p> <a data-toggle="modal" href="#login-form-modal">login</a>
                                    <?php } ?>
                                <?php } ?>
                                </div>
                            </td>
                        <?php if ($hasInsuranceInfo===true) { ?>
                            <td data-title=""><button type="button" class="btn btn-theme">Request an appointment</button></td>
                        <?php } ?>
                        </tr>
                    <?php } ?>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
    <div class="col-sm-3">

            <div class="recent-activity">
                <div class="activity-panel">
                    <div class="media">
                        <div class="pull-left">
                            <i class="fa fa-money fa-4x theme media-object"></i>
                        </div>
                        <div class="media-body">
                            <h5>Price range</h5>
                            <p>$1,500 - 21,500</p>
                        </div>
                    </div>
                </div>

                <div class="activity-panel">
                    <div class="media">
                        <div class="pull-left">
                            <i class="fa fa-bar-chart-o fa-4x theme-4 media-object"></i>
                        </div>
                        <div class="media-body">
                            <h5>Average Price</h5>
                            <p>$4,500</p>
                        </div>
                    </div>
                </div>

                <div class="activity-panel">
                    <div class="media">
                        <div class="pull-left">
                            <i class="fa fa-hospital-o fa-4x theme-2 media-object"></i>
                        </div>
                        <div class="media-body">
                            <h5>Hospitals</h5>
                            <p>$7,500 - $21,500</p>
                        </div>
                    </div>
                </div>

                <div class="activity-panel">
                    <div class="media">
                        <div class="pull-left">
                            <i class="fa fa-ambulance fa-4x theme-3 media-object"></i>
                        </div>
                        <div class="media-body">
                            <h5>Providers in other areas</h5>
                            <p>$2,000 - $2,700</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
<?php
        Yii::app()->clientScript->registerScriptFile(Yii::app()->request->baseUrl . "/js/advanced-datatable/media/js/jquery.dataTables.js", CClientScript::POS_END);
        Yii::app()->clientScript->registerScriptFile(Yii::app()->request->baseUrl . "/js/advanced-datatable/media/js/DT_bootstrap3.js", CClientScript::POS_END);
        Yii::app()->clientScript->registerScriptFile(Yii::app()->request->baseUrl . "/js/feeslist.js", CClientScript::POS_END);
?>