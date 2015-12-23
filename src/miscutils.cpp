#include "miscutils.hpp"

#include <algorithm> // std::find

template <typename T>
void ezremove(std::vector<T>& v, T val) {
    int pos = std::find(v.begin(), v.end(), val) - v.begin();
    if (pos >= v.size()) return;
    v[pos] = v[v.size() - 1];
    v.pop_back();
}

#include "game_node.hpp"
template void ezremove<GameNode*>(std::vector<GameNode*>& v, GameNode* val);