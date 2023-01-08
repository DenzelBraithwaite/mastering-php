<?php
$connection = mysqli_connect('localhost', 'root', '', 'rpg');

// Raise error if no db connection.
if (!$connection) die('Connection to DB not established :(').error($connection) . mysqli_error($connection);
?>