function idx = findClosestCentroids(X, centroids)
%FINDCLOSESTCENTROIDS computes the centroid memberships for every example
%   idx = FINDCLOSESTCENTROIDS (X, centroids) returns the closest centroids
%   in idx for a dataset X where each row is a single example. idx = m x 1 
%   vector of centroid assignments (i.e. each entry in range [1..K])
%

% Set K
K = size(centroids, 1);

% You need to return the following variables correctly.
idx = zeros(size(X,1), 1);

% ====================== YOUR CODE HERE ======================
% Instructions: Go over every example, find its closest centroid, and store
%               the index inside idx at the appropriate location.
%               Concretely, idx(i) should contain the index of the centroid
%               closest to example i. Hence, it should be a value in the 
%               range 1..K
%
% Note: You can use a for-loop over the examples to compute this.
%

m = size(X, 1);
for i = 1:m
    % ||X -μ||^2の初期値は無限大として設定(数値が十分に大きければ何でも問題なし)
    d_min = inf;
    idx_min = 0;
    
    for j = 1:K
        diff = X(i,:) - centroids(j,:);
        d = diff * diff';
        
        % jを1~Kまで繰り返した時に最小値がidx(i)に入る
        if d <= d_min
            d_min = d;
            idx(i) = j;
        end
    end
end

% 課題提出時は問題なかったがオプションでエラーが出た際の実装内容
% m = size(X, 1);
% d = zeros(m, 3);
% 
% for i = 1:m
%     for j = 1:K
%         diff = X(i, :) - centroids(j, :);
%         d(i, j) = diff * diff';
%     end
%     d_col_i = d(i, :);
%     d_col_i_min = min(d_col_i);
%     
%     idx(i) = find(d_col_i == d_col_i_min);
% end

% =============================================================

end