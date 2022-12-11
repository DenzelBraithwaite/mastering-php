
<?php include "functions.php" ?>
<?php include "includes/header.php" ?>

	<section class="content">

		<aside class="col-xs-4">
		
		<?php Navigation();?>
			
		</aside><!--SIDEBAR-->


<article class="main-content col-xs-8">

	<form action="test_form.php" method="POST">
		<label for="username">Username</label>
		<input name="username" type="text" placeholder="Ex: Kaz123">
		<br>
		<label for="password">Password</label>
		<input name="password" type="password">
		<br>
		<button name="submit" type="submit">Submit</button>
	</form>

	<?php  

/*  Step1: Make a form that submits one value to POST super global


 */
	
?>


</article><!--MAIN CONTENT-->
<?php include "includes/footer.php" ?>