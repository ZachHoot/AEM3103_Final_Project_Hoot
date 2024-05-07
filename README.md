# Paper Airplane Numerical Study
Final Project: AEM 3103 Spring 2024

By: Zach Hoot

## Summary of Findings
  - Variations Studied: Case A was the general case were velocity and flight angle were varried within the given min/max range supplied by the test condition. Case B was a study of the variation resulting in a flight path angle of 0 radians and the velocity varrying within the same range as in Case A. Case C was to test changes resulting from taking the same conditions as case A and increasing the velocity 50%. Case D was similar to case C but instead of increasing the velocity 50%, it was increased 200% to better gauge the extreme case of what would occur should the velocity be significantly higher than the pre calculated ideal flight angle and velocity for maximum range.
  - Summary of findings:
    - Case A produced just about the expected results for ideal conditions. The nominal case was calculated to be the ideal conditions for range flight and as predicted by the math, it flew in a straight line descending at a constant speed and with a constant flight path angle. The minimum and maximum conditions caused changes in the glide profile of the airplane shown as undulations in the flight path compared to the straight line shown in the nominal case. The undualtions suggest that the plane was not in a static equilibrium state and would then be expected to have varrying velocity and flight path angle throughout the flight to attempt to gain static equilibrium which as shown in the time derivative graphs was not achieved in the 6 second trials. Lastly for case A, it is visable in the Monte-Carlo variation graph that the trials closest to the nominal case flew with the straigtest (ideal) flight path and the trials that fell closer to either extreme would either descend much faster with some oscilation and reach a similar range to the nominal case or would osilate upward drastically and not glide nearly as far.

    - Case B was the trial with a constant flight path angle of 0 radians. With this analysis it is much easier to ascertain the effects of velocity on the glide trajectory. As expected by doing the calculations for ideal conditions, having the velocity closer to the nominal state resulted in a much more stable flight compared to either extreme. The nominal velocity used in the case wasn't the ideal velocity for the flight path angle used but had instead been optimized for -0.18 radians as expressed in the above table and analysis of case A. This means that the nominal case still had some small oscilation in the flight path. Looking at the Monte-Carlo variation test it can be infered that the lower the velocity, the further the paper airplane would glide but it would also descend further. Data within the randV or randfa arrays is used to verify the analaysis of the data, in addition to comparing the visual data with the minimum, maximimum, and nominal case graphs. Looking at the time derivative graphs gives the most complete picture of the nature of the flight path of this case, with bigger oscilations near the beginning and trending towards equilibrium near the end of the 6 second trial. The equilibrium condition seemed to trend towards dH/dt ~ -0.8m/sec and dR/dt ~ 3.5m/sec.
  
    - Case C explored what would happen if the velocity should be increased. All trials were conducted the same as case A with the velocity being multiplied by 1.5x allowing for a greater range and overall higher average velocity to be analayzed. At some critical velocity and flight path angle the paper airplane while perform a loop during the glide which causes a significant reduction in the glide range observed. By comparing the single variable variation it can be seen that the nominal velocity condition is not fast enough to cause the loop. Observing the Monte-Carlo variation graph, only a small portion of the trials achieved the critical velocity and flight angle to perform the loop and a couple trials got very close, showing up as more and more pointy spikes on the graph. Ignoring the loop, the trials follow the same general rule about total range traveled compared to height at t=6seconds. The concatenation of the trials shows a near critical condition for the loop to form and this cases the polynomial fitted to the data to become significantly less accurate compared to cases A and B where max error was observer to be 60% smaller than whats seen in case C. Exact calculated erros are listed bellow each polyfit/concatenation graph. Lastly, the time derivative graphs show a far greater range of values compared to cases A and B but with the same trend towards equilibrium at a similar but slightly different equilibrium point.
  
    - Case D showed what could happen with a bigger increase in velocity compared to cases A and C. All trials were performed the same as Case A and C, except the velocity value was multiplied by 3x, once again allowing for a greater range and higher average/nominal velocity for this study. The minimum case looks almost identical to the nominal case from case C but the nominal case and maximum case for case D both show loops in the traversed flight path. This shows that the critical velocity for a flight angle of -0.18 radians must be between 5.325m/sec and 10.65m/sec. Additional analysis of Monte-Carlo trials could be done to narrow down the exact critical condition and fit a function to compare the flight path angle and the necessary velocity. The maximum velocity resulted in 2 loops performed but the maximum flight angle still only showed 1 loop but much more circular than the other loops shown in the 105 other trials calculated. The average of the Monte-Carlo variation showed the loop with significant oscilation immediatly afterwards and the shortest range of all of the trials. Fitting a polynomial to this graph proved to be significantly challenging since the resultant flight path is not a recognizable function failing the verticle line test. A best attempt was made to match the data with a tenth order polynomial but as expected, it has the greatest maximum error of all of the cases, almost 200% greater than the error in case C that was about 300% greater than the error seen in the polyfit of cases A and B. Finally, the time derivatives show the same oscilation seen in all of the previoous cases but case D is the only case where the range slope is negative. This is a direct result of the loop performed by the paper airplane within the first second of flight. This unique and possible troublesome case should be explored further by analyzing how flight angle effects the loop characteristics with a constant velocity.

  - Overall completeness of analaysis:
  The study does a pretty complete job of analayzing how velocity under many conditions effects the flight trajectory by having the velocity varried independently of initial flight path angle and studying different ranges of velocity varriation to better assertain any significant changes in behavior. The study does a much poorer job of analyzing how flight path angle effects the flight trajectory of the paper airplane. Flight path angle is largely kept as a constant during the trials, with the variations in cases A, C, and D being the only somewhat meaningful analysis of how flight path angle effects the glide. To what extent the behavior of the airplane changes with flight path angle is not known because of this study and any significant changes of behavior type is completely unknown. An example of such change in behavior would be the stall state of the paper airplane. Understanding stall of an airplane is a significant part of the analysis of a aircraft since it can have a drastic impact on the saftey or overall flyability of the aircraft. More Variations should've been conducted in regard to flight path angle, similar to cases B, C, and D for velocity
  
  

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
