<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*,com.food.model.Restaurant" %> 
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>DishDelight - Restaurants</title>
    
    <!-- CSS Links -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
    
    <style>
        :root {
            --primary-color: #ff4757;
            --secondary-color: #2f3542;
            --accent-color: #ffa502;
            --text-light: #ffffff;
            --text-dark: #2f3542;
            --bg-light: #f1f2f6;
            --shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
            --transition: all 0.3s ease;
        }

        body {
            background-color: #f8f9fa;
            padding-top: 76px;
            font-family: 'Poppins', sans-serif;
        }

        /* Navbar Styling */
        .navbar {
            background-color: white !important;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
            padding: 15px 0;
        }

        .navbar-brand {
            font-size: 1.8rem;
            font-weight: 700;
            color: var(--primary-color) !important;
        }

        .nav-link {
            color: var(--text-dark) !important;
            font-weight: 500;
            padding: 0.7rem 1.2rem !important;
            transition: var(--transition);
            border-radius: 25px;
        }

        .nav-link:hover {
            color: var(--primary-color) !important;
            background-color: var(--bg-light);
        }

        .nav-link.active {
            color: var(--primary-color) !important;
            background-color: var(--bg-light);
        }

        .profile-icon {
            width: 40px;
            height: 40px;
            border-radius: 50%;
            background-color: var(--bg-light);
            display: flex;
            align-items: center;
            justify-content: center;
            transition: var(--transition);
        }

        .profile-icon:hover {
            background-color: var(--primary-color);
            color: white;
        }
      
        :root {
            --primary-color: #ff4757;
            --secondary-color: #2f3542;
            --accent-color: #ffa502;
            --text-light: #ffffff;
            --text-dark: #2f3542;
            --bg-light: #f1f2f6;
            --shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
            --transition: all 0.3s ease;
        }

        /* Existing styles remain the same */
        /* ... (keep your existing styles) ... */

        /* New styles for search and filter section */
        .search-section {
            background-color: white;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.05);
            padding: 2rem 0;
            margin-bottom: 2rem;
        }

        .search-container {
            max-width: 800px;
            margin: 0 auto;
        }

        .search-form .input-group {
            border-radius: 50px;
            overflow: hidden;
            box-shadow: 0 2px 15px rgba(0, 0, 0, 0.08);
        }

        .search-input {
            border: none;
            padding: 15px 25px;
            font-size: 1.1rem;
            border-radius: 50px 0 0 50px !important;
        }

        .search-input:focus {
            box-shadow: none;
            border: none;
        }

        .search-button {
            background-color: var(--primary-color);
            color: white;
            border: none;
            padding: 0 30px;
            border-radius: 0 50px 50px 0 !important;
            transition: var(--transition);
        }

        .search-button:hover {
            background-color: #e6394a;
        }

        .cuisine-filters {
            display: flex;
            gap: 1rem;
            overflow-x: auto;
            padding: 1rem 0;
            -ms-overflow-style: none;
            scrollbar-width: none;
        }

        .cuisine-filters::-webkit-scrollbar {
            display: none;
        }

        .cuisine-filter-btn {
            background-color: var(--bg-light);
            color: var(--text-dark);
            border: none;
            padding: 8px 20px;
            border-radius: 25px;
            font-size: 0.9rem;
            font-weight: 500;
            white-space: nowrap;
            transition: var(--transition);
        }

        .cuisine-filter-btn:hover,
        .cuisine-filter-btn.active {
            background-color: var(--primary-color);
            color: white;
            transform: translateY(-2px);
        }

        .cuisine-filter-btn i {
            margin-right: 5px;
        }

        @media (max-width: 768px) {
            .search-section {
                padding: 1rem 0;
            }

            .search-input {
                padding: 12px 20px;
                font-size: 1rem;
            }

            .cuisine-filters {
                padding: 0.5rem 0;
            }

            .cuisine-filter-btn {
                padding: 6px 15px;
                font-size: 0.8rem;
            }
        }
  

        /* Restaurant Section Styling */
        .restaurants-section {
            padding: 3rem 0;
            background-color: #f8f9fa;
        }

        .section-title {
            text-align: center;
            margin-bottom: 3rem;
            color: var(--text-dark);
            font-size: 2.5rem;
            font-weight: 700;
            position: relative;
            padding-bottom: 1.5rem;
        }

        .section-title::after {
            content: '';
            position: absolute;
            bottom: 0;
            left: 50%;
            transform: translateX(-50%);
            width: 100px;
            height: 4px;
            background: var(--primary-color);
            border-radius: 2px;
        }

        .restaurant-grid {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(320px, 1fr));
            gap: 2.5rem;
            padding: 1rem;
            max-width: 1400px;
            margin: 0 auto;
        }

        .restaurant-card {
            display: flex;
            flex-direction: column;
            border: none;
            border-radius: 20px;
            overflow: hidden;
            transition: var(--transition);
            background: var(--text-light);
            box-shadow: var(--shadow);
            height: 100%;
            animation: fadeIn 0.5s ease-out;
        }

        .restaurant-card:hover {
            transform: translateY(-10px);
            box-shadow: 0 15px 30px rgba(0, 0, 0, 0.15);
        }

        .card-image-link {
            position: relative;
            width: 100%;
            padding-top: 60%; /* 5:3 Aspect Ratio */
            overflow: hidden;
        }

        .restaurant-image {
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            object-fit: cover;
            transition: transform 0.5s ease;
        }

        .restaurant-card:hover .restaurant-image {
            transform: scale(1.1);
        }

        .card-body {
            padding: 1.8rem;
            flex-grow: 1;
            display: flex;
            flex-direction: column;
        }

        .card-title {
            font-size: 1.4rem;
            font-weight: 600;
            color: var(--text-dark);
            margin-bottom: 0.5rem;
        }

        .badge-rating {
            background: linear-gradient(45deg, #2ecc71, #27ae60);
            color: white;
            padding: 0.5rem 1rem;
            border-radius: 25px;
            font-weight: 600;
            font-size: 0.9rem;
            display: inline-flex;
            align-items: center;
            gap: 5px;
            box-shadow: 0 2px 10px rgba(46, 204, 113, 0.2);
        }

        .cuisine-type-highlight {
            background-color: var(--bg-light);
            padding: 0.6rem 1.2rem;
            border-radius: 25px;
            font-size: 0.9rem;
            color: var(--text-dark);
            display: inline-flex;
            align-items: center;
            gap: 5px;
            transition: var(--transition);
        }

        .delivery-time {
            color: var(--text-dark);
            font-weight: 500;
            font-size: 0.9rem;
        }

        .status-badge {
            padding: 0.5rem 1rem;
            border-radius: 25px;
            font-size: 0.9rem;
            font-weight: 500;
            display: inline-flex;
            align-items: center;
            gap: 5px;
        }

        .status-open {
            background-color: #e3f9e5;
            color: #2ecc71;
        }

        .status-closed {
            background-color: #ffe5e5;
            color: #ff4757;
        }

        /* Animations */
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

        /* Responsive Design */
        @media (max-width: 1200px) {
            .restaurant-grid {
                grid-template-columns: repeat(auto-fill, minmax(300px, 1fr));
            }
        }

        @media (max-width: 768px) {
            .section-title {
                font-size: 2rem;
            }
            
            .restaurant-grid {
                grid-template-columns: repeat(auto-fill, minmax(280px, 1fr));
                gap: 1.5rem;
            }

            .card-body {
                padding: 1.5rem;
            }
        }
    </style>
</head>
<body>
    <!-- Navigation Bar -->
    <nav class="navbar navbar-expand-lg navbar-light fixed-top">
        <div class="container">
            <!-- Logo -->
            <a class="navbar-brand d-flex align-items-center" href="#">
                <i class="fas fa-utensils me-2"></i>
                <span>DishDelight</span>
            </a>

            <!-- Mobile Toggle Button -->
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
                <span class="navbar-toggler-icon"></span>
            </button>

            <!-- Navigation Items -->
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav ms-auto align-items-center">
                    <li class="nav-item">
                        <a class="nav-link active" href="#">
                            <i class="fas fa-home me-1"></i> Home
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">
                            <i class="fas fa-info-circle me-1"></i> About
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">
                            <i class="fas fa-question-circle me-1"></i> Help
                        </a>
                    </li>
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle profile-icon" href="#" role="button" data-bs-toggle="dropdown">
                            <i class="fas fa-user-circle fa-lg"></i>
                        </a>
                        <ul class="dropdown-menu dropdown-menu-end">
                            <li><a class="dropdown-item" href="#"><i class="fas fa-user me-2"></i>Profile</a></li>
                            <li><a class="dropdown-item" href="#"><i class="fas fa-cog me-2"></i>Settings</a></li>
                            <li><hr class="dropdown-divider"></li>
                            <li><a class="dropdown-item text-danger" href="login.jsp"><i class="fas fa-sign-out-alt me-2"></i>Logout</a></li>
                        </ul>
                    </li>
                </ul>
            </div>
        </div>
    </nav>
<section class="search-section">
        <div class="container">
            <!-- Search Bar -->
            <div class="search-container mb-4">
                <form class="search-form">
                    <div class="input-group">
                        <input type="text" 
                               class="form-control search-input" 
                               placeholder="Search for restaurants, cuisines, or dishes..."
                               aria-label="Search">
                        <button class="btn search-button" type="submit">
                            <i class="fas fa-search"></i>
                        </button>
                    </div>
                </form>
            </div>

            <!-- Cuisine Type Filters -->
            <div class="cuisine-filters">
                <button class="cuisine-filter-btn active">
                    <i class="fas fa-utensils"></i> All
                </button>
                <button class="cuisine-filter-btn">
                    <i class="fas fa-pizza-slice"></i> Italian
                </button>
                <button class="cuisine-filter-btn">
                    <i class="fas fa-hamburger"></i> American
                </button>
                <button class="cuisine-filter-btn">
                    <i class="fas fa-pepper-hot"></i> Mexican
                </button>
                <button class="cuisine-filter-btn">
                    <i class="fas fa-fish"></i> Japanese
                </button>
                <button class="cuisine-filter-btn">
                    <i class="fas fa-drumstick-bite"></i> Indian
                </button>
                <button class="cuisine-filter-btn">
                    <i class="fas fa-bowl-rice"></i> Chinese
                </button>
                <button class="cuisine-filter-btn">
                    <i class="fas fa-cheese"></i> French
                </button>
                <button class="cuisine-filter-btn">
                    <i class="fas fa-seedling"></i> Vegetarian
                </button>
            </div>
        </div>
    </section>

    <!-- Restaurants Section -->
    <section class="restaurants-section">
        <div class="container">
            <h2 class="section-title">
                <i class="fas fa-utensils me-2"></i>
                Popular Restaurants
            </h2>
            
            <div class="restaurant-grid">
                <% 
                List<Restaurant> rList = (List<Restaurant>)session.getAttribute("restaurantList");
                if(rList != null && !rList.isEmpty()) {
                    for(Restaurant p : rList) { 
                %>
                <div class="restaurant-card">
                    <a href="menu?restaurantId=<%= p.getRestaurantId() %>" class="card-image-link">
                        <img src="<%= p.getImagePath() %>" 
                             class="restaurant-image" 
                             alt="<%= p.getName() %>"
                             onerror="this.src='https://via.placeholder.com/300x200?text=Restaurant+Image'">
                    </a>
                    <div class="card-body">
                        <div class="d-flex justify-content-between align-items-start mb-3">
                            <h5 class="card-title mb-0"><%= p.getName() %></h5>
                            <span class="badge-rating">
                                <i class="fas fa-star"></i> <%= p.getRatings() %>
                            </span>
                        </div>
                        
                        <div class="d-flex justify-content-between align-items-center mb-3">
                            <span class="cuisine-type-highlight">
                                <i class="fas fa-utensils me-1"></i><%= p.getCuisineType() %>
                            </span>
                            <span class="delivery-time">
                                <i class="fas fa-clock me-1"></i><%= p.getDeliveryTime() %> mins
                            </span>
                        </div>

                        <p class="card-text small text-muted mb-3">
                            <i class="fas fa-map-marker-alt me-2"></i><%= p.getAddress() %>
                        </p>
                        
                        <div class="d-flex justify-content-between align-items-center mt-auto">
                            <% if(p.getIsAvailable()) { %>
                                <span class="status-badge status-open">
                                    <i class="fas fa-circle me-1"></i>Open Now
                                </span>
                            <% } else { %>
                                <span class="status-badge status-closed">
                                    <i class="fas fa-circle me-1"></i>Closed
                                </span>
                            <% } %>
                        </div>
                    </div>
                </div>
                <% 
                    }
                } else { 
                %>
                <div class="col-12 text-center py-5">
                    <i class="fas fa-utensils fa-3x mb-3 text-muted"></i>
                    <h3>No Restaurants Available</h3>
                    <p class="text-muted">Please try again later or check back soon for new restaurants.</p>
                </div>
                <% } %>
            </div>
        </div>
    </section>

    <!-- Scripts -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        document.addEventListener('DOMContentLoaded', function() {
            const cards = document.querySelectorAll('.restaurant-card');
            cards.forEach((card, index) => {
                card.style.animationDelay = ${index * 0.1}s;
            });
        });
    </script>
</body>
</html>