<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Order Confirmation</title>
    <style>
        @keyframes slideIn {
            0% {
                transform: translateY(-50px);
                opacity: 0;
            }
            100% {
                transform: translateY(0);
                opacity: 1;
            }
        }

        @keyframes fadeIn {
            0% { opacity: 0; }
            100% { opacity: 1; }
        }

        @keyframes checkmark {
            0% {
                transform: scale(0);
            }
            50% {
                transform: scale(1.2);
            }
            100% {
                transform: scale(1);
            }
        }

        @keyframes pulse {
            0% { transform: scale(1); }
            50% { transform: scale(1.05); }
            100% { transform: scale(1); }
        }

        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(135deg, #f5f7fa 0%, #c3cfe2 100%);
            margin: 0;
            padding: 40px 20px;
            min-height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .container {
            width: 90%;
            max-width: 600px;
            background: rgba(255, 255, 255, 0.95);
            padding: 40px;
            border-radius: 20px;
            box-shadow: 0 20px 40px rgba(0, 0, 0, 0.1);
            backdrop-filter: blur(10px);
            border: 1px solid rgba(255, 255, 255, 0.3);
            animation: slideIn 0.8s ease-out;
        }

        .success-icon {
            width: 80px;
            height: 80px;
            background: #4CAF50;
            border-radius: 50%;
            margin: 0 auto 30px;
            position: relative;
            animation: checkmark 0.8s cubic-bezier(0.65, 0, 0.45, 1) forwards;
        }

        .success-icon::after {
            content: '';
            width: 30px;
            height: 60px;
            border-right: 6px solid white;
            border-bottom: 6px solid white;
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -60%) rotate(45deg);
        }

        h2 {
            text-align: center;
            color: #2c3e50;
            font-size: 2.2em;
            margin-bottom: 30px;
            animation: fadeIn 1s ease-out 0.5s both;
        }

        .message-box {
            background: linear-gradient(45deg, #3498db, #2980b9);
            color: white;
            padding: 20px;
            border-radius: 10px;
            margin: 20px 0;
            text-align: center;
            animation: pulse 2s infinite;
        }

        .order-details {
            margin: 30px 0;
            padding: 20px;
            background: rgba(52, 152, 219, 0.1);
            border-radius: 10px;
            animation: fadeIn 1s ease-out 1s both;
        }

        .order-details p {
            font-size: 1.1em;
            color: #34495e;
            line-height: 1.6;
            margin: 10px 0;
        }

        .highlight {
            color: #2980b9;
            font-weight: bold;
        }

        .shipping-info {
            background: #f8f9fa;
            padding: 20px;
            border-radius: 10px;
            margin: 20px 0;
            border-left: 4px solid #3498db;
            animation: fadeIn 1s ease-out 1.5s both;
        }

        .btn-home {
            display: inline-block;
            width: 100%;
            padding: 15px;
            background: linear-gradient(45deg, #3498db, #2980b9);
            color: white;
            border: none;
            border-radius: 10px;
            font-size: 1.1em;
            font-weight: 600;
            cursor: pointer;
            text-align: center;
            text-decoration: none;
            text-transform: uppercase;
            letter-spacing: 1px;
            transition: all 0.3s ease;
            box-shadow: 0 4px 15px rgba(52, 152, 219, 0.3);
            animation: fadeIn 1s ease-out 2s both;
        }

        .btn-home:hover {
            transform: translateY(-3px);
            box-shadow: 0 6px 20px rgba(52, 152, 219, 0.4);
            background: linear-gradient(45deg, #2980b9, #3498db);
        }

        .tracking-number {
            font-family: monospace;
            font-size: 1.2em;
            color: #e74c3c;
            background: #fff3f3;
            padding: 5px 10px;
            border-radius: 5px;
            border: 1px dashed #e74c3c;
        }

        @media (max-width: 768px) {
            .container {
                width: 95%;
                padding: 20px;
            }

            h2 {
                font-size: 1.8em;
            }
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="success-icon"></div>
        
        <h2>Thank You for Your Order!</h2>
        
        <div class="message-box">
            Your payment has been successfully processed! 🎉
        </div>

        <div class="order-details">
            <p><span class="highlight">Order Status:</span> Confirmed</p>
            <p><span class="highlight">Order Number:</span> #ORD-${orderNumber}</p>
            <p><span class="highlight">Estimated Delivery:</span> Within 30-45 minutes</p>
        </div>

        <div class="shipping-info">
            <p>🚚 <strong>Delivery Update:</strong></p>
            <p>Our delivery partner will contact you shortly. You'll receive real-time updates about your order status.</p>
            <p>Keep your phone handy!</p>
        </div>

        <p style="text-align: center; color: #666; animation: fadeIn 1s ease-out 1.8s both;">
            A confirmation email has been sent to your registered email address.
        </p>

        <a href="home.jsp" class="btn-home">
            Return to Home Page
        </a>
    </div>
</body>
</html>