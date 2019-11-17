//
//  wrapper_lighting.hpp
//  RTTrPM to OSC
//
//  Created by GW Rodriguez on 11/16/19.
//  Copyright © 2019 GW Rodriguez. All rights reserved.
//

#ifndef wrapper_lighting_hpp
#define wrapper_lighting_hpp

#include <stdio.h>


typedef unsigned short int my_uint16;
typedef unsigned char my_uint8;
typedef unsigned int my_uint32;


#pragma mark - ChannelBlock

typedef struct MyChannelBlock MyChannelBlock;

#ifdef __cplusplus
extern "C" {
#endif
    
    MyChannelBlock* newChannelBlock();
    MyChannelBlock* newChannelBlockWith(unsigned char* vec, my_uint16 intSig, my_uint16 fltSig);
    void destroyChannelBlock(MyChannelBlock* trash);
    
    void channelBlock_chanOffset(MyChannelBlock* obj, my_uint16 val);
    void channelBlock_xFade(MyChannelBlock* obj, my_uint16 val);
    void channelBlock_value(MyChannelBlock* obj, my_uint8 val);
    
    my_uint16 getChannelBlockChanOffset(MyChannelBlock* obj);
    my_uint16 getChannelBlockXFade(MyChannelBlock* obj);
    my_uint8 getChannelBlockValue(MyChannelBlock* obj);
    
    void printChannelBlock(MyChannelBlock* obj);
    
#ifdef __cplusplus
}
#endif





#pragma mark - Spot

typedef struct MySpot MySpot;

#ifdef __cplusplus
extern "C" {
#endif
    
    MySpot* newSpot();
    MySpot* newSpotWith(unsigned char* vec, my_uint16 intSig, my_uint16 fltSig);
    void destroySpot(MySpot* trash);
    
    void spot_size(MySpot* obj, my_uint16 val);
    void spot_id(MySpot* obj, my_uint16 val);
    void spot_spotOffset(MySpot* obj, my_uint16 val);
    void spot_channelStruct(MySpot* obj, my_uint16 val);
    void spot_chanBlocks(MySpot* obj, MyChannelBlock* blocks);
    
    my_uint16 getSpotSize(MySpot* obj);
    my_uint16 getSpotID(MySpot* obj);
    my_uint16 getSpotOffset(MySpot* obj);
    my_uint16 getSpotChannelStruct(MySpot* obj);
    MyChannelBlock* getSpotChanBlocks(MySpot* obj);
    
    void printSpot(MySpot* obj);
    
#ifdef __cplusplus
}
#endif





#pragma mark - Universe

typedef struct MyUniverse MyUniverse;

#ifdef __cplusplus
extern "C" {
#endif
    
    MyUniverse* newUniverse();
    MyUniverse* newUniverseWith(unsigned char* vec, my_uint16 intSig, my_uint16 fltSig);
    void destroyUniverse(MyUniverse* trash);
    
    void universe_size(MyUniverse* obj, my_uint16 val);
    void universe_id(MyUniverse* obj, my_uint16 val);
    void universe_numSpots(MyUniverse* obj, my_uint16 val);
    void universe_spotList(MyUniverse* obj, MySpot*);
    
    my_uint16 getUniverseSize(MyUniverse* obj);
    my_uint16 getUniverseID(MyUniverse* obj);
    my_uint16 getUniverseNumSpots(MyUniverse* obj);
    MySpot* getUniverseSpotList(MyUniverse* obj);
    
    void printUniverse(MyUniverse* obj);
    
#ifdef __cplusplus
}
#endif





#pragma mark - LightingOutput

typedef struct MyLightingOutput MyLightingOutput;

#ifdef __cplusplus
extern "C" {
#endif
    
    MyLightingOutput* newLightingOutput();
    MyLightingOutput* newLightingOutputWith(unsigned char* vec, my_uint16 intSig, my_uint16 fltSig);
    void destroyLightingOutput(MyLightingOutput* trash);
    
    void lightingOutput_lightSequence(MyLightingOutput* obj, my_uint32 val);
    void lightingOutput_holdTime(MyLightingOutput* obj, my_uint32 val);
    void lightingOutput_size(MyLightingOutput* obj, my_uint16 val);
    void lightingOutput_numUniverses(MyLightingOutput* obj, my_uint16 val);
    void lightingOutput_action(MyLightingOutput* obj, my_uint8 val);
    void lightingOutput_uniList(MyLightingOutput* obj, MyUniverse* universes);
    
    my_uint32 getLightingOutputLightingSequence(MyLightingOutput* obj);
    my_uint32 getLightingOutputHoldTime(MyLightingOutput* obj);
    my_uint16 getLightingOutputSize(MyLightingOutput* obj);
    my_uint16 getLightingOutputNumUniverses(MyLightingOutput* obj);
    my_uint8 getLightingOutputAction(MyLightingOutput* obj);
    MyUniverse* getLightingOutputUniList(MyLightingOutput* obj);
    
    void printLightingOutput(MyLightingOutput* obj);
    
#ifdef __cplusplus
}
#endif





#pragma mark - LightingSync

typedef struct MyLightingSync MyLightingSync;

#ifdef __cplusplus
extern "C" {
#endif

    MyLightingSync* newLightingSync();
    MyLightingSync* newLightingSyncWith(unsigned char* vec, my_uint16 intSig, my_uint16 fltSig);
    void destroyLightingSync(MyLightingSync* trash);
    
    void lightingSync_deviceID(MyLightingSync* obj, my_uint32 val);
    void lightingSync_deviceSubID0(MyLightingSync* obj, my_uint32 val);
    void lightingSync_deviceDubID1(MyLightingSync* obj, my_uint32 val);
    void lightingSync_seqNum(MyLightingSync* obj, my_uint32 val);
    void lightingSync_size(MyLightingSync* obj, my_uint16 val);
    
    my_uint32 getLightingSyncDeviceID(MyLightingSync* obj);
    my_uint32 getLightingSyncDeviceSubID0(MyLightingSync* obj);
    my_uint32 getLightingSyncDeviceSubID1(MyLightingSync* obj);
    my_uint32 getLightingSyncSeqNum(MyLightingSync* obj);
    my_uint16 getLightingSyncSize(MyLightingSync* obj);
    
    void printLightingSync(MyLightingSync* obj);

#ifdef __cplusplus
}
#endif

#endif /* wrapper_lighting_hpp */
