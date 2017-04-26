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
<div class="field-gird row">

          <?=avatar_init()?>
</div>
<div class="add_links field-gird row">
    <div class="col-md-6"><button type="button" class="btn btn-primary">Связаться</button></div>
    <div class="col-md-6">
        <i class="fa fa-bell fa-lg" aria-hidden="true"></i>
        <span class="glyphicon-class">785 Сообщение</span>
    </div></div>
<div class="add_links field-gird row">
    <div class=""><a class="" href="#">Написать сообщение</a></div>
</div>
<div class="add_links field-gird row">
    <h4><?=osc_user_name();?></h4>
</div>


    <ul class="list-group">
        <li class="list-group-item">
            <span class="badge">14</span>
            <a href="<?=osc_search_category_url()?>">
                Все запросы</a>
        </li>
        <li class="list-group-item">
            <span class="badge">2</span>
            <a href="<?=osc_user_list_items_url()?>">
                Мои Запросы</a>
        </li>
        <li class="list-group-item">
            <span class="badge">14</span>
            <a href="#">
                Все теги</a>
        </li>
        <li class="list-group-item">
            <span class="badge">14</span>
            <a href="<?=osc_user_alerts_url()?>">
                Уведемление</a>
        </li>

        <li class="list-group-item">
            <span class="badge">1</span>
            <a href="#">
                Сообщение</a>
        </li>
        <li class="list-group-item">
            <span class="badge">1</span>
            <a href="#">
                Связи</a>
        </li>
        <li class="list-group-item">
            <span class="badge">1</span>
            <a href="<?=osc_user_profile_url()?>">
                Настройка</a>
        </li>
    </ul>



