<?php if ( ! defined('ABS_PATH')) exit('ABS_PATH is not loaded. Direct access is not allowed.');

/*
 * Copyright 2014 Osclass
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

    class CWebTest extends BaseModel
    {
        private $itemManager;
        private $user;
        private $userId;

        function __construct()
        {
            parent::__construct();
            $this->itemManager = Item::newInstance();

            // here allways userId == ''
            if( osc_is_web_user_logged_in() ) {
                $this->userId = osc_logged_user_id();
                $this->user = User::newInstance()->findByPrimaryKey($this->userId);
            } else {
                $this->userId = null;
                $this->user = null;
            }
            osc_run_hook( 'init_test' );
        }

        //Business Layer...
        function doModel()
    {
              //calling the view...

            $locales = OSCLocale::newInstance()->listAllEnabled();
            $this->_exportVariableToView('locales', $locales);

            switch( $this->action ) {
                
                  case 'test_page': // post
                      $this->doView('test-page.php');
                      break;
                  default :
                      $this->doView('test-def.php');
                break; 
            }
    }
      //hopefully generic...
        function doView($file)
        {
            osc_run_hook("before_html");
            osc_current_web_theme_path($file);
            Session::newInstance()->_clearVariables();
            osc_run_hook("after_html");
        }
    }