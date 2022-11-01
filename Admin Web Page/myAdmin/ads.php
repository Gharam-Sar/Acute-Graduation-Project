
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <link rel="apple-touch-icon" sizes="76x76" href="./assets/img/apple-icon.png">
  <link rel="icon" type="image/png" href="./assets/img/favicon.png">
  <title>
    Admin Page
  </title>

 
  <link href="https://fonts.googleapis.com/icon?family=Material+Icons+Round" rel="stylesheet">

  <link id="pagestyle" href="./assets/css/styles.css" rel="stylesheet" />
</head>

<body class="g-sidenav-show  bg-gray-100">
   <aside style="background-color: #0b1a34;" class="sidenav  navbar-vertical navbar-expand-xs  border-radius-xl fixed-start ms-2 " id="sidenav-main">

    <div class="" >
      <img width="150px" class="ms-5" src="./assets/img/logolightblue.png" >
    </div>
    <hr class="horizontal light mt-0 mb-1">
    <div class="collapse navbar-collapse    max-height-vh-100" id="sidenav-collapse-main">
      <ul class="navbar-nav">
      <li class="nav-item">
          <a class="nav-link text-white " href="./index.php">
            <div class="text-white text-center me-2 d-flex align-items-center justify-content-center">
              <i class="material-icons opacity-10">dashboard</i>
            </div>
            <span class="nav-link-text ms-1">Main page</span>
          </a>
        </li>
        <li class="nav-item">
          <a class="nav-link text-white " href="./user-table.php">
            <div class="text-white text-center me-2 d-flex align-items-center justify-content-center">
              <i class="material-icons opacity-10">table_view</i>
            </div>
            <span class="nav-link-text ms-1">Users Table</span>
          </a>
        </li>
    
        <li class="nav-item">
          <a class="nav-link text-white "   href="./food-table.php" >
            <div class="text-white text-center me-2 d-flex align-items-center justify-content-center">
              <i class="material-icons opacity-10">table_view</i>
            </div>
            <span class="nav-link-text ms-1">Foods Table</span>
          </a>
        </li>
          <li class="nav-item">
          <a class="nav-link text-white "   href="./feed-back.php" >
            <div class="text-white text-center me-2 d-flex align-items-center justify-content-center">
              <i class="material-icons opacity-10">assignment</i>
            </div>
            <span class="nav-link-text ms-1">Feed Back</span>
          </a>
        </li>
        <li class="nav-item">
      <a style="background-color: #b6d9f0; "class="nav-link text-white " href="./ads.php">
        <div class="text-white text-center me-2 d-flex align-items-center justify-content-center">
          <i class="material-icons opacity-10"style="background-color:#0b1a34; ">receipt_long</i>
        </div>
        <span class="nav-link-text ms-1"style="color:#0b1a34;">Advertisement</span>
      </a>
    </li>
      
      
        <li class="nav-item">
          <a class="nav-link text-white " href="./sign-in.php">
            <div class="text-white text-center me-2 d-flex align-items-center justify-content-center">
              <i class="material-icons opacity-10">login</i>
            </div>
            <span class="nav-link-text ms-1">Sign Out</span>
          </a>
        </li>
           </ul>
  </aside>
  <main class="main-content position-relative max-height-vh-100 h-100 border-radius-lg ">
  
    <nav class="navbar navbar-main navbar-expand-lg px-0 mx-4 shadow-none border-radius-xl" id="navbarBlur" navbar-scroll="true">
      <div class="container-fluid py-2 px-1">
     
      </div>
    </nav>

    <div class="row ms-0 mb-4 " align="center"; >
             



                <div class="col-lg-8 col-md-10">
                 <div class="card h-200">
                 <div class="card-header pb-0" align="center"; style="background-color: #d4a9a9;">
                      <h6>Add Ad</h6>
                    </div>
                    <div class="card-body p-4" align="center"; style="background-color: #d4a9a9;">
                   
                    <form align="center"; method="post" class="text-start">
            <tr>
            <td><div class="ms-2"> </div> </td>
           <td>
              <label  align="center"; class="form-label">Display Date</label  >
                  <div class="input-group input-group-outline mb-2">
                    <input style="background-color: white;" type="date" placeholder="" class="form-control" name="date" required>
                  </div>
           </td>
           <td><div class="ms-2"> </div> </td>
           <td>
              <label  align="center"; class="form-label">Photo Link</label  >
                  <div class="input-group input-group-outline mb-2">
                  <input style="background-color: white;" type="link" step=".01" placeholder="" class="form-control" name="link" required>
                  </div>
           </td> </tr>
            <tr><td><div class="ms-2 mb-1"> </div> </td>
           <td class="mb-1">
           <div class="text-center ">
                    <button method="POST" action="localhost/myAdmin/ads.php" type="submit" style="background-color: #0b1a34; color: white;"
                      class="btn  w-100 my-4 mb-2">Add Ad Link</button>
                  </div>
           </td>
           <td><div class="ms-2 mb-1"> </div> </td>  <td><div class="ms-2 mb-1"> </div> </td>
           <td> </td><td> </td>

            </tr>

 </form>
 <?php 
  if (isset($_POST['date'])&&$_POST['date']!=""&&isset($_POST['link'])&&$_POST['link']!=""
  )
  {
                    @$dp=new mysqli('localhost', 'root','','acutedb');
                    if(mysqli_connect_errno())
                    { echo 'Can not connect to database';
                        die(); }
                   $strQry="INSERT INTO `ads`(`date`, `link`) VALUES ('" . $_POST['date'] . "','" . $_POST['link'] . "')";
                    $res = $dp ->query($strQry);
                                    }
            
            ?>

                  
                


                    </div>
                  </div>
                </div>

                <div class="col-lg-4 col-md-6">
                 <div class="card h-300">
                 <div class="card-header pb-0" align="center"; style="background-color: #90d4d3;">
                      <h6>Change Ad Status</h6>
                    </div>
                    <div class="card-body p-4" align="center"; style="background-color: #90d4d3;">
                   

                    <form align="center"; method="post" class="text-start">
                  <label  align="center"; class="form-label">Ad ID</label  >
                  <div class="input-group input-group-outline mb-4">
                    <input style="background-color: white;" type="" placeholder="Enter Ad ID to change its status " class="form-control" name="ad_delete" required>
                  </div>
                  <div class="text-center pb-6">
                    <button method="POST" action="localhost/myAdmin/ads.php" type="submit" style="background-color: #0b1a34; color: white;"
                      class="btn  w-100 my-4 mb-2 ">Change Status</button>
                  </div>
                  </form>
                  <?php 
                          if (isset($_POST['ad_delete']) && $_POST['ad_delete']!="")
                          {   @$dp=new mysqli('localhost', 'root','','acutedb');
                              if(mysqli_connect_errno())
                              {  echo 'Can not connect to database';
                                  die(); }
                                  $strQry=" select * from `ads` WHERE `id`='" . $_POST['ad_delete'] . "'";
                                  $res = $dp ->query($strQry);
                                 
                                    $row = $res -> fetch_assoc();
                                      $s=$row['status'];
                                    if($s==1){
                                      $strQry = "UPDATE `ads` SET `status`= 0 WHERE `id`='" . $_POST['ad_delete'] . "'";
                                      $res = $dp ->query($strQry);
                                    }
                                    if($s==0){
                                      $strQry = "UPDATE `ads` SET `status`= 1 WHERE `id`='" . $_POST['ad_delete'] . "'";
                                      $res = $dp ->query($strQry);
                                    }}
              
                        ?> 
                    </div>
                  </div>
                </div>
              </div>
              </div>
            </div>
   

    <div class="container-fluid py-4" align = "center";>
      <div class="row"  align = "center";>
        <div class="col-12">
          <div class="card my-4">
            <div class="card-header p-0 position-relative mt-n4 mx-3 z-index-2">
              <div class=" border-radius-lg pt-4 pb-3"style="background-color: #0b1a34; color: white;">
                <h6 class="text-white text-capitalize ps-3">Ad Links</h6>
              </div>
            </div>
            <div class="card-body px-0 pb-2"  align = "center";>
              <div class="table-responsive p-0"  align = "center";>
                <table class="table align-items-center mb-0" align = "center";>
                  <thead  align = "center";>
                    <tr>
                    <th class="text-uppercase text-secondary text-xs font-weight-bolder opacity-7 ps-2">ID</th>              
                    <th class="text-uppercase text-secondary text-xs font-weight-bolder opacity-7 ps-2">Date</th>              
                    <th class="text-uppercase text-secondary text-xs font-weight-bolder opacity-7 ps-2">Status</th>              

                    <th class="text-uppercase text-secondary text-xs font-weight-bolder opacity-7 ps-2">Link</th>              

                    </tr>
                  </thead>
                  <tbody  align = "center";>
                  <?php 
                    @$dp=new mysqli('localhost', 'root','','acutedb');
                    if(mysqli_connect_errno())
                    {
                        echo 'Can not connect to database';
                        die();
                    }
                   $strQry='select * from ads';
                    $res = $dp ->query($strQry);
                    for($i=0;$i<$res -> num_rows;$i++)
                    {
                        $row = $res -> fetch_assoc();
                        $id=$row['id'];
                        $date=$row['date'];
                        $status=$row['status'];
                        $link=$row['link'];

          echo"<tr ><th >$id</th><th >$date</th><th >$status</th><th >$link</th>";

                        
                
                    }
          
            
            ?>

                  </tbody>
                </table>
              </div>
            </div>
          </div>
        </div>
      </div>
      
    </div>
  </main>
 
</body>

</html>