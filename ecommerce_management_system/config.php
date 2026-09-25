<?php

session_start();

$host = "127.0.0.1";
$port = "3306";
$db   = "ecommerce_management";
$user = "shopnest";
$pass = "shopnest123";

try {
    $pdo = new PDO(
        "mysql:host=$host;port=$port;dbname=$db;charset=utf8mb4",
        $user,
        $pass,
        [
            PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION,
            PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_ASSOC
        ]
    );
} catch (PDOException $e) {
    die("Database connection failed: " . $e->getMessage());
}

function e($v) {
    return htmlspecialchars((string)$v, ENT_QUOTES, 'UTF-8');
}

function logged() {
    return isset($_SESSION['user']);
}

function is_admin() {
    return !empty($_SESSION['user']) &&
           $_SESSION['user']['role'] === 'admin';
}

function cart_count() {
    global $pdo;

    if (!logged()) {
        return 0;
    }

    $s = $pdo->prepare(
        "SELECT COALESCE(SUM(quantity), 0) AS c
         FROM cart_items
         WHERE user_id = ?"
    );

    $s->execute([$_SESSION['user']['id']]);

    return (int)$s->fetch()['c'];
}

function flash($msg, $type = 'success') {
    $_SESSION['flash'] = [$msg, $type];
}

function redirect($url) {
    header("Location: " . $url);
    exit;
}