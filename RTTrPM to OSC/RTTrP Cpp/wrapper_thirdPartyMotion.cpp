//
//  wrapper_thirdPartyMotion.cpp
//  RTTrPM to OSC
//
//  Created by GW Rodriguez on 11/21/19.
//  Copyright © 2019 GW Rodriguez. All rights reserved.
//

#include "wrapper_thirdPartyMotion.hpp"


#pragma mark - MyPacket

MyPacket* newPacket() {
    return reinterpret_cast<MyPacket*>(new Packet());
}

#warning second MyPacket constructor not working
MyPacket* newPacketWith(my_uint16 intSig, my_uint16 fltSig, unsigned char* data) {
    return newPacket();
}

MyPacket* copyPacket(const MyPacket* toCopy) {
    Packet *newObj = new Packet();
    newObj->pkType = reinterpret_cast<const Packet*>(toCopy)->pkType;
    newObj->intSig = reinterpret_cast<const Packet*>(toCopy)->intSig;
    newObj->fltSig = reinterpret_cast<const Packet*>(toCopy)->fltSig;
    
    return reinterpret_cast<MyPacket*>(newObj);
}

void destoryPacket(MyPacket* trash) {
    delete reinterpret_cast<Packet*>(trash);
}


void packet_pkType(MyPacket* obj, my_uint8 type) {
    reinterpret_cast<Packet*>(obj)->pkType = type;
}

void packet_intSig(MyPacket* obj, my_uint16 val) {
    reinterpret_cast<Packet*>(obj)->intSig = val;
}

void packet_fltSig(MyPacket* obj, my_uint16 val) {
    reinterpret_cast<Packet*>(obj)->fltSig = val;
}


my_uint8 getPacketPkType(MyPacket* obj) {
    return reinterpret_cast<Packet*>(obj)->pkType;
}

my_uint16 getPacketIntSig(MyPacket* obj) {
    return reinterpret_cast<Packet*>(obj)->intSig;
}

my_uint16 getPacketFltSig(MyPacket* obj) {
    return reinterpret_cast<Packet*>(obj)->fltSig;
}





#pragma mark - MyTrackable

MyTrackable* newTrackable() {
    return reinterpret_cast<MyTrackable*>(new Trackable());
}

#warning second MyTrackable constructor broken
MyTrackable* newTrackableWith(unsigned char* data, my_uint16 intSig, my_uint16 fltSig) {
    return newTrackable();
}

MyTrackable* copyTrackable(const Trackable* toCopy) {
    Trackable *newObj = new Trackable();
    newObj->timeStamp = reinterpret_cast<const Trackable*>(toCopy)->timeStamp;
    newObj->size = reinterpret_cast<const Trackable*>(toCopy)->size;
    newObj->nameLen = reinterpret_cast<const Trackable*>(toCopy)->nameLen;
    newObj->numMods = reinterpret_cast<const Trackable*>(toCopy)->numMods;
    newObj->name = reinterpret_cast<const Trackable*>(toCopy)->name;
    
    return reinterpret_cast<MyTrackable*>(newObj);
}

void destroyTrackable(MyTrackable* trash) {
    delete reinterpret_cast<Trackable*>(trash);
}


void trackable_timeStamp(MyTrackable* obj, my_uint32 val) {
    reinterpret_cast<Trackable*>(obj)->timeStamp = val;
}

void trackable_size(MyTrackable* obj, my_uint16 val) {
    reinterpret_cast<Trackable*>(obj)->size = val;
}

void trackable_nameLen(MyTrackable* obj, my_uint8 val) {
    reinterpret_cast<Trackable*>(obj)->nameLen = val;
}

void trackable_numMods(MyTrackable* obj, my_uint8 val) {
    reinterpret_cast<Trackable*>(obj)->numMods = val;
}

void trackable_name(MyTrackable* obj, std::string val) {
    reinterpret_cast<Trackable*>(obj)->name = val;
}


my_uint32 getTrackableTimeStamp(MyTrackable* obj) {
    return reinterpret_cast<Trackable*>(obj)->timeStamp;
}

my_uint16 getTrackableSize(MyTrackable* obj) {
    return reinterpret_cast<Trackable*>(obj)->size;
}

my_uint8 getTrackableNameLen(MyTrackable* obj) {
    return reinterpret_cast<Trackable*>(obj)->nameLen;
}

my_uint8 getTrackableNumMods(MyTrackable* obj) {
    return reinterpret_cast<Trackable*>(obj)->numMods;
}

void getTrackableName(MyTrackable* obj, std::string* name) {
    std::string localName = reinterpret_cast<Trackable*>(obj)->name;
    name = &localName;
}


void printTrackable(MyTrackable* obj) {
    reinterpret_cast<Trackable*>(obj)->printModule();
}





#pragma mark - MyCentroidMod

MyCentroidMod* newCentroidMod() {
    return reinterpret_cast<MyCentroidMod*>(new CentroidMod());
}

#warning second MyCentroidMod constructor is broken
MyCentroidMod* newCentroidModWith(std::vector<unsigned char>* data, my_uint16 intSig, my_uint16 fltSig) {
    return newCentroidMod();
}

MyCentroidMod* copyCentroidMod(const MyCentroidMod* toCopy) {
    CentroidMod *newObj = new CentroidMod();
    newObj->size = reinterpret_cast<const CentroidMod*>(toCopy)->size;
    newObj->latency = reinterpret_cast<const CentroidMod*>(toCopy)->latency;
    newObj->x = reinterpret_cast<const CentroidMod*>(toCopy)->x;
    newObj->y = reinterpret_cast<const CentroidMod*>(toCopy)->y;
    newObj->z = reinterpret_cast<const CentroidMod*>(toCopy)->z;
    
    return reinterpret_cast<MyCentroidMod*>(newObj);
}

void destroyCentroidMod(MyCentroidMod* trash) {
    delete reinterpret_cast<CentroidMod*>(trash);
}


void centroidMod_size(MyCentroidMod* obj, my_uint16 val) {
    reinterpret_cast<CentroidMod*>(obj)->size = val;
}

void centroidMod_latency(MyCentroidMod* obj, my_uint16 val) {
    reinterpret_cast<CentroidMod*>(obj)->latency = val;
}

void centroidMod_x(MyCentroidMod* obj, double val) {
    reinterpret_cast<CentroidMod*>(obj)->x = val;
}

void centroidMod_y(MyCentroidMod* obj, double val) {
    reinterpret_cast<CentroidMod*>(obj)->y = val;
}

void centroidMod_z(MyCentroidMod* obj, double val) {
    reinterpret_cast<CentroidMod*>(obj)->z = val;
}


my_uint16 getCentroidModSize(MyCentroidMod* obj) {
    return reinterpret_cast<CentroidMod*>(obj)->size;
}

my_uint16 getCentroidModLatency(MyCentroidMod* obj) {
    return reinterpret_cast<CentroidMod*>(obj)->latency;
}

double getCentroidModX(MyCentroidMod* obj) {
    return reinterpret_cast<CentroidMod*>(obj)->x;
}

double getCentroidModY(MyCentroidMod* obj) {
    return reinterpret_cast<CentroidMod*>(obj)->y;
}

double getCentroidModZ(MyCentroidMod* obj) {
    return reinterpret_cast<CentroidMod*>(obj)->z;
}


void printCentroidMod(MyCentroidMod* obj) {
    reinterpret_cast<CentroidMod*>(obj)->printModule();
}





#pragma mark - MyLEDModule

MyLEDModule* newLEDModule() {
    return reinterpret_cast<MyLEDModule*>(new LEDModule());
}

#warning second MyLEDModule constructor broken
MyLEDModule* newLEDModuleWith(std::vector<unsigned char>* data, my_uint16 intSig, my_uint16 fltSig) {
    return newLEDModule();
}

MyLEDModule* copyLEDModule(MyLEDModule* toCopy) {
    LEDModule *newObj = new LEDModule();
    newObj->size = reinterpret_cast<const LEDModule*>(toCopy)->size;
    newObj->latency = reinterpret_cast<const LEDModule*>(toCopy)->latency;
    newObj->index = reinterpret_cast<const LEDModule*>(toCopy)->index;
    newObj->x = reinterpret_cast<const LEDModule*>(toCopy)->x;
    newObj->y = reinterpret_cast<const LEDModule*>(toCopy)->y;
    newObj->z = reinterpret_cast<const LEDModule*>(toCopy)->z;
    
    return reinterpret_cast<MyLEDModule*>(newObj);
}

void destroyLEDModule(MyLEDModule* trash) {
    delete reinterpret_cast<LEDModule*>(trash);
}


void ledModule_size(MyLEDModule* obj, my_uint16 val) {
    reinterpret_cast<LEDModule*>(obj)->size = val;
}

void ledModule_latency(MyLEDModule* obj, my_uint16 val) {
    reinterpret_cast<LEDModule*>(obj)->latency = val;
}

void ledModule_index(MyLEDModule* obj, my_uint8 val) {
    reinterpret_cast<LEDModule*>(obj)->index = val;
}

void ledModule_x(MyLEDModule* obj, double val) {
    reinterpret_cast<LEDModule*>(obj)->x = val;
}

void ledModule_y(MyLEDModule* obj, double val) {
    reinterpret_cast<LEDModule*>(obj)->y = val;
}

void ledModule_z(MyLEDModule* obj, double val) {
    reinterpret_cast<LEDModule*>(obj)->z = val;
}


my_uint16 getLEDModuleSize(MyLEDModule* obj) {
    return reinterpret_cast<LEDModule*>(obj)->size;
}

my_uint16 getLEDModuleLatency(MyLEDModule* obj) {
    return reinterpret_cast<LEDModule*>(obj)->latency;
}

my_uint8 getLEDModuleIndex(MyLEDModule* obj) {
    return reinterpret_cast<LEDModule*>(obj)->index;
}

double getLEDModuleX(MyLEDModule* obj) {
    return reinterpret_cast<LEDModule*>(obj)->x;
}

double getLEDModuleY(MyLEDModule* obj) {
    return reinterpret_cast<LEDModule*>(obj)->y;
}

double getLEDModuleZ(MyLEDModule* obj) {
    return reinterpret_cast<LEDModule*>(obj)->z;
}


void printLEDModule(MyLEDModule* obj) {
    reinterpret_cast<LEDModule*>(obj)->printModule();
}





#pragma mark - QuatModule

MyQuatModule* newQuatModule() {
    return reinterpret_cast<MyQuatModule*>(new QuatModule());
}

#warning second MyQuatModule constructor is broken
MyQuatModule* newQuatModuleWith(std::vector<unsigned char>* data, my_uint16 intSig, my_uint16 fltSig) {
    return newQuatModule();
}

MyQuatModule* copyQuatModule(const MyQuatModule* toCopy) {
    QuatModule *newObj = new QuatModule();
    newObj->size = reinterpret_cast<const QuatModule*>(toCopy)->size;
    newObj->latency = reinterpret_cast<const QuatModule*>(toCopy)->latency;
    newObj->Qx = reinterpret_cast<const QuatModule*>(toCopy)->Qx;
    newObj->Qy = reinterpret_cast<const QuatModule*>(toCopy)->Qy;
    newObj->Qz = reinterpret_cast<const QuatModule*>(toCopy)->Qz;
    newObj->Qw = reinterpret_cast<const QuatModule*>(toCopy)->Qw;
    
    return reinterpret_cast<MyQuatModule*>(newObj);
}

void destroyQuatModule(MyQuatModule* trash) {
    delete reinterpret_cast<QuatModule*>(trash);
}


void quatModule_size(MyQuatModule* obj, my_uint16 val) {
    reinterpret_cast<QuatModule*>(obj)->size = val;
}

void quatModule_latency(MyQuatModule* obj, my_uint16 val) {
    reinterpret_cast<QuatModule*>(obj)->latency = val;
}

void quatModule_Qx(MyQuatModule* obj, double val) {
    reinterpret_cast<QuatModule*>(obj)->Qx = val;
}

void quatModule_Qy(MyQuatModule* obj, double val) {
    reinterpret_cast<QuatModule*>(obj)->Qy = val;
}

void quatModule_Qz(MyQuatModule* obj, double val) {
    reinterpret_cast<QuatModule*>(obj)->Qz = val;
}

void quatModule_Qw(MyQuatModule* obj, double val) {
    reinterpret_cast<QuatModule*>(obj)->Qw = val;
}


my_uint16 getQuatModuleSize(MyQuatModule* obj) {
    return reinterpret_cast<QuatModule*>(obj)->size;
}

my_uint16 getQuatModuleLatency(MyQuatModule* obj) {
    return reinterpret_cast<QuatModule*>(obj)->latency;
}

double getQuatModuleQx(MyQuatModule* obj) {
    return reinterpret_cast<QuatModule*>(obj)->Qx;
}

double getQuatModuleQy(MyQuatModule* obj) {
    return reinterpret_cast<QuatModule*>(obj)->Qy;
}

double getQuatModuleQz(MyQuatModule* obj) {
    return reinterpret_cast<QuatModule*>(obj)->Qz;
}

double getQuatModuleQw(MyQuatModule* obj) {
    return reinterpret_cast<QuatModule*>(obj)->Qw;
}


void printQuatModule(MyQuatModule* obj) {
    reinterpret_cast<QuatModule*>(obj)->printModule();
}





#pragma mark - EulerModule

MyEulerModule* newEulerModule() {
    return reinterpret_cast<MyEulerModule*>(new EulerModule());
}

#warning second MyEulerModule is broken
MyEulerModule* newEulerModuleWith(std::vector<unsigned char>* data, my_uint16 intSig, my_uint16 fltSig) {
    return newEulerModule();
}

MyEulerModule* copyEulerModule(const MyEulerModule* toCopy) {
    EulerModule *newObj = new EulerModule();
    newObj->size = reinterpret_cast<const EulerModule*>(toCopy)->size;
    newObj->latency = reinterpret_cast<const EulerModule*>(toCopy)->latency;
    newObj->order = reinterpret_cast<const EulerModule*>(toCopy)->order;
    newObj->R1 = reinterpret_cast<const EulerModule*>(toCopy)->R1;
    newObj->R2 = reinterpret_cast<const EulerModule*>(toCopy)->R2;
    newObj->R3 = reinterpret_cast<const EulerModule*>(toCopy)->R3;
    
    return reinterpret_cast<MyEulerModule*>(newObj);
}

void destroyEulerModule(MyEulerModule* trash) {
    delete reinterpret_cast<EulerModule*>(trash);
}


void eulerModule_size(MyEulerModule* obj, my_uint16 val) {
    reinterpret_cast<EulerModule*>(obj)->size = val;
}

void eulerModule_latency(MyEulerModule* obj, my_uint16 val) {
    reinterpret_cast<EulerModule*>(obj)->latency = val;
}

void eulerModule_order(MyEulerModule* obj, my_uint16 val) {
    reinterpret_cast<EulerModule*>(obj)->order = val;
}

void eulerModule_R1(MyEulerModule* obj, double val) {
    reinterpret_cast<EulerModule*>(obj)->R1 = val;
}

void eulerModule_R2(MyEulerModule* obj, double val) {
    reinterpret_cast<EulerModule*>(obj)->R2 = val;
}

void eulerModule_R3(MyEulerModule* obj, double val) {
    reinterpret_cast<EulerModule*>(obj)->R3 = val;
}


my_uint16 getEulerModuleSize(MyEulerModule* obj) {
    return reinterpret_cast<EulerModule*>(obj)->size;
}

my_uint16 getEulerModuleLatency(MyEulerModule* obj) {
    return reinterpret_cast<EulerModule*>(obj)->latency;
}

my_uint16 getEulerModuleOrder(MyEulerModule* obj) {
    return reinterpret_cast<EulerModule*>(obj)->order;
}

double getEulerModuleR1(MyEulerModule* obj) {
    return reinterpret_cast<EulerModule*>(obj)->R1;
}

double getEulerModuleR2(MyEulerModule* obj) {
    return reinterpret_cast<EulerModule*>(obj)->R2;
}

double getEulerModuleR3(MyEulerModule* obj) {
    return reinterpret_cast<EulerModule*>(obj)->R3;
}


void printEulerModule(MyEulerModule* obj) {
    reinterpret_cast<EulerModule*>(obj)->printModule();
}





#pragma mark - MyCentroidAccVelMod

MyCentroidAccVelMod* newCentroidAccVelMod() {
    return reinterpret_cast<MyCentroidAccVelMod*>(new CentroidAccVelMod());
}

#warning second MyCentroidAccVelMod is broken
MyCentroidAccVelMod* newCentroidAccVelModWith(std::vector<unsigned char>* data, my_uint16 intSig, my_uint16 fltSig) {
    return newCentroidAccVelMod();
}

MyCentroidAccVelMod* copyCentroidAccVelMod(MyCentroidAccVelMod* toCopy) {
    CentroidAccVelMod *newObj = new CentroidAccVelMod();
    newObj->size = reinterpret_cast<const CentroidAccVelMod*>(toCopy)->size;
    newObj->x = reinterpret_cast<const CentroidAccVelMod*>(toCopy)->x;
    newObj->y = reinterpret_cast<const CentroidAccVelMod*>(toCopy)->y;
    newObj->z = reinterpret_cast<const CentroidAccVelMod*>(toCopy)->z;
    newObj->accx = reinterpret_cast<const CentroidAccVelMod*>(toCopy)->accx;
    newObj->accy = reinterpret_cast<const CentroidAccVelMod*>(toCopy)->accy;
    newObj->accz = reinterpret_cast<const CentroidAccVelMod*>(toCopy)->accz;
    newObj->velx = reinterpret_cast<const CentroidAccVelMod*>(toCopy)->velx;
    newObj->vely = reinterpret_cast<const CentroidAccVelMod*>(toCopy)->vely;
    newObj->velz = reinterpret_cast<const CentroidAccVelMod*>(toCopy)->velz;
    
    return reinterpret_cast<MyCentroidAccVelMod*>(newObj);
}

void destroyCentroidAccVelMod(MyCentroidAccVelMod* trash) {
    delete reinterpret_cast<CentroidAccVelMod*>(trash);
}


void centroidAccVelMod_size(MyCentroidAccVelMod* obj, my_uint16 val) {
    reinterpret_cast<CentroidAccVelMod*>(obj)->size = val;
}

void centroidAccVelMod_x(MyCentroidAccVelMod* obj, double val) {
    reinterpret_cast<CentroidAccVelMod*>(obj)->x = val;
}

void centroidAccVelMod_y(MyCentroidAccVelMod* obj, double val) {
    reinterpret_cast<CentroidAccVelMod*>(obj)->y = val;
}

void centroidAccVelMod_z(MyCentroidAccVelMod* obj, double val) {
    reinterpret_cast<CentroidAccVelMod*>(obj)->z = val;
}

void centroidAccVelMod_accx(MyCentroidAccVelMod* obj, float val) {
    reinterpret_cast<CentroidAccVelMod*>(obj)->accx = val;
}

void centroidAccVelMod_accy(MyCentroidAccVelMod* obj, float val) {
    reinterpret_cast<CentroidAccVelMod*>(obj)->accy = val;
}

void centroidAccVelMod_accz(MyCentroidAccVelMod* obj, float val) {
    reinterpret_cast<CentroidAccVelMod*>(obj)->accz = val;
}

void centroidAccVelMod_velx(MyCentroidAccVelMod* obj, float val) {
    reinterpret_cast<CentroidAccVelMod*>(obj)->velx = val;
}

void centroidAccVelMod_vely(MyCentroidAccVelMod* obj, float val) {
    reinterpret_cast<CentroidAccVelMod*>(obj)->vely = val;
}

void centroidAccVelMod_velz(MyCentroidAccVelMod* obj, float val) {
    reinterpret_cast<CentroidAccVelMod*>(obj)->velz = val;
}


my_uint16 getCentroidAccVelModSize(MyCentroidAccVelMod* obj) {
    return reinterpret_cast<CentroidAccVelMod*>(obj)->size;
}

double getCentroidAccVelModX(MyCentroidAccVelMod* obj) {
    return reinterpret_cast<CentroidAccVelMod*>(obj)->x;
}

double getCentroidAccVelModY(MyCentroidAccVelMod* obj) {
    return reinterpret_cast<CentroidAccVelMod*>(obj)->y;
}

double getCentroidAccVelModZ(MyCentroidAccVelMod* obj) {
    return reinterpret_cast<CentroidAccVelMod*>(obj)->z;
}

float getCentroidAccVelModAccX(MyCentroidAccVelMod* obj) {
    return reinterpret_cast<CentroidAccVelMod*>(obj)->accx;
}

float getCentroidAccVelModAccY(MyCentroidAccVelMod* obj) {
    return reinterpret_cast<CentroidAccVelMod*>(obj)->accy;
}

float getCentroidAccVelModAccZ(MyCentroidAccVelMod* obj) {
    return reinterpret_cast<CentroidAccVelMod*>(obj)->accz;
}

float getCentroidAccVelModVelX(MyCentroidAccVelMod* obj) {
    return reinterpret_cast<CentroidAccVelMod*>(obj)->velx;
}

float getCentroidAccVelModVelY(MyCentroidAccVelMod* obj) {
    return reinterpret_cast<CentroidAccVelMod*>(obj)->vely;
}

float getCentroidAccVelModVelZ(MyCentroidAccVelMod* obj) {
    return reinterpret_cast<CentroidAccVelMod*>(obj)->velz;
}


void printCentroidAccVelMod(MyCentroidAccVelMod* obj) {
    reinterpret_cast<CentroidAccVelMod*>(obj)->printModule();
}





#pragma mark - MyLEDAccVelMod

MyLEDAccVelMod* newLEDAccVelMod() {
    return reinterpret_cast<MyLEDAccVelMod*>(new LEDAccVelMod());
}

#warning second MyLEDAccVelMod is broken
MyLEDAccVelMod* newLEDAccVelModWith(std::vector<unsigned char>* data, my_uint16 intSig, my_uint16 fltSig) {
    return newLEDAccVelMod();
}

MyLEDAccVelMod* copyLEDAccVelMod(MyLEDAccVelMod* toCopy) {
    LEDAccVelMod *newObj = new LEDAccVelMod();
    newObj->size = reinterpret_cast<const LEDAccVelMod*>(toCopy)->size;
    newObj->x = reinterpret_cast<const LEDAccVelMod*>(toCopy)->x;
    newObj->y = reinterpret_cast<const LEDAccVelMod*>(toCopy)->y;
    newObj->z = reinterpret_cast<const LEDAccVelMod*>(toCopy)->z;
    newObj->accx = reinterpret_cast<const LEDAccVelMod*>(toCopy)->accx;
    newObj->accy = reinterpret_cast<const LEDAccVelMod*>(toCopy)->accy;
    newObj->accz = reinterpret_cast<const LEDAccVelMod*>(toCopy)->accz;
    newObj->velx = reinterpret_cast<const LEDAccVelMod*>(toCopy)->velx;
    newObj->vely = reinterpret_cast<const LEDAccVelMod*>(toCopy)->vely;
    newObj->velz = reinterpret_cast<const LEDAccVelMod*>(toCopy)->velz;
    
    return reinterpret_cast<MyLEDAccVelMod*>(newObj);
}

void destroyLEDAccVelMod(MyLEDAccVelMod* trash) {
    delete reinterpret_cast<LEDAccVelMod*>(trash);
}


void ledAccVelMod_size(MyLEDAccVelMod* obj, my_uint16 val) {
    reinterpret_cast<LEDAccVelMod*>(obj)->size = val;
}

void ledAccVelMod_index(MyLEDAccVelMod* obj, my_uint8 val) {
    reinterpret_cast<LEDAccVelMod*>(obj)->index = val;
}

void ledAccVelMod_x(MyLEDAccVelMod* obj, double val) {
    reinterpret_cast<LEDAccVelMod*>(obj)->x = val;
}

void ledAccVelMod_y(MyLEDAccVelMod* obj, double val) {
    reinterpret_cast<LEDAccVelMod*>(obj)->y = val;
}

void ledAccVelMod_z(MyLEDAccVelMod* obj, double val) {
    reinterpret_cast<LEDAccVelMod*>(obj)->z = val;
}

void ledAccVelMod_accx(MyLEDAccVelMod* obj, float val) {
    reinterpret_cast<LEDAccVelMod*>(obj)->accx = val;
}

void ledAccVelMod_accy(MyLEDAccVelMod* obj, float val) {
    reinterpret_cast<LEDAccVelMod*>(obj)->accy = val;
}

void ledAccVelMod_accz(MyLEDAccVelMod* obj, float val) {
    reinterpret_cast<LEDAccVelMod*>(obj)->accz = val;
}

void ledAccVelMod_velx(MyLEDAccVelMod* obj, float val) {
    reinterpret_cast<LEDAccVelMod*>(obj)->velx = val;
}

void ledAccVelMod_vely(MyLEDAccVelMod* obj, float val) {
    reinterpret_cast<LEDAccVelMod*>(obj)->vely = val;
}

void ledAccVelMod_velz(MyLEDAccVelMod* obj, float val) {
    reinterpret_cast<LEDAccVelMod*>(obj)->velz = val;
}


my_uint16 getLEDAccVelModSize(MyLEDAccVelMod* obj) {
    return reinterpret_cast<LEDAccVelMod*>(obj)->size;
}

my_uint8 getLEDAccVelModIndex(MyLEDAccVelMod* obj) {
    return reinterpret_cast<LEDAccVelMod*>(obj)->index;
}

double getLEDAccVelModX(MyLEDAccVelMod* obj) {
    return reinterpret_cast<LEDAccVelMod*>(obj)->x;
}

double getLEDAccVelModY(MyLEDAccVelMod* obj) {
    return reinterpret_cast<LEDAccVelMod*>(obj)->y;
}

double getLEDAccVelModZ(MyLEDAccVelMod* obj) {
    return reinterpret_cast<LEDAccVelMod*>(obj)->z;
}

float getLEDAccVelModAccX(MyLEDAccVelMod* obj) {
    return reinterpret_cast<LEDAccVelMod*>(obj)->accx;
}

float getLEDAccVelModAccY(MyLEDAccVelMod* obj) {
    return reinterpret_cast<LEDAccVelMod*>(obj)->accy;
}

float getLEDAccVelModAccZ(MyLEDAccVelMod* obj) {
    return reinterpret_cast<LEDAccVelMod*>(obj)->accz;
}

float getLEDAccVelModVelX(MyLEDAccVelMod* obj) {
    return reinterpret_cast<LEDAccVelMod*>(obj)->velx;
}

float getLEDAccVelModVelY(MyLEDAccVelMod* obj) {
    return reinterpret_cast<LEDAccVelMod*>(obj)->vely;
}

float getLEDAccVelModVelZ(MyLEDAccVelMod* obj) {
    return reinterpret_cast<LEDAccVelMod*>(obj)->velz;
}


void printLEDAccVelMod(MyLEDAccVelMod* obj) {
    reinterpret_cast<LEDAccVelMod*>(obj)->printModule();
}
