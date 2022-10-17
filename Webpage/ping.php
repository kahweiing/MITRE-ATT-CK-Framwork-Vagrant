<!DOCTYPE html>
<html lang="en">
<?php require_once('check_login.php');?>
<?php include('connect.php');?>
<body>

<!-- Start of HTML when logged in as Administator -->
	<form name="ping" action="pingit.php" method="post" target="_blank">
		<table width='600' border='1'>
		<tr valign='middle'>
			<td colspan='2' align='center'>
			<b>Hospital Management Connectivity Testing<br></b>
			</td>
		</tr>
		<tr valign='middle'>
			<td align='center'>
				Ping a Machine on the Network:
			</td>
				<td align='center'>
				<input type="text" name="ip" size="30">
				<input type="submit" value="submit" name="submit">
			</td>
			</td>
		</tr>
	</table>
	</form>
</body>
</html>
