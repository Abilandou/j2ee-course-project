/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


//Toggle between Login and Register Divs
$(document).ready(function(){
    $(document).ready(function(){
       $("#RegisterSection").hide();
       $("#NoAccountInfo").click(function(){
           $("#LoginSection").hide();
           $("#RegisterSection").show();
       });
       $("#HaveAccountInfo").click(function(){
           $("#RegisterSection").hide();
           $("#LoginSection").show();
       });
    });
});
