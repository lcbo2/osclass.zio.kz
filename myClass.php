<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of newPHPClass
 *
 * @author maks
 */
class myClass {
    //put your code here
    public $test;
    public $arr;
    public function testDo($arrIn){
        return $this->arr[]=$arrIn;        
    }
}

$my=new myClass;
$my->testDo(78);
echo $my->arr[78];