//
//  wrapper_lighting.cpp
//  RTTrPM to OSC
//
//  Created by GW Rodriguez on 11/16/19.
//  Copyright © 2019 GW Rodriguez. All rights reserved.
//

#include "wrapper_lighting.hpp"
#include "lighting.h"
#include "protocol_common.h"


using namespace std;


#pragma mark - MyChannelBlock

MyChannelBlock* newChannelBlock() {
    return reinterpret_cast<MyChannelBlock*>(new ChannelBlock());
}

#warning second ChannelBlock constructor isn't working
MyChannelBlock* newChannelBlockWith(unsigned char* vec, int vecSize, my_uint16 intSig, my_uint16 fltSig) {
    return newChannelBlock();
}

void destroyChannelBlock(MyChannelBlock* trash) {
    delete reinterpret_cast<ChannelBlock*>(trash);
}


void channelBlock_chanOffset(MyChannelBlock* obj, my_uint16 val) {
    reinterpret_cast<ChannelBlock*>(obj)->chanOffset = val;
}

void channelBlock_xFade(MyChannelBlock* obj, my_uint16 val) {
    reinterpret_cast<ChannelBlock*>(obj)->xFade = val;
}

void channelBlock_value(MyChannelBlock* obj, my_uint8 val) {
    reinterpret_cast<ChannelBlock*>(obj)->value = val;
}


my_uint16 getChannelBlockChanOffset(MyChannelBlock* obj) {
    return reinterpret_cast<ChannelBlock*>(obj)->chanOffset;
}

my_uint16 getChannelBlockXFade(MyChannelBlock* obj) {
    return reinterpret_cast<ChannelBlock*>(obj)->xFade;
}

my_uint8 getChannelBlockValue(MyChannelBlock* obj) {
    return reinterpret_cast<ChannelBlock*>(obj)->value;
}


void printChannelBlock(MyChannelBlock* obj) {
    reinterpret_cast<ChannelBlock*>(obj)->printModule();
}





#pragma mark - MySpot

MySpot* newSpot() {
    return reinterpret_cast<MySpot*>(new Spot());
}

#warning second MySpot constructor isn't working
MySpot* newSpotWith(unsigned char* vec, int vecSize, my_uint16 intSig, my_uint16 fltSig) {
    return newSpot();
}

void destroySpot(MySpot* trash) {
    delete reinterpret_cast<Spot*>(trash);
}


void spot_size(MySpot* obj, my_uint16 val) {
    reinterpret_cast<Spot*>(obj)->size = val;
}

void spot_id(MySpot* obj, my_uint16 val) {
    reinterpret_cast<Spot*>(obj)->spotID = val;
}

void spot_spotOffset(MySpot* obj, my_uint16 val) {
    reinterpret_cast<Spot*>(obj)->spotOffset = val;
}

void spot_channelStruct(MySpot* obj, my_uint16 val) {
    reinterpret_cast<Spot*>(obj)->channelStruct = val;
}

#warning broken
void spot_chanBlocks(MySpot* obj, MyChannelBlock* blocks, int blockSize) {
    //std::vector<ChannelBlock*> localBlocks;
    ChannelBlock* localBlocks = reinterpret_cast<ChannelBlock*>(blocks);
    std::vector<ChannelBlock> vec;
    vec.assign(localBlocks, localBlocks + blockSize);
}


my_uint16 getSpotSize(MySpot* obj) {
    return reinterpret_cast<Spot*>(obj)->size;
}

my_uint16 getSpotID(MySpot* obj) {
    return reinterpret_cast<Spot*>(obj)->spotID;
}

my_uint16 getSpotOffset(MySpot* obj) {
    return reinterpret_cast<Spot*>(obj)->spotOffset;
}

my_uint16 getSpotChannelStruct(MySpot* obj) {
    return reinterpret_cast<Spot*>(obj)->channelStruct;
}

#warning broken, need to figure out parameter arrays
unsigned long int getSpotChanBlocks(MySpot* obj, MyChannelBlock* blocks) {
//    std::vector<ChannelBlock*> chanBlocks = *reinterpret_cast<Spot*>(obj)->chanBlocks;
//    ChannelBlock localBlock[chanBlocks.size()];
//    std::copy(chanBlocks.begin(), chanBlocks.end(), localBlock);
//
//    blocks = reinterpret_cast<MyChannelBlock*>(localBlock);
//    return chanBlocks.size();
    return 0;
}


void printSpot(MySpot* obj) {
    reinterpret_cast<Spot*>(obj)->printModule();
}





#pragma mark - MyUniverse

MyUniverse* newUniverse() {
    return reinterpret_cast<MyUniverse*>(new Universe());
}

#warning second MyUniverse constructor isn't working
MyUniverse* newUniverseWith(unsigned char* vec, my_uint16 intSig, my_uint16 fltSig) {
    return newUniverse();
}

void destroyUniverse(MyUniverse* trash) {
    delete reinterpret_cast<Universe*>(trash);
}


void universe_size(MyUniverse* obj, my_uint16 val) {
    reinterpret_cast<Universe*>(obj)->size = val;
}

void universe_id(MyUniverse* obj, my_uint16 val) {
    reinterpret_cast<Universe*>(obj)->universeID = val;
}

void universe_numSpots(MyUniverse* obj, my_uint16 val) {
    reinterpret_cast<Universe*>(obj)->numSpots = val;
}

#warning setter isn't working
void universe_spotList(MyUniverse* obj, MySpot* list, int listSize) {
//    std::vector<Spot*> localList;
//
//    for (int i = 0; i < listSize; i++) {
//        MySpot* spot = list[i];
//        localList.push_back(reinterpret_cast<Spot*>(spot));
//    }
//
//    reinterpret_cast<Universe*>(obj)->spotList = &localList;
}


my_uint16 getUniverseSize(MyUniverse* obj) {
    return reinterpret_cast<Universe*>(obj)->size;
}

my_uint16 getUniverseID(MyUniverse* obj) {
    return reinterpret_cast<Universe*>(obj)->universeID;
}

my_uint16 getUniverseNumSpots(MyUniverse* obj) {
    return reinterpret_cast<Universe*>(obj)->numSpots;
}

unsigned long int getUniverseSpotListSize(MyUniverse* obj) {
    return reinterpret_cast<Universe*>(obj)->spotList->size();
}

#warning not working
/// Call getUniverseSpotListSize() first to pass spotList with proper malloc'd memory
void getUniverseSpotList(MyUniverse* obj, MySpot* spotList) {
    std::vector<Spot*> uniSpotList = *reinterpret_cast<Universe*>(obj)->spotList;
    const unsigned long int listSize = getUniverseSpotListSize(obj);
    Spot tempList[listSize];

//    std::copy(uniSpotList.begin(), uniSpotList.end(), tempList);

}


void printUniverse(MyUniverse* obj) {
    reinterpret_cast<Universe*>(obj)->printModule();
}





#pragma mark - LightingOutput

MyLightingOutput* newLightingOutput() {
    return reinterpret_cast<MyLightingOutput*>(new LightingOutput());
}

#warning second MyLightingOutput constructor isn't working
MyLightingOutput* newLightingOutputWith(unsigned char* vec, my_uint16 intSig, my_uint16 fltSig) {
    return newLightingOutput();
}

void destroyLightingOutput(MyLightingOutput* trash) {
    delete reinterpret_cast<LightingOutput*>(trash);
}


void lightingOutput_lightSequence(MyLightingOutput* obj, my_uint32 val) {
    reinterpret_cast<LightingOutput*>(obj)->lightSeuquence = val;
}

void lightingOutput_holdTime(MyLightingOutput* obj, my_uint32 val) {
    reinterpret_cast<LightingOutput*>(obj)->holdTime = val;
}

void lightingOutput_size(MyLightingOutput* obj, my_uint16 val) {
    reinterpret_cast<LightingOutput*>(obj)->size = val;
}

void lightingOutput_numUniverses(MyLightingOutput* obj, my_uint16 val) {
    reinterpret_cast<LightingOutput*>(obj)->numUniverses = val;
}

void lightingOutput_action(MyLightingOutput* obj, my_uint8 val) {
    reinterpret_cast<LightingOutput*>(obj)->action = val;
}

#warning setter isn't working
void lightingOutput_uniList(MyLightingOutput* obj, MyUniverse* universes) {
    
}


my_uint32 getLightingOutputLightingSequence(MyLightingOutput* obj) {
    return reinterpret_cast<LightingOutput*>(obj)->lightSeuquence;
}

my_uint32 getLightingOutputHoldTime(MyLightingOutput* obj) {
    return reinterpret_cast<LightingOutput*>(obj)->holdTime;
}

my_uint16 getLightingOutputSize(MyLightingOutput* obj) {
    return reinterpret_cast<LightingOutput*>(obj)->size;
}

my_uint16 getLightingOutputNumUniverses(MyLightingOutput* obj) {
    return reinterpret_cast<LightingOutput*>(obj)->numUniverses;
}

my_uint8 getLightingOutputAction(MyLightingOutput* obj) {
    return reinterpret_cast<LightingOutput*>(obj)->action;
}

#warning getter isn't working
unsigned long int getLightingOutputUniList(MyLightingOutput* obj, MyUniverse* list) {
    std::vector<Universe*> uniList = *reinterpret_cast<LightingOutput*>(obj)->uniList;
    const unsigned long int size = uniList.size();
    Universe array[size];
    
//    array[0] = uniList[0];
    
//    copy(uniList.begin(), uniList.end(), array);
//    obj = reinterpret_cast<MyLightingOutput*>(array);
    
    return size;
}


void printLightingOutput(MyLightingOutput* obj) {
    reinterpret_cast<LightingOutput*>(obj)->printModule();
}





#pragma mark - MyLightingSync

MyLightingSync* newLightingSync() {
    return reinterpret_cast<MyLightingSync*>(new LightingSync());
}

#warning second MyLightingSync constructor isn't working
MyLightingSync* newLightingSyncWith(unsigned char* vec, my_uint16 intSig, my_uint16 fltSig) {
    return newLightingSync();
}

void destroyLightingSync(MyLightingSync* trash) {
    delete reinterpret_cast<LightingSync*>(trash);
}


void lightingSync_deviceID(MyLightingSync* obj, my_uint32 val) {
    reinterpret_cast<LightingSync*>(obj)->deviceID = val;
}

void lightingSync_deviceSubID0(MyLightingSync* obj, my_uint32 val) {
    reinterpret_cast<LightingSync*>(obj)->deviceSubID0 = val;
}

void lightingSync_deviceDubID1(MyLightingSync* obj, my_uint32 val) {
    reinterpret_cast<LightingSync*>(obj)->deviceSubID1 = val;
}

void lightingSync_seqNum(MyLightingSync* obj, my_uint32 val) {
    reinterpret_cast<LightingSync*>(obj)->seqNum = val;
}

void lightingSync_size(MyLightingSync* obj, my_uint16 val) {
    reinterpret_cast<LightingSync*>(obj)->size = val;
}


my_uint32 getLightingSyncDeviceID(MyLightingSync* obj) {
    return reinterpret_cast<LightingSync*>(obj)->deviceID;
}

my_uint32 getLightingSyncDeviceSubID0(MyLightingSync* obj) {
    return reinterpret_cast<LightingSync*>(obj)->deviceSubID0;
}

my_uint32 getLightingSyncDeviceSubID1(MyLightingSync* obj) {
    return reinterpret_cast<LightingSync*>(obj)->deviceSubID1;
}

my_uint32 getLightingSyncSeqNum(MyLightingSync* obj) {
    return reinterpret_cast<LightingSync*>(obj)->seqNum;
}

my_uint16 getLightingSyncSize(MyLightingSync* obj) {
    return reinterpret_cast<LightingSync*>(obj)->size;
}


void printLightingSync(MyLightingSync* obj) {
    reinterpret_cast<LightingSync*>(obj)->printModule();
}

