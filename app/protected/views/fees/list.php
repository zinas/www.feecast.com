<div class="row">
    <div class="col-sm-9">
        <div class="" style="margin-bottom: 10px;">

            <div class="row fees-filters">
                <!-- <div class="col-sm-5">
                    <label>Price Range</label>
                    <div style="padding-top: 7px;">
                    <input
                        type="text"
                        class="my-slider"
                        value=""
                        data-slider-min="100"
                        data-slider-max="25000"
                        data-slider-step="100"
                        data-slider-value="[5000,20000]" style="">
                    </div>
                </div>
                <div class="col-sm-4">
                    <label>Location</label>
                    <input type="text" class="form-control input-sm" placeholder="Location">
                </div>
                <div class="col-sm-3" style="padding-top: 23px;">
                    <button class="btn btn-sm btn-primary">Filter Fees</button>
                </div> -->

                <a href="#" style="margin-left: 30px;">Advanced search</a>
            </div>

        </div>
        <div id="no-more-tables" class="content-panel">
            <div class="search-fees-title">
                <h2>Fee details</h2>
                <h4 class="theme"><?php echo $term?></h4>
            </div>
            <div class="adv-table">
                <table cellpadding="0" cellspacing="0" border="0" class="table cf" id="fees-list">
                    <thead class="cf">
                        <tr>
                            <th style="min-width: 40px;"></th>
                            <th>Facility</th>
                            <th>Location</th>
                            <th class="text-center">Total Cost</th>
                            <th></th>
                        </tr>
                    </thead>
                    <tbody>
                    <?php foreach ($centers as $center) { ?>
                        <tr
                            data-center-id="<?php echo $center->id?>"
                            data-target-url="<?php echo $this->createUrl('fees/physicians')?>"
                            data-contact-url="<?php echo $this->createUrl('providers/contact')?>"
                            data-cpt-id="<?php echo $center->cpt ?>"
                            data-loaded="0">
                            <td style="height: 44px;" class="text-center">
                                <i class="call-to-action theme fa fa-plus-circle fa-2x"></i>
                                <i class="rev-call-to-action theme fa fa-minus-circle fa-2x"></i>
                            </td>
                            <td data-title="Facility">
                                <a class="theme" href="<?php echo $this->createUrl('providers/details?id='.$center->id)?>" class="js-center-details">
                                    <?php echo $center->name?>
                                </a>
                            </td>
                            <td data-title="Location"><?php echo $center->addrRoad?></td>
                            <td class="text-center" data-title="Your Price">
                                <div class="price-info">
                                <?php if (Yii::app()->user->hasInsuranceInfo) { ?>
                                    <span class="theme-prominent">
                                        <?php echo _::currency($center->minTotal).' - '._::currency($center->maxTotal)?>
                                    </span>
                                <?php } else { ?>
                                    <button class="btn btn-default">Get your price</button>
                                    <?php /*
                                    <a data-toggle="modal" href="#insurance-info-modal">Enter insurance info</a>
                                    <?php if (Yii::app()->user->isGuest) { ?>
                                        <p style="margin:0; padding: 0;">or</p> <a data-toggle="modal" href="#login-form-modal">login</a>
                                    <?php } ?>
                                    */ ?>
                                <?php } ?>
                                </div>
                            </td>
                            <td data-title=""><button type="button" class="btn btn-theme js-contact-provider">Contact provider</button></td>
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
                            <p><?php echo _::currency($summary['min_price']) . ' - ' . _::currency($summary['max_price'])?></p>
                        </div>
                    </div>
                </div>

                <div class="activity-panel">
                    <div class="media">
                        <div class="pull-left">
                            <i class="fa fa-bar-chart-o fa-4x theme-4 media-object"></i>
                        </div>
                        <div class="media-body">
                            <h5>Max Recommended Price</h5>
                            <p><?php echo _::currency(3*$summary['average_price']) ?></p>
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
                            <p class="discreet">Not implented yet</p>
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
                            <p class="discreet">Not implented yet</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>


<!-- modal for insurance info -->

<div class="modal fade login-modal " id="insurance-info-modal" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-sm">
    <div class="modal-content">
<div id="login-page">
<form class="form-login" method="POST" action="<?php echo Yii::app()->createUrl('fees/list') ?>">
    <input type="hidden" name="search-need" value="<?php echo $term ?>">
  <h2 class="form-login-heading">fill in your insurance info</h2>
  <div class="login-wrap">
        <label>Choose insurance carrier</label>
        <select name="carrier" class="insurance-carrier" data-target-url="<?php echo $this->createUrl('fees/plans')?>">
            <option value="-1">Select one...</option>
            <?php foreach ($providers as $provider) { ?>
                <option value="<?php echo $provider->id?>"><?php echo $provider->insName?></option>
            <?php } ?>
        </select>
        <div class="insurance-options hidden">
      <hr>
        <label>Select plan</label>
        <div class="plans-placeholder"></div>
        <br><br><strong>OR</strong><br><br>
      <label>Enter your policy number</label>
      <input type="text" class="form-control" name="password" placeholder="Policy number">
      <br>
      <button class="btn btn-theme btn-block" type="submit">See your personal price!</button>
    </div>
  </div>

</form>
</div>


    </div>
  </div>
</div>


<?php
        Yii::app()->clientScript->registerScriptFile(Yii::app()->request->baseUrl . "/js/advanced-datatable/media/js/jquery.dataTables.js", CClientScript::POS_END);
        Yii::app()->clientScript->registerScriptFile(Yii::app()->request->baseUrl . "/js/advanced-datatable/media/js/DT_bootstrap3.js", CClientScript::POS_END);
        Yii::app()->clientScript->registerScriptFile(Yii::app()->request->baseUrl . "/js/feeslist.js", CClientScript::POS_END);
?>