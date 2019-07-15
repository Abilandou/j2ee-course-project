/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
$(document).ready(function(){
    $("#adminLoginBut").click(function(){
//        alert("You just clicked the admin login button");
        return;
    });
    
});

$(document).ready(function(){
    $('#add_button').click(function(){
        $('#user_form')[0].reset();
        $('.modal-title').text('Add User');
        $('#action').val("Add");
        $('#operation').val("Add");
        $('#user_upload_image').html('');
    });

    var dataTable = $('#adminTableData').DataTable({
        "processing":true,
        "serverSide":true,
        "order":[],
        "ajax": {
                url:"./../view_categories.jsp",
                method:"POST",
        },
        "columnDefs":[
                "target":[0, 3, 4],
                "orderable":false
        ],
    });


});
