<?php  
$serverName = "KAZDESKTOP"; 
$databaseName = "lbpsb_project"; 
// $username = "kaz";   
// $password = "";  

$connectionInfo = [
    // "username"=>$username,
    // "password"=>$password,
    "database"=>$databaseName
];

/* Connect using SQL Server Authentication. */  
$connection = sqlsrv_connect( $serverName, $connectionInfo);  

if ($connection) {
    echo "Connection established.<br>";
} else {
    echo "Connection could not be established.<br>";
    die( print_r( sqlsrv_errors(), true));
}
?>