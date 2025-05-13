# 📦 Customer Orders Dashboard – Flutter App

A clean and modern Flutter app that displays customer order insights in a beautiful, card-based dashboard UI. This app is ideal for understanding purchasing behavior, top-selling products, and high-value orders.

---

## 🖼️ Screenshots
<img src="https://github.com/user-attachments/assets/11740b57-3735-4e17-b6ed-c8e6d5e0fb8d" alt="App Screenshot" width="200" height="400"/> &#160;
<img src="https://github.com/user-attachments/assets/9c16e442-dd38-42d2-90ee-61611d0d4821" alt="App Screenshot" width="200" height="400"/> &#160;
<img src="https://github.com/user-attachments/assets/9adf0396-41c5-4537-bc72-791fc8eab246" alt="App Screenshot" width="200" height="400"/> &#160;<br><br>
<img src="https://github.com/user-attachments/assets/1b560d4d-176c-44dd-8c2d-479120ef6098" alt="App Screenshot" width="200" height="400"/> &#160;
<img src="https://github.com/user-attachments/assets/19d21f00-121e-4c54-87e1-b489081d87aa" alt="App Screenshot" width="200" height="400"/> &#160;



## 🚀 Features

- 📋 View all customer orders with expandable cards
- 📊 Insights panel with:
  - Total per customer
  - Top-selling product
  - Unique products
  - High-value orders (₹2000+)
- 📈 Modern UI inspired by banking and finance apps
- 🧩 Modular code with reusable components
- 💡 Bottom sheets for customer and product breakdown

---



## 🧰 Project Technologies
| Technology          | Description                                                                                                                                               |
| ------------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------- |
| **Flutter**         | The main UI toolkit for building natively compiled applications for mobile, web, and desktop from a single codebase.                                      |
| **Dart**            | Programming language used to write the Flutter application.                                                                                               |
| **GetX (optional)** | For state management and navigation (if used).                                                                                                            |
| **Material Design** | Used Flutter’s built-in Material Components for a consistent and user-friendly interface.                                                                 |
| **Custom Widgets**  | Modular and reusable widgets like `OrderCard`, `InsightsPanel`, and bottom sheet components.                                                              |
| **Local Data**      | Simulated order data stored in `orders_sample.dart` to mock real-world customer transactions.                                                             |
| **Responsive UI**   | Designed to adapt layouts and scroll behavior for different screen sizes using flexible widgets like `ListView`, `SingleChildScrollView`, and `Expanded`. |
| **Bottom Sheets**   | Used for showing detailed data insights interactively without navigating away from the screen.                                                            |


  ---

 
## 📁 Folder Structure

-lib/<br>
├─ widgets/<br>
│ &#160;└── insights_panel.dart<br>
│ &#160;└── order_card.dart<br>
├─ screens/<br>
│ &#160;└── orders_dashboard.dart<br>
├─ data/<br>
│ &#160;└── orders_sample.dart<br>
├─ main.dart<br>

