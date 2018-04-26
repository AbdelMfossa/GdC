<?php
    session_start();
    if (isset($_SESSION['login'])){
        echo '<meta http-equiv="refresh" content="0;URL=pages/home.php">';
    }
    else{
?>
    <html>
        <head lang="en">
        <meta charset="UTF-8">
        <title>Login</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="css/style1.css" rel="stylesheet" type="text/css">
        <link rel="shortcut icon" type="image/x-icon" href="images/yodeco2.png">
        </head>
        <body>
                <div class="row">
                    <div class="col-3">
                        <img src="images/logo-GdC.png" alt="Logo" class="logo"/>
                    </div>
                </div>
                <div class="row">
                    <div class="col-1">
                    </div>
                    <div class="col-10">
                        <center><img src="images/welcome-login.png" alt="welcome" class="welcome" style="width:680px"></center>
                    </div>
                    <div class="col-1">
                    </div>
                </div>

        <div class="row">
            <div class="col-4"></div>
            <div class="col-4">
                <div class="mysession">
                    <form name="fconnect" action="pages/login.php" method="POST">
                        <label for="login"> Login </label>
                        <input type="text" id="login" name="login" autofocus>
                        <label for="password">Password</label>
                        <input type="password" id="password" name="password">
                        <input type="submit" value="Connect" name="connect">
                    </form>
                    <span><a href="passwordForgot.php">Forgot your password</a></span>
                </div>
            </div>
            
        </div >
            <div class="footer">
                <p>Copyright LYCLAF/YODECO~AS © 2018, All rights reserved.</p>
            </div>
            </body>
            </html>
<?php
    }
?>