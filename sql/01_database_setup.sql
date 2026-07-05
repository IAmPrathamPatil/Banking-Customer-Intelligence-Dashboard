-- ======================================================
-- Banking Customer Intelligence Platform
-- Database Setup
-- Author: Pratham Patil
-- ======================================================

-- Create Database
CREATE DATABASE banking_customer_intelligence;

-- Connect to the database before running the remaining script.

-- Create Customers Table
CREATE TABLE customers (

    customer_id BIGINT PRIMARY KEY,

    credit_score SMALLINT NOT NULL
        CHECK (credit_score BETWEEN 300 AND 900),

    country VARCHAR(50) NOT NULL,

    gender VARCHAR(10) NOT NULL
        CHECK (gender IN ('Male', 'Female')),

    age SMALLINT NOT NULL
        CHECK (age BETWEEN 18 AND 100),

    tenure SMALLINT NOT NULL
        CHECK (tenure BETWEEN 0 AND 50),

    balance NUMERIC(12,2) NOT NULL
        DEFAULT 0
        CHECK (balance >= 0),

    products SMALLINT NOT NULL
        CHECK (products BETWEEN 1 AND 10),

    credit_card BOOLEAN NOT NULL,

    active_member BOOLEAN NOT NULL,

    estimated_salary NUMERIC(12,2) NOT NULL
        CHECK (estimated_salary >= 0),

    churn BOOLEAN NOT NULL
);