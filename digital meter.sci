clc;
clear;
close;

// Time and sample signal
t = 0:0.1:20;
signal = 5 + 2*sin(t);   // sample varying signal

// Create window
f = scf(0);
f.figure_name = "Digital Meter with Graph";

// Arrays for plotting
x_data = [];
y_data = [];

for i = 1:length(signal)
    clf();

    // -------- Digital Meter --------
    xrect(1, 8, 3, 1.5);             // meter box
    value = msprintf("%.2f V", signal(i));
    xstring(1.5, 8.6, "DIGITAL METER");
    xstring(1.8, 8.2, value);

    // -------- Real-Time Graph --------
    x_data = [x_data t(i)];
    y_data = [y_data signal(i)];

    subplot(2,1,2);
    plot(x_data, y_data, 'r');
    xtitle("Real-Time Signal Graph", "Time (s)", "Voltage (V)");
    xgrid();

    sleep(200); // update delay
end
