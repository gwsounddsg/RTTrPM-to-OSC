//
//  wrapper_thirdPartyMotion.hpp
//  RTTrPM to OSC
//
//  Created by GW Rodriguez on 11/21/19.
//  Copyright © 2019 GW Rodriguez. All rights reserved.
//

#ifndef wrapper_thirdPartyMotion_hpp
#define wrapper_thirdPartyMotion_hpp

#include <stdio.h>
#include "thirdParty_motion.h"


#ifndef MYTYPES
typedef unsigned int my_uint32;
typedef unsigned short int my_uint16;
typedef unsigned char my_uint8;
#endif


#pragma mark - Packet

typedef struct MyPacket MyPacket;

#ifdef __cplusplus
extern "C" {
#endif
    
    MyPacket* newPacket();
    MyPacket* newPacketWith(my_uint16 intSig, my_uint16 fltSig, unsigned char* data);
    MyPacket* copyPacket(const MyPacket* toCopy);
    void destoryPacket(MyPacket* trash);
    
    void packet_pkType(MyPacket* obj, my_uint8 type);
    void packet_intSig(MyPacket* obj, my_uint16 val);
    void packet_fltSig(MyPacket* obj, my_uint16 val);
    
    my_uint8 getPacketPkType(MyPacket* obj);
    my_uint16 getPacketIntSig(MyPacket* obj);
    my_uint16 getPacketFltSig(MyPacket* obj);
    
#ifdef __cplusplus
}
#endif





#pragma mark - Trackable

typedef struct MyTrackable MyTrackable;

#ifdef __cplusplus
extern "C" {
#endif
    
    MyTrackable* newTrackable();
    MyTrackable* newTrackableWith(unsigned char* data, my_uint16 intSig, my_uint16 fltSig);
    MyTrackable* copyTrackable(const Trackable* toCopy);
    void destroyTrackable(MyTrackable* trash);
    
    void trackable_timeStamp(MyTrackable* obj, my_uint32 val);
    void trackable_size(MyTrackable* obj, my_uint16 val);
    void trackable_nameLen(MyTrackable* obj, my_uint8 val);
    void trackable_numMods(MyTrackable* obj, my_uint8 val);
    void trackable_name(MyTrackable* obj, std::string val);
    
    my_uint32 getTrackableTimeStamp(MyTrackable* obj);
    my_uint16 getTrackableSize(MyTrackable* obj);
    my_uint8 getTrackableNameLen(MyTrackable* obj);
    my_uint8 getTrackableNumMods(MyTrackable* obj);
    void getTrackableName(MyTrackable* obj, std::string* name);
    
    void printTrackable(MyTrackable* obj);
    
#ifdef __cplusplus
}
#endif





#pragma mark - CentroidMod

typedef struct MyCentroidMod MyCentroidMod;

#ifdef __cplusplus
extern "C" {
#endif
    
    MyCentroidMod* newCentroidMod();
    MyCentroidMod* newCentroidModWith(std::vector<unsigned char>* data, my_uint16 intSig, my_uint16 fltSig);
    MyCentroidMod* copyCentroidMod(const MyCentroidMod* toCopy);
    void destroyCentroidMod(MyCentroidMod* trash);
    
    void centroidMod_size(MyCentroidMod* obj, my_uint16 val);
    void centroidMod_latency(MyCentroidMod* obj, my_uint16 val);
    void centroidMod_x(MyCentroidMod* obj, double val);
    void centroidMod_y(MyCentroidMod* obj, double val);
    void centroidMod_z(MyCentroidMod* obj, double val);
    
    my_uint16 getCentroidModSize(MyCentroidMod* obj);
    my_uint16 getCentroidModLatency(MyCentroidMod* obj);
    double getCentroidModX(MyCentroidMod* obj);
    double getCentroidModY(MyCentroidMod* obj);
    double getCentroidModZ(MyCentroidMod* obj);
    
    void printCentroidMod(MyCentroidMod* obj);
    
#ifdef __cplusplus
}
#endif





#pragma mark - LEDModule

typedef struct MyLEDModule MyLEDModule;

#ifdef __cplusplus
extern "C" {
#endif
    
    MyLEDModule* newLEDModule();
    MyLEDModule* newLEDModuleWith(std::vector<unsigned char>* data, my_uint16 intSig, my_uint16 fltSig);
    MyLEDModule* copyLEDModule(MyLEDModule* toCopy);
    void destroyLEDModule(MyLEDModule* trash);
    
    void ledModule_size(MyLEDModule* obj, my_uint16 val);
    void ledModule_latency(MyLEDModule* obj, my_uint16 val);
    void ledModule_index(MyLEDModule* obj, my_uint8 val);
    void ledModule_x(MyLEDModule* obj, double val);
    void ledModule_y(MyLEDModule* obj, double val);
    void ledModule_z(MyLEDModule* obj, double val);
    
    my_uint16 getLEDModuleSize(MyLEDModule* obj);
    my_uint16 getLEDModuleLatency(MyLEDModule* obj);
    my_uint8 getLEDModuleIndex(MyLEDModule* obj);
    double getLEDModuleX(MyLEDModule* obj);
    double getLEDModuleY(MyLEDModule* obj);
    double getLEDModuleZ(MyLEDModule* obj);
    
    void printLEDModule(MyLEDModule* obj);
    
#ifdef __cplusplus
}
#endif





#pragma mark - QuatModule

typedef struct MyQuatModule MyQuatModule;

#ifdef __cplusplus
extern "C" {
#endif
    
    MyQuatModule* newQuatModule();
    MyQuatModule* newQuatModuleWith(std::vector<unsigned char>* data, my_uint16 intSig, my_uint16 fltSig);
    MyQuatModule* copyQuatModule(const MyQuatModule* toCopy);
    void destroyQuatModule(MyQuatModule* trash);
    
    void quatModule_size(MyQuatModule* obj, my_uint16 val);
    void quatModule_latency(MyQuatModule* obj, my_uint16 val);
    void quatModule_Qx(MyQuatModule* obj, double val);
    void quatModule_Qy(MyQuatModule* obj, double val);
    void quatModule_Qz(MyQuatModule* obj, double val);
    void quatModule_Qw(MyQuatModule* obj, double val);
    
    my_uint16 getQuatModuleSize(MyQuatModule* obj);
    my_uint16 getQuatModuleLatency(MyQuatModule* obj);
    double getQuatModuleQx(MyQuatModule* obj);
    double getQuatModuleQy(MyQuatModule* obj);
    double getQuatModuleQz(MyQuatModule* obj);
    double getQuatModuleQw(MyQuatModule* obj);
    
    void printQuatModule(MyQuatModule* obj);
    
#ifdef __cplusplus
}
#endif





#pragma mark - EulerModule

typedef struct MyEulerModule MyEulerModule;

#ifdef __cplusplus
extern "C" {
#endif
    
    MyEulerModule* newEulerModule();
    MyEulerModule* newEulerModuleWith(std::vector<unsigned char>* data, my_uint16 intSig, my_uint16 fltSig);
    MyEulerModule* copyEulerModule(const MyEulerModule* toCopy);
    void destroyEulerModule(MyEulerModule* trash);
    
    void eulerModule_size(MyEulerModule* obj, my_uint16 val);
    void eulerModule_latency(MyEulerModule* obj, my_uint16 val);
    void eulerModule_order(MyEulerModule* obj, my_uint16 val);
    void eulerModule_R1(MyEulerModule* obj, double val);
    void eulerModule_R2(MyEulerModule* obj, double val);
    void eulerModule_R3(MyEulerModule* obj, double val);
    
    my_uint16 getEulerModuleSize(MyEulerModule* obj);
    my_uint16 getEulerModuleLatency(MyEulerModule* obj);
    my_uint16 getEulerModuleOrder(MyEulerModule* obj);
    double getEulerModuleR1(MyEulerModule* obj);
    double getEulerModuleR2(MyEulerModule* obj);
    double getEulerModuleR3(MyEulerModule* obj);
    
    void printEulerModule(MyEulerModule* obj);
    
#ifdef __cplusplus
}
#endif





#pragma mark - CentroidAccVelMod

typedef struct MyCentroidAccVelMod MyCentroidAccVelMod;

#ifdef __cplusplus
extern "C" {
#endif
    
    MyCentroidAccVelMod* newCentroidAccVelMod();
    MyCentroidAccVelMod* newCentroidAccVelModWith(std::vector<unsigned char>* data, my_uint16 intSig, my_uint16 fltSig);
    MyCentroidAccVelMod* copyCentroidAccVelMod(MyCentroidAccVelMod* toCopy);
    void destroyCentroidAccVelMod(MyCentroidAccVelMod* trash);
    
    void centroidAccVelMod_size(MyCentroidAccVelMod* obj, my_uint16 val);
    void centroidAccVelMod_x(MyCentroidAccVelMod* obj, double val);
    void centroidAccVelMod_y(MyCentroidAccVelMod* obj, double val);
    void centroidAccVelMod_z(MyCentroidAccVelMod* obj, double val);
    void centroidAccVelMod_accx(MyCentroidAccVelMod* obj, float val);
    void centroidAccVelMod_accy(MyCentroidAccVelMod* obj, float val);
    void centroidAccVelMod_accz(MyCentroidAccVelMod* obj, float val);
    void centroidAccVelMod_velx(MyCentroidAccVelMod* obj, float val);
    void centroidAccVelMod_vely(MyCentroidAccVelMod* obj, float val);
    void centroidAccVelMod_velz(MyCentroidAccVelMod* obj, float val);
    
    my_uint16 getCentroidAccVelModSize(MyCentroidAccVelMod* obj);
    double getCentroidAccVelModX(MyCentroidAccVelMod* obj);
    double getCentroidAccVelModY(MyCentroidAccVelMod* obj);
    double getCentroidAccVelModZ(MyCentroidAccVelMod* obj);
    float getCentroidAccVelModAccX(MyCentroidAccVelMod* obj);
    float getCentroidAccVelModAccY(MyCentroidAccVelMod* obj);
    float getCentroidAccVelModAccZ(MyCentroidAccVelMod* obj);
    float getCentroidAccVelModVelX(MyCentroidAccVelMod* obj);
    float getCentroidAccVelModVelY(MyCentroidAccVelMod* obj);
    float getCentroidAccVelModVelZ(MyCentroidAccVelMod* obj);
    
    void printCentroidAccVelMod(MyCentroidAccVelMod* obj);
    
#ifdef __cplusplus
}
#endif





#pragma mark - LEDAccVelMod

typedef struct MyLEDAccVelMod MyLEDAccVelMod;

#ifdef __cplusplus
extern "C" {
#endif
    
    MyLEDAccVelMod* newLEDAccVelMod();
    MyLEDAccVelMod* newLEDAccVelModWith(std::vector<unsigned char>* data, my_uint16 intSig, my_uint16 fltSig);
    MyLEDAccVelMod* copyLEDAccVelMod(MyLEDAccVelMod* toCopy);
    void destroyLEDAccVelMod(MyLEDAccVelMod* trash);
    
    void ledAccVelMod_size(MyLEDAccVelMod* obj, my_uint16 val);
    void ledAccVelMod_index(MyLEDAccVelMod* obj, my_uint8 val);
    void ledAccVelMod_x(MyLEDAccVelMod* obj, double val);
    void ledAccVelMod_y(MyLEDAccVelMod* obj, double val);
    void ledAccVelMod_z(MyLEDAccVelMod* obj, double val);
    void ledAccVelMod_accx(MyLEDAccVelMod* obj, float val);
    void ledAccVelMod_accy(MyLEDAccVelMod* obj, float val);
    void ledAccVelMod_accz(MyLEDAccVelMod* obj, float val);
    void ledAccVelMod_velx(MyLEDAccVelMod* obj, float val);
    void ledAccVelMod_vely(MyLEDAccVelMod* obj, float val);
    void ledAccVelMod_velz(MyLEDAccVelMod* obj, float val);
    
    my_uint16 getLEDAccVelModSize(MyLEDAccVelMod* obj);
    my_uint8 getLEDAccVelModIndex(MyLEDAccVelMod* obj);
    double getLEDAccVelModX(MyLEDAccVelMod* obj);
    double getLEDAccVelModY(MyLEDAccVelMod* obj);
    double getLEDAccVelModZ(MyLEDAccVelMod* obj);
    float getLEDAccVelModAccX(MyLEDAccVelMod* obj);
    float getLEDAccVelModAccY(MyLEDAccVelMod* obj);
    float getLEDAccVelModAccZ(MyLEDAccVelMod* obj);
    float getLEDAccVelModVelX(MyLEDAccVelMod* obj);
    float getLEDAccVelModVelY(MyLEDAccVelMod* obj);
    float getLEDAccVelModVelZ(MyLEDAccVelMod* obj);
    
    void printLEDAccVelMod(MyLEDAccVelMod* obj);
    
#ifdef __cplusplus
}
#endif

#endif /* wrapper_thirdPartyMotion_hpp */
