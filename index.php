<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8" />
  <meta http-equiv="X-UA-Compatible" content="IE=edge" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>Test PHP</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous" />
</head>

<body>
  <div class="container">
    <h1>TODOs</h1>

    <ul>
      <?php
      # Les variables d'environnement sont lues ici
      $pdo = new PDO('mysql:host=' . $_ENV["DATABASE_HOST"] . ';port=' . $_ENV["DATABASE_PORT"] . ';dbname=' . $_ENV["DATABASE_NAME"] . '', $_ENV["DATABASE_USER"], $_ENV["DATABASE_PASSWORD"]);

      $query = $pdo->prepare('SELECT * FROM todo');
      $query->execute();

      while ($todo = $query->fetch()) {
      ?>
        <li><?php echo $todo['title']; ?></li>
      <?php
      }

      ?>
    </ul>
  </div>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js" integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN" crossorigin="anonymous"></script>
</body>

</html>