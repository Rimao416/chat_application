<?php
    include('database_connection.php');
    session_start();
    $message='';
    if(isset($_SESSION['user_id']))
     {
         header('location:index.php');
         
     }
    if(isset($_POST['login'])){
        $query="SELECT * FROM login WHERE username =:username";
        $statement=$connect->prepare($query);
        $statement->execute(array(
            ':username'=>$_POST['username']
        ));
        $count=$statement->rowCount();
        if($count > 0){
            $result=$statement->fetchAll();
            foreach($result as $row){
                if(password_verify($_POST['password'],$row['password'])){
                    $_SESSION['user_id']=$row['user_id'];
                    $_SESSION['username']=$row['username'];
                    $sub_query="
                    INSERT INTO login_details (user_id) VALUES ('".$row['user_id']."')";
                    $statement=$connect->prepare($sub_query);
                    $statement->execute();
                    $_SESSION['login_details_id']=$connect->lastInsertId();
                    header('location:index.php');
                }else{
                    $message='<label>Wrong Password</label>';
                }
            }
        }else{
            $message='<label>Wrong Username</label>';
        }
    }
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/5.0.1/css/bootstrap.min.css">
</head>
<body>
    <div class="container">
        <br>
        <h3 align="center">Chat application using PHP Ajax Jquery</h3> <br>
        <div class="panel panel-default">
            <div class="panel-heading">Chat Application</div>
            <div class="panel-body">
                <form action="" method="post">
                    <div class="form-group">
                        <label for="">Enter Username</label>
                        <input type="text" name="username" class="form-control" required>
                    </div>
                    <div class="form-group">
                        <label for="">Enter Password</label>
                        <input type="password" name="password" class="form-control" required>
                    </div>
                    <div class="form-group">
                        <input type="submit" name="login" class="btn btn-info" value="Login">
                    </div>
                    
                </form>
            </div>
        </div>
    </div>
</body>
</html>