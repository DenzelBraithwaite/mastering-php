
<?php include "functions.php" ?>
<?php include "includes/header.php" ?>

	<section class="content">

		<aside class="col-xs-4">
		
		<?php Navigation();?>
			
		</aside><!--SIDEBAR-->


<article class="main-content col-xs-8">

	
<!-- Step1: Make a form that submits one value to POST super global -->
	<?php  
		if (isset($_POST['submit'])) {
			$username = $_POST['username'];
			$password = $_POST['password'];

			if (strlen($username) < 3) {
				echo "Sorry, your username needs to be longer than 3 characters.";
			} else {
                echo "Your username is: " . $username . "<br>";
                echo "Your super secret password is " . $password;
            }
		}



	?>

<form action="6.php" method="POST">
	<label for="username">Username</label>
	<input name="username" type="text" placeholder="Ex: Kaz123">
	<br>
	<label for="password">Password</label>
	<input name="password" type="password">
	<br>
	<button name="submit" type="submit">Submit</button>
</form>

</article><!--MAIN CONTENT-->
<?php include "includes/footer.php" ?>