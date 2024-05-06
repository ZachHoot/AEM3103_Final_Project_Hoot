# Paper Airplane Numerical Study
Final Project: AEM 3103 Spring 2024

By: Zach Hoot

## Summary of Findings

## Code Listing

-[concatenate.m](https://github.com/ZachHoot/AEM3103_Final_Project/blob/master/concatenate.m): Funtion takes the 100 test cases (101x100 arrays) from Monte-Carlo variable variations and averages each time point and returns an array with just those 101 values

-[center_num_der.m](https://github.com/ZachHoot/AEM3103_Final_Project/blob/master/center_num_der.m): Function takes the height and range data calculated by concatenate.m and uses center difference method to calculate the derivative with respect to time of the range and height of the average resultant, while also using forward and backward distance method to calculate the first and last derivative values.

-[EqMotion.m](https://github.com/ZachHoot/AEM3103_Final_Project/blob/master/EqMotion.m): Supplies the differential equations of motion for the ode23 function to calculate the trajectory of the paper airplane.

## Figures and Descriptions


![Case A, Figure 1](https://github.com/ZachHoot/AEM3103_Final_Project/blob/master/Figures/CaseA_Min_Max.svg)
  - Min Max and Nominal Cases for the velocity (+2, +3.55, +7.5) and flight path angle (-0.5,-0.18,+0.4) shown independent of one another as specified for case A.
    
![Case A, Figure 2](https://github.com/ZachHoot/AEM3103_Final_Project/blob/master/Figures/CaseA_Monte_Carlo.svg)
  - 100 Cases of varrying simultaniously the velocity and flight path angle between the minimum and maximum values from the previous figure.
    
![Case A, Figure 3](https://github.com/ZachHoot/AEM3103_Final_Project/blob/master/Figures/CaseA_Concatenation_and_Polyfit.svg)
  - The 100 trials from the monte-carlo figure have been averaged to produce the solid line in the above graph and a fifth order polynomial has been fitted to the data (the dotted line). Max error was calculated to be ~0.2m.
    
![Case A, Figure 4](https://github.com/ZachHoot/AEM3103_Final_Project/blob/master/Figures/CaseA_Time_Derivatives.svg)
   - Time derivative using center distance method was performed on the height and range data to produce the above derivative graphs. Forward and backward distance methods were used only to calculate the slope of the first and last data points due to the methods decreased accuracy but increased versatility
     
![Case B, Figure 1](https://github.com/ZachHoot/AEM3103_Final_Project/blob/master/Figures/CaseB_Min_Max.svg)
  - Min Max and Nominal Cases for the Velocity (+2, +3.55, +7.5) and a constant flight path angle of 0 rad as specified for case B.
    
![Case B, Figure 2](https://github.com/ZachHoot/AEM3103_Final_Project/blob/master/Figures/CaseB_Monte_Carlo.svg)
  - 100 Cases of varrying simultaniously the velocity and flight path angle between the minimum and maximum values from the previous figure.
    
![Case B, Figure 3](https://github.com/ZachHoot/AEM3103_Final_Project/blob/master/Figures/CaseB_Concatenation_and_Polyfit.svg)
  - The 100 trials from the monte-carlo figure have been averaged to produce the solid line in the above graph and a fifth order polynomial has been fitted to the data (the dotted line). Max error was calculated to be ~0.26m.
    
![Case B, Figure 4](https://github.com/ZachHoot/AEM3103_Final_Project/blob/master/Figures/CaseB_Time_Derivatives.svg)
   - Time derivative using center distance method was performed on the height and range data to produce the above derivative graphs. Forward and backward distance methods were used only to calculate the slope of the first and last data points due to the methods decreased accuracy but increased versatility
     
![Case C, Figure 1](https://github.com/ZachHoot/AEM3103_Final_Project/blob/master/Figures/CaseC_Min_Max.svg)
  - Min Max and Nominal Cases for the 1.5*Velocity (+2, +3.55, +7.5) and flight path angle (-0.5, -0.18, +0.4). Case specified and increase of 50% of the velocity to study its effects on flight trajectory specified for case C.
    
![Case C, Figure 2](https://github.com/ZachHoot/AEM3103_Final_Project/blob/master/Figures/CaseC_Monte_Carlo.svg)
  - 100 Cases of varrying simultaniously the velocity and flight path angle between the minimum and maximum values from the previous figure.
    
![Case C, Figure 3](https://github.com/ZachHoot/AEM3103_Final_Project/blob/master/Figures/CaseC_Concatenation_and_Polyfit.svg)
  - The 100 trials from the monte-carlo figure have been averaged to produce the solid line in the above graph and a seventh order polynomial has been fitted to the data (the dotted line). Max error was calculated to be ~0.57m. It became harder to accuratly fit a polynomial to the data due to the loop performed by some of the test cases.
    
![Case C, Figure 4](https://github.com/ZachHoot/AEM3103_Final_Project/blob/master/Figures/CaseC_Time_Derivatives.svg)
   - Time derivative using center distance method was performed on the height and range data to produce the above derivative graphs. Forward and backward distance methods were used only to calculate the slope of the first and last data points due to the methods decreased accuracy but increased versatility
     
![Case D, Figure 1](https://github.com/ZachHoot/AEM3103_Final_Project/blob/master/Figures/CaseD_Min_Max.svg)
  - Min Max and Nominal Cases for the 3*Velocity (+2, +3.55, +7.5) and flight path angle (-0.5, -0.18, +0.4). Case specified and increase of 200% of the velocity to study its effects on flight trajectory specified for case D.
    
![Case D, Figure 2](https://github.com/ZachHoot/AEM3103_Final_Project/blob/master/Figures/CaseD_Monte_Carlo.svg)
  - 100 Cases of varrying simultaniously the velocity and flight path angle between the minimum and maximum values from the previous figure.
    
![Case D, Figure 3](https://github.com/ZachHoot/AEM3103_Final_Project/blob/master/Figures/CaseD_Concatenation_and_Polyfit.svg)
  - The 100 trials from the monte-carlo figure have been averaged to produce the solid line in the above graph and a tenth order polynomial has been fitted to the data (the dotted line). Max error was calculated to be ~1.06m. It became hard to accuratly fit a polynomial to the data due to the loop performed by most of the test cases.
    
![Case D, Figure 4](https://github.com/ZachHoot/AEM3103_Final_Project/blob/master/Figures/CaseD_Time_Derivatives.svg)
   - Time derivative using center distance method was performed on the height and range data to produce the above derivative graphs. Forward and backward distance methods were used only to calculate the slope of the first and last data points due to the methods decreased accuracy but increased versatility
