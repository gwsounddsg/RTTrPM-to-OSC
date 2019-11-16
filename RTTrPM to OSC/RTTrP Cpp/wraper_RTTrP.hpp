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
    MyRTTrP* createP();
    MyRTTrP* createWithVector(unsigned char* vec[], int size);
    void destroyMyRTTrP(MyRTTrP* trash);

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
    MyRTTrPM* createPM();
    void destroyMyRTTrPM(MyRTTrPM* trash);

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
    MyRTTrPL* createPL();
    MyRTTrPL* createFromCopy(MyRTTrPL* toCopy);
    void destoryMyRTTrPL(MyRTTrPL* trash);

    void printModule(MyRTTrPL* obj);
#ifdef __cplusplus
}
#endif

#endif /* wraper_RTTrP_hpp */
