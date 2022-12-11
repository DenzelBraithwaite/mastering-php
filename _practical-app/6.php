
<?php include "functions.php" ?>
<?php include "includes/header.php" ?>

	<section class="content">

		<aside class="col-xs-4">
		
		<?php Navigation();?>
			
		</aside><!--SIDEBAR-->


<article class="main-content col-xs-8">

<form action="test_form.php" method="POST">
  <label for="first-name">First Name:</label>
  <input name="first-name" type="text" placeholder="Ex: John">
  <br>
  <label for="last-name">Last Name:</label>
  <input name="last-name" type="text" placeholder="Ex: Smith">
  <br>
  <label for="password">Password:</label>
  <input name="password" type="password">
  <br>
  <button name ="submit" type='submit'>Submit</button>
</form>

	<?php  

/*  Step1: Make a form that submits one value to POST super global


 */
	
?>


</article><!--MAIN CONTENT-->
<?php include "includes/footer.php" ?>