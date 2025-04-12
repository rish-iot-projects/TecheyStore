import express from 'express';
import { Pool } from 'pg';
import { Kafka } from 'kafkajs';

const app = express();
app.use(express.json());

// PostgreSQL connection
const pool = new Pool({
    user: 'postgres',
    host: 'db',
    database: 'tech_store',
    password: 'password',
    port: 5432,
});

// Kafka setup
const kafka = new Kafka({
    clientId: 'tech-store',
    brokers: ['kafka:9092'],
});
const producer = kafka.producer();

// Fetch products from DB
app.get('/api/products', async (req, res) => {
    const result = await pool.query('SELECT id, sku, name, category, price, stock, description FROM products WHERE category = $1', ['electronics']);
    res.json(result.rows);
});

// Place order and send to Kafka
app.post('/api/orders', async (req, res) => {
    const { product_id, quantity } = req.body;
    const result = await pool.query(
        'INSERT INTO orders (product_id, quantity) VALUES ($1, $2) RETURNING *',
        [product_id, quantity]
    );

    // Send order to Kafka
    await producer.connect();
    await producer.send({
        topic: 'orders',
        messages: [{ value: JSON.stringify(result.rows[0]) }],
    });
    await producer.disconnect();

    res.json(result.rows[0]);
});

// Mock electronics API (simulating DigiKey or similar)
app.get('/api/external/electronics', async (req, res) => {
    // Mock response
    const mockData = [
        { sku: 'EXT001', name: 'Microchip PIC16F877A', price: 3.50 },
        { sku: 'EXT002', name: 'Raspberry Pi 4', price: 35.00 },
        { sku: 'EXT003', name: 'Diode 1N4148', price: 0.02 },
        { sku: 'EXT004', name: 'Servo Motor SG90', price: 2.50 },
        { sku: 'EXT005', name: 'Breadboard 400 Points', price: 4.00 },
    ];
    res.json(mockData);
});

app.listen(3000, () => console.log('Server running on port 3000'));
