<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FoodApp Login</title>
<style>
    body {
        margin: 0;
        padding: 0;
        min-height: 100vh;
        background-image: url('https://images.unsplash.com/photo-1504674900247-0877df9cc836?q=80&w=1470&auto=format&fit=crop'); /* Example food image URL - replace with your image */
        background-size: cover;
        background-position: center;
        background-repeat: no-repeat;
        display: flex;
        justify-content: center;
        align-items: center;
        font-family: Arial, sans-serif;
    }

    .form-container {
        background: rgba(255, 255, 255, 0.8);
        backdrop-filter: blur(10px);
        -webkit-backdrop-filter: blur(10px); /* For Safari support */
        padding: 2rem;
        border-radius: 10px;
        box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
        width: 100%;
        max-width: 400px;
    }

    .form-container h1 {
        text-align: center;
        color: #333;
        margin-bottom: 1rem;
    }

    .form-container p {
        text-align: center;
        color: #666;
        margin-bottom: 1.5rem;
    }

    form {
        display: flex;
        flex-direction: column;
        gap: 1rem;
    }

    label {
        color: #333;
        font-weight: bold;
    }

    input {
        padding: 10px;
        border: 1px solid #ddd;
        border-radius: 5px;
        font-size: 1rem;
    }

    input:focus {
        outline: none;
        border-color: #4CAF50;
        box-shadow: 0 0 5px rgba(76, 175, 80, 0.3);
    }

    button {
        background-color: #4CAF50;
        color: white;
        padding: 12px;
        border: none;
        border-radius: 5px;
        cursor: pointer;
        font-size: 1rem;
        font-weight: bold;
        text-transform: uppercase;
        transition: background-color 0.3s, transform 0.2s;
    }

    button:hover {
        background-color: #45a049;
        transform: translateY(-1px);
    }

    button:active {
        transform: translateY(0);
    }

    a {
        color: #4CAF50;
        text-decoration: none;
        font-weight: bold;
    }

    a:hover {
        text-decoration: underline;
    }
</style>
</head>
<body>
    <div class="form-container">
        <h1>Welcome to FoodApp</h1>
        <p>Please sign in to continue</p>
        <form action="LoginServlet" method="post">
            <label for="email">Email</label>
            <input type="email" id="email" name="email" placeholder="Enter your email" required>
            
            <label for="password">Password</label>
            <input type="password" id="password" name="password" placeholder="Enter your password" required>
            
            <button type="submit" value="LoginServlet">Sign In</button>
        </form>
        <p>Don't have an account? <a href="Register.jsp">Register Here</a></p>
    </div>
</body>
</html>