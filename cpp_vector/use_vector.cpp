#include <vector>


void use_vector(std::vector<int>& v)
{
    v.resize(3);
    v[0] = 2;
    v[1] = 3;
    v[2] = 4;
}


void use_vector_vector(std::vector<std::vector<int>>& vs)
{
    vs.resize(2);
    vs[0].resize(3);
    vs[0][0] = 1;
    vs[0][1] = 2;
    vs[0][2] = 3;
    vs[1].resize(2);
    vs[1][0] = 4;
    vs[1][1] = 5;
}
