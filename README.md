# 🚗 Vehicule Management(Swift)

Develop an app for vehicle management that enables users to create, view, and delete Vehicles and dynamically display features specific to the selected vehicle.


![Swift](https://img.shields.io/badge/Language-Swift-orange)
![Xcode 16](https://img.shields.io/badge/IDE-Xcode%2016-blue)

---

## **📸 Screenshots & User Stories**

### **🚀 User Story 1: Vehicle Creation Flow**
Users can add a new vehicle by following a step-by-step selection process.

<div align="center">
    <img src="https://github.com/user-attachments/assets/e6fe6e2f-6b63-4bd5-a298-365f2b8cc029" alt="Vehicles List" width="450">
    <img src="https://github.com/user-attachments/assets/e45e2307-d4cf-4f0e-abd5-6306b3737641" alt="Vehicle Details" width="450">
    <img src="https://github.com/user-attachments/assets/519ed15a-ad16-48a6-b102-93651b8ba34d" alt="Vehicle Details" width="450">
</div>
---

### **📋 User Story 2: Vehicles Listing**
Users can view and manage their saved vehicles with simulating occasional decoding failures .

<img src="https://github.com/user-attachments/assets/cc3ce141-65ed-4b62-9856-0bbd77a9fdeb" alt="Vehicle Creation Flow" width="500">


---

### **📊 User Story 3: Dashboard**
The **dashboard** displays key vehicle details and quick actions.

<img src="https://github.com/user-attachments/assets/62c5329c-f1d9-46dd-825e-9bab23488156" alt="Dashboard" width="500">
---


## **🛠 Features**
✅ **Dashboard** – Displays selected vehicle information.  
✅ **Vehicle List** – View, select, and delete vehicles.  
✅ **Add New Car** – Step-by-step vehicle search and selection .  
✅ **Data Persistence** – Save user selections (UserDefault).  
✅ **Modern UI** – Built with SwiftUI.  
✅ **Tests** – SortVehicules, SaveVehicules and LoadVehicleData Tests.  

---

## 🏗 Architecture Overview

 Vehicule Management follows **Clean Architecture**, ensuring a clear separation of concerns. The project is divided into multiple layers:

- **Presentation Layer (UI & ViewModels)**
- **Domain Layer (Entities & Protocols)**
- **Data Layer (Repositories, Services, and Networking)**
- **Infrastructure (Configuration & Utilities)**
- **State Management (VehiculeStore)**

---

  ### 🖼 UML Component Diagram

Below is the **UML Component Diagram** for the project:

<img src="https://github.com/user-attachments/assets/7a72f3e7-6885-4973-b5c4-9f541a60fac7" alt="" width="800" height="1300">
