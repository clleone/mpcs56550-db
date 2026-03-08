-- modified the version Rafi provided
-- Create products table
CREATE TABLE IF NOT EXISTS products (
                                        id SERIAL PRIMARY KEY,
                                        item VARCHAR(255) NOT NULL,
                                        quantity INTEGER NOT NULL,
                                        price DECIMAL(10, 2) NOT NULL
                                    );

-- Create orders table
CREATE TABLE IF NOT EXISTS orders (
                                    id SERIAL PRIMARY KEY,
                                    product_id INTEGER NOT NULL,
                                    quantity INTEGER NOT NULL DEFAULT 1,
                                    total_price DECIMAL(10, 2) NOT NULL,
                                    status VARCHAR(50) DEFAULT 'Order Received',
                                    FOREIGN KEY (product_id) REFERENCES products(id)
                                    );

-- Insert sample products
INSERT INTO products (item, quantity, price) VALUES
                                                    ('Candyland', 30, 10.00),
                                                    ('Twister', 25, 14.00),
                                                    ('Easy Bake Oven', 15, 50.00),
                                                    ('Jumping Jacks', 50, 7.00),
                                                    ('Little Green Army Men', 45, 10.00),
                                                    ('Neds Nose', 0, 30.00);