<?php $i=0; foreach ($results as $result) { $physician = $result['physician']; ?>
<div class="hoverable" data-id="<?php echo $result['physicianId']?>">
    <div class="row">
        <div class="col-sm-4 radio">
            <label>
                <input type="radio" <?php echo $i===0?' CHECKED ':''?>name="optionsRadios" value="<?php echo $result['physicianId']?>">
                <strong><?php echo $physician->title?></strong>
            </label>
        </div>
        <div class="col-sm-2"><span class="theme-prominent"><?php echo $result['price']?></span></div>
    </div>
</div>
<div style="display:none" id="popover-<?php echo $result['physicianId']?>">
    <div style="width: 800px;">
        <div class="row" style="margin:0;">
            <div style="width: 190px;" class="col-md-4 centered">
                <div class="profile-pic">
                    <p><img src="<?php echo $physician->image?>" class="img-circle"></p>
                </div>
            </div>

            <div style="width: 190px;"  class="col-md-4 profile-text">
                <h3><?php echo $physician->title?></h3>
                <h6><?php echo $physician->specialtiesTitle?></h6>
            </div>

            <div style="width: 190px;" class="col-md-4 profile-text mb centered">
                <div class="left-divider right-divider hidden-sm hidden-xs">
                    <h4><?php echo $result['pPrice'] ?></h4>
                    <h6>Physician</h6>
                    <h4><?php echo $result['cPrice'] ?></h4>
                    <h6>Facility</h6>
                    <h4 style="color: #999"><?php echo $result['iPrice'] ?></h4>
                    <h6>Paid by insurance</h6>
                </div>
            </div>

            <div style="width: 190px;" class="col-md-4 centered">
                <h1 class="rating-num">4.3</h1>
                <div class="rating">
                    <span class="glyphicon glyphicon-star"></span><span class="glyphicon glyphicon-star">
                    </span><span class="glyphicon glyphicon-star"></span><span class="glyphicon glyphicon-star">
                    </span><span class="glyphicon glyphicon-star-empty"></span>
                </div>
                <div>
                    <span class="glyphicon glyphicon-user"></span>78 total
                </div>
            </div>
        </div>
    </div>
</div>
<?php $i++; } ?>