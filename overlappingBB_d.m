% PURPOSE: demo of overlappingBB()
%          Time series bootstap: overlapping blocks
%---------------------------------------------------
% USAGE: overlappingBB_d
%---------------------------------------------------

clc; clear all; close all;

% Spanish Interbank Interest Rates: 1d, 1m, 3m, 6m, 1y

Z=[13.1960   13.0550   12.7300   12.5620   12.6730
   12.1280   12.1350   12.0120   11.9170   11.8790
   11.3960   11.2710   11.0550   10.9890   11.0300
   11.0130   10.9790   10.9020   10.9340   10.9530
   10.8120   10.9740   11.1070   11.2840   11.2790
   10.4740   10.4330   10.4430   10.4820   10.5880
   10.4550   10.6610   10.7860   10.8150   10.8660
   10.3920   10.5490   10.7470   10.9010   11.0390
   10.5790   10.8730   11.1750   11.3800   11.5990
   11.3100   11.8400   12.6290   12.7990   12.8420
   11.3620   11.8900   12.5700   12.9680   13.0240
   12.3990   12.8210   13.6480   13.8140   13.9070
   12.3460   13.2410   14.1350   14.5910   14.7880
   13.4700   14.0130   14.5630   14.9030   14.9960
   13.8920   14.4670   15.1270   15.4400   15.5220
   13.9090   14.3500   14.7800   14.9990   15.0720
   13.9740   14.3730   14.7650   14.9060   14.9830
   14.4220   14.7150   14.8960   14.9810   14.9650
   15.1070   15.4640   15.5300   15.4520   15.2500
   15.1030   15.3010   15.3070   15.1570   15.0570
   14.9850   15.0830   15.0640   14.8380   14.7660
   14.8280   14.9550   14.9590   14.7560   14.7170
   15.1830   15.3160   15.3310   15.2390   15.2120
   15.4870   15.8940   15.9790   15.9150   15.8960
   15.0650   15.4610   15.6040   15.6230   15.6430
   15.0590   15.2970   15.4980   15.6350   15.7030
   14.7850   15.1470   15.4340   15.6090   15.7860
   14.5800   14.7620   14.9920   15.1780   15.4460
   14.6640   14.8830   15.0460   15.2430   15.4610
   14.7420   14.8680   14.9960   15.1000   15.2600
   14.7100   14.8440   15.0100   15.0840   15.2000
   14.6370   14.7950   15.0180   15.1450   15.3170
   14.6550   14.8730   15.1570   15.3830   15.7140
   14.6120   14.7560   14.9670   15.0490   15.3190
   14.7030   14.7990   14.9780   15.0290   15.1970
   14.9130   14.9940   15.1190   15.1960   15.2680
   14.5910   14.9500   15.1480   15.2460   15.2920
   14.5630   14.6670   14.7030   14.6040   14.5850
   14.0830   13.9790   13.7870   13.6290   13.5900
   13.5800   13.6130   13.4630   13.2300   13.1360
   13.1730   13.1380   12.9360   12.6770   12.5190
   12.6630   12.6800   12.4940   12.2740   12.2330
   12.7200   12.7870   12.8210   12.6810   12.6460
   12.6450   12.7200   12.7170   12.6830   12.6560
   12.5920   12.5850   12.3940   12.2850   12.2740
   12.5790   12.6530   12.6180   12.4770   12.4360
   12.6100   12.6640   12.7200   12.7020   12.6820
   12.6430   12.7600   12.9200   12.9500   12.9250
   12.7170   12.8040   12.8780   12.8530   12.7610
   12.5950   12.7220   12.7490   12.6780   12.5720
   12.3660   12.5080   12.5740   12.5450   12.5280
   12.1240   12.4360   12.5460   12.5660   12.5670
   12.4220   12.4620   12.5020   12.4930   12.4850
   12.3790   12.4980   12.6240   12.7400   12.7940
   12.6590   12.8020   12.9500   13.1030   13.1370
   13.0100   13.2630   13.4830   13.7060   13.8920
   13.0300   14.0730   14.1180   14.1860   14.1730
   13.4060   13.9850   14.2340   14.1470   14.1730
   14.2740   14.3320   14.2900   14.0980   14.1190
   15.1040   15.4090   15.1560   14.7760   14.5070
   14.3610   14.5690   14.4050   14.0980   13.8430
   14.7680   14.6950   13.8290   13.4090   13.0510
   15.6660   15.6790   14.6450   13.8290   13.2450
   14.2460   14.4280   13.9680   13.4200   13.0280
   13.6170   13.6900   12.8470   12.2190   11.9630
   11.6360   11.5410   11.1020   10.7050   10.4090
   12.3850   11.9690   11.2710   10.7160   10.2210
   10.7420   10.8370   10.5530   10.2900    9.7840
   10.1900   10.1890    9.9790    9.7650    9.3340
   10.6880    9.7720    9.5800    9.3980    9.1020
    9.5890    9.5310    9.2150    8.9350    8.7420
    9.1370    9.2240    8.8630    8.5820    8.2380
    8.9990    9.0550    8.7660    8.4280    8.0900
    8.8000    8.7930    8.6220    8.4310    8.1390
    8.1660    8.1810    8.1440    8.0930    8.0410
    7.9530    7.9620    7.8760    7.8400    7.8790
    7.6280    7.6900    7.6800    7.7210    7.8350
    7.5170    7.6110    7.7100    7.8680    8.1980
    7.5620    7.6210    7.7500    8.0410    8.3450
    7.4570    7.6500    7.8100    8.0550    8.4820
    7.3580    7.5370    7.8400    8.2840    8.8750
    7.4190    7.4970    7.8200    8.2380    8.9700
    7.4060    7.5320    7.8600    8.2680    9.0190
    7.4730    7.8290    8.2200    8.7060    9.4450
    8.0160    8.4180    8.9400    9.5620   10.4220
    8.0500    8.2630    8.6000    9.1320    9.9420
    8.6520    9.2110    9.5600    9.9870   10.5060
    8.5660    8.8550    9.3500    9.7410   10.4090
    8.7070    9.0170    9.3800    9.7250   10.3000
    9.3990    9.4900    9.6300    9.8990   10.3630
    9.4380    9.5070    9.6500    9.8440   10.2720
    9.4660    9.5260    9.6000    9.7280    9.9820
    9.3350    9.3750    9.3800    9.4170    9.5720
    9.3020    9.4170    9.4800    9.5240    9.6340
    9.4410    9.4470    9.4800    9.4360    9.4300
    9.4130    9.2970    9.2100    9.1700    9.1360
    9.0160    8.9770    8.8900    8.7120    8.6590
    9.0340    8.9270    8.7100    8.5470    8.4730
    8.5100    8.4830    8.4400    8.3670    8.3650
    7.8180    7.7170    7.5800    7.5040    7.5850
    7.6610    7.6280    7.4700    7.4090    7.4190
    7.3090    7.3270    7.3000    7.2640    7.2760
    7.3870    7.3190    7.2500    7.1900    7.2010
    7.4400    7.4090    7.3300    7.2910    7.2690
    7.3300    7.1890    7.0600    7.0010    6.9750
    6.8490    6.8890    6.8500    6.7250    6.6680
    6.8750    6.8330    6.7000    6.5190    6.3880
    6.5500    6.4600    6.3600    6.1400    5.9900
    6.1100    6.1900    5.9300    5.6900    5.4900
    6.1500    6.0700    5.8900    5.7100    5.5800
    5.8300    5.9000    5.8300    5.7800    5.7900
    5.6000    5.6400    5.5600    5.5300    5.5000
    5.4700    5.3700    5.2700    5.2000    5.1700
    5.3400    5.2900    5.2100    5.1400    5.1000
    5.3400    5.3000    5.2700    5.1900    5.1300
    5.4900    5.3900    5.3400    5.2600    5.2100
    5.3100    5.2700    5.1700    5.0900    4.9900
    5.1200    5.1300    5.1200    5.0500    4.9800
    5.1800    5.1300    5.0400    4.9500    4.8100
    4.8900    4.8900    4.8300    4.7000    4.6200
    4.8300    4.8200    4.7000    4.5200    4.4200
    5.2900    4.7800    4.6400    4.4300    4.3300
    4.5900    4.6300    4.4400    4.2500    4.1600
    4.5900    4.5600    4.4100    4.2600    4.2200
    4.3200    4.3300    4.3400    4.2300    4.2200
    4.3300    4.3400    4.3300    4.2300    4.1900
    4.4000    4.3500    4.3300    4.2200    4.1400
    4.6000    4.4300    4.3500    4.1700    4.0700
    4.4700    4.4200    4.2500    3.9500    3.8300
    4.0400    4.1100    3.9900    3.7200    3.6400
    3.6200    3.7900    3.8000    3.6400    3.6200
    3.0000    3.4200    3.3600    3.2900    3.2400
    3.1100    3.1400    3.1100    3.0900    3.0600
    3.0900    3.1000    3.0600    3.0100    3.0400
    2.9100    3.0300    3.0300    2.9500    3.0300
    2.6900    2.6800    2.6800    2.6900    2.7100
    2.5400    2.5400    2.5600    2.6800    2.6600
    2.5600    2.5900    2.6000    2.6600    2.7800
    2.5100    2.6100    2.6600    2.8600    3.0200
    2.4300    2.5900    2.6800    3.0200    3.2300
    2.4200    2.5600    2.6900    3.0700    3.2600
    2.4800    2.7300    3.3200    3.4300    3.6100
    2.9200    3.0000    3.4400    3.4800    3.6600
    3.0200    3.4900    3.4500    3.5200    3.8100
    3.0200    3.1200    3.3100    3.5400    3.9200
    3.2500    3.3400    3.5200    3.7300    4.0900
    3.5000    3.5700    3.7400    3.9200    4.2400
    3.6900    3.7700    3.9200    4.1100    4.3600
    3.9200    4.1600    4.3600    4.5500    4.8500
    4.2700    4.3400    4.5000    4.6800    4.9500
    4.3000    4.3800    4.5700    4.8200    5.1000
    4.4100    4.5500    4.7800    4.9800    5.2700
    4.5800    4.6800    4.8500    5.0200    5.1900
    4.7400    4.8300    5.0300    5.1200    5.1900
    4.8300    4.9100    5.0800    5.1300    5.1600
    4.8300    4.9300    4.9300    4.9100    4.8600
    4.7500    4.7800    4.7500    4.6700    4.5600
    4.9600    4.7800    4.7300    4.6400    4.5900
    4.7700    4.7500    4.7000    4.6000    4.4800
    4.9800    4.7800    4.6700    4.5700    4.4600
    4.6300    4.6300    4.6300    4.5500    4.5100
    4.5300    4.5100    4.4500    4.3400    4.2900
    4.5000    4.5000    4.4400    4.3800    4.3000
    4.4800    4.4400    4.3600    4.2200    4.1100
    3.9800    4.0300    3.9600    3.8200    3.7600
    3.9600    3.7000    3.5700    3.4500    3.3500
    3.5000    3.4000    3.3600    3.2500    3.1900
    3.2900    3.4100    3.3500    3.2500    3.2400
    3.2900    3.3400    3.3300    3.3400    3.4800
    3.2700    3.3200    3.3400    3.3900    3.5700
    3.2500    3.3300    3.3800    3.4900    3.8000
    3.3000    3.3200    3.4000    3.5200    3.8700
    3.3100    3.3600    3.4600    3.6200    3.9600
    3.3400    3.3700    3.4600    3.5800    3.8400
    3.2900    3.3500    3.3900    3.5000    3.6400
    3.2900    3.3100    3.3400    3.3700    3.4600
    3.3000    3.3000    3.3000    3.2500    3.2300
    3.2900    3.3100    3.2500    3.1600    3.1200
    3.3000    3.2300    3.0800    3.0400    3.0200
    3.0700    2.9500    2.9500    2.8800    2.8800
    2.7800    2.8400    2.8300    2.7400    2.7000
    2.7600    2.7600    2.7100    2.5500    2.5300
    2.7100    2.5900    2.5300    2.4000    2.4200
    2.5500    2.5700    2.5300    2.4600    2.5000
    2.5600    2.5200    2.4000    2.3300    2.2600
    2.2000    2.1700    2.1600    2.0700    2.0700
    2.0700    2.1200    2.1300    2.0900    2.1000
    2.0800    2.1100    2.1500    2.1900    2.2800
    2.0200    2.1200    2.1400    2.1800    2.2600
    2.0100    2.0800    2.1400    2.1800    2.2800
    1.9800    2.0700    2.1500    2.2100    2.4300
    2.0200    2.1100    2.1400    2.1900    2.3600
    2.0100    2.0600    2.0800    2.1200    2.2100
    2.0300    2.0500    2.0600    2.0800    2.2200
    2.0000    2.0200    2.0300    2.0200    2.0300
    2.0600    2.0300    2.0300    2.0600    2.1800
    2.0100    2.0500    2.0800    2.1400    2.3000
    2.0300    2.0600    2.1000    2.1900    2.4100
    2.0500    2.0600    2.1100    2.1800    2.4000
    2.0300    2.0600    2.1100    2.1700    2.3300
    2.0500    2.0700    2.1100    2.2000    2.3800
    2.0900    2.0700    2.1500    2.2000    2.3700
    2.0800    2.0900    2.1600    2.2200    2.3400
    2.0500    2.1500    2.1700    2.2100    2.3000 ];
 
% Filtering Z in order to achieve stationarity
dZ = filter([1 -1],1,Z); 
dZ = dZ(2:end,:);

% Applying block-boostrap with size b
b = 10;
dZb = overlappingBB(dZ,b);

% Plots
subplot(2,1,1);
plot(dZ);
title('Original (1-B) Yield(1d, 1m, 3m, 6m, 1y)');
axis tight;

subplot(2,1,2);
plot(dZb);
title('Bootstrapped (1-B) Yield(1d, 1m, 3m, 6m, 1y)');
axis tight;