<?php  
$serverName = "KAZDESKTOP"; 
$databaseName = "lbpsb_project"; 

// This wasn't working, although it's valid for my ssms server
// $username = "kaz";   
// $password = "";  

// If user and password are not specified in the $connectionInfo array,
// The connection will be attempted using Windows Authentication.
$connectionInfo = [
    // "username"=>$username,
    // "password"=>$password,
    "database"=>$databaseName
];

/* Connect using SQL Server Authentication. */  
$connection = sqlsrv_connect( $serverName, $connectionInfo);  

if ($connection) {
    // echo "Connection established 😁.<br>";
} else {
    echo "Connection could not be established.😥<br>";
    die( print_r( sqlsrv_errors(), true));
}

/* Set up Transact-SQL query example. */  
// $tsql = "UPDATE Sales.SalesOrderDetail   
//          SET OrderQty = ?   
//          WHERE SalesOrderDetailID = ?";  
/* Assign parameter values. */  
// $param1 = 5;  
// $param2 = 10;  
// $params = array(&$param1, &$param2);  

// ❗ Update after to use params and be more secure ❗
// $exampleQuery = "SELECT * FROM filter_teachers";

function execQuery ($query) {
    global $connection;
    /* Check if query can exectute. */  
    if (!$statement = sqlsrv_prepare($connection, $query)) {
        echo "Statement/query invalid and cannot be executed. 😥<br>";  
        die(print_r(sqlsrv_errors(), true));  
    };

      
    /* Execute the statement. */  
    if (sqlsrv_execute($statement)) {  
        // $results = [];
        $queryResource = sqlsrv_query($connection, $query);
        while ($row = sqlsrv_fetch_array($queryResource, SQLSRV_FETCH_ASSOC)) {
            $results['first_name'] = $row[first_name];
            $results['last_name'] = $row[last_name];
            $results['school'] = $row[school];
            $results['subject'] = $row[subject];
            $results['grade'] = $row[grade];
        };
    } else {  
        echo "Query could not be executed. 😥<br>";  
        die(print_r(sqlsrv_errors(), true));  
    }  
    return $results;
    
    // return sqlsrv_fetch_array($queryResource, SQLSRV_FETCH_ASSOC);

    /* Free the statement and connection resources. */  
    // sqlsrv_free_stmt($statement);  
    // sqlsrv_close($connection);  
}

?>