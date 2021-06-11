<?php
    include('database_connection.php');
    session_start();
    if(!isset($_SESSION['user_id'])){
        header('location:login.php');
    }

?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/5.0.1/css/bootstrap.min.css">
    <title>Document</title>
    <style>
        .ligne{
            width: 300px;
            height: 300px;
        }
    </style>
</head>
<body>
    <div class="container">
        <br>
        <h3 align="center">Chat application using PHP Ajax jquery</h3>
        <br>
        <div class="table-responsive">
            <h4 align="center">Online User</h4>
            <p align="right">Hi - <?php echo $_SESSION['username'];?> -  <a href="logout.php">Logout</a> </p>
            <div id="user_details">

            </div>
            <div id="user_model_details">

            </div>
        </div>
    </div>
</body>
</html>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script>
    $(function(){
        fetch_user();
        setInterval(function(){
            update_last_activity();
            fetch_user() 
            update_chat_history_data()
        },5000);
        function fetch_user()
        {
            $.ajax({
                url:'fetch_user.php',
                method:'post',
                success:function(data){
                    $('#user_details').html(data); 
                }
            })
        }
        function update_last_activity()
        {
            $.ajax({
                url:'update_last_activity.php',
                success:function()
                {
                    console.log('ds')
                }
            })
        }
        function make_chat_dialog_box(to_user_id,to_user_name){
            var modal_content='<div id="user_dialog_'+to_user_id+'" class="user_dialog" title="You have chat with '+to_user_name+'">';
            modal_content +='<div style="height:300px; border:1px solid #ccc; overflow-y:scroll; margin-bottom:24px; padding:16px;" class="chat_history" data-touserid="'+to_user_id+'"id="chat_history_'+to_user_id+'">';
            modal_content +=fetch_user_chat_history(to_user_id)
            modal_content+='</div>';
            modal_content +='<div class="form-group">';
            modal_content +='<textarea class="form-control ligne" placeholder="Tu parles avec '+to_user_name+'" name="chat_message_'+to_user_id+'" id="chat_message_'+to_user_id+'" class="form-control"></textarea>';
            modal_content +='</div><div class="form-group" align="right">';
            modal_content +='<button type="button" name="send_chat" id="'+to_user_id+'" class="btn btn-info send_chat">Send</button></div></div>';
            $('#user_model_details').html(modal_content);
        }
        $(document).on('click','.start-chat',function(){
            var to_user_id=$(this).data('touserid');
            var to_user_name=$(this).data('tousername');
            make_chat_dialog_box(to_user_id, to_user_name);
            $('#user_dialog_'+to_user_id).dialog({
                autoOpen:false,
                width:100
            })
            $('#user_dialog_'+to_user_id).dialog('open')
            
        })
        $(document).on('click','.send_chat',function(){
            var to_user_id=$(this).attr('id');
            var chat_message=$('#chat_message_'+to_user_id).val()
            $.ajax({
                url:"insert_chat.php",
                method:"post",
                data:{to_user_id:to_user_id, chat_message:chat_message},
                success:function(data)
                {
                    $('#chat_message_'+to_user_id).val('');
                    $('#chat_history_'+to_user_id).html(data);
                }
            })
        })
        function fetch_user_chat_history(to_user_id)
        {
            $.ajax({
                url:"fetch_user_chat_history.php",
                method:"POST",
                data:{to_user_id:to_user_id},
                success:function(data){
                    $('#chat_history_'+to_user_id).html(data);
                }
            })
        }
        function update_chat_history_data()
        {
            $('.chat_history').each(function(){
                var to_user_id=$(this).data('touserid');
                fetch_user_chat_history(to_user_id)
            })
        }
        $(document).on('click','.ui-button-icon',function(){
            $('.user-dialog').dialg('destroy').remove()
        })
        $(document).on('focus','.ligne',function(){
            var is_type='yes';
            $.ajax({
                url:"update_is_type_status.php",
                method:"post",
                data:{is_type:is_type},
                success:function(){

                }
            })
        })
        $(document).on('blur','.ligne',function(){
            var is_type='no';
            $.ajax({
                url:"update_is_type_status.php",
                method:"post",
                data:{is_type:is_type},
                success:function(){
                    
                }
            })
        })
    })
</script>