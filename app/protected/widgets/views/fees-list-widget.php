<div id="no-more-tables" class="content-panel">
    <?php if (isset($need)) { ?>
        <h2>Fee details</h2>
        <h4 class="theme"><?php echo $need ?></h4>
        <br>
    <?php } ?>
    <div class="adv-table">
        <table cellpadding="0" cellspacing="0" border="0" class="table table-striped table-condensed cf" id="fees-list">
            <thead class="cf">
                <tr>
                    <th></th>
                    <th>Facility</th>
                <?php if ($hasInsuranceInfo===true) { ?>
                    <th>Physician</th>
                <?php } ?>
                    <th>Location</th>
                <?php if ($hasInsuranceInfo===true) { ?>
                    <th>Insured Price</th>
                <?php } ?>
                    <th class="text-center">Cash Price</th>
                    <th class="text-center">Your Price</th>
                <?php if ($hasInsuranceInfo===true) { ?>
                    <th></th>
                <?php } ?>
                </tr>
            </thead>
            <tbody>
            <?php foreach ($fees as $fee) { ?>
                <tr>
                    <td class="text-center">
                        <i class="call-to-action theme fa fa-angle-double-down"></i>
                    </td>
                    <td data-title="Facility"><?php echo $fee['facility']?></td>
                <?php if ($hasInsuranceInfo===true) { ?>
                    <td data-title="Physician"><?php echo $fee['physician']?></td>
                <?php } ?>
                    <td data-title="Location"><?php echo $fee['location']?></td>
                <?php if ($hasInsuranceInfo===true) { ?>
                    <td data-title="Insured Price">
                        <?php echo $fee['insuredPrice']?>
                    </td>
                <?php } ?>
                    <td class="theme-prominent text-center" data-title="Cash Price"><?php echo $fee['cashPrice']?></td>
                    <td class="text-center" data-title="Your Price">
                        <div class="price-info">
                        <?php if ($hasInsuranceInfo) { ?>
                            <?php echo $fee['userPrice']?>
                        <?php } else { ?>
                            <a href="<?php echo Yii::app()->createUrl('fees/insuranceInfo') ?>">
                                Enter insurance info
                            </a>
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