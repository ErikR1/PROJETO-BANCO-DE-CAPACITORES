## Erik Adriano Romanelli
## Fundação Hermínio Ometto - 2024

## TCC - Estudo de sistema de correção de fator de potência

## Orientador: Daniel Augusto Pagi Ferreira


clc
close all
clear all

f = 60;
L = 214e-3;
C = 6.6e-6;
V = 127;
R = 103.28;
Qteorico = 75;
P =100;

XL = 2*pi*f*L;

XC = -i/(2*pi*f*C);

ZL = R + i*XL;

ZC = XC;

Z = (ZL*ZC)/(ZL+ZC);

I = V/Z;

% Determinando a corrente do capacitor e da fonte com o capacitor

QC = 32.41;
IC = QC/V;
printf('Corrente no capacitor teórico %.3f\n', IC)

QL = 42.59;
Sf = sqrt((QL^2)+(P^2));
Ifonte = Sf/V;

printf('Corrente na fonte com o capacitor teórico %.3f\n', Ifonte)


% Determinando o Fator de potência com os simulados

Isimulado = 0.962;

QC1 = C*(V*V)*2*pi*f;

printf('Carga reativa produzida pelo capacitor simulação: %.3f\n', QC1)

QL1 = XL*(Isimulado*Isimulado);

printf('Carga reativa produzida pelo indutor simulação: %.3f\n', QL1)

S1 = sqrt((P^(2))+(QC1 - QL1)^(2));
FP1 = P/S1;

printf('O fator de potência encontrado foi: %.3f\n', FP1)

% Determinando o fator de potência simulado antes do capacitor

Isimulado_antes= 0.962;

QLantes = XL*(Isimulado_antes*Isimulado_antes);
Santes = sqrt((P^(2)+(QLantes^(2))));
FPantes = P/Santes;
printf('O fator de potência antes do capacitor, simulação foi: %.3f\n', FPantes)


% Determinando o Fator de potência com os valores reais

QC2 = C*(V*V)*2*pi*f;

printf('Carga reativa produzida pelo capacitor real: %.3f\n', QC2)

QL2 = XL*abs(I*I);

printf('Carga reativa produzida pelo indutor real: %.3f\n', QL2)

S2 = sqrt((P^(2))+(QC2 - QL2)^(2));
FP2 = P/S2;

printf('O fator de potência encontrado foi: %.3f\n', FP2)




