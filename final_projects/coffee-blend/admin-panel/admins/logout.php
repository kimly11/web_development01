<?php


    session_start();
    session_unset();
    session_destroy();
    header("location: http://localhost/web_development01/final_projects/coffee-blend/admin-panel/admins/login-admins.php");