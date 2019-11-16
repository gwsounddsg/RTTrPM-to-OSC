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
#include <vector>


#pragma mark - RTTrP

struct MyRTTrP;
typedef struct MyRTTrP MyRTTrP;

MyRTTrP* createP();
MyRTTrP* createWithVector(std::vector<unsigned char>* vec);
void destroyMyRTTrP(MyRTTrP* trash);

void printHeader(MyRTTrP* obj);


#pragma mark - RTTrPM
struct MyRTTrPM;
typedef struct MyRTTrPM MyRTTrPM;



#endif /* wraper_RTTrP_hpp */
