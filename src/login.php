<?php
session_start();
include 'application/bdd_connection.php';

if(!empty($_POST))
{    $query =
    '
        INSERT INTO
            users
            (Username, Password)
        VALUES
            (?, ?)
    ';  
    
                  //On rempli la BDD avec les infos du formulaire
              
                $resultSet = $pdo->prepare($query);
                $resultSet->execute(
                    [$_POST['username'], $_POST['password']]
                    );
    
    $template = 'login';
    include 'layout.phtml';
    var_dump($_POST["username"]);
}

