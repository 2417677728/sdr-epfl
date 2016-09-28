function [ C ] = my_qammap( M )
% MY_QAMMAP Creates constellation for square QAM modulations
% C = MY_QAMMAP(M) outputs a 1×M vector with the
% constellation for the quadrature amplitude modulation of
% alphabet size M, where M is the square of an integer power
% of 2 (e.g. 4, 16, 64, ...).
% The signal constellation is a square constellation.


% Check if M is the square of a power of 2 (required for a QAM, by definition)
if (not(is_number_integer(log2(sqrt(M)))) || M <= 1)
    error('M must be the square of a power of 2.');
end


max_coordinate = (log2(M)-1);

[Y,X] = ndgrid(max_coordinate:-2:-max_coordinate,-max_coordinate:2:max_coordinate);

QAM = X + i*Y;

C = reshape(QAM, 1, M);


function result = is_number_integer(n)
    result = (mod(n,1) == 0);
end
end

