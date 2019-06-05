      function [x,nroot]=quadfcn(a, b, c)
% ----------------------------------------------------------------------
% Usage:       [x,nroot]=quadfcn(a, b, c)
%
% Solve a quadratic equation where a, b, and c are real.
%   a*x*x + b*x + c = 0
%
% Public Variables
%   a, b, c     ... coefficients (input)
%   x           ... two complex solutions (output)
%   nroot       ... number of roots (output)
%
% Instructor: Nam Sun Wang
% ----------------------------------------------------------------------

      if (a == 0.)
        if (b == 0.)
%         We have a non-equation; therefore, we have no valid solution
          nroot = 0;
        else
%         We have a linear equation with 1 root.
          nroot = 1;
          x(1) = -c/b;
        end
      else
%     We have a true quadratic equation.  Apply the quadratic formula to find two roots.
        nroot = 2;
        DD = b*b-4.*a*c;
        x(1) = (-b+sqrt(DD))/2./a;
        x(2) = (-b-sqrt(DD))/2./a;
      end