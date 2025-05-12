# 1. Assembly Voting System

## 1.1 Overview
The **Assembly Voting System** is a console-based application developed using **8086 Assembly Language**, designed to simulate a basic electronic voting process.  
The system enables users to:
- Cast votes
- View voting results
- Determine the winner among predefined candidates

It operates in a DOS environment and uses low-level **interrupt handling** and **memory operations**, offering hands-on understanding of how hardware-level applications function.

---

## 1.2 Motivation
With increasing reliance on electronic systems in sectors like elections, understanding low-level programming is essential for computer engineers.  
This project offers:
- A deep dive into assembly-level logic
- Practice with processor instructions and memory management
- User interaction without high-level abstractions

---

## 1.3 Problem Definition

### 1.3.1 Problem Statement
Manual vote counting is error-prone and inefficient. Modern electronic systems are too abstract for educational use.  
There's a need for a **simple, assembly-language-based voting system** to show how such systems work at the lowest level.

### 1.3.2 Complex Engineering Problem
Challenges include:
- Handling user input via **low-level interrupts**
- Managing memory and data without structured types
- Implementing logic and comparisons with a **minimal instruction set**
- Ensuring **robustness** in a low-abstraction language

| Name of the Problem        | Attributes Touched                                                        | Explanation                                                                                                                               |
|----------------------------|---------------------------------------------------------------------------|-------------------------------------------------------------------------------------------------------------------------------------------|
| P1: Depth of knowledge     | Assembly language, CPU architecture, interrupts, memory management, I/O  | Requires understanding of low-level components, conditional logic, and debugging at the machine level.                                   |
| P2: Depth of analysis      | Low-level programming, interrupt handling, arithmetic operations         | Demands deep analysis of CPU behavior, memory usage, and user interaction, requiring precise debugging and system-level reasoning.       |
| P3: Interdependence        | Assembly programming, interrupt handling, memory management              | All modules are tightly coupled—failure in one (e.g., input or memory allocation) affects the entire system’s functionality.             |

---

## 1.4 Design Goals/Objectives

The main objective is to build a **fully functional voting system using 8086 Assembly**.  
The system should:
- Accept and process user votes
- Maintain and update vote counts
- Display voting results in real-time
- Determine the winner or display a tie

### 1.4.1 Functionalities
The system will support:
1. Interactive text-based user interface  
2. Voting for one of three predefined candidates  
3. Displaying total votes per candidate  
4. Determining and showing winner/tie  
5. Handling invalid inputs and clean program exit  

---

## 1.5 Application

### 🔑 Key Features
The Assembly Voting System is ideal for:
- Teaching **low-level programming** in a real-world context
- Demonstrating **interrupt-based I/O handling**
- Learning **logic flow and control** at the processor level
- Introducing **embedded system fundamentals**
- Building strong programming foundations
- Preparing for **firmware/system-level roles**

### ⚙️ Practicality, Relevance, and Industry Demand
Although modern voting machines use high-level tech and security layers, the **core concepts** of this project remain relevant:
- **Interrupts and memory handling**
- **Low-level logic and control**
- **Embedded systems and firmware**

#### Industry Insights:
1. **Computer Architecture Understanding** – See how the CPU executes instructions.  
2. **Embedded Systems** – ATMs, access systems, and voting machines rely on low-level code.  
3. **Security-Critical Apps** – Essential for malware analysis and exploit prevention.  
4. **Optimized Code Requirements** – Aerospace, medical, and automotive sectors prefer low-level optimization.  
5. **Hardware–Software Bridge** – Understand how user input becomes machine logic.  
6. **Academic Edge** – Boosts performance in OS, compiler, and embedded coursework.

---

## 1.5.2 Conclusion
The **Assembly Voting System** is a compact yet powerful project that:
- Demonstrates **real-world logic at the processor level**
- Enhances understanding of **interrupts, I/O**, and **UI design in Assembly**
- Prepares students for deeper studies in **embedded systems**, **OS design**, and **low-level programming**

## 1.5.3 Slide
![1](https://github.com/user-attachments/assets/a91c0114-87f9-4cc8-ad6b-7c16b064f5ff)

![2](https://github.com/user-attachments/assets/66acc374-dea9-4e17-9267-ce90e58ffa9f)

![3](https://github.com/user-attachments/assets/b69f5773-d247-4f02-a03f-a2bce25b6fd8)

![4](https://github.com/user-attachments/assets/9eda6ca0-84b4-4674-b0e0-8565f2036cbd)

![5](https://github.com/user-attachments/assets/27a9ace7-5bfb-4c75-80f3-28da18eea97b)

![6](https://github.com/user-attachments/assets/e4fda4dd-dd41-4936-81dc-0ebcc19b34b5)

![7](https://github.com/user-attachments/assets/14dc0bd4-3182-4f8d-9b38-cd02fea35eee)


