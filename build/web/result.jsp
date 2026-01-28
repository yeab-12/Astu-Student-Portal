<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Operation Result</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }
        
        body {
            background: linear-gradient(135deg, #f5f7fa 0%, #c3cfe2 100%);
            min-height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            padding: 20px;
        }
        
        .result-container {
            background: white;
            border-radius: 20px;
            box-shadow: 0 15px 35px rgba(50, 50, 93, 0.1), 0 5px 15px rgba(0, 0, 0, 0.07);
            width: 100%;
            max-width: 600px;
            padding: 50px 40px;
            text-align: center;
            position: relative;
            overflow: hidden;
            animation: fadeInUp 0.6s ease-out;
        }
        
        @keyframes fadeInUp {
            from {
                opacity: 0;
                transform: translateY(30px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }
        
        .result-container:before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 6px;
            background: linear-gradient(90deg, #4facfe 0%, #00f2fe 100%);
        }
        
        .icon-container {
            width: 80px;
            height: 80px;
            margin: 0 auto 25px;
            display: flex;
            align-items: center;
            justify-content: center;
            border-radius: 50%;
            background: linear-gradient(135deg, #4facfe 0%, #00f2fe 100%);
            color: white;
            font-size: 36px;
            box-shadow: 0 8px 20px rgba(79, 172, 254, 0.3);
        }
        
        h2 {
            color: #2c3e50;
            font-size: 32px;
            font-weight: 700;
            margin-bottom: 30px;
            position: relative;
            padding-bottom: 15px;
        }
        
        h2:after {
            content: '';
            position: absolute;
            bottom: 0;
            left: 50%;
            transform: translateX(-50%);
            width: 80px;
            height: 4px;
            background: linear-gradient(to right, #4facfe, #00f2fe);
            border-radius: 2px;
        }
        
        .message-box {
            background: #f8fafc;
            border-radius: 12px;
            padding: 25px 20px;
            margin-bottom: 35px;
            border-left: 5px solid #4facfe;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.03);
            animation: pulse 2s infinite;
        }
        
        @keyframes pulse {
            0% { box-shadow: 0 5px 15px rgba(79, 172, 254, 0.1); }
            50% { box-shadow: 0 5px 20px rgba(79, 172, 254, 0.2); }
            100% { box-shadow: 0 5px 15px rgba(79, 172, 254, 0.1); }
        }
        
        .message-text {
            color: #2c3e50;
            font-size: 20px;
            font-weight: 500;
            line-height: 1.5;
        }
        
        .action-buttons {
            display: flex;
            justify-content: center;
            gap: 20px;
            margin-top: 30px;
        }
        
        .btn {
            display: inline-block;
            padding: 15px 30px;
            border-radius: 10px;
            font-size: 16px;
            font-weight: 600;
            text-decoration: none;
            transition: all 0.3s ease;
            cursor: pointer;
            letter-spacing: 0.5px;
            position: relative;
            overflow: hidden;
        }
        
        .btn-primary {
            background: linear-gradient(to right, #4facfe 0%, #00f2fe 100%);
            color: white;
            box-shadow: 0 5px 15px rgba(79, 172, 254, 0.3);
        }
        
        .btn-primary:hover {
            transform: translateY(-3px);
            box-shadow: 0 8px 20px rgba(79, 172, 254, 0.4);
        }
        
        .btn-primary:active {
            transform: translateY(0);
        }
        
        .btn-secondary {
            background: #f8f9fa;
            color: #4a5568;
            border: 2px solid #e2e8f0;
        }
        
        .btn-secondary:hover {
            background: #edf2f7;
            transform: translateY(-3px);
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.05);
        }
        
        .btn:after {
            content: '';
            position: absolute;
            top: 50%;
            left: 50%;
            width: 5px;
            height: 5px;
            background: rgba(255, 255, 255, 0.5);
            opacity: 0;
            border-radius: 100%;
            transform: scale(1, 1) translate(-50%);
            transform-origin: 50% 50%;
        }
        
        .btn:focus:not(:active)::after {
            animation: ripple 1s ease-out;
        }
        
        @keyframes ripple {
            0% {
                transform: scale(0, 0);
                opacity: 0.5;
            }
            100% {
                transform: scale(30, 30);
                opacity: 0;
            }
        }
        
        .result-footer {
            margin-top: 40px;
            padding-top: 20px;
            border-top: 1px solid #edf2f7;
            color: #718096;
            font-size: 14px;
        }
        
        @media (max-width: 600px) {
            .result-container {
                padding: 40px 25px;
            }
            
            h2 {
                font-size: 26px;
            }
            
            .message-text {
                font-size: 18px;
            }
            
            .action-buttons {
                flex-direction: column;
            }
            
            .btn {
                width: 100%;
                text-align: center;
            }
        }
        
        /* Success/Error message coloring based on message type */
        <% 
            // We can detect if the message is success or error based on keywords
            // This is a simple approach - you might want to adjust based on your actual messages
            String msg = (String) request.getAttribute("msg");
            boolean isError = msg != null && 
                (msg.toLowerCase().contains("error") || 
                 msg.toLowerCase().contains("fail") || 
                 msg.toLowerCase().contains("invalid"));
            boolean isSuccess = msg != null && 
                (msg.toLowerCase().contains("success") || 
                 msg.toLowerCase().contains("added") || 
                 msg.toLowerCase().contains("updated") ||
                 msg.toLowerCase().contains("deleted"));
        %>
        
        <%
            if (isError) {
        %>
            .icon-container {
                background: linear-gradient(135deg, #ff6b6b 0%, #ff8e8e 100%);
                box-shadow: 0 8px 20px rgba(255, 107, 107, 0.3);
            }
            
            h2:after {
                background: linear-gradient(to right, #ff6b6b, #ff8e8e);
            }
            
            .message-box {
                border-left-color: #ff6b6b;
                animation: pulse-error 2s infinite;
            }
            
            @keyframes pulse-error {
                0% { box-shadow: 0 5px 15px rgba(255, 107, 107, 0.1); }
                50% { box-shadow: 0 5px 20px rgba(255, 107, 107, 0.2); }
                100% { box-shadow: 0 5px 15px rgba(255, 107, 107, 0.1); }
            }
            
            .btn-primary {
                background: linear-gradient(to right, #ff6b6b 0%, #ff8e8e 100%);
                box-shadow: 0 5px 15px rgba(255, 107, 107, 0.3);
            }
        <%
            } else if (isSuccess) {
        %>
            .icon-container {
                background: linear-gradient(135deg, #51cf66 0%, #69db7c 100%);
                box-shadow: 0 8px 20px rgba(81, 207, 102, 0.3);
            }
            
            h2:after {
                background: linear-gradient(to right, #51cf66, #69db7c);
            }
            
            .message-box {
                border-left-color: #51cf66;
                animation: pulse-success 2s infinite;
            }
            
            @keyframes pulse-success {
                0% { box-shadow: 0 5px 15px rgba(81, 207, 102, 0.1); }
                50% { box-shadow: 0 5px 20px rgba(81, 207, 102, 0.2); }
                100% { box-shadow: 0 5px 15px rgba(81, 207, 102, 0.1); }
            }
            
            .btn-primary {
                background: linear-gradient(to right, #51cf66 0%, #69db7c 100%);
                box-shadow: 0 5px 15px rgba(81, 207, 102, 0.3);
            }
        <%
            }
        %>
    </style>
</head>
<body>
    <div class="result-container">
        <div class="icon-container">
            <!-- Dynamic icon based on message type -->
            <% if (isError) { %>
                <span>⚠️</span>
            <% } else if (isSuccess) { %>
                <span>✓</span>
            <% } else { %>
                <span>ℹ️</span>
            <% } %>
        </div>
        
        <h2>Operation Result</h2>
        
        <div class="message-box">
            <p class="message-text"><%= request.getAttribute("msg") %></p>
        </div>
        
        <div class="action-buttons">
            <a href="student_manager.jsp" class="btn btn-primary">Back to Manager</a>
            <a href="register.html" class="btn btn-secondary">Go to Home</a>
        </div>
        
        <div class="result-footer">
            <p>System Status: <span id="status-indicator">●</span> Operational</p>
        </div>
    </div>
    
    <script>
        document.addEventListener('DOMContentLoaded', function() {
            // Add status indicator animation
            const statusIndicator = document.getElementById('status-indicator');
            
            // Check if message suggests error or success
            const message = "<%= request.getAttribute("msg") %>".toLowerCase();
            
            if (message.includes("error") || message.includes("fail") || message.includes("invalid")) {
                statusIndicator.style.color = "#ff6b6b";
                statusIndicator.style.animation = "blink 1.5s infinite";
            } else if (message.includes("success") || message.includes("added") || 
                       message.includes("updated") || message.includes("deleted")) {
                statusIndicator.style.color = "#51cf66";
            } else {
                statusIndicator.style.color = "#4facfe";
            }
            
            // Add CSS for blinking animation
            const style = document.createElement('style');
            style.textContent = `
                @keyframes blink {
                    0%, 100% { opacity: 1; }
                    50% { opacity: 0.5; }
                }
            `;
            document.head.appendChild(style);
            
            // Add auto-redirect timer for success messages
            if (message.includes("success") && !message.includes("error") && 
                !message.includes("fail") && !message.includes("invalid")) {
                
                let timeLeft = 8;
                const timerElement = document.createElement('div');
                timerElement.style.marginTop = '15px';
                timerElement.style.fontSize = '14px';
                timerElement.style.color = '#718096';
                timerElement.innerHTML = `You will be redirected back to the manager in <span id="countdown">${timeLeft}</span> seconds...`;
                
                document.querySelector('.action-buttons').parentNode.insertBefore(
                    timerElement, 
                    document.querySelector('.action-buttons').nextSibling
                );
                
                const countdownElement = document.getElementById('countdown');
                const countdownInterval = setInterval(() => {
                    timeLeft--;
                    countdownElement.textContent = timeLeft;
                    
                    if (timeLeft <= 0) {
                        clearInterval(countdownInterval);
                        window.location.href = 'student_manager.jsp';
                    }
                }, 1000);
            }
            
            // Add confetti effect for success messages
            if (message.includes("success") && !message.includes("error")) {
                setTimeout(() => {
                    createConfetti();
                }, 300);
            }
            
            function createConfetti() {
                const colors = ['#4facfe', '#00f2fe', '#51cf66', '#69db7c', '#ffd43b'];
                
                for (let i = 0; i < 50; i++) {
                    const confetti = document.createElement('div');
                    confetti.style.position = 'fixed';
                    confetti.style.width = '10px';
                    confetti.style.height = '10px';
                    confetti.style.background = colors[Math.floor(Math.random() * colors.length)];
                    confetti.style.borderRadius = '50%';
                    confetti.style.top = '0';
                    confetti.style.left = Math.random() * 100 + 'vw';
                    confetti.style.opacity = '0.8';
                    confetti.style.zIndex = '9999';
                    confetti.style.pointerEvents = 'none';
                    
                    document.body.appendChild(confetti);
                    
                    // Animate confetti
                    const animation = confetti.animate([
                        { transform: 'translateY(0) rotate(0deg)', opacity: 0.8 },
                        { transform: `translateY(${window.innerHeight}px) rotate(${Math.random() * 360}deg)`, opacity: 0 }
                    ], {
                        duration: 1000 + Math.random() * 2000,
                        easing: 'cubic-bezier(0.215, 0.610, 0.355, 1)'
                    });
                    
                    animation.onfinish = () => confetti.remove();
                }
            }
        });
    </script>
</body>
</html>