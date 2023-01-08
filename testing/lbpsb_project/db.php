<?php  
$serverName = "mssqlserver"; 
$username = "kaz";   
$password = "";  
$databaseName = "lbpsb_project"; 

$connectionInfo = [
    "username"=>$username,
    "password"=>$password,
    "database"=>$databaseName
];

/* Connect using SQL Server Authentication. */  
$connection = sqlsrv_connect( $serverName, $connectionInfo);  
