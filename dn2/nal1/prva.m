format long

% x = 0 : (7 + ((c1 + c2 ) % 13)), c1=0, c2=0
x = 0:7;

II = [1, 1, 1, 1, 1, 1, 1, 1];
A = [II; x; x.^2; x.^3; x.^4; x.^5]'

b =[
    1.00000; 
    1.11111;
    1.24992;
    1.42753;
    1.65984;
    1.96875;
    2.38336;
    2.94117;
]

% operacija \
x1 = A\b

% normalni sistem
x2 =(A'*A)\(A'*b)

% pseudo inverz
B = pinv(A);
x3 = B * b

% singularni razcep
[U, S, V] = svd(A);
x4 = (V * pinv(S) * U') * b

% QR razcepi
% Gram-Schmidt
[Q, R] = cgs (A);
x5 = R \ (Q' * b)

% modificiran Gram-Schmidt (QR razširjene matrike [A b])
[MQ, MR] = mgs ([A, b]);
R = MR(1:end-1, 1:end-1);
z = MR(1:end-1, end);
x6 = R \ z

% Householderjeva zrcaljenja
[Q, R] = qrhouse (A);
x7 = R \ (Q' * b)

% Givensove rotacije
[Q, R] = qrgivens (A);
x8 = R \ (Q' * b)

res = [1; 0.1; 0.1e-1; 0.1e-2; 0.1e-3; 0.1e-4];
norm (x1 - res)
norm (x2 - res)
norm (x3 - res)
norm (x4 - res)
norm (x5 - res)
norm (x6 - res)
norm (x7 - res)
norm (x8 - res)
