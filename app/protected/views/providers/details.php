<div
    class="center-background"
    style="background-image: url(<?php echo $center->cover?>)"
>
    <div
        class="center-logo content-panel"
    style="background-image: url(<?php echo $center->icon?>)"
    ></div>
</div>

<div class="row" style="margin-top: 300px">
    <div class="col-sm-6">
        <div class="content-panel" style="padding: 10px;">
            <address>
              <strong><?php echo $center->name?></strong><br>
              <?php echo $center->addrRoad?><br>
              <?php echo $center->addrCity?>, <?php echo $center->addrState?> <?php echo $center->addrZip?><br>
              <abbr title="Phone">P:</abbr> <?php echo $center->centPhone?>
            </address>

            <address>
              <strong>Website</strong><br>
              <a href="<?php echo $center->url?>" target="_blank"><?php echo $center->url?></a>
            </address>

            <address>
              <strong>Hours</strong><br>
              <?php echo  $center->hourSummary ?>
            </address>

            <address>
              <strong>About</strong>
              <p><?php echo $center->about ?>
            </address>

            <button class="btn btn-block btn-primary" style="">Contact</button>
        </div>
    </div>
    <div class="col-sm-6">
        <div class="content-panel" style="padding:0;">
            <iframe
                src="<?php echo $center->map ?>"
                height="350"
                frameborder="0"
                style="width: 100%"
            ></iframe>
        </div>

        <div class="content-panel" padding="10px;">
            <div class="row">
                <div class="col-xs-12 col-md-6 text-center">
                    <h1 class="rating-num">
                        3.9</h1>
                    <div class="rating">
                        <span class="glyphicon glyphicon-star"></span><span class="glyphicon glyphicon-star">
                        </span><span class="glyphicon glyphicon-star"></span><span class="glyphicon glyphicon-star">
                        </span><span class="glyphicon glyphicon-star-empty"></span>
                    </div>
                    <div>
                        <span class="glyphicon glyphicon-user"></span>155 total
                    </div>
                </div>
                <div class="col-xs-12 col-md-6 shift-left">
                    <div class="row rating-desc">
                        <div class="col-xs-3 col-md-3 text-right">
                            <span class="glyphicon glyphicon-star"></span>5
                        </div>
                        <div class="col-xs-8 col-md-9">
                            <div class="progress progress-striped">
                                <div class="progress-bar progress-bar-success" role="progressbar" aria-valuenow="20"
                                    aria-valuemin="0" aria-valuemax="100" style="width: 80%">
                                    <span class="sr-only">80%</span>
                                </div>
                            </div>
                        </div>
                        <!-- end 5 -->
                        <div class="col-xs-3 col-md-3 text-right">
                            <span class="glyphicon glyphicon-star"></span>4
                        </div>
                        <div class="col-xs-8 col-md-9">
                            <div class="progress">
                                <div class="progress-bar progress-bar-success" role="progressbar" aria-valuenow="20"
                                    aria-valuemin="0" aria-valuemax="100" style="width: 60%">
                                    <span class="sr-only">60%</span>
                                </div>
                            </div>
                        </div>
                        <!-- end 4 -->
                        <div class="col-xs-3 col-md-3 text-right">
                            <span class="glyphicon glyphicon-star"></span>3
                        </div>
                        <div class="col-xs-8 col-md-9">
                            <div class="progress">
                                <div class="progress-bar progress-bar-info" role="progressbar" aria-valuenow="20"
                                    aria-valuemin="0" aria-valuemax="100" style="width: 40%">
                                    <span class="sr-only">40%</span>
                                </div>
                            </div>
                        </div>
                        <!-- end 3 -->
                        <div class="col-xs-3 col-md-3 text-right">
                            <span class="glyphicon glyphicon-star"></span>2
                        </div>
                        <div class="col-xs-8 col-md-9">
                            <div class="progress">
                                <div class="progress-bar progress-bar-warning" role="progressbar" aria-valuenow="20"
                                    aria-valuemin="0" aria-valuemax="100" style="width: 20%">
                                    <span class="sr-only">20%</span>
                                </div>
                            </div>
                        </div>
                        <!-- end 2 -->
                        <div class="col-xs-3 col-md-3 text-right">
                            <span class="glyphicon glyphicon-star"></span>1
                        </div>
                        <div class="col-xs-8 col-md-9">
                            <div class="progress">
                                <div class="progress-bar progress-bar-danger" role="progressbar" aria-valuenow="80"
                                    aria-valuemin="0" aria-valuemax="100" style="width: 15%">
                                    <span class="sr-only">15%</span>
                                </div>
                            </div>
                        </div>
                        <!-- end 1 -->
                    </div>
                    <!-- end row -->
                </div>
            </div>
        </div>
    </div>
</div>