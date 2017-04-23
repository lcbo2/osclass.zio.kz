<?php
/***
 * Анкета
 */
$address = '';
    if(osc_user_address()!='') {
        if(osc_user_city_area()!='') {
            $address = osc_user_address().", ".osc_user_city_area();
        } else {
            $address = osc_user_address();
        }
    } else {
        $address = osc_user_city_area();
    }
    $location_array = array();
    if(trim(osc_user_city()." ".osc_user_zip())!='') {
        $location_array[] = trim(osc_user_city()." ".osc_user_zip());
    }
    if(osc_user_region()!='') {
        $location_array[] = osc_user_region();
    }
    if(osc_user_country()!='') {
        $location_array[] = osc_user_country();
    }
    $location = implode(", ", $location_array);
    unset($location_array);
?>

    <div class="add_links field-gird row">
       
            <h5>О себе</h5>
            <hr>
             <ul id="user_data">
        
        <?php if( osc_user_website() !== '' ) { ?>
        <li class="website"><i class="fa fa-link"></i> <strong><a target="_blank" href="<?php echo osc_user_website(); ?>"><?php echo osc_user_website(); ?></a></strong></li>
        <?php } ?>
        <?php if( $address !== '' ) { ?>
        <li class="adress"> <i class="fa fa-map-marker"></i> <strong><?php _e('Address', OSCLASSWIZARDS_THEME_FOLDER);?>:</strong><br><?php echo $address; ?></li>
        <?php } ?>
        <?php if( $location !== '' ) { ?>
        <li class="location"><i class="fa fa-location-arrow"></i> <strong><?php _e('Location', OSCLASSWIZARDS_THEME_FOLDER);?>:</strong><br><?php echo  $location; ?></li>
        <?php } ?>
      </ul>
        
        <div class="add_block">

        </div>

    </div>
    <hr>

