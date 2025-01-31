<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Register Here</title>
    <style>
        @keyframes fadeIn {
            from {
                opacity: 0;
                transform: translateY(20px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        @keyframes slideIn {
            from { transform: translateX(-20px); opacity: 0; }
            to { transform: translateX(0); opacity: 1; }
        }

        @keyframes float {
            0% { transform: translateY(0px); }
            50% { transform: translateY(-10px); }
            100% { transform: translateY(0px); }
        }

        @keyframes shimmer {
            0% { background-position: -1000px 0; }
            100% { background-position: 1000px 0; }
        }

        body {
            font-family: 'Poppins', sans-serif;
            margin: 0;
            padding: 0;
            min-height: 100vh;
            background-image: url('https://images.unsplash.com/photo-1504674900247-0877df9cc836?q=80');
            background-size: cover;
            background-position: center;
            background-repeat: no-repeat;
            display: flex;
            align-items: center;
            justify-content: center;
            overflow-x: hidden;
        }

        body::before {
            content: '';
            position: fixed;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            background: rgba(0, 0, 0, 0.6);
            backdrop-filter: blur(8px);
            z-index: 1;
            animation: fadeIn 1s ease-out;
        }

        .form-container {
            position: relative;
            width: 100%;
            max-width: 400px;
            margin: 20px;
            padding: 30px;
            background: rgba(255, 255, 255, 0.95);
            border-radius: 15px;
            box-shadow: 0 8px 32px rgba(0, 0, 0, 0.1);
            z-index: 2;
            transform: translateY(0);
            transition: all 0.3s ease;
            animation: fadeIn 0.5s ease-out;
        }

        .form-container:hover {
            transform: translateY(-5px);
            box-shadow: 0 15px 40px rgba(0, 0, 0, 0.2);
        }

        h1 {
            text-align: center;
            color: #2c3e50;
            margin-bottom: 30px;
            font-size: 28px;
            font-weight: 600;
            animation: float 3s ease-in-out infinite;
        }

        .input-group {
            position: relative;
            margin-bottom: 20px;
            opacity: 0;
            animation: slideIn 0.5s ease-out forwards;
        }

        .input-group:nth-child(1) { animation-delay: 0.1s; }
        .input-group:nth-child(2) { animation-delay: 0.2s; }
        .input-group:nth-child(3) { animation-delay: 0.3s; }
        .input-group:nth-child(4) { animation-delay: 0.4s; }
        .input-group:nth-child(5) { animation-delay: 0.5s; }

        label {
            font-size: 14px;
            color: #34495e;
            margin-bottom: 8px;
            display: block;
            font-weight: 500;
            transition: transform 0.3s ease, color 0.3s ease;
        }

        .input-group:hover label {
            transform: translateX(5px);
            color: #3498db;
        }

        input[type="text"],
        input[type="password"],
        input[type="email"] {
            width: 100%;
            padding: 12px;
            margin-bottom: 20px;
            border: 2px solid #e0e0e0;
            border-radius: 8px;
            box-sizing: border-box;
            font-size: 14px;
            transition: all 0.3s ease;
            background: rgba(255, 255, 255, 0.9);
        }

        input[type="text"]:focus,
        input[type="password"]:focus,
        input[type="email"]:focus {
            border-color: #3498db;
            box-shadow: 0 0 15px rgba(52, 152, 219, 0.2);
            transform: translateY(-2px);
            outline: none;
        }

        button {
            width: 100%;
            padding: 14px;
            background: linear-gradient(135deg, #3498db, #2980b9);
            color: #fff;
            border: none;
            border-radius: 8px;
            font-size: 16px;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.3s ease;
            margin-top: 10px;
            position: relative;
            overflow: hidden;
            animation: fadeIn 0.5s ease-out 0.6s backwards;
        }

        button:hover {
            background: linear-gradient(135deg, #2980b9, #3498db);
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(52, 152, 219, 0.3);
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

        p {
            text-align: center;
            font-size: 14px;
            margin-top: 20px;
            color: #34495e;
            animation: fadeIn 0.5s ease-out 0.7s backwards;
        }

        p a {
            color: #3498db;
            text-decoration: none;
            font-weight: 600;
            transition: all 0.3s ease;
            position: relative;
        }

        p a:hover {
            color: #2980b9;
        }

        p a::after {
            content: '';
            position: absolute;
            width: 100%;
            height: 2px;
            bottom: -2px;
            left: 0;
            background-color: #3498db;
            transform: scaleX(0);
            transform-origin: right;
            transition: transform 0.3s ease;
        }

        p a:hover::after {
            transform: scaleX(1);
            transform-origin: left;
        }

        @media (max-width: 500px) {
            .form-container {
                margin: 10px;
                padding: 20px;
            }

            h1 {
                font-size: 24px;
            }
        }
    </style>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600&display=swap" rel="stylesheet">
</head>
<body>
    <div class="form-container">
        <h1>Welcome to FoodApp</h1>
        <form action="RegisterServlet" method="post">
            <div class="input-group">
                <label for="username">Username</label>
                <input type="text" id="username" name="username" placeholder="Enter your username" required>
            </div>
            
            <div class="input-group">
                <label for="password">Password</label>
                <input type="password" id="password" name="password" placeholder="Enter your password" required>
            </div>
            
            <div class="input-group">
                <label for="cpassword">Confirm Password</label>
                <input type="password" id="cpassword" name="cpassword" placeholder="Confirm your password" required>
            </div>
            
            <div class="input-group">
                <label for="email">Email</label>
                <input type="email" id="email" name="email" placeholder="Enter your email" required>
            </div>
            
            <div class="input-group">
                <label for="address">Address</label>
                <input type="text" id="address" name="address" placeholder="Enter your address" required>
            </div>
            
            <button type="submit">Create Account</button>
        </form>
        <p>Already have an account? <a href="login.jsp">Login here</a></p>
    </div>
</body>
</html>