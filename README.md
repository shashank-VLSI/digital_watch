⌚ FPGA Digital Watch (Verilog)

    A modular digital watch system implemented in Verilog HDL.
    The project supports real-time clock functionality along with an interactive edit mode controlled through push buttons.


📌 Features

    ⏱ Real-time Seconds, Minutes, and Hours counter

    🛠 Edit mode to manually adjust time

    🔘 Button-controlled input with debouncing

    🔄 Mode-based display and editing selection

    🧩 Fully modular RTL design

    ⚡ Designed for 100 MHz FPGA clock


🧱 Project Architecture

    The design is divided into multiple independent modules for clarity and scalability.

    watch (Top Module)
    │
    ├── sec              → Seconds counter
    ├── minute           → Minutes counter
    ├── hr               → Hours counter
    ├── mode             → Display & edit selector
    └── button_control   → Button debounce & validation


📂 Module Description

    1️⃣ sec – Seconds Counter

        Counts seconds using clock division

        Supports manual increment in edit mode

        Range: 0 – 59


    2️⃣ minute – Minutes Counter

        Increments when seconds roll over

        Supports manual increment

        Range: 0 – 59


    3️⃣ hr – Hours Counter

        Increments when minutes roll over

        Supports manual increment

        Range: 0 – 23


    4️⃣ mode – Mode Controller

        Handles two main functions:

            Display Mode (mode = 0)

                Selects which time field is displayed.

            Edit Mode (mode = 1)

                Enables manual increment for selected field.


        Input (in)        Selected Field
        00                Seconds
        01                Minutes
        10                Hours


    5️⃣ button_control

        Debounces mechanical push button

        Generates valid input pulse

        Detects long button press


    6️⃣ watch – Top Module

        Connects all submodules and controls system data flow.


⚙️ Inputs and Outputs

    Inputs

        Signal      Description
        clk         100 MHz system clock
        rst         System reset
        mode        Edit / Display mode selector
        button      User input button
        in[1:0]     Field selection


    Output

        Signal      Description
        out[5:0]    Selected time value


🧠 System Behaviour

    Display Mode

        Displays selected time unit

        Clock runs normally


    Edit Mode

        Allows user to increment selected time unit

        Display still shows selected value


⏳ Timing Details

    Clock frequency assumed: 100 MHz

    Button press must be held for ~1 second to register valid input


🛠 Tools & Technologies

    Verilog HDL

    FPGA-based implementation

    RTL Design Methodology


🚀 How To Use

    Load design onto FPGA board

    Use mode switch to toggle between:

        Display Mode

        Edit Mode


    Use selection input in[1:0] to choose:

        Seconds

        Minutes

        Hours


    Press button to increment selected field


📈 Future Improvements

    7-segment display driver

    Blinking edit indicator

    AM/PM support

    Multi-button user interface

    Alarm functionality

    Clock parameterization


📚 Learning Objectives

    This project demonstrates:

        Sequential and combinational logic design

        Clock domain synchronization

        Button debouncing techniques

        Modular RTL architecture

        Counter rollover handling

        Hardware UI design concepts


👨‍💻 Author

    Developed as part of learning and experimenting with FPGA-based digital design using Verilog.
