<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Checkout</title>
    <style>
        /* Animations */
        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(20px); }
            to { opacity: 1; transform: translateY(0); }
        }

        @keyframes slideIn {
            from { transform: translateX(-20px); opacity: 0; }
            to { transform: translateX(0); opacity: 1; }
        }

        @keyframes pulse {
            0% { transform: scale(1); }
            50% { transform: scale(1.05); }
            100% { transform: scale(1); }
        }

        @keyframes shimmer {
            0% { background-position: -1000px 0; }
            100% { background-position: 1000px 0; }
        }

        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(135deg, #f5f7fa 0%, #c3cfe2 100%);
            margin: 0;
            padding: 40px 20px;
            min-height: 100vh;
            display: flex;
            justify-content: center;
            align-items: flex-start;
            animation: fadeIn 1s ease-out;
        }

        .container {
            width: 100%;
            max-width: 600px;
            background: rgba(255, 255, 255, 0.95);
            padding: 40px;
            border-radius: 20px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
            backdrop-filter: blur(10px);
            border: 1px solid rgba(255, 255, 255, 0.3);
            animation: slideIn 0.8s ease-out;
        }

        h2 {
            text-align: center;
            color: #2c3e50;
            font-size: 2.2em;
            margin-bottom: 30px;
            text-shadow: 2px 2px 4px rgba(0,0,0,0.1);
            animation: fadeIn 1s ease-out;
        }

        .form-group {
            margin-bottom: 20px;
            opacity: 0;
            animation: fadeIn 0.5s ease-out forwards;
        }

        .form-group:nth-child(1) { animation-delay: 0.1s; }
        .form-group:nth-child(2) { animation-delay: 0.2s; }
        .form-group:nth-child(3) { animation-delay: 0.3s; }
        .form-group:nth-child(4) { animation-delay: 0.4s; }
        .form-group:nth-child(5) { animation-delay: 0.5s; }
        .form-group:nth-child(6) { animation-delay: 0.6s; }
        .form-group:nth-child(7) { animation-delay: 0.7s; }
        .form-group:nth-child(8) { animation-delay: 0.8s; }

        label {
            display: block;
            margin-bottom: 8px;
            color: #34495e;
            font-weight: 600;
            font-size: 1.1em;
            transition: transform 0.3s ease, color 0.3s ease;
        }

        .form-group:hover label {
            transform: translateX(5px);
            color: #3498db;
        }

        input[type="text"],
        input[type="email"],
        input[type="tel"],
        textarea,
        select {
            width: 100%;
            padding: 12px 15px;
            border: 2px solid #e0e0e0;
            border-radius: 10px;
            font-size: 1em;
            transition: all 0.3s ease;
            background: rgba(255, 255, 255, 0.9);
            color: #2c3e50;
            box-sizing: border-box;
        }

        input[type="text"]:focus,
        input[type="email"]:focus,
        input[type="tel"]:focus,
        textarea:focus,
        select:focus {
            border-color: #3498db;
            outline: none;
            box-shadow: 0 0 15px rgba(52, 152, 219, 0.3);
            transform: translateY(-2px);
        }

        textarea {
            resize: vertical;
            min-height: 100px;
        }

        select {
            appearance: none;
            background-image: url("data:image/svg+xml;charset=UTF-8,%3csvg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 24 24' fill='none' stroke='currentColor' stroke-width='2' stroke-linecap='round' stroke-linejoin='round'%3e%3cpolyline points='6 9 12 15 18 9'%3e%3c/polyline%3e%3c/svg%3e");
            background-repeat: no-repeat;
            background-position: right 15px center;
            background-size: 15px;
            padding-right: 45px;
        }

        button {
            background: linear-gradient(45deg, #3498db, #2980b9);
            color: white;
            padding: 15px 30px;
            border: none;
            border-radius: 10px;
            cursor: pointer;
            width: 100%;
            font-size: 1.1em;
            font-weight: 600;
            text-transform: uppercase;
            letter-spacing: 1px;
            margin-top: 20px;
            transition: all 0.3s ease;
            box-shadow: 0 4px 15px rgba(52, 152, 219, 0.3);
            position: relative;
            overflow: hidden;
            animation: fadeIn 0.5s ease-out 1s forwards;
        }

        button:hover {
            transform: translateY(-3px);
            box-shadow: 0 6px 20px rgba(52, 152, 219, 0.4);
            background: linear-gradient(45deg, #2980b9, #3498db);
        }

        button::after {
            content: '';
            position: absolute;
            top: -50%;
            left: -50%;
            width: 200%;
            height: 200%;
            background: linear-gradient(
                to right,
                rgba(255, 255, 255, 0) 0%,
                rgba(255, 255, 255, 0.3) 50%,
                rgba(255, 255, 255, 0) 100%
            );
            transform: rotate(45deg);
            animation: shimmer 3s infinite;
        }

        .success-message {
            background: linear-gradient(45deg, #2ecc71, #27ae60);
            color: white;
            padding: 15px;
            border-radius: 10px;
            text-align: center;
            margin-bottom: 20px;
            animation: pulse 2s infinite;
            display: none;
        }

        .required-field::after {
            content: "*";
            color: #e74c3c;
            margin-left: 5px;
            animation: pulse 1s infinite;
        }

        @media (max-width: 768px) {
            .container {
                padding: 20px;
            }

            h2 {
                font-size: 1.8em;
            }

            button {
                padding: 12px 20px;
            }
        }

        .payment-method {
            margin-bottom: 20px;
        }

        .payment-option {
            display: flex;
            align-items: center;
            padding: 10px;
            border: 2px solid #e0e0e0;
            border-radius: 10px;
            margin-bottom: 10px;
            cursor: pointer;
            transition: all 0.3s ease;
        }

        .payment-option:hover {
            border-color: #3498db;
            background: rgba(52, 152, 219, 0.05);
            transform: translateX(5px);
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Checkout</h2>
        <div class="success-message" id="successMessage">
            Order placed successfully!
        </div>

        <form action="checkout" method="post"> 
            <div class="form-group">
                <label for="name" class="required-field">Full Name</label>
                <input type="text" id="name" name="name" required>
            </div>

            <div class="form-group">
                <label for="email" class="required-field">Email</label>
                <input type="email" id="email" name="email" required>
            </div>

            <div class="form-group">
                <label for="phone" class="required-field">Phone</label>
                <input type="tel" id="phone" name="phone" required>
            </div>

            <div class="form-group">
                <label for="address" class="required-field">Address</label>
                <textarea id="address" name="address" rows="4" required></textarea>
            </div>

            <div class="form-group">
                <label for="city" class="required-field">City</label>
                <input type="text" id="city" name="city" required>
            </div>

            <div class="form-group">
                <label for="state" class="required-field">State</label>
                <input type="text" id="state" name="state" required>
            </div>

            <div class="form-group">
                <label for="zip" class="required-field">Zip Code</label>
                <input type="text" id="zip" name="zip" required>
            </div>

            <div class="form-group">
                <label for="payment" class="required-field">Payment Method</label>
                <select id="payment" name="paymentMode" required>
                    <option value="">Select Payment Method</option>
                    <option value="card">Credit/Debit Card</option>
                    <option value="cash">Cash on Delivery</option>
                    <option value="upi">UPI</option>
                    <option value="wallet">E-Wallet</option>
                </select>
            </div>

            <button type="submit">Place Order</button>
        </form>
    </div>
</body>
</html>