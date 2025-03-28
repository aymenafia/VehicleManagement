# 🚗 Vehicule Management(Swift)

Develop an app for vehicle management that enables users to create, view, and delete Vehicles and dynamically display features specific to the selected vehicle.


![Swift](https://img.shields.io/badge/Language-Swift-orange)
![Xcode 16](https://img.shields.io/badge/IDE-Xcode%2016-blue)

---

## **📸 Screenshots & User Stories**

### **🚀 User Story 1: Vehicle Creation Flow**
Users can add a new vehicle by following a step-by-step selection process with simulating occasional decoding failures.

<div align="center">
    <img src="https://github.com/user-attachments/assets/e6fe6e2f-6b63-4bd5-a298-365f2b8cc029" alt="Vehicles List" width="250" height="550">
    <img src="https://github.com/user-attachments/assets/e45e2307-d4cf-4f0e-abd5-6306b3737641" alt="Vehicle Details" width="250" height="550">
    <img src="https://github.com/user-attachments/assets/519ed15a-ad16-48a6-b102-93651b8ba34d" alt="Vehicle Details"width="250" height="550">
</div>
---

### **📋 User Story 2: Vehicles Listing**
Users can view and manage their saved vehicles and select one.

<div align="center">
<img src="https://github.com/user-attachments/assets/1a36f52d-0894-4673-95b5-48f9e92dca86" alt="Vehicle Creation Flow" width="250" height="550">
<img src="https://github.com/user-attachments/assets/77ee21fc-df53-476e-92d6-82b925eef8a4" alt="Vehicle Creation Flow" width="250" height="550">
</div>

---

### **📊 User Story 3: Dashboard**
The **dashboard** displays key vehicle details.

<img src="https://github.com/user-attachments/assets/62c5329c-f1d9-46dd-825e-9bab23488156" alt="Dashboard" width="250" height="550">
---


## **🛠 Features**
✅ **Dashboard** – Displays selected vehicle information.  
✅ **Vehicle List** – View, select, and delete vehicles.  
✅ **Add New Car** – Step-by-step vehicle search and save .  
✅ **Data Persistence** – Save user selections (UserDefault).  
✅ **Modern UI** – Built with SwiftUI.  
✅ **Tests** – SortVehicules, SaveVehicules and LoadVehicleData Tests.  

---


## 🌐 Localization

The application is fully localized in:

- 🇺🇸 English
- 🇩🇪 German
  
---

## 🖥 Supported Platforms

The application is fully localized in:

- iOS 17.0+
- Compatible with iPhone (Portrait mode only)
  
---
## 🏗 Architecture Overview

 Vehicule Management is divided into multiple layers:

- **Presentation Layer (UI & ViewModels)**
- **Domain Layer (Entities)**
- **Data Layer (Repositories, Services, and Networking)**
- **Infrastructure (Configuration & Utilities)**
- **State Management (VehiculeStore)**

---

  ### 🖼 UML Component Diagram

Below is the **UML Component Diagram** for the project:

<img src="https://github.com/user-attachments/assets/7a72f3e7-6885-4973-b5c4-9f541a60fac7" alt="" width="800" height="1300">
