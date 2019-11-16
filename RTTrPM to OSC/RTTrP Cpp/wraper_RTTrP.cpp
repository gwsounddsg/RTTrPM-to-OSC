//
//  wraper_RTTrP.cpp
//  RTTrPM to OSC
//
//  Created by GW Rodriguez on 11/15/19.
//  Copyright © 2019 GW Rodriguez. All rights reserved.
//

#include "wraper_RTTrP.hpp"
#include "RTTrP.h"


#pragma mark - RTTrP

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





#pragma mark - RTTrPM

extern "C++"
{
    MyRTTrPM* createPM() {
        return reinterpret_cast<MyRTTrPM*>(new RTTrPM());
    }
    
    void destroyMyRTTrPM(MyRTTrPM* trash) {
        delete reinterpret_cast<RTTrPM*>(trash);
    }
    
    void printPacket(MyRTTrPM* obj) {
        reinterpret_cast<RTTrPM*>(obj)->printPacket();
    }
}





#pragma mark - RTTrPL

extern "C++"
{
    MyRTTrPL* createPL() {
        return reinterpret_cast<MyRTTrPL*>(new RTTrPL());
    }

    // RTTrPL(RTTrPL* toCopy) is not implemented in protocol
//    MyRTTrPL* createFromCopy(MyRTTrPL* toCopy) {
//        return reinterpret_cast<MyRTTrPL*>(new RTTrPL(toCopy));
//    }
    
    void destoryMyRTTrPL(MyRTTrPL* trash) {
        delete reinterpret_cast<RTTrPL*>(trash);
    }
    
    void printModule(MyRTTrPL* obj) {
        reinterpret_cast<RTTrPL*>(obj)->printModule();
    }
}
