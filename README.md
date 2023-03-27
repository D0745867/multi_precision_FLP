# multi_precision_FLP
Design of a Reconfigurable Multi-Precision Floating-Point Computation Unit for Dot Product of 4D Vectors
## 內容說明
使用Verilog實現 IEEE754標準之單精度與倍精度浮點數乘加器以及4D的內積運算，並且使用pipeline設計，提高電路的運算效率，並在最後使用Clock gating技巧來省去不必要的轉態，降低power以達到低功耗的設計