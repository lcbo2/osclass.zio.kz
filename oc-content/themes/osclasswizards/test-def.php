<?php

/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
 // meta tag robots
    osc_add_hook('header','osclasswizards_nofollow_construct');

   // osclasswizards_add_body_class('test');
    osc_current_web_theme_path('header.php') ;
echo 'test page default';