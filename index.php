<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Travel Destinations</title>
    <link rel="stylesheet" href="styles.css">
</head>
<body>
    <div class="container">
        <h1>Travel Destinations</h1>
        <?php

        error_reporting(E_ALL);
        ini_set('display_errors', 1);
        // Database connection
        $servername = "sql306.infinityfree.com";
        $username = "if0_37424778";
        $password = "19Bece54020";
        $dbname = "if0_37424778_travel";

        $conn = new mysqli($servername, $username, $password, $dbname);

        if ($conn->connect_error) {
            die("Connection failed: " . $conn->connect_error);
        }

        // Fetch destinations
        $sql = "SELECT * FROM destinations";
        $result = $conn->query($sql);

        if ($result->num_rows > 0) {
            while ($destination = $result->fetch_assoc()) {
                echo "<div class='destination-card'>";
                echo "<h2>" . $destination['destination_name'] . "</h2>";
                echo "<p><strong>Country:</strong> " . $destination['country'] . "</p>";
                echo "<p><strong>Best Time to Visit:</strong> " . $destination['best_time_to_visit'] . "</p>";
                echo "<p>" . $destination['description'] . "</p>";
                echo "<img src='images/" . $destination['image_url'] . "' alt='" . $destination['destination_name'] . "' class='destination-image'>";

                // Fetch activities for this destination
                $activity_sql = "SELECT * FROM activities WHERE destination_id = " . $destination['destination_id'];
                $activity_result = $conn->query($activity_sql);

                if ($activity_result->num_rows > 0) {
                    echo "<h3>Activities:</h3>";
                    echo "<ul class='activity-list'>";
                    while ($activity = $activity_result->fetch_assoc()) {
                        echo "<li>";
                        echo "<strong>" . $activity['activity_name'] . "</strong> - $" . $activity['cost'] . " (" . $activity['duration'] . ")";
                        echo "<p>" . $activity['activity_description'] . "</p>";
                        echo "</li>";
                    }
                    echo "</ul>";
                } else {
                    echo "<p>No activities found for this destination.</p>";
                }
                echo "</div>";
            }
        } else {
            echo "<p>No destinations found.</p>";
        }

        $conn->close();
        ?>
    </div>
</body>
</html>