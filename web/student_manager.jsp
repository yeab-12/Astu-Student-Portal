<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>ASTU Student Management</title>
    <style>
        :root {
            --primary: #667eea;
            --primary-dark: #5a67d8;
            --secondary: #4a5568;
            --success: #48bb78;
            --danger: #f56565;
            --warning: #ed8936;
            --light: #f7fafc;
            --dark: #2d3748;
            --gray: #a0aec0;
            --accent: #9f7aea;
            --gradient: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            --gradient-success: linear-gradient(135deg, #48bb78 0%, #38a169 100%);
            --gradient-danger: linear-gradient(135deg, #f56565 0%, #e53e3e 100%);
            --shadow: 0 15px 35px rgba(50, 50, 93, 0.1), 0 5px 15px rgba(0, 0, 0, 0.07);
            --radius: 16px;
            --glass-bg: rgba(255, 255, 255, 0.9);
            --glass-border: rgba(255, 255, 255, 0.2);
        }

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Inter', -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, sans-serif;
        }

        body {
            background: linear-gradient(135deg, #f6d5f7 0%, #fbe9d7 100%);
            min-height: 100vh;
            padding: 30px 20px;
            color: var(--dark);
            position: relative;
            overflow-x: hidden;
        }

        body::before {
            content: '';
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-image: 
                radial-gradient(circle at 20% 80%, rgba(102, 126, 234, 0.1) 0%, transparent 50%),
                radial-gradient(circle at 80% 20%, rgba(159, 122, 234, 0.1) 0%, transparent 50%);
            z-index: -1;
        }

        .container {
            max-width: 1200px;
            margin: 0 auto;
            position: relative;
        }

        .header {
            text-align: center;
            margin-bottom: 50px;
            padding: 30px;
            background: var(--glass-bg);
            backdrop-filter: blur(10px);
            border-radius: var(--radius);
            border: 1px solid var(--glass-border);
            box-shadow: var(--shadow);
            position: relative;
            overflow: hidden;
        }

        .header::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 5px;
            background: var(--gradient);
        }

        .university-badge {
            display: inline-block;
            background: var(--gradient);
            color: white;
            padding: 10px 25px;
            border-radius: 30px;
            font-weight: 600;
            font-size: 14px;
            letter-spacing: 1px;
            margin-bottom: 20px;
            box-shadow: 0 5px 15px rgba(102, 126, 234, 0.3);
            position: relative;
            overflow: hidden;
        }

        .university-badge::after {
            content: '';
            position: absolute;
            top: -50%;
            left: -60%;
            width: 40%;
            height: 200%;
            background: rgba(255, 255, 255, 0.3);
            transform: rotate(30deg);
            transition: all 0.3s;
        }

        .university-badge:hover::after {
            left: 120%;
        }

        h2 {
            font-size: 44px;
            font-weight: 800;
            color: transparent;
            background: var(--gradient);
            -webkit-background-clip: text;
            background-clip: text;
            margin-bottom: 15px;
            position: relative;
            display: inline-block;
            text-shadow: 0 2px 10px rgba(102, 126, 234, 0.2);
        }

        .subtitle {
            color: var(--secondary);
            font-size: 18px;
            margin-top: 15px;
            max-width: 600px;
            margin-left: auto;
            margin-right: auto;
            line-height: 1.6;
            opacity: 0.8;
        }

        .stats-bar {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
            gap: 20px;
            margin: 40px 0;
        }

        .stat-item {
            background: var(--glass-bg);
            backdrop-filter: blur(10px);
            border-radius: 12px;
            padding: 25px;
            text-align: center;
            border: 1px solid var(--glass-border);
            transition: all 0.3s ease;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.05);
        }

        .stat-item:hover {
            transform: translateY(-5px);
            box-shadow: 0 10px 25px rgba(0, 0, 0, 0.1);
        }

        .stat-number {
            font-size: 40px;
            font-weight: 800;
            color: var(--primary);
            margin-bottom: 10px;
            background: var(--gradient);
            -webkit-background-clip: text;
            background-clip: text;
            color: transparent;
        }

        .stat-label {
            font-size: 14px;
            color: var(--secondary);
            text-transform: uppercase;
            letter-spacing: 1px;
            font-weight: 600;
            opacity: 0.7;
        }

        .dashboard-cards {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(350px, 1fr));
            gap: 30px;
            margin-top: 30px;
        }

        .card {
            background: var(--glass-bg);
            backdrop-filter: blur(10px);
            border-radius: var(--radius);
            padding: 35px 30px;
            position: relative;
            overflow: hidden;
            border: 1px solid var(--glass-border);
            transition: all 0.4s cubic-bezier(0.4, 0, 0.2, 1);
            box-shadow: var(--shadow);
        }

        .card::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 5px;
            background: var(--gradient);
            transition: height 0.3s ease;
        }

        .card:hover {
            transform: translateY(-10px) scale(1.02);
            box-shadow: 0 25px 50px rgba(50, 50, 93, 0.15), 0 15px 35px rgba(0, 0, 0, 0.1);
        }

        .card:hover::before {
            height: 8px;
        }

        .card.delete-card::before {
            background: var(--gradient-danger);
        }

        .card-icon {
            width: 70px;
            height: 70px;
            background: var(--gradient);
            border-radius: 20px;
            display: flex;
            align-items: center;
            justify-content: center;
            margin-bottom: 25px;
            color: white;
            font-size: 30px;
            box-shadow: 0 10px 20px rgba(102, 126, 234, 0.3);
            transition: all 0.3s ease;
        }

        .card:hover .card-icon {
            transform: rotate(10deg) scale(1.1);
        }

        .delete-card .card-icon {
            background: var(--gradient-danger);
            box-shadow: 0 10px 20px rgba(245, 101, 101, 0.3);
        }

        .card h3 {
            font-size: 26px;
            font-weight: 700;
            color: var(--dark);
            margin-bottom: 25px;
            padding-bottom: 15px;
            border-bottom: 2px solid rgba(160, 174, 192, 0.2);
        }

        .form-group {
            margin-bottom: 25px;
            position: relative;
        }

        .form-group label {
            display: block;
            margin-bottom: 12px;
            font-weight: 600;
            color: var(--secondary);
            font-size: 15px;
            padding-left: 5px;
            transition: all 0.3s;
        }

        .input-with-icon {
            position: relative;
        }

        .input-icon {
            position: absolute;
            left: 20px;
            top: 50%;
            transform: translateY(-50%);
            color: var(--primary);
            font-size: 20px;
            z-index: 2;
        }

        input[type="number"],
        input[type="text"] {
            width: 100%;
            padding: 18px 18px 18px 60px;
            border: 2px solid #e2e8f0;
            border-radius: 12px;
            font-size: 16px;
            transition: all 0.3s;
            background-color: rgba(247, 250, 252, 0.8);
            color: var(--dark);
            font-weight: 500;
            position: relative;
            z-index: 1;
        }

        input[type="number"]:focus,
        input[type="text"]:focus {
            outline: none;
            border-color: var(--primary);
            background-color: white;
            box-shadow: 0 0 0 4px rgba(102, 126, 234, 0.15);
            transform: translateY(-2px);
        }

        input[type="number"]::placeholder,
        input[type="text"]::placeholder {
            color: var(--gray);
            font-weight: 400;
        }

        button[type="submit"] {
            background: var(--gradient);
            color: white;
            border: none;
            padding: 20px 30px;
            border-radius: 12px;
            font-size: 17px;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.3s;
            width: 100%;
            letter-spacing: 0.5px;
            box-shadow: 0 5px 15px rgba(102, 126, 234, 0.3);
            position: relative;
            overflow: hidden;
            margin-top: 10px;
        }

        button[type="submit"]::before {
            content: '';
            position: absolute;
            top: 0;
            left: -100%;
            width: 100%;
            height: 100%;
            background: linear-gradient(90deg, transparent, rgba(255, 255, 255, 0.2), transparent);
            transition: left 0.5s;
        }

        button[type="submit"]:hover {
            transform: translateY(-3px);
            box-shadow: 0 8px 25px rgba(102, 126, 234, 0.4);
        }

        button[type="submit"]:hover::before {
            left: 100%;
        }

        button[type="submit"]:active {
            transform: translateY(0);
        }

        .delete-card button[type="submit"] {
            background: var(--gradient-danger);
            box-shadow: 0 5px 15px rgba(245, 101, 101, 0.3);
        }

        .delete-card button[type="submit"]:hover {
            box-shadow: 0 8px 25px rgba(245, 101, 101, 0.4);
        }

        .quick-actions {
            display: flex;
            justify-content: center;
            gap: 20px;
            margin-top: 50px;
            flex-wrap: wrap;
        }

        .action-btn {
            display: inline-flex;
            align-items: center;
            gap: 12px;
            padding: 18px 30px;
            border-radius: 12px;
            background: var(--glass-bg);
            color: var(--secondary);
            text-decoration: none;
            font-weight: 600;
            box-shadow: var(--shadow);
            transition: all 0.3s;
            border: 1px solid var(--glass-border);
            backdrop-filter: blur(10px);
            position: relative;
            overflow: hidden;
        }

        .action-btn::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: var(--gradient);
            opacity: 0;
            transition: opacity 0.3s;
            z-index: -1;
        }

        .action-btn:hover {
            transform: translateY(-5px);
            box-shadow: 0 15px 30px rgba(0, 0, 0, 0.15);
            color: white;
        }

        .action-btn:hover::before {
            opacity: 1;
        }

        .action-btn.view {
            color: var(--success);
        }

        .action-btn.edit {
            color: var(--warning);
        }

        .action-btn span {
            font-size: 20px;
        }

        .footer {
            text-align: center;
            margin-top: 70px;
            padding-top: 30px;
            border-top: 1px solid rgba(160, 174, 192, 0.2);
            color: var(--secondary);
            font-size: 14px;
            opacity: 0.7;
        }

        .footer p {
            margin: 5px 0;
        }

        .notification {
            position: fixed;
            top: 30px;
            right: 30px;
            background: var(--glass-bg);
            backdrop-filter: blur(10px);
            padding: 20px 25px;
            border-radius: 12px;
            box-shadow: 0 15px 35px rgba(0, 0, 0, 0.15);
            max-width: 400px;
            transform: translateX(400px);
            transition: transform 0.5s cubic-bezier(0.68, -0.55, 0.265, 1.55);
            border-left: 5px solid var(--primary);
            z-index: 1000;
            display: flex;
            align-items: center;
            gap: 15px;
        }

        .notification.show {
            transform: translateX(0);
        }

        .notification::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: var(--gradient);
            opacity: 0.1;
            z-index: -1;
            border-radius: 12px;
        }

        .notification-icon {
            font-size: 24px;
        }

        @media (max-width: 768px) {
            .dashboard-cards {
                grid-template-columns: 1fr;
            }

            h2 {
                font-size: 36px;
            }

            .stats-bar {
                grid-template-columns: repeat(2, 1fr);
            }

            .header {
                padding: 20px;
            }

            .card {
                padding: 25px 20px;
            }

            .quick-actions {
                gap: 15px;
            }

            .action-btn {
                padding: 15px 20px;
            }
        }

        @media (max-width: 480px) {
            .stats-bar {
                grid-template-columns: 1fr;
            }

            h2 {
                font-size: 28px;
            }

            .stat-number {
                font-size: 32px;
            }

            body {
                padding: 20px 15px;
            }
        }

        /* Floating animation for cards */
        @keyframes float {
            0%, 100% { transform: translateY(0); }
            50% { transform: translateY(-10px); }
        }

        .card {
            animation: float 6s ease-in-out infinite;
        }

        .card:nth-child(2) {
            animation-delay: 2s;
        }

        /* Pulse animation for stats */
        @keyframes pulse {
            0% { box-shadow: 0 5px 15px rgba(0, 0, 0, 0.05); }
            50% { box-shadow: 0 5px 20px rgba(102, 126, 234, 0.15); }
            100% { box-shadow: 0 5px 15px rgba(0, 0, 0, 0.05); }
        }

        .stat-item {
            animation: pulse 3s ease-in-out infinite;
        }

        .stat-item:nth-child(2) { animation-delay: 1s; }
        .stat-item:nth-child(3) { animation-delay: 2s; }
        .stat-item:nth-child(4) { animation-delay: 3s; }

        /* Form submission animation */
        @keyframes submitting {
            0% { transform: scale(1); opacity: 1; }
            50% { transform: scale(1.05); opacity: 0.8; }
            100% { transform: scale(1); opacity: 1; }
        }

        .submitting {
            animation: submitting 1s ease-in-out infinite;
        }

        /* Glow effect for focused inputs */
        @keyframes glow {
            0%, 100% { box-shadow: 0 0 0 4px rgba(102, 126, 234, 0.15); }
            50% { box-shadow: 0 0 0 8px rgba(102, 126, 234, 0.1); }
        }

        input[type="number"]:focus,
        input[type="text"]:focus {
            animation: glow 2s ease-in-out infinite;
        }

        /* Bounce animation for hover */
        @keyframes bounce {
            0%, 100% { transform: translateY(0); }
            50% { transform: translateY(-5px); }
        }

        .action-btn:hover {
            animation: bounce 0.5s ease;
        }

        /* Wave animation for header */
        @keyframes wave {
            0% { transform: translateX(-100%) rotate(30deg); }
            100% { transform: translateX(200%) rotate(30deg); }
        }

        .university-badge::after {
            animation: wave 1.5s ease-in-out infinite;
        }   
    </style>
</head>
<body>
    <div class="container">
        <!-- Header Section -->
        <div class="header">
            <div class="university-badge">ASTU - Adama Science and Technology University</div>
            <h2>Student Management System</h2>
            <p class="subtitle">Manage student records efficiently with our comprehensive CRUD system. Add new students or remove existing ones with ease.</p>
            
            <!-- Stats Bar -->
            <div class="stats-bar">
                <div class="stat-item">
                    <div class="stat-number" id="totalStudents">0</div>
                    <div class="stat-label">Total Students</div>
                </div>
                <div class="stat-item">
                    <div class="stat-number" id="departments">12</div>
                    <div class="stat-label">Departments</div>
                </div>
                <div class="stat-item">
                    <div class="stat-number" id="activeUsers">1</div>
                    <div class="stat-label">Active User</div>
                </div>
                <div class="stat-item">
                    <div class="stat-number" id="todayOperations">0</div>
                    <div class="stat-label">Today's Operations</div>
                </div>
            </div>
        </div>
        
        <!-- Dashboard Cards -->
        <div class="dashboard-cards">
            <!-- CREATE FORM CARD -->
            <div class="card">
                <div class="card-icon">
                    <span>➕</span>
                </div>
                <h3>Add New Student</h3>
                <form action="studentservlet" method="POST" id="createForm">
                    <input type="hidden" name="action" value="create" class="hidden-input">
                    
                    <div class="form-group">
                        <label for="id">Student ID</label>
                        <div class="input-with-icon">
                            <div class="input-icon">#️⃣</div>
                            <input type="number" name="id" id="id" placeholder="Enter student ID" required min="1000">
                        </div>
                    </div>
                    
                    <div class="form-group">
                        <label for="name">Full Name</label>
                        <div class="input-with-icon">
                            <div class="input-icon">👤</div>
                            <input type="text" name="name" id="name" placeholder="Enter full name" required>
                        </div>
                    </div>
                    
                    <div class="form-group">
                        <label for="dept">Department</label>
                        <div class="input-with-icon">
                            <div class="input-icon">🏛️</div>
                            <input type="text" name="dept" id="dept" placeholder="Enter department" required>
                        </div>
                    </div>
                    
                    <button type="submit" id="createBtn">Add Student</button>
                </form>
            </div>
            
            <!-- DELETE FORM CARD -->
            <div class="card delete-card">
                <div class="card-icon">
                    <span>🗑️</span>
                </div>
                <h3>Delete Student</h3>
                <form action="studentservlet" method="POST" id="deleteForm">
                    <input type="hidden" name="action" value="delete" class="hidden-input">
                    
                    <div class="form-group">
                        <label for="deleteId">Student ID</label>
                        <div class="input-with-icon">
                            <div class="input-icon">#️⃣</div>
                            <input type="number" name="id" id="deleteId" placeholder="Enter student ID to delete" required min="1000">
                        </div>
                    </div>
                    
                    <div class="form-group">
                        <label for="confirmDelete">
                            <input type="checkbox" id="confirmDelete" required>
                            I confirm I want to delete this student record
                        </label>
                    </div>
                    
                    <button type="submit" id="deleteBtn">Delete Student</button>
                </form>
            </div>
        </div>
        
        <!-- Quick Actions -->
        <div class="quick-actions">
            <a href="#" class="action-btn view" onclick="showNotification('View functionality will be available soon!', 'info')">
                <span>👁️</span> View All Students
            </a>
            <a href="#" class="action-btn edit" onclick="showNotification('Edit functionality will be available soon!', 'warning')">
                <span>✏️</span> Edit Student
            </a>
            <a href="#" class="action-btn" onclick="showNotification('Report generation will be available soon!', 'info')">
                <span>📊</span> Generate Report
            </a>
            <a href="#" class="action-btn" onclick="showNotification('Search functionality will be available soon!', 'info')">
                <span>🔍</span> Search Student
            </a>
        </div>
        
        <!-- Footer -->
        <div class="footer">
            <p>ASTU Student Management System v2.0 • © 2023 Adama Science and Technology University</p>
            <p>For assistance, contact: support@astu.edu.et</p>
        </div>
        
        <!-- Notification -->
        <div class="notification" id="notification">
            <div id="notificationMessage"></div>
        </div>
    </div>
    
    <script>
        document.addEventListener('DOMContentLoaded', function() {
            // Initialize stats with random values
            document.getElementById('totalStudents').textContent = Math.floor(Math.random() * 500) + 100;
            document.getElementById('todayOperations').textContent = Math.floor(Math.random() * 10) + 1;
            
            // Form submission animations
            const createForm = document.getElementById('createForm');
            const deleteForm = document.getElementById('deleteForm');
            const createBtn = document.getElementById('createBtn');
            const deleteBtn = document.getElementById('deleteBtn');
            
            createForm.addEventListener('submit', function(e) {
                // Validate form before submission
                if (!this.checkValidity()) {
                    e.preventDefault();
                    showNotification('Please fill in all required fields correctly!', 'error');
                    return;
                }
                
                // Add submitting animation
                createBtn.classList.add('submitting');
                createBtn.innerHTML = 'Adding Student... <span class="spinner">⏳</span>';
                
                // Show success notification (in real app, this would be after server response)
                setTimeout(() => {
                    showNotification('Student added successfully!', 'success');
                }, 1000);
            });
            
            deleteForm.addEventListener('submit', function(e) {
                if (!this.checkValidity()) {
                    e.preventDefault();
                    showNotification('Please confirm deletion by checking the box!', 'error');
                    return;
                }
                
                // Add submitting animation
                deleteBtn.classList.add('submitting');
                deleteBtn.innerHTML = 'Deleting Student... <span class="spinner">⏳</span>';
                
                // Show warning notification
                showNotification('Warning: This action cannot be undone!', 'warning');
                
                // In a real app, you might want to confirm deletion
                const confirmed = confirm('Are you sure you want to delete this student record? This action cannot be undone.');
                if (!confirmed) {
                    e.preventDefault();
                    deleteBtn.classList.remove('submitting');
                    deleteBtn.innerHTML = 'Delete Student';
                    return;
                }
            });
            
            // Input validation and styling
            const inputs = document.querySelectorAll('input[type="number"], input[type="text"]');
            inputs.forEach(input => {
                input.addEventListener('input', function() {
                    if (this.checkValidity()) {
                        this.style.borderColor = '#27ae60';
                        this.style.backgroundColor = '#f9fff9';
                    } else {
                        this.style.borderColor = '#e74c3c';
                        this.style.backgroundColor = '#fff9f9';
                    }
                });
                
                input.addEventListener('focus', function() {
                    this.parentElement.style.transform = 'translateY(-2px)';
                });
                
                input.addEventListener('blur', function() {
                    this.parentElement.style.transform = 'translateY(0)';
                });
            });
            
            // Auto-suggest for department field
            const deptInput = document.getElementById('dept');
            const departments = [
                'Computer Science and Engineering', 'Architecutre', 'Mechanical Engineering',
                'Civil Engineering', 'Chemical Engineering', 'Software Engineering',
                'Applied Chemistry', 'Water and Resource Engineering', 'Electronics and Communication Engineering',
                'Applied Mathematics', 'Applied Physics', 'Applied Biology','Pharmacy'
            ];
            
            let deptDatalist = document.createElement('datalist');
            deptDatalist.id = 'deptSuggestions';
            departments.forEach(dept => {
                let option = document.createElement('option');
                option.value = dept;
                deptDatalist.appendChild(option);
            });
            document.body.appendChild(deptDatalist);
            deptInput.setAttribute('list', 'deptSuggestions');
            
            // Notification system
            window.showNotification = function(message, type = 'info') {
                const notification = document.getElementById('notification');
                const notificationMessage = document.getElementById('notificationMessage');
                
                notificationMessage.innerHTML = message;
                notification.classList.add('show');
                
                // Style based on type
                notification.style.borderLeftColor = 
                    type === 'success' ? '#27ae60' : 
                    type === 'error' ? '#e74c3c' : 
                    type === 'warning' ? '#f39c12' : '#3498db';
                
                // Auto-hide after 5 seconds
                setTimeout(() => {
                    notification.classList.remove('show');
                }, 5000);
            };
            
            // Simulate loading stats
            setTimeout(() => {
                document.getElementById('totalStudents').style.transform = 'scale(1.2)';
                setTimeout(() => {
                    document.getElementById('totalStudents').style.transform = 'scale(1)';
                }, 300);
            }, 1000);
            
            // Add keyboard shortcuts
            document.addEventListener('keydown', function(e) {
                // Ctrl + Enter to submit create form
                if (e.ctrlKey && e.key === 'Enter' && 
                    (document.activeElement === document.getElementById('name') || 
                     document.activeElement === document.getElementById('dept'))) {
                    createForm.requestSubmit();
                }
                
                // Escape to clear forms
                if (e.key === 'Escape') {
                    createForm.reset();
                    deleteForm.reset();
                }
            });
        });
    </script>
</body>
</html>