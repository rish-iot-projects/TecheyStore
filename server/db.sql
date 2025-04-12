CREATE DATABASE tech_store;

\c tech_store;

CREATE TABLE products (
    id SERIAL PRIMARY KEY,
    sku VARCHAR(50) UNIQUE NOT NULL,
    name VARCHAR(100) NOT NULL,
    category VARCHAR(50) DEFAULT 'electronics',
    price DECIMAL(10, 2) NOT NULL,
    stock INTEGER NOT NULL,
    description TEXT
);

CREATE TABLE orders (
    id SERIAL PRIMARY KEY,
    product_id INTEGER REFERENCES products(id),
    quantity INTEGER NOT NULL,
    status VARCHAR(20) DEFAULT 'pending',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO products (sku, name, category, price, stock, description)
VALUES
    ('ELEC001', 'Resistor 10k Ohm 1/4W', 'electronics', 0.10, 1000, 'Carbon film resistor, 5% tolerance, 10k Ohm'),
    ('ELEC002', 'Resistor 1k Ohm 1/4W', 'electronics', 0.10, 1000, 'Carbon film resistor, 5% tolerance, 1k Ohm'),
    ('ELEC003', 'Capacitor 100uF 16V', 'electronics', 0.25, 500, 'Electrolytic capacitor, 100uF, 16V rating'),
    ('ELEC004', 'Capacitor 10uF 50V', 'electronics', 0.20, 600, 'Electrolytic capacitor, 10uF, 50V rating'),
    ('ELEC005', 'Transistor 2N2222 NPN', 'electronics', 0.15, 400, 'General-purpose NPN transistor'),
    ('ELEC006', 'Transistor BC547 NPN', 'electronics', 0.12, 450, 'Low-power NPN transistor'),
    ('ELEC007', 'Arduino Uno R3', 'electronics', 25.00, 50, 'ATmega328P microcontroller development board'),
    ('ELEC008', 'Raspberry Pi 4 Model B 4GB', 'electronics', 55.00, 30, 'Single-board computer with 4GB RAM'),
    ('ELEC009', 'LED 5mm Red', 'electronics', 0.05, 2000, '5mm red LED, 20mA, 2V'),
    ('ELEC010', 'LED 5mm Green', 'electronics', 0.05, 2000, '5mm green LED, 20mA, 2.2V'),
    ('ELEC011', 'Diode 1N4148', 'electronics', 0.03, 1500, 'Small signal fast switching diode'),
    ('ELEC012', 'Diode 1N4007', 'electronics', 0.05, 1200, '1A rectifier diode'),
    ('ELEC013', 'LM358 Op-Amp', 'electronics', 0.50, 300, 'Dual operational amplifier IC'),
    ('ELEC014', 'NE555 Timer IC', 'electronics', 0.30, 400, 'Precision timer IC for oscillators and PWM'),
    ('ELEC015', 'DHT11 Temperature Sensor', 'electronics', 2.50, 100, 'Digital temperature and humidity sensor'),
    ('ELEC016', 'HC-SR04 Ultrasonic Sensor', 'electronics', 3.00, 80, 'Ultrasonic distance sensor, 2cm-400cm range'),
    ('ELEC017', 'Breadboard 830 Points', 'electronics', 5.00, 60, 'Solderless breadboard with 830 tie-points'),
    ('ELEC018', 'Jumper Wires M/M 40pcs', 'electronics', 2.00, 200, '40-piece male-to-male jumper wire set, 20cm'),
    ('ELEC019', 'Servo Motor SG90', 'electronics', 2.50, 90, 'Micro servo motor, 180-degree rotation'),
    ('ELEC020', '16x2 LCD Display', 'electronics', 4.00, 70, '16x2 character LCD with I2C interface');
