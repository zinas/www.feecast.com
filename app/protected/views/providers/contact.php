<div class="row provider-contact">
    <div class="col-xs-12">
        <div class="row">
            <div class="col-xs-4">
                <div class="content-panel medical-center pn">
                    <div id="blog-bg">
                        <div class="blog-title"><?php echo $center->name?></div>
                    </div>
                    <div class="blog-text">
                        <p><?php echo $center->addrRoad?></p>
                        <p><?php echo $center->addrCity?></p>
                        <p><?php echo $center->addrZip.' '.$center->addrState.', '.$center->addrCounty?></p>
                    </div>
                </div>
            </div>
            <div class="col-xs-8">
                <div class="row content-panel" style="margin:0;">
                    <div class="col-md-4 centered">
                        <div class="profile-pic">
                            <p><img src="<?php echo $selectedPhysician?$physician->image:Physician::getDefaultImage()?>" class="img-circle"></p>
                        </div>
                    </div>

                    <div class="col-md-4 profile-text">
                        <h3><?php echo $selectedPhysician?$physician->title:''?></h3>
                        <h6><?php echo $selectedPhysician?$physician->specialtiesTitle:''?></h6>
                        <p style="<?php echo $selectedPhysician?'':'margin-top: 60px'?>"><?php echo $cpt->cptLongDesc?></p>
                    </div>

                    <div class="col-md-4 profile-text mb centered">
                        <div class="left-divider hidden-sm hidden-xs">
                            <?php if ($selectedPhysician) { ?>
                            <h4><?php echo _::currency($physicianPrice) ?></h4>
                            <h6>Physician</h6>
                            <?php } else { echo '<br>'; } ?>
                            <h4><?php echo _::currency($centerPrice) ?></h4>
                            <h6>Facility</h6>
                            <h4 style="color: #999"><?php echo _::currency($centerPriceIns) ?></h4>
                            <h6>Paid by insurance</h6>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- fee details -->
        <div class="content-panel mt" style="padding: 10px;">
            <div class="row">
                <div class="col-sm-4 insurance-info">
                    <h4>Your Insurance Info</h4>
                    <?php if (Yii::app()->user->isGuest) { ?>
                        <label>Insurance Provider</label>
                        <p><?php echo isset(Yii::app()->user->insuranceProvider->insName)?Yii::app()->user->insuranceProvider->insName:''?></p>
                        <label>Insurance Plan</label>
                        <p><?php echo isset(Yii::app()->user->insurancePlan->planName)?Yii::app()->user->insurancePlan->planName:''?></p>
                        <label>Policy Number</label>
                        <p><?php echo isset(Yii::app()->session['insurance-info']['policy-number'])?Yii::app()->session['insurance-info']['policy-number']:''?></p>
                    <?php } else { ?>
                        <label>Insurance Provider</label>
                        <p><?php echo isset(Yii::app()->user->patient->ins->insName)?Yii::app()->user->patient->ins->insName:''?></p>
                        <label>Insurance Plan</label>
                        <p><?php echo isset(Yii::app()->user->patient->plan->planName)?Yii::app()->user->patient->plan->planName:''?></p>
                        <label>Policy Number</label>
                        <p><?php echo isset(Yii::app()->user->patient->patPolicyNum)?Yii::app()->user->patient->patPolicyNum:''?></p>
                    <?php } ?>
                </div>

                <div class="col-sm-8">
                    <form class="form-horizontal" role="form">
                      <div class="form-group">
                        <label class="col-sm-3 control-label">First Name</label>
                        <div class="col-sm-9">
                          <input type="text" name="first-name" class="form-control" placeholder="First Name"
                            value="<?php echo !Yii::app()->user->isGuest?Yii::app()->user->firstName:''?>">
                        </div>
                      </div>
                      <div class="form-group">
                        <label class="col-sm-3 control-label">Last Name</label>
                        <div class="col-sm-9">
                          <input type="text" name="last-name" class="form-control" placeholder="Last Name"
                            value="<?php echo !Yii::app()->user->isGuest?Yii::app()->user->lastName:''?>">
                        </div>
                      </div>
                      <div class="form-group">
                        <label class="col-sm-3 control-label">Email</label>
                        <div class="col-sm-9">
                          <input type="email" name="email" class="form-control" placeholder="e-mail"
                            value="<?php echo !Yii::app()->user->isGuest?Yii::app()->user->email:''?>">
                        </div>
                      </div>
                      <div class="form-group">
                        <label class="col-sm-3 control-label">Telephone</label>
                        <div class="col-sm-9">
                          <input type="text" name="phone" class="form-control" placeholder="Telephone">
                        </div>
                      </div>
                    </form>
                </div>
            </div>

            <div class="row mt">
                <div class="col-sm-12">
                    <div style="padding: 5px">
                        <label>Notes and questions for the center</label>
                        <textarea class="form-control" rows="10"></textarea>
                    </div>
                </div>
            </div>
            <button type="button" class="btn btn-primary btn-lg btn-block mt">Submit</button>
        </div>
    </div>
    <div class="col-xs-3 hidden">
        <div class="white-panel pn">
            <div class="white-header"><h5>What happens next?</h5></div>
            <p>FeeCast will send your request to the provider and you will receive a confirmation for the appointment. The provider may need additional information, in which case we will contact you with some questions prior to confirming the appointment.</p>
        </div><br>
        <div class="white-panel pn">
            <div class="white-header"><h5>Why request appointments through FeeCast?</h5></div>
            <p>FeeCast helps you understand the pricing fees of various providers in your area as well as across the country. When you request an appointment through FeeCast, the provider is aware of your expectations for the fees you are responsible for.</p>
        </div><br>
        <div class="white-panel pn">
            <div class="white-header"><h5>Why we need your health insurance information?</h5></div>
            <p>In order to most accurately estimate the fee that you will be charged for a specific procedure, we need to know how much your insurance provider will cover.</p>
            <p>Your insurance policy number, found on your health insurance card, will help us tell you what your responsibility will be.</p>
        </div>
    </div>
</div>