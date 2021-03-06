function mpgMean = apply_MLP_matlab(signal, Mdl)

% Apply pretrained Multi Layer Perceptron regressor
%
% Author:
% Dr. Marco Palombo
% Cardiff University Brain Research Imaging Centre (CUBRIC)
% Cardiff University, UK
% 8th December 2021
% Email: palombom@cardiff.ac.uk

tic

mpgMean = zeros(size(signal,1), numel(Mdl));

for i=1:numel(Mdl)
    net = Mdl{i};
    mpgMean(:,i) = net(signal');
end

tt = toc;

fprintf('DONE - MLP fitted in %3.0f sec.\n', tt)

end
