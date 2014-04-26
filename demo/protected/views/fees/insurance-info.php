<form method="POST" action="">
<div class="search-fees">
    <h2><i class="fa fa-medkit theme"></i>Tell us your needs. We are here to help you.</h2>
    <h4>Healthcare provider fees at your fingertips.</h4>
    <div class="row">
        <div class="col-sm-8">
            <div class="form-panel with-header">
                <h3>Your procedure</h3>
                <input class="form-control input-lg" type="text" name="search-need" id="search-need" placeholder="Describe your need or enter a CPT code">

                <div class="tasks-widget">
                    <div id="selected-needs" class="task-content">
                        <ul class="task-list ui-sortable">
                            <?php foreach (Yii::app()->searchState->terms['search-needs'] as $need) { ?>
                            <?php
                                preg_match('#\((.*?)\)#', $need, $match);
                                $needTitle = str_replace(" ".$match[0],"",$need);
                            ?>
                            <li class="list-primary">
                                <div class="task-title">
                                    <span class="task-title-sp"><?php echo $needTitle ?></span>
                                    <input type="hidden" name="search-needs[]" value="<?php echo $need ?>">
                                    <span class="badge bg-info"><?php echo $match[1] ?></span>
                                    <div class="pull-right hidden-phone">
                                        <button class="btn btn-danger btn-xs fa fa-trash-o"></button>
                                    </div>
                                </div>
                            </li>
                            <?php } ?>
                        </ul>
                    </div>
                </div>

                <input class="form-control input-lg" type="text" name="search-doctor" placeholder="Your doctor (optional)">

                <div class="tasks-widget">
                    <div id="selected-doctors" class="task-content">
                        <ul class="task-list ui-sortable">

                        </ul>
                    </div>
                </div>

            </div>
        </div>

        <div class="col-sm-4">
            <div class="darkblue-panel pn">
                <div class="darkblue-header">
                    <h5>or choose from the image</h5>
                </div>
                <div class="body-image"></div>
            </div>
        </div>
    </div>

    <div class="row">
        <div class="col-sm-8">
            <div class="form-panel with-header">
                <h3>Your health information</h3>
                <div class="checkbox">
                    <label>
                        <input type="checkbox" checked="" value="1">
                        I want to include my insurance info
                    </label>
                </div>
                <div class="form-group">
                    <label for="health-insurance-carrier">Your health insurance carrier</label>
                    <input type="text" class="form-control" id="health-insurance-carrier" placeholder="Enter your health insurance carrier">
                </div>
                <div class="form-group">
                    <label for="health-insurance-policy">Policy number</label>
                    <input type="text" class="form-control" id="health-insurance-policy" placeholder="Enter your health insurance policy number">
                </div>
            </div>

            <div class="form-panel with-header">
                <h3>Your personal information</h3>
                <div class="form-group">
                    <label for="location">City or zip code</label>
                    <input type="text" class="form-control" id="location" placeholder="eg. San Fransisco">
                </div>
                <div class="form-group">
                    <label for="email">e-mail</label>
                    <input type="email" class="form-control" id="email" placeholder="eg. john@feecast.com">
                </div>
            </div>
        </div>
        <div class="col-sm-4">
            <div class="form-panel with-header">
                <h5>Why we need your info</h5>
                <p>In order to most accurately estimate the fee that you will be charged for a specific procedure, we need to know how much your insurance provider will cover.
</p>
                <p>Your insurance policy number, found on your health insurance card, will help us tell you what your responsibility will be.
</p>
                <br>
                <h5>What happens next?</h5>
                <p>FeeCast will provide you with estimates of what different providers and surgery centers in your area charge for the procedure you need.
</p>
                <p>The cost of certain in-network procedures can vary by over 400%. The biggest factor driving cost is where the care is provided.
</p>
            </div>
        </div>
    </div>

    <div class="row">
        <div class="col-sm-8">
            <div class="form-panel with-header">
                <p style="text-align: center;">By selecting “Submit Your Request” you are agreeing to the FeeCast <a href="#">Terms and Conditions</a></p>
                <button type="submit" class="btn btn-primary btn-lg btn-block">Submit Your Request</button>
            </div>
        </div>
    </div>
</form>

</div>
</form>
<?php Yii::app()->clientScript->registerScriptFile(Yii::app()->request->baseUrl . "/js/insuranceInfo.js", CClientScript::POS_END); ?>
