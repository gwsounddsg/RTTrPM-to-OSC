//
//  wraper_RTTrP.hpp
//  RTTrPM to OSC
//
//  Created by GW Rodriguez on 11/15/19.
//  Copyright © 2019 GW Rodriguez. All rights reserved.
//

#ifndef wraper_RTTrP_hpp
#define wraper_RTTrP_hpp

#include <stdio.h>



#pragma mark - RTTrP

struct MyRTTrP;
typedef struct MyRTTrP MyRTTrP;

#ifdef __cplusplus
extern "C" {
#endif
    MyRTTrP* newP();
    MyRTTrP* newPWithVector(unsigned char* vec, int size);
    void destroyP(MyRTTrP* trash);

    void printHeader(MyRTTrP* obj);
#ifdef __cplusplus
}
#endif


#pragma mark - RTTrPM
struct MyRTTrPM;
typedef struct MyRTTrPM MyRTTrPM;

#ifdef __cplusplus
extern "C" {
#endif
    MyRTTrPM* newPM();
    void destroyPM(MyRTTrPM* trash);

    void printPacket(MyRTTrPM* obj);
#ifdef __cplusplus
}
#endif



#pragma mark - RTTrPL
struct MyRTTrPL;
typedef struct MyRTTrPL MyRTTrPL;

#ifdef __cplusplus
extern "C" {
#endif
    MyRTTrPL* newPL();
    //MyRTTrPL* newPLFrom(MyRTTrPL* toCopy);
    void destoryPL(MyRTTrPL* trash);

    void printModule(MyRTTrPL* obj);
#ifdef __cplusplus
}
#endif

#endif /* wraper_RTTrP_hpp */
