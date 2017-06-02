function [x,f] = MT5b( p1,p2,max)
%For use on problem 5 of Num Analysis II midterm. 
%Input: p1 and p2 are two intial guesses
%Output: x and f are vectors, x a sequences of guesses at the %root, f a sequence of values erf(x)-k

%First, we create vectors to store x and f(x) values, as well as
%store the first two guesses, max iterations, and my value k
x=[];f=[];x(1)=p1;x(2)=p2;TOL=0.00001;k=0.75;
d=2*sqrt(pi);

%Here, we compute the first two function values with the trap rule
c=x(1)/2;
f(1)=(x(1)/d)*(1+2*exp(-c^2)+exp(-x(1)^2))-k
c=x(2)/2
f(2)=(x(2)/d)*(1+2*exp(-c^2)+exp(-x(2)^2))-k

%Now we iterate over n, generating new guesses using the secant %method and calculating new function values
for n=3:max
    x(n)=x(n-1)-f(n-1)*(x(n-1)-x(n-2))/(f(n-1)-f(n-2)); %secant method
    if (abs(x(n)-x(n-1))<TOL) %checking our stopping condition
        disp('Your approximation of the root is')
        x(n)
        disp('The sequence of x values is')
        x'
        disp('The sequence of f values is')
        f'
        return
    end
    c=x(n)/2;
    f(n)=(x(n)/d)*(1+2*exp(-c^2)+exp(-x(n)^2))-k; %trapezoidal rule
end

disp('You have reached max iterations without reaching tolerance.')
disp('Here are the sequences of x and f values used')
x'
f'
end


