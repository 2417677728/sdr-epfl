function Rf = ofdm_rx_frame(rx_signal, num_carriers, num_zeros, prefix_length)

% OFDM_RX_FRAME Receiver for ODFM signals (without channel equalization) 
% RF = OFDM_RX_FRAME(RX_SIGNAL, NUM_CARRIERS, NUM_ZEROS, PREFIX_LENGTH)
%   RX_SIGNAL: vector with the input samples in the time domain
%   NUM_CARRIERS: number of subcarriers (FFT/IFFT size) 
%   NUM_ZEROS: number of zero carriers at either end of the spectrum 
%   PREFIX_LENGTH: length of cyclic prefix (in number of samples) 
%
%   RF: Matrix containing the received OFDM frame. The received symbols are
%   arranged columnwise in a num_carriers x num_ofdm_symbols matrix. After
%   removing the cyclic prefix we go back to frequency domain and also
%   remove the zero carriers.

ofdm_frame_width = length(rx_signal) / (num_carriers+prefix_length);
ofdm_frame_ifft_prefix = reshape(rx_signal, num_carriers+prefix_length, ofdm_frame_width);

% Remove cyclic prefix
ofdm_frame_ifft = ofdm_frame_ifft_prefix(1:prefix_length,:);

% Apply FFT to get the ofdm frame
ofdm_frame_with_carriers = fft(ofdm_frame_ifft);

number_ofdm_symbols = size(ofdm_frame_with_carriers,2);

% Remove unused subcarriers values
ofdm_frame = ofdm_frame_with_carriers(num_zeros+1:end-num_zeros,:);

Rf =  ofdm_frame;






