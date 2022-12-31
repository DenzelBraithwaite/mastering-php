<?php

if (isset($_POST['submit'])) {
  $username = $_POST['username'];
  $password = $_POST['password'];
  $connection = mysqli_connect('localhost', 'root', '', 'fighters');
  // echo $username . '<br>' . $password;

  if ($connection) {
    // echo "We are connected!";
  } else {
    die('No luck :(');
  }

} else {
  echo 'no';
};

?>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link href="style.css" rel="stylesheet">
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Roboto:ital,wght@0,100;0,400;0,700;0,900;1,400&display=swap" rel="stylesheet">
  <title>Stats Checker | Character Stats</title>
</head>
<body>
  <div class="container-login">
    <div>
      <form action="login.php" method="POST">
      <div class="form-group">
          <label for="username">Fighter Name</label>
          <input id="username" class="form-control" name="username" type="text">
        </div>
        <div class="form-group">
          <label for="password">Password</label>
          <input id="password" class="form-control" name="password" type="password">
        </div>
        <input class="btn btn-submit" type="submit" name="submit" value="Submit">
        <!-- <button name="submit" type="submit">Submit</button> -->
      </form>
    </div>
    <img class="banner-img" src="banner.png" alt="image of ...">
  </div>


</body>
</html>
