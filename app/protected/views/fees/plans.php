<select name="plan">
    <option value="-1">Select one...</option>
    <?php foreach ($plans as $plan) { ?>
        <option value="<?php echo $plan->id?>"><?php echo $plan->planName?></option>
    <?php } ?>
</select>