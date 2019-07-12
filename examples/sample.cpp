#include <iostream>
#include "vscode_template/library.h"
#include <boost/fiber/all.hpp>

int main()
{
   boost::fibers::use_scheduling_algorithm< boost::fibers::algo::round_robin > ();
   boost::fibers::fiber fb([]{
      fn("Fiber 1", 5);
   });
   boost::fibers::fiber fb2([]{
      fn("Fiber 2", 5);
   });
   fb.join();
   fb2.join();
}
