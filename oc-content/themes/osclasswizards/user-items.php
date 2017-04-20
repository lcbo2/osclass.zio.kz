<?php
/*
 *      Osclass – software for creating and publishing online classified
 *                           advertising platforms
 *
 *                        Copyright (C) 2014 OSCLASS
 *
 *       This program is free software: you can redistribute it and/or
 *     modify it under the terms of the GNU Affero General Public License
 *     as published by the Free Software Foundation, either version 3 of
 *            the License, or (at your option) any later version.
 *
 *     This program is distributed in the hope that it will be useful, but
 *         WITHOUT ANY WARRANTY; without even the implied warranty of
 *        MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 *             GNU Affero General Public License for more details.
 *
 *      You should have received a copy of the GNU Affero General Public
 * License along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */

// meta tag robots
osc_add_hook('header', 'osclasswizards_nofollow_construct');

osclasswizards_add_body_class('user user-items');

//osc_add_hook('before-main','sidebar');

//function sidebar() {
//    osc_current_web_theme_path('user-sidebar.php');
//}

osc_current_web_theme_path('header.php');


?>

<div class="row">
    <?php
//    osc_current_web_theme_path('user-sidebar.php');
    ?>
    <div class="col-sm-8 col-md-9">
        <!-- Nav tabs -->
        <ul class="nav nav-tabs ">
            <li class="active"><a href="#ads" data-toggle="tab">Обьявление</a></li>
            <li><a href="#my_ads" data-toggle="tab">Мои обьявлений</a></li>
            <li><a href="#messages" data-toggle="tab">Сообщения</a></li>

            <li><a href="#links" data-toggle="tab">Связи</a></li>
            <li><a href="#add_ads" data-toggle="tab" class="">Подать обьявление</a></li>
            <li class="dropdown">
                <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                    Еще <span class="caret"></span>
                </a>
                <ul class="dropdown-menu">
                    <li><a href="#bill" data-toggle="tab">Счет</a></li>
                    <li><a href="#settings" data-toggle="tab">Настройка</a></li>
                    <li><a href="#help" data-toggle="tab">Помощь</a></li>
                </ul>
            </li>



        </ul>

        <!-- Tab panes -->
        <div class="tab-content">
            <div class="tab-pane active" id="ads">

               <?php 
               osc_current_web_theme_path('search.php');
               ?> 

            </div>

            <div class="tab-pane" id="my_ads">
               <?php 
               osc_current_web_theme_path('profiles/loops.php');
               ?> 
            </div>
            <div class="tab-pane" id="messages">

            </div>
            <div class="tab-pane" id="bill">
                <div class="row field-gird">

                </div>  
            </div>
            <div class="tab-pane" id="links">
                <div class="row field-gird">    


                </div>

            </div>
            <div class="tab-pane" id="add_ads">

            </div>
            <div class="tab-pane" id="settings">

            </div>
            <div class="tab-pane" id="help">
                <div class="row field-gird">

                </div>  
            </div> 
        </div>

    </div>
</div>
<?php osc_current_web_theme_path('footer.php'); ?>
