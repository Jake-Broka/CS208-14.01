CREATE DATABASE IF NOT EXISTS cs208demo;

USE cs208demo;

CREATE TABLE IF NOT EXISTS menu (
    id INT AUTO_INCREMENT PRIMARY KEY,
    item VARCHAR(255) NOT NULL,
    price_sm DECIMAL(5,2),
    price_md DECIMAL(5,2),
    price_lg DECIMAL(5,2),
    `description` VARCHAR(1000),
    `type` VARCHAR(255) NOT NULL
);

CREATE TABLE IF NOT EXISTS reviews (
    id INT AUTO_INCREMENT PRIMARY KEY,
    review VARCHAR(500) NOT NULL,
    `timestamp` TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- 1. SIGNATURE DONUTS (Single-price items)
INSERT INTO menu (item, price_sm, price_md, price_lg, `description`, `type`) VALUES
('Classic Glazed', 2.50, NULL, NULL, 'Our legendary original light, fluffy, and perfectly glazed', 'donut'),
('Maple Bacon Bar', 3.75, NULL, NULL, 'Rich maple glaze topped with crispy applewood bacon', 'donut'),
('Boston Cream', 3.50, NULL, NULL, 'Bavarian cream filling, dark chocolate ganache topping', 'donut'),
('Blueberry Cake', 3.25, NULL, NULL, 'Dense cake donut bursting with fresh blueberries', 'donut'),
('Cinnamon Sugar Twist', 2.75, NULL, NULL, 'Hand-twisted and tossed in cinnamon sugar', 'donut'),
('Strawberry Frosted', 3.00, NULL, NULL, 'Vanilla donut with strawberry glaze and rainbow sprinkles', 'donut'),
('Chocolate Old Fashioned', 3.25, NULL, NULL, 'Sour cream donut with rich chocolate glaze', 'donut'),
('Lemon Poppy Seed', 3.50, NULL, NULL, 'Bright lemon glaze with poppy seed crunch', 'donut'),
('Dulce de Leche', 3.75, NULL, NULL, 'Caramel cream filled, drizzled with dulce de leche', 'donut'),
('PB & J', 3.75, NULL, NULL, 'Peanut butter glaze with raspberry jam filling', 'donut');

-- 2. COFFEE & DRINKS (Multi-priced items)
INSERT INTO menu (item, price_sm, price_md, price_lg, `description`, `type`) VALUES
('Drip Coffee', 2.25, 2.75, 3.25, 'House blend or single origin', 'coffee'),
('Cold Brew', 3.50, 4.00, 4.50, 'Slow-steeped 18 hours, smooth and bold', 'coffee'),
('Espresso', 3.00, NULL, NULL, 'Double shot pulled to order', 'coffee'),
('Americano', 3.25, 3.75, 4.25, 'Espresso and hot water, classic and clean', 'coffee'),
('Latte', 4.25, 4.75, 5.25, 'Espresso with steamed milk, choice of milk', 'coffee'),
('Cappuccino', 4.25, 4.75, 5.25, 'Equal parts espresso, steamed milk, foam', 'coffee'),
('Mocha', 4.75, 5.25, 5.75, 'Espresso, chocolate, steamed milk, whipped cream', 'coffee'),
('Vanilla Chai Latte', 4.50, 5.00, 5.50, 'Spiced chai with vanilla and steamed milk', 'coffee');

-- 3. OTHER DRINKS (Single-price items)
INSERT INTO menu (item, price_sm, price_md, price_lg, `description`, `type`) VALUES
('Fresh Squeezed OJ', 3.50, NULL, NULL, 'Fresh squeezed orange juice', 'drink'),
('Hot Chocolate', 3.75, NULL, NULL, 'Hot chocolate', 'drink'),
('Iced Tea (Sweet / Unsweet)', 2.50, NULL, NULL, 'Iced tea', 'drink'),
('Lemonade', 2.75, NULL, NULL, 'Lemonade', 'drink'),
('Milk (Whole, Chocolate, Strawberry)', 2.00, NULL, NULL, 'Milk options', 'drink'),
('Apple Cider (Seasonal)', 3.50, NULL, NULL, 'Seasonal apple cider', 'drink');

-- 4. BREAKFAST BITES (Single-price items)
INSERT INTO menu (item, price_sm, price_md, price_lg, `description`, `type`) VALUES
('Egg & Cheese Croissant', 5.50, NULL, NULL, 'Egg & cheese breakfast croissant', 'breakfast'),
('Bacon Breakfast Sandwich', 6.25, NULL, NULL, 'Bacon breakfast sandwich', 'breakfast'),
('Avocado Toast', 5.75, NULL, NULL, 'Avocado toast', 'breakfast'),
('Yogurt Parfait', 4.50, NULL, NULL, 'Yogurt parfait', 'breakfast');

--5. GENERIC REVIEWS
INSERT INTO reviews (review) VALUES
("I got food poisoning for weeks"),
("Nice location"),
("They should be open 24/7"),
("No trees planted outside but we're in the city of trees"),
("Put one near BSU!"),
("Lorem ipsum dolor sit amet"),
("I think therefore I am"),
("To be or not to be"),
("<h1>Hello, world!</h1>"),
("10/10 would come again"),
-- Page 1 ^^
("If you're reading this, my pagination works!"),
("Great donuts."),
("Lovely staff"),
("The classic glazed is my favorite!"),
("Their sunday baker's dozen deal is amazing");
-- Page 2 ^^

