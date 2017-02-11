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

function sidebar() {
    osc_current_web_theme_path('user-sidebar.php');
}

osc_current_web_theme_path('header.php');

function user_loop() {
$user_loop=[];
    if (osclasswizards_show_as() == 'gallery') {
        $user_loop['user_loop'] = 'loop-user-grid.php';
        $user_loop['list_class'] = 'listing-grid';
        $user_loop['active'] = 'active';
        return $user_loop;
    } else {
        $user_loop['loop_template'] = 'loop-user-list.php';
        $user_loop['list_class'] = '';
         $user_loop['buttonClass'] = '';
         return $user_loop;
    }
}
?>

<div class="row">
<?php
osc_current_web_theme_path('user-sidebar.php');
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

                <div class="field-gird row">

                    <div class=" col-md-12">
                        <p>
                            Curabitur arcu erat, accumsan id imperdiet et, porttitor at sem. Nulla porttitor accumsan tincidunt. Pellentesque in ipsum id orci porta dapibus. Cras ultricies ligula sed magna dictum porta. Donec sollicitudin molestie malesuada. Donec sollicitudin molestie malesuada. Pellentesque in ipsum id orci porta dapibus. Curabitur non nulla sit amet nisl tempus convallis quis ac lectus. Curabitur aliquet quam id dui posuere blandit. Praesent sapien massa, convallis a pellentesque nec, egestas non nisi.  
                        </p>
                    </div>

                    <!--chat_sidebar-->
                </div>

            </div>

            <div class="tab-pane" id="my_ads">2Vestibulum ac diam sit amet quam vehicula elementum sed sit amet dui. Praesent sapien massa, convallis a pellentesque nec, egestas non nisi. Curabitur aliquet quam id dui posuere blandit. Cras ultricies ligula sed magna dictum porta. Curabitur aliquet quam id dui posuere blandit. Donec sollicitudin molestie malesuada. Praesent sapien massa, convallis a pellentesque nec, egestas non nisi. Cras ultricies ligula sed magna dictum porta. Donec sollicitudin molestie malesuada. Proin eget tortor risus.</div>
            <div class="tab-pane" id="messages">

                <p>
                    Curabitur arcu erat, accumsan id imperdiet et, porttitor at sem. Nulla porttitor accumsan tincidunt. Pellentesque in ipsum id orci porta dapibus. Cras ultricies ligula sed magna dictum porta. Donec sollicitudin molestie malesuada. Donec sollicitudin molestie malesuada. Pellentesque in ipsum id orci porta dapibus. Curabitur non nulla sit amet nisl tempus convallis quis ac lectus. Curabitur aliquet quam id dui posuere blandit. Praesent sapien massa, convallis a pellentesque nec, egestas non nisi.  
                </p>


            </div>
            <div class="tab-pane" id="bill">4Vestibulum ac diam sit amet quam vehicula elementum sed sit amet dui. Praesent sapien massa, convallis a pellentesque nec, egestas non nisi. Curabitur aliquet quam id dui posuere blandit. Cras ultricies ligula sed magna dictum porta. Curabitur aliquet quam id dui posuere blandit. Donec sollicitudin molestie malesuada. Praesent sapien massa, convallis a pellentesque nec, egestas non nisi. Cras ultricies ligula sed magna dictum porta. Donec sollicitudin molestie malesuada. Proin eget tortor risus.</div>
            <div class="tab-pane" id="links">
                <div class="row field-gird">    
                    <div class="col-md-12">
                        <div class="input-group" id="adv-search">
                            <input type="text" class="form-control" placeholder="Search for snippets" />
                            <div class="input-group-btn">
                                <div class="btn-group" role="group">
                                    <div class="dropdown dropdown-lg">
                                        <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown" aria-expanded="false"><span class="caret"></span></button>
                                        <div class="dropdown-menu dropdown-menu-right" role="menu">
                                            <form class="form-horizontal" role="form">
                                                <div class="form-group">
                                                    <label for="filter">Filter by</label>
                                                    <select class="form-control">
                                                        <option value="0" selected>All Snippets</option>
                                                        <option value="1">Featured</option>
                                                        <option value="2">Most popular</option>
                                                        <option value="3">Top rated</option>
                                                        <option value="4">Most commented</option>
                                                    </select>
                                                </div>

                                                <button type="submit" class="btn btn-primary pull-right">Искать <span class="glyphicon glyphicon-search" aria-hidden="true"></span></button>
                                            </form>
                                        </div>
                                    </div>
                                    <button type="button" class="btn btn-primary"><span class="glyphicon glyphicon-search" aria-hidden="true"></span></button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <!--            Статус онлайн-->
                <div class="col-md-12">
                    <div class="row field-gird">
                        <div class="btn-group" data-toggle="buttons">
                            <label class="btn btn-default  active">
                                <input type="radio" name="options" id="option1" autocomplete="off" checked> Онлайн
                            </label>
                            <label class="btn btn-default">
                                <input type="radio" name="options" id="option2" autocomplete="off"> Офлайн
                            </label>
                        </div>
                    </div> 
                </div>
                <!------>
                <!----Список контактов--->
                <div class="row ">
                    <div class="col-md-12">
                        <div class="panel panel-default">
                            <div class="panel-heading c-list">
                                <span class="title">Contacts</span>
                            </div>
                            <div class="row" style="display: none;">
                                <div class="col-md-12">
                                    <div class="input-group c-search">
                                        <input type="text" class="form-control" id="contact-list-search">
                                        <span class="input-group-btn">
                                            <button class="btn btn-default" type="button"><span class="glyphicon glyphicon-search text-muted"></span></button>
                                        </span>
                                    </div>
                                </div>
                            </div>
                            <ul class="list-group" id="contact-list">
                                <li class="list-group-item">
                                    <div class="col-md-12 col-md-3">
                                        <div class="profile-userpic">
                                            <img src="http://api.randomuser.me/portraits/men/49.jpg" alt="Scott Stevens" class="img-responsive img-circle" />
                                        </div>
                                        <div class="profile-usertitle-name">Scott Stevens</div>
                                        <div class="profile-userbuttons">
                                        </div>

                                    </div>
                                    <div class="col-md-12 col-md-9">

                                        <span class="">
                                            <ul>
                                                <li><span class="glyphicon glyphicon-map-marker"></span>&nbsp;<b>Адресс: </b>&nbsp;<span>Город Шымкент Турдалы 23/2</span></li>
                                                <li><span class="glyphicon glyphicon-earphone"></span>&nbsp;<b>Контакт: </b><span>8775-404-16-35</span></li>
                                                <li><span class="fa fa-comments"></span>&nbsp;<b>эл-почта: </b><span>xzy@gmail.com</span></li>
                                            </ul>
                                        </span>
                                        <div class="profile-userbuttons pull-right">
                                            <button type="button" class="btn btn-success btn-sm">Отписаться</button>
                                            <button type="button" class="btn btn-danger btn-sm">Написать</button>
                                        </div>

                                    </div>
                                    <div class="clearfix"></div>
                                </li>

                                <li class="list-group-item">
                                    <div class="col-md-12 col-md-3">
                                        <img src="http://api.randomuser.me/portraits/women/76.jpg" alt="Glenda Patterson" class="img-responsive img-circle" />
                                    </div>
                                    <div class="col-md-12 col-md-9">
                                        <span class="name">Glenda Patterson</span><br/>
                                        <span class="glyphicon glyphicon-map-marker text-muted c-info" data-toggle="tooltip" title="5020 Poplar Dr"></span>
                                        <span class="visible-xs"> <span class="text-muted">5020 Poplar Dr</span><br/></span>
                                        <span class="glyphicon glyphicon-earphone text-muted c-info" data-toggle="tooltip" title="(538) 718-7548"></span>
                                        <span class="visible-xs"> <span class="text-muted">(538) 718-7548</span><br/></span>
                                        <span class="fa fa-comments text-muted c-info" data-toggle="tooltip" title="glenda.patterson@example.com"></span>
                                        <span class="visible-xs"> <span class="text-muted">glenda.patterson@example.com</span><br/></span>
                                    </div>
                                    <div class="clearfix"></div>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
                <!------>


            </div>
            <div class="tab-pane" id="add_ads">6Vestibulum ac diam sit amet quam vehicula elementum sed sit amet dui. Praesent sapien massa, convallis a pellentesque nec, egestas non nisi. Curabitur aliquet quam id dui posuere blandit. Cras ultricies ligula sed magna dictum porta. Curabitur aliquet quam id dui posuere blandit. Donec sollicitudin molestie malesuada. Praesent sapien massa, convallis a pellentesque nec, egestas non nisi. Cras ultricies ligula sed magna dictum porta. Donec sollicitudin molestie malesuada. Proin eget tortor risus.</div>
            <div class="tab-pane" id="settings">
                <form class="form-horizontal field-gird">
                    <fieldset>

                        <!-- Form Name -->


                        <!-- Text input-->
                        <div class="form-group">
                            <label class="col-md-4 control-label" for="username">Изменить имя </label>  
                            <div class="col-md-6">
                                <input id="username" name="username" type="text" placeholder="" class="form-control input-md">

                            </div>
                        </div>

                        <!-- Text input-->
                        <div class="form-group">
                            <label class="col-md-4 control-label" for="email">Изменить электронную почту</label>  
                            <div class="col-md-6">
                                <input id="email" name="email" type="text" placeholder="" class="form-control input-md">

                            </div>
                        </div>

                        <!-- Password input-->
                        <div class="form-group">
                            <label class="col-md-4 control-label" for="password">Сменить пароль</label>
                            <div class="col-md-6">
                                <input id="password" name="password" type="password" placeholder="" class="form-control input-md">

                            </div>
                        </div>

                        <!-- Password input-->
                        <div class="form-group">
                            <label class="col-md-4 control-label" for="repeat_password">Еще вводите пароль</label>
                            <div class="col-md-6">
                                <input id="repeat_password" name="repeat_password" type="password" placeholder="" class="form-control input-md">

                            </div>
                        </div>

                        <!-- Select Basic -->
                        <div class="form-group">
                            <label class="col-md-4 control-label" for="region_id">Регион и Город</label>
                            <div class="col-md-6">
                                <select id="region_id" name="region_id" class="form-control">
                                    <option value="1">Option one</option>
                                    <option value="2">Option two</option>
                                    <option value="3">Option two</option>
                                    <option value="4">Option two</option>
                                </select>
                            </div>
                        </div>

                        <!-- Text input-->
                        <div class="form-group">
                            <label class="col-md-4 control-label" for="geo_info">Адрес</label>  
                            <div class="col-md-6">
                                <input id="geo_info" name="geo_info" type="text" placeholder="" class="form-control input-md">

                            </div>
                        </div>

                        <!-- Text input-->
                        <div class="form-group">
                            <label class="col-md-4 control-label" for="phone">Изменить Контактную тел</label>  
                            <div class="col-md-6">
                                <input id="phone" name="phone" type="text" placeholder="" class="form-control input-md">

                            </div>
                        </div>

                        <!-- Button -->
                        <div class="form-group">
                            <a class="col-md-4 control-label" href="#">Удалить учетную запись</a>
                            <div class="col-md-4 pull-right">
                                <button id="submit" name="submit" class="btn btn-primary">Сохранить</button>
                            </div>
                        </div>

                    </fieldset>
                </form>

            </div>
            <div class="tab-pane" id="help">
                <div class="row field-gird">
                    <!--                                Поиск-->
                    <div class="col-md-12 field-gird">
                        <div class="input-group" id="help-search">
                            <input type="text" class="form-control" placeholder="Search for snippets">
                            <div class="input-group-btn">
                                <div class="btn-group" role="group">

                                    <button type="button" class="btn btn-primary"><span class="glyphicon glyphicon-search" aria-hidden="true"></span></button>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-3">


                        <div class="list-group">
                            <a href="#" class="list-group-item active">
                                Cras justo odio
                            </a>
                            <a href="#" class="list-group-item">Dapibus ac facilisis in</a>
                            <a href="#" class="list-group-item">Morbi leo risus</a>
                            <a href="#" class="list-group-item">Porta ac consectetur ac</a>
                            <a href="#" class="list-group-item">Vestibulum at eros</a>
                        </div>


                    </div>
                    <div class="col-md-9">
                        <div class="panel panel-default">
                            <div class="panel-heading">Panel heading without title</div>
                            <div class="panel-body">
                                <p>Vestibulum ac diam sit amet quam vehicula elementum sed sit amet dui. Nulla quis lorem ut libero malesuada feugiat. Curabitur arcu erat, accumsan id imperdiet et, porttitor at sem. Praesent sapien massa, convallis a pellentesque nec, egestas non nisi. Donec sollicitudin molestie malesuada. Quisque velit nisi, pretium ut lacinia in, elementum id enim. Vivamus suscipit tortor eget felis porttitor volutpat. Donec sollicitudin molestie malesuada. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec velit neque, auctor sit amet aliquam vel, ullamcorper sit amet ligula. Vivamus magna justo, lacinia eget consectetur sed, convallis at tellus.</p>
                            </div>
                        </div>  
                    </div>
                </div>  
            </div> 
        </div>
        <div class="list-header">
<?php osc_run_hook('search_ads_listing_top'); ?>
            <h1 class="title">
<?php _e('My listings', OSCLASSWIZARDS_THEME_FOLDER); ?>
            </h1>
            <?php if (osc_count_items() == 0) { ?>
                <p class="empty" >
                    <?php _e('No listings have been added yet', OSCLASSWIZARDS_THEME_FOLDER); ?>
                </p>
            <?php } else { ?>
            </div>
                    <?php
                    View::newInstance()->_exportVariableToView("listClass", user_loop()['listClass']);
                    View::newInstance()->_exportVariableToView("listAdmin", true);
                    osc_current_web_theme_path(user_loop()['loop_template']);
                    ?>
            <?php
            if (osc_rewrite_enabled()) {
                $footerLinks = osc_search_footer_links();
                ?>
                <ul class="footer-links">
                <?php foreach ($footerLinks as $f) {
                    View::newInstance()->_exportVariableToView('footer_link', $f); ?>
                    <?php if ($f['total'] < 3) continue; ?>
                        <li><a href="<?php echo osc_footer_link_url(); ?>"><?php echo osc_footer_link_title(); ?></a></li>
                    <?php } ?>
                </ul>
                <?php } ?>
            <div class="pagination"> <?php echo osc_pagination_items(); ?> </div>
        <?php } ?>
    </div>
</div>
        <?php osc_current_web_theme_path('footer.php'); ?>
