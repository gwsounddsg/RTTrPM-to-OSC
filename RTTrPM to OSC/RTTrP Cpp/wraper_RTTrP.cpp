//
//  wraper_RTTrP.cpp
//  RTTrPM to OSC
//
//  Created by GW Rodriguez on 11/15/19.
//  Copyright © 2019 GW Rodriguez. All rights reserved.
//

#include "wraper_RTTrP.hpp"
#include "RTTrP.h"
#include "protocol_common.h"


#pragma mark - RTTrP

using namespace std;

MyRTTrP* newP() {
    return reinterpret_cast<MyRTTrP*>(new RTTrP());
}

MyRTTrP* newPWithVector(unsigned char* vec, int size) {
    vector<unsigned char> localVec;
    localVec.assign(vec, vec + size);
    return reinterpret_cast<MyRTTrP*>(new RTTrP(localVec));
}

void destroyP(MyRTTrP* trash) {
    delete reinterpret_cast<RTTrP*>(trash);
}

void printHeader(MyRTTrP* obj) {
    reinterpret_cast<RTTrP*>(obj)->printHeader();
}





#pragma mark - RTTrPM


MyRTTrPM* newPM() {
    return reinterpret_cast<MyRTTrPM*>(new RTTrPM());
}

void destroyPM(MyRTTrPM* trash) {
    delete reinterpret_cast<RTTrPM*>(trash);
}

void printPacket(MyRTTrPM* obj) {
    reinterpret_cast<RTTrPM*>(obj)->printPacket();
}






#pragma mark - RTTrPL


MyRTTrPL* newPL() {
    return reinterpret_cast<MyRTTrPL*>(new RTTrPL());
}

// RTTrPL(RTTrPL* toCopy) is not implemented in protocol
//    MyRTTrPL* createFromCopy(MyRTTrPL* toCopy) {
//        return reinterpret_cast<MyRTTrPL*>(new RTTrPL(toCopy));
//    }

void destoryPL(MyRTTrPL* trash) {
    delete reinterpret_cast<RTTrPL*>(trash);
}

void printModule(MyRTTrPL* obj) {
    reinterpret_cast<RTTrPL*>(obj)->printModule();
}
