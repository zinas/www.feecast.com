<?php
    $textStyle = ' style="color:#767676; font-weight: normal; margin: 0; padding: 0; line-height: 20px; font-size: 12px;font-family: Helvetica, Arial, sans-serif;" ';
?>

 <html lang="en">
  <head>
    <meta content="text/html; charset=utf-8" http-equiv="Content-Type">
    <title>
      Modern
    </title>
    <style type="text/css">
    a:hover { text-decoration: none !important; }
    .header h1 {color: #47c8db !important; font: bold 32px Helvetica, Arial, sans-serif; margin: 0; padding: 0; line-height: 40px;}
    .header p {color: #c6c6c6; font: normal 12px Helvetica, Arial, sans-serif; margin: 0; padding: 0; line-height: 18px;}

    .content h2 {color:#646464 !important; font-weight: bold; margin: 0; padding: 0; line-height: 26px; font-size: 18px; font-family: Helvetica, Arial, sans-serif;  }
    .content p {color:#767676; font-weight: normal; margin: 0; padding: 0; line-height: 20px; font-size: 12px;font-family: Helvetica, Arial, sans-serif;}
    .content a {color: #0eb6ce; text-decoration: none;}
    .footer p {font-size: 11px; color:#7d7a7a; margin: 0; padding: 0; font-family: Helvetica, Arial, sans-serif;}
    .footer a {color: #0eb6ce; text-decoration: none;}
    </style>
  </head>
  <body style="margin: 0; padding: 0; background: #4b4b4b url('http://78.46.175.130/cdn/bg_email.png');" bgcolor="#4b4b4b">

    <table cellpadding="0" cellspacing="0" border="0" align="center" width="100%" style="padding: 35px 0; background: #4b4b4b url('http://78.46.175.130/cdn/bg_email.png');">
          <tr>
            <td align="center" style="margin: 0; padding: 0; background: url('http://78.46.175.130/cdn/bg_email.png') ;" >
                <table cellpadding="0" cellspacing="0" border="0" align="center" width="600" style="font-family: Helvetica, Arial, sans-serif; background:#2a2a2a;" class="header">
                    <tr>
                        <td width="600" align="left" style="padding: font-size: 0; line-height: 0; height: 7px;" height="7" colspan="2"><img src="http://78.46.175.130/cdn/bg_header.png" alt="header bg"></td>
                      </tr>
                    <tr>
                    <td width="20"style="font-size: 0px;">&nbsp;</td>
                    <td width="580" align="left" style="padding: 18px 0 10px;">
                        <h1 style="color: #47c8db; font: bold 32px Helvetica, Arial, sans-serif; margin: 0; padding: 0; line-height: 40px;">FeeCast</h1>
                        <p style="color: #c6c6c6; font: normal 12px Helvetica, Arial, sans-serif; margin: 0; padding: 0; line-height: 18px;">Healthcare provider fees, at your fingertips</p>
                    </td>
                  </tr>
                </table><!-- header-->


                <table cellpadding="0" cellspacing="0" border="0" align="center" width="600" style="font-family: Helvetica, Arial, sans-serif; background: #fff;" bgcolor="#fff">

                    <tr>
                    <td width="600" valign="top" align="left" style="font-family: Helvetica, Arial, sans-serif; padding: 20px 0 0;" class="content">
                        <table cellpadding="0" cellspacing="0" border="0"  style="color: #717171; font: normal 11px Helvetica, Arial, sans-serif; margin: 0; padding: 0;" width="600">
                        <tr>
                            <td width="21" style="font-size: 1px; line-height: 1px;"><img src="http://78.46.175.130/cdn/spacer.gif" alt="space" width="20"></td>
                            <td style="padding: 20px 0 0;" align="left">
                            <p style="color:#767676; font-weight: normal; margin: 0; padding: 0; line-height: 20px; font-size: 12px;font-family: Helvetica, Arial, sans-serif; ">
                                Dear <?php echo $name?>,
                            </p><br/>
                            <p style="color:#767676; font-weight: normal; margin: 0; padding: 0; line-height: 20px; font-size: 12px;font-family: Helvetica, Arial, sans-serif; ">
                                As discussed during our appointment, I am sending you a list for the most cost effective medical centers,
                                regarding your query about <b><?php echo $term ?></b>. Feel free to reply to this mail, if you have further questions.<br/><br/>
                                You can view an online version of the same list <a href="#">here</a>.
                            </p><br/>
                            <p style="color:#767676; font-weight: normal; margin: 0; padding: 0; line-height: 20px; font-size: 12px;font-family: Helvetica, Arial, sans-serif; ">
                                Kind regards,<br/>
                                <b><?php echo $doctor?></b>
                            </p><br/><br/>

                            </td>
                            <td width="21" style="font-size: 1px; line-height: 1px;"><img src="http://78.46.175.130/cdn/spacer.gif" alt="space" width="20"></td>
                        </tr>

                        <tr>
                            <td width="21" style="font-size: 1px; line-height: 1px;"><img src="http://78.46.175.130/cdn/spacer.gif" alt="space" width="20"></td>
                            <td style="padding: 0;  font-family: Helvetica, Arial, sans-serif; background: url('http://78.46.175.130/cdn/bg_date_wide.png') no-repeat left top; height:20px; line-height: 20px;"  align="center" width="558" height="20">
                                <h3 style="color:#666; font-weight: bold; text-transform: uppercase; margin: 0; padding: 0; line-height: 10px; font-size: 10px;"><currentdayname> <currentday> <currentmonthname></h3>
                            </td>
                            <td width="21" style="font-size: 1px; line-height: 1px;"><img src="http://78.46.175.130/cdn/spacer.gif" alt="space" width="20"></td>
                        </tr>
                        <tr>
                            <td width="21" style="font-size: 1px; line-height: 1px;"><img src="http://78.46.175.130/cdn/spacer.gif" alt="space" width="20"></td>
                            <td style="padding: 20px 0 0;" align="left">
                                <h2 style="color:#646464; font-weight: bold; margin: 0; padding: 0; line-height: 26px; font-size: 18px; font-family: Helvetica, Arial, sans-serif; "><?php echo $term ?></h2>
                            </td>
                            <td width="21" style="font-size: 1px; line-height: 1px;"><img src="http://78.46.175.130/cdn/spacer.gif" alt="space" width="20"></td>
                        </tr>
                        <tr>
                            <td width="21" style="font-size: 1px; line-height: 1px;"><img src="http://78.46.175.130/cdn/spacer.gif" alt="space" width="20"></td>
                            <td style="padding: 15px 0 15px;"  valign="top">

<table cellpadding="0" cellspacing="10" border="0"  <?php echo $textStyle?>>
    <thead class="cf">
        <tr>
            <th></th>
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
            <td data-title="Location"><?php echo $center->addrCity?></td>
            <td class="text-center" data-title="Your Price">
                <div class="price-info">
                    <span class="theme-prominent">
                        <?php echo _::currency($center->minTotal).'&nbsp;-&nbsp;'._::currency($center->maxTotal)?>
                    </span>
                </div>
            </td>
            <td data-title=""><a style="background: #0eb6ce; color: #fff; text-decoration: none; padding: 5px;" href="#">Contact</button></td>
        </tr>
    <?php } ?>
    </tbody>
</table>

                                <img src="http://78.46.175.130/cdn/divider_wide.png" alt="" style="border-top: 10px solid #fff;width: 558px">
                            </td>
                            <td width="21" style="font-size: 1px; line-height: 1px;"><img src="http://78.46.175.130/cdn/spacer.gif" alt="space" width="20"></td>
                        </tr>
                        </table>
                    </td>

                  </tr>
                    <tr>
                        <td width="600" align="left" style="padding: font-size: 0; line-height: 0; height: 3px;" height="3" colspan="2"><img src="http://78.46.175.130/cdn/bg_bottom.png" alt="header bg"></td>
                      </tr>
                </table><!-- body -->





                <table cellpadding="0" cellspacing="0" border="0" align="center" width="600" style="font-family: Helvetica, Arial, sans-serif; line-height: 10px;" class="footer">
                <tr>
                    <td align="center" style="padding: 5px 0 10px; font-size: 11px; color:#7d7a7a; margin: 0; line-height: 1.2;font-family: Helvetica, Arial, sans-serif;" valign="top">
                        <br><p style="font-size: 11px; color:#7d7a7a; margin: 0; padding: 0; font-family: Helvetica, Arial, sans-serif;">You're receiving this email because your general practicioner requested it for you.</p>
                        <p style="font-size: 11px; color:#7d7a7a; margin: 0; padding: 0; font-family: Helvetica, Arial, sans-serif;">Having trouble reading this? <webversion style="color: #0eb6ce; text-decoration: none;">View it in your browser</webversion>. </p>
                    </td>
                  </tr>
                </table><!-- footer-->
            </td>
            </td>
        </tr>
    </table>


  </body>
</html>