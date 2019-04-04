class Solution {
public:
   vector<vector<int>> combine(int n, int k) {
        vector<vector<int>> res;
        if (k == 1) { // base case
            for (int i = 1; i <= n; ++i) res.push_back({i});
            return res;
        } 
        else if (k == n) { // base case
            res.resize(1);
            for (int i = 1; i <= n; ++i) res[0].push_back(i);
            return res;
        }
        
        res = combine(n-1,k); // all combinations without n
        auto tmp = combine(n-1,k-1);
        for (auto& x:tmp) x.push_back(n); // all combinations with n
        res.insert(res.end(), tmp.begin(), tmp.end());
        return res;
    }

};