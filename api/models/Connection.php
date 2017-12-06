<<<<<<< HEAD
<?php
    function getConnection() {
        $config = parse_ini_file('config.ini.php');
        
        // $host = $config['database']['server'];
        // $user = $config['database']['user'];
        // $password = $config['database']['password'];
        // $database = $config['database']['database'];
        $host = "localhost";
        $user = "root";
        $password = "";
        $database ="ecaptain";

        $conn = new mysqli($host, $user, $password , $database);
        if ($conn->connect_errno) {
            throw new Exception("Fallo al contenctar a MySQL: (" . $conn->connect_errno . ") " . $conn->connect_error, 1);
        }

        return $conn;
    }
=======
<?php
    function getConnection() {
        $config = parse_ini_file('config.ini.php');
        
        // $host = $config['database']['server'];
        // $user = $config['database']['user'];
        // $password = $config['database']['password'];
        // $database = $config['database']['database'];
        $host = "localhost";
        $user = "root";
        $password = "";
        $database ="ecaptain";

        $conn = new mysqli($host, $user, $password , $database);
        if ($conn->connect_errno) {
            throw new Exception("Fallo al contenctar a MySQL: (" . $conn->connect_errno . ") " . $conn->connect_error, 1);
        }

        return $conn;
    }
>>>>>>> origin/master
?>