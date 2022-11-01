
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <link rel="apple-touch-icon" sizes="76x76" href="./assets/img/apple-icon.png">
  <link rel="icon" type="image/png" href="./assets/img/favicon.png">
  <title>
    Acute-Admin Sign In
  </title>

<link id="pagestyle" href="./assets/css/styles.css" rel="stylesheet" />
</head>

<body class="bg-gray-200">


  <main class="main-content  mt-0">
    <div class="page-header align-items-start min-vh-100" style="background-image: url('./assets/img/bg2.jpg');">
      <span class="mask bg-gradient-dark opacity-6"></span>
      <div class="container my-auto">
        <div class="row">
          <div class="col-lg-4 col-md-8 col-12 mx-auto">
            <div class="card z-index-0 fadeIn3 fadeInBottom">
              <div class="card-header p-0 position-relative mt-n4 mx-3 z-index-2">
                <div style="background-color: #b6d9f0;" class=" shadow-primary border-radius-lg py-3 pe-1">
                  <div class="row mt-3">

                    <div class="col-2 text-center px-4">
                      <a class=" px-4">
                        <img src="./assets/img/logoNavy.png" alt="main_logo">
                      </a>

                    </div>

                  </div>
                  <h4 class=" font-weight-bolder text-center mt-2 mb-0" style="color: #0b1a34;">Admin Page</h4>
                </div>
              </div>
              <div class="card-body">
 
                <form method="post" class="text-start">
                  <label class="form-label">Email</label>
                  <div class="input-group input-group-outline ">
                    <input type="email" placeholder="Enter Email" class="form-control" name="Email" required>
                  </div>

                  <label class="form-label">Password</label>
                  <div class="input-group input-group-outline ">
                    <input type="password" class="form-control" placeholder="Enter Password" name="Password" required>
                  </div>

                  <div class="text-center">
                    <button method="POST" action="localhost/myAdmin/index.php" type="submit" style="background-color: #0b1a34; color: white;"
                      class="btn  w-100 my-4 mb-2">Sign in</button>
                  </div>

                </form>


                <?php  
       

       if (isset($_POST['Email'])&&isset($_POST['Password'])&&$_POST['Email']!=""&&$_POST['Password']!="")
       { session_start();
         
           $valid_user=0;
           @$dp=new mysqli('localhost', 'root','','acutedb');
           if(mysqli_connect_errno())
           {
               echo 'Can not connect to database';
               die();
           }
          $strQry='select * from acute_users';
           $res = $dp ->query($strQry);
           for($i=0;$i<$res -> num_rows;$i++)
           {
               $row = $res -> fetch_assoc();
               if ($_POST['Email'] == $row['email'] && sha1($_POST['Password']) == $row['password'])
               {
                   $_SESSION['email']=$_POST['Email'];
                   $_SESSION['password']=$_POST['Password'];
                   $_SESSION['uselevel']=$row['user_level'];
                   $_SESSION['name']=$row['first_name'];
                //   echo $_SESSION['uselevel'];
                   if($_SESSION['uselevel']==2)
                   {
                      $_SESSION['islogged']=2;
                    header("location:index.php");
                   }
                   if($_SESSION['uselevel']==1)
                   {
                      $_SESSION['islogged']=1;
                    header("location:index.php");
                   echo $_SESSION['name'];
                   }
                   if($_SESSION['uselevel']==0)
                   {
                      $_SESSION['islogged']=0;
                      header("location:sign-in.php");
                   }
                  // header("location:sign-in.php");
                  
               }
       
           }
       
       }

     ?> 
              </div>
            </div>
          </div>
        </div>
      </div>

    </div>
  </main>




</body>

</html>