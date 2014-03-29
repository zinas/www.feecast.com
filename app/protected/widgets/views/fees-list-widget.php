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
                    <th>Facility</th>
                <?php if ($extended===true) { ?>
                    <th>Physician</th>
                <?php } ?>
                    <th>Location</th>
                    <th>Insured Price</th>
                    <th>Cash Price</th>
                <?php if ($extended===true) { ?>
                    <th>Your Price</th>
                <?php } ?>
                    <th></th>
                <?php if ($extended===true) { ?>
                    <th></th>
                <?php } ?>
                </tr>
            </thead>
            <tbody>
            <?php foreach ($fees as $fee) { ?>
                <tr>
                    <td data-title="Facility"><?php echo $fee['facility']?></td>
                <?php if ($extended===true) { ?>
                    <td data-title="Physician"><?php echo $fee['physician']?></td>
                <?php } ?>
                    <td data-title="Location"><?php echo $fee['location']?></td>
                    <td data-title="Insured Price">
                        <?php if (Yii::app()->user->id) { ?>
                            <?php echo $fee['insuredPrice']?>
                        <?php } else { ?>
                            <a href="<?php echo Yii::app()->createUrl('fees/insuranceInfo') ?>">Enter insurance info</a> or <a data-toggle="modal" href="#login-form-modal">login</a> to view
                        <?php } ?>
                    </td>
                    <td data-title="Cash Price"><?php echo $fee['cashPrice']?></td>
                <?php if ($extended===true) { ?>
                    <td data-title="Your Price">
                        <?php if (Yii::app()->user->id) { ?>
                            <?php echo $fee['userPrice']?>
                        <?php } else { ?>
                            <a href="<?php echo Yii::app()->createUrl('fees/insuranceInfo') ?>">Enter insurance info</a> or <a data-toggle="modal" href="#login-form-modal">login</a> to view
                        <?php } ?>
                    </td>
                <?php } ?>
                    <td data-title=""><button type="button" class="btn btn-default">Details</button></td>
                <?php if ($extended===true) { ?>
                    <td data-title=""><button type="button" class="btn btn-theme">Request an appointment</button></td>
                <?php } ?>
                </tr>
            <?php } ?>
            </tbody>
        </table>
    </div>
</div>