local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local fmt = require("luasnip.extras.fmt").fmt

return {
  -- Boilerplate
  s(
    "cpt",
    fmt(
      [[
#include <bits/stdc++.h>
using namespace std;

#define ll long long 
#define ld long double
#define sza(x) ((int)x.size())
#define all(a) (a).begin(), (a).end()
#define mp(a,b) make_pair(a,b)
const int MAX_N = 1e5 + 5;
const ll MOD = 1e9 + 7;
const ll INF = 1e9;
const ld EPS = 1e-9;

void solve() {{ 
  {}
}}

int main() {{
    ios::sync_with_stdio(false);
    cin.tie(nullptr);
    solve();
    return 0;
}}
]],
      { i(1, "// code here") }
    )
  ),
  s(
    "cp",
    fmt(
      [[
#include <bits/stdc++.h>
using namespace std;

#define ll long long 
#define ld long double
#define sza(x) ((int)x.size())
#define all(a) (a).begin(), (a).end()
#define mp(a,b) make_pair(a,b)
const int MAX_N = 1e5 + 5;
const ll MOD = 1e9 + 7;
const ll INF = 1e9;
const ld EPS = 1e-9;

void solve() {{ 
  {}
}}

int main() {{
    ios::sync_with_stdio(false);
    cin.tie(nullptr);
    int t;
    cin >> t;
    while (t--) {{
    solve();
    }}
    return 0;
}}
]],
      { i(1, "// code here") }
    )
  ),

  s(
    "cp",
    fmt(
      [[
#include <bits/stdc++.h>
using namespace std;

#define ll long long 
#define ld long double
#define sza(x) ((int)x.size())
#define all(a) (a).begin(), (a).end()
#define mp(a,b) make_pair(a,b)
const int MAX_N = 1e5 + 5;
const ll MOD = 1e9 + 7;
const ll INF = 1e9;
const ld EPS = 1e-9;

void solve() {{ 
  {}
}}

int main() {{
    ios::sync_with_stdio(false);
    cin.tie(nullptr);
    int t;
    cin >> t;
    while (t--) {{
    solve();
    }}
    return 0;
}}
]],
      { i(1, "// code here") }
    )
  ),

  -- Fast IO macro
  s("fio", t("ios::sync_with_stdio(false); cin.tie(nullptr);")),
}
