<?php
$serverName = "MSSQLSERVER";
$databaseName = "lbpsb_project";
$username = "kaz";
$password = "";

// Try removing db name or playing with server name if it doesnt work.
$connection = mysqli_connect($serverName, $username, $password, $databaseName);

// Raise error if no db connection.
if (!$connection) die('Connection to DB not established :(').error($connection) . mysqli_error($connection);
?>