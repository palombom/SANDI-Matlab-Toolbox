function protocol = SchemeToProtocol(schemefile)
%
% camino.m--------------------------------------------------------------
% Transforms schemefile to protocol
% 
% protocol = SchemeToProtocol(schemefile)
% 
% Description: Reads a Camino Version 1 schemefile into a protocol object
%
% Parameters:  
% protocol - structure containing diffusion acquision information 
% schemefile -  Camino Version 1 schemefile
%   
%------------------------------------------------------------------------
% This file is part of the camino.m toolbox.
% Copyright (c) 2015, UCL Microstructure Imaging Group (MIG), All rights reserved.
% Distributed under the Modified BSD Licence (see: LICENSE.pdf).
%
% Authors:
%   Daniel C Alexander (d.alexander@ucl.ac.uk)
%   Gary Hui Zhang (gary.zhang@ucl.ac.uk)
%

fid = fopen(schemefile, 'r', 'b');

% Read in the header (assumes one line)
%A = fscanf(fid, '%c', 10);
A = fgetl(fid);

% Read in the data
A = fscanf(fid, '%f', [7, inf]);

fclose(fid);

% Create the protocol
protocol.pulseseq = 'PGSE';
protocol.grad_dirs = A(1:3,:)';
protocol.G = A(4,:);
protocol.delta = A(5,:);
protocol.smalldel = A(6,:);
protocol.TE = A(7,:);
protocol.totalmeas = length(A);

% Find the B0's
bVals = GetBvalues(protocol);
protocol.b0_Indices = find(bVals==0);

