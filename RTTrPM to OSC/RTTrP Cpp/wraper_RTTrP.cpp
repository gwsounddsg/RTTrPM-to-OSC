//
//  wraper_RTTrP.cpp
//  RTTrPM to OSC
//
//  Created by GW Rodriguez on 11/15/19.
//  Copyright © 2019 GW Rodriguez. All rights reserved.
//

#include "wraper_RTTrP.hpp"
#include "RTTrP.h"


extern "C++"
{
    MyRTTrP* createP() {
        return reinterpret_cast<MyRTTrP*>(new RTTrP());
    }
    
    MyRTTrP* createWithVector(std::vector<unsigned char> vec) {
        return reinterpret_cast<MyRTTrP*>(new RTTrP(vec));
    }
    
    void destroyMyRTTrP(MyRTTrP* trash) {
        delete reinterpret_cast<RTTrP*>(trash);
    }
    
    void printHeader(MyRTTrP* obj) {
        reinterpret_cast<RTTrP*>(obj)->printHeader();
    }
}
