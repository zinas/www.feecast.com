<div id="no-more-tables" class="content-panel" style="padding: 5px;">
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
                    <td data-title="Insured Price"><?php echo $fee['insuredPrice']?></td>
                    <td data-title="Cash Price"><?php echo $fee['cashPrice']?></td>
                <?php if ($extended===true) { ?>
                    <td data-title="Your Price"><?php echo $fee['userPrice']?></td>
                <?php } ?>
                    <td data-title=""><button type="button" class="btn btn-default">Details</button></td>
                <?php if ($extended===true) { ?>
                    <td data-title=""><button type="button" class="btn btn-primary">Request an appointment</button></td>
                <?php } ?>
                </tr>
            <?php } ?>
            </tbody>
        </table>
    </div>
</div>