<?php

if (isset($_POST['submit'])) {
  $username = $_POST['username'];
  $password = $_POST['password'];
  echo $username . '<br>' . $password;
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
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
  <title>Document</title>
</head>
<body>

<div class="container">
  <div class="col-sm-6">
    <form action="login.php" method="POST">
    <div class="form-group">
        <label for="username">Fighter Name</label>
        <input id="username" class="form-control" name="username" type="text">
      </div>
      <div class="form-group">
        <label for="password">Password</label>
        <input id="password" class="form-control" name="password" type="password">
      </div>
      <input class="btn btn-primary mt-2" type="submit" name="submit" value="Submit">
      <!-- <button name="submit" type="submit">Submit</button> -->
    </form>
  </div>
</div>


<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js" integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN" crossorigin="anonymous"></script>
</body>
</html>
