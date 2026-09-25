# ShopNest — E-Commerce Management System
CS2307 Internet Programming Lab Mini Project

## Technology
HTML5, CSS3, JavaScript, PHP 8+, MySQL 8+, PDO.

## Features
- Responsive e-commerce storefront
- Product search and category filtering
- Customer registration/login with password hashing
- Database-backed cart and quantity management
- Checkout and order creation
- Order history and status display
- Admin dashboard with products, orders, users and revenue metrics
- Admin product add/delete management
- SQL schema + realistic seed data
- Local SVG product images; no external image dependency

## Run locally (XAMPP)
1. Copy `ecommerce_management_system` into `C:/xampp/htdocs/`.
2. Start Apache and MySQL in XAMPP.
3. Open phpMyAdmin and import `database/ecommerce.sql`.
4. Check `config.php`: default XAMPP credentials are root with an empty password.
5. Visit `http://localhost/ecommerce_management_system/`.
6. Admin login: `admin@shopnest.test` / `password`.

## Notes
This is a lab/demo project. Payment options are demonstration choices; no real payment gateway is connected.
