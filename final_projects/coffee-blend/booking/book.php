<?php
// Start output buffering
ob_start();

require "../includes/header.php"; 
require "../config/config.php"; 

// Start the session if it hasn't been started yet
if (session_status() == PHP_SESSION_NONE) {
    session_start();
}

if (isset($_POST['submit'])) {
    // Check for empty fields
    if (empty($_POST['first_name']) || empty($_POST['last_name']) || empty($_POST['date']) ||
        empty($_POST['time']) || empty($_POST['phone']) || empty($_POST['message'])) {
        echo "<script>alert('One or more inputs are empty');</script>";
    } else { 
        $first_name = $_POST['first_name'];
        $last_name = $_POST['last_name'];
        $date = $_POST['date'];
        $time = $_POST['time'];
        $phone = $_POST['phone'];
        $message = $_POST['message'];
        $user_id = $_SESSION['user_id'];

        // Validate the date
        if ($date > date("n/j/Y")) { // Use Y-m-d format for comparison
            // Check if a booking already exists for the same user at the same date and time
            $checkBooking = $conn->prepare("SELECT * FROM bookings WHERE user_id = :user_id AND date = :date AND time = :time");
            $checkBooking->execute([
                ':user_id' => $user_id,
                ':date' => $date,
                ':time' => $time
            ]);

            if ($checkBooking->rowCount() > 0) {
                echo "<script>alert('You already have a booking for this date and time.');</script>";
            } else {
                // Prepare and execute the insert statement
                $insert = $conn->prepare("INSERT INTO bookings (first_name, last_name, date, time, phone, message, user_id) 
                VALUES (:first_name, :last_name, :date, :time, :phone, :message, :user_id)");

                $insert->execute([
                    ":first_name" => $first_name,
                    ":last_name" => $last_name,
                    ":date" => $date,
                    ":time" => $time,
                    ":phone" => $phone,
                    ":message" => $message,
                    ":user_id" => $user_id
                ]);

                // Redirect after successful insert
                header("Location: " . APPURL);
                exit(); // Ensure no further code is executed after redirection
            }
        } else {
            echo "<script>alert('Please select a future date.');</script>";
        }
    }
}

// Flush the output buffer and turn off output buffering
ob_end_flush();
?>