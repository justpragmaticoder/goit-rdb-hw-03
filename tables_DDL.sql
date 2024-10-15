-- Contacts table remains unchanged (no foreign keys needed)

CREATE TABLE suppliers (
    id INT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    contact VARCHAR(255),
    address VARCHAR(255),
    city VARCHAR(100),
    postal_code VARCHAR(20),
    country VARCHAR(100),
    phone VARCHAR(50)
);

-- Shippers table remains unchanged (no foreign keys needed)

CREATE TABLE shippers (
    id INT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    phone VARCHAR(50)
);

-- Categories table (no foreign keys needed for now)

CREATE TABLE categories (
    id INT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    description TEXT
);

-- Products table (foreign keys to Suppliers and Categories)

CREATE TABLE products (
    id INT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    supplier_id INT NOT NULL,
    category_id INT NOT NULL,
    unit VARCHAR(50),
    price DECIMAL(10, 2),
    FOREIGN KEY (supplier_id) REFERENCES suppliers(id), -- Assuming contacts include suppliers
    FOREIGN KEY (category_id) REFERENCES categories(id) -- Link to categories table
);

-- Employees table remains unchanged (no foreign keys needed)

CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    last_name VARCHAR(100) NOT NULL,
    first_name VARCHAR(100) NOT NULL,
    birthdate DATE NOT NULL,
    photo VARCHAR(255),
    notes TEXT
);

-- Customers table (no foreign keys needed)

CREATE TABLE customers (
    id INT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    contact VARCHAR(255),
    address VARCHAR(255),
    city VARCHAR(100),
    postal_code VARCHAR(20),
    country VARCHAR(100)
);

-- Orders table (foreign keys to Contacts, Employees, Customers, and Shippers)

CREATE TABLE orders (
    id INT PRIMARY KEY,
    customer_id INT NOT NULL,
    employee_id INT NOT NULL,
    order_date DATE NOT NULL,
    shipper_id INT NOT NULL,
    FOREIGN KEY (customer_id) REFERENCES customers(id), -- Reference to customers table
    FOREIGN KEY (employee_id) REFERENCES employees(employee_id),
    FOREIGN KEY (shipper_id) REFERENCES shippers(id)
);

-- Order Details table (foreign keys to Orders and Products tables)

CREATE TABLE order_details (
    id INT PRIMARY KEY,
    order_id INT NOT NULL,
    product_id INT NOT NULL,
    quantity INT NOT NULL,
    FOREIGN KEY (order_id) REFERENCES orders(id),
    FOREIGN KEY (product_id) REFERENCES products(id)
);