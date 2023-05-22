#include <iostream>
#include <vector>
#include <string>

using namespace std;

int main()
{
    vector<string> msg {"Hello", "C+asdf+", "World", "from", "VS Coasdfde", "and the C++ extension! ccc   pdf"};

    for (const string& word : msg)
    {
        cout << word << " ";
    }
    cout << endl;
}