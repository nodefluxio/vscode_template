#include "library.h"

#include <iostream>
#include <boost/fiber/all.hpp>


void fn( std::string const& str, int n)
{
    for ( int i = 0; i < n; ++i)
    {
        std::cout << i << ": " << str << std::endl;
        boost::this_fiber::sleep_for(std::chrono::seconds(1));
    }
}
