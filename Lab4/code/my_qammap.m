% MY_QAMMAP Create constellation for square QAM modulations
% C = MY_QAMMAP(M) outputs a 1xM vector with the
% constellation for the quadrature amplitude modulation of
% alphabet size M, where M is the square of an integer power
% of 2 (e.g. 4, 16, 64, ...).
% The signal constellation is a square constellation.


function c = my_qammap(M)

% Verify that M is the square of a power of two
if log2(sqrt(M)) ~= fix(log2(sqrt(M)))
    error('M must be in the form of M = 2^(2K), where K is a positive integer.');
end

aux = (-(sqrt(M)-1):2:sqrt(M)-1);
x = meshgrid(aux);
y = transpose(meshgrid(fliplr(aux)));

	% equivalently, we could call only once meshgrid, but with two output arguments
	% [x, y] = meshgrid(aux, fliplr(aux));
	
c = x + 1i*y;

% We finally reshape c to be a row wector
c = transpose(c(:));
