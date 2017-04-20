<?php
    /*
     *      OSCLass – software for creating and publishing online classified
     *                           advertising platforms
     *
     *                        Copyright (C) 2010 OSCLASS
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

    class ModelSpamKiller extends DAO {
        /**
         * It references to self object: ModelSpamKiller
         * It is used as a singleton
         * 
         * @access private
         * @since unknown
         * @var Currency
         */
        private static $instance ;

        /**
         * It creates a new ModelSpamKiller object class ir if it has been created
         * before, it return the previous object
         * 
         * @access public
         * @since unknown
         * @return Currency
         */
        public static function newInstance() {
            if( !self::$instance instanceof self ) {
                self::$instance = new self ;
            }
            return self::$instance ;
        }
		
		
        /**
         * Return table names
         * @return string
         */

		
		 public function getItemTable() {
            return DB_TABLE_PREFIX.'t_item';
        }
		
		
		public function getCommentTable() {
            return DB_TABLE_PREFIX.'t_item_comment';
        }
			
		function blockItem($id){
            $this->dao->from($this->getItemTable()) ;
            $this->dao->set(array(
                'b_spam' => 1
            )) ;
            $this->dao->where(array(
                'pk_i_id' => $id
            )) ;
			$this->dao->update() ;
        }
		
		public function getCommentById($id) {
            $this->dao->select() ;
            $this->dao->from($this->getCommentTable()) ;
			$this->dao->where('pk_i_id', $id );
            $result = $this->dao->get() ;
			 if( !$result ) {
                return array() ;
            }
			return $result->row();
        }
		
		function blockComment($id){
            $this->dao->from($this->getCommentTable()) ;
            $this->dao->set(array(
                'b_active' => 0
            )) ;
            $this->dao->where(array(
                'pk_i_id' => $id
            )) ;
			$this->dao->update() ;
		}
    }
?>