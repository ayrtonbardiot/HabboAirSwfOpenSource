﻿// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.room.IRoomEngine

package com.sulake.habbo.room
{
    import com.sulake.core.runtime.IUnknown;
    import flash.events.IEventDispatcher;
    import flash.display.DisplayObject;
    import flash.geom.Point;
    import com.sulake.room.utils.IRoomGeometry;
    import com.sulake.room.utils.IVector3d;
    import flash.geom.Rectangle;
    import com.sulake.room.object.IRoomObject;
    import com.sulake.core.utils._SafeStr_24;
    import flash.display.BitmapData;
    import flash.geom.Matrix;
    import com.sulake.core.communication.messages.IMessageComposer;

    public /*dynamic*/ interface IRoomEngine extends IUnknown 
    {

        function get events():IEventDispatcher;
        function get isInitialized():Boolean;
        function get activeRoomId():int;
        function createRoomCanvas(_arg_1:int, _arg_2:int, _arg_3:int, _arg_4:int, _arg_5:int):DisplayObject;
        function setRoomCanvasScale(_arg_1:int, _arg_2:int, _arg_3:Number, _arg_4:Point=null, _arg_5:Point=null, _arg_6:Boolean=false, _arg_7:Boolean=false, _arg_8:Boolean=false):void;
        function modifyRoomCanvas(_arg_1:int, _arg_2:int, _arg_3:int, _arg_4:int):Boolean;
        function getObjectsByCategory(_arg_1:int):Array;
        function setRoomCanvasMask(_arg_1:int, _arg_2:int, _arg_3:Boolean):void;
        function getRoomCanvasGeometry(_arg_1:int, _arg_2:int=-1):IRoomGeometry;
        function getRoomCanvasScreenOffset(_arg_1:int, _arg_2:int=-1):Point;
        function setRoomCanvasScreenOffset(_arg_1:int, _arg_2:int, _arg_3:Point):Boolean;
        function getRoomCanvasScale(_arg_1:int=-1000, _arg_2:int=-1):Number;
        function handleRoomCanvasMouseEvent(_arg_1:int, _arg_2:int, _arg_3:int, _arg_4:String, _arg_5:Boolean, _arg_6:Boolean, _arg_7:Boolean, _arg_8:Boolean):void;
        function setActiveRoom(_arg_1:int):void;
        function getRoomNumberValue(_arg_1:int, _arg_2:String):Number;
        function getRoomStringValue(_arg_1:int, _arg_2:String):String;
        function getFurnitureIconUrl(_arg_1:int):String;
        function getFurnitureIcon(_arg_1:int, _arg_2:_SafeStr_3140, _arg_3:String=null, _arg_4:IStuffData=null, _arg_5:Boolean=false):_SafeStr_3248;
        function getWallItemIconUrl(_arg_1:int, _arg_2:String=null):String;
        function getWallItemIcon(_arg_1:int, _arg_2:_SafeStr_3140, _arg_3:String=null):_SafeStr_3248;
        function getFurnitureImage(_arg_1:int, _arg_2:IVector3d, _arg_3:int, _arg_4:_SafeStr_3140, _arg_5:uint=0, _arg_6:String=null, _arg_7:int=-1, _arg_8:int=-1, _arg_9:IStuffData=null, _arg_10:Boolean=false):_SafeStr_3248;
        function getGenericRoomObjectImage(_arg_1:String, _arg_2:String, _arg_3:IVector3d, _arg_4:int, _arg_5:_SafeStr_3140, _arg_6:uint=0, _arg_7:String=null, _arg_8:IStuffData=null, _arg_9:int=-1, _arg_10:int=-1, _arg_11:String=null, _arg_12:int=-1):_SafeStr_3248;
        function getWallItemImage(_arg_1:int, _arg_2:IVector3d, _arg_3:int, _arg_4:_SafeStr_3140, _arg_5:uint=0, _arg_6:String=null, _arg_7:int=-1, _arg_8:int=-1):_SafeStr_3248;
        function getPetImage(_arg_1:int, _arg_2:int, _arg_3:int, _arg_4:IVector3d, _arg_5:int, _arg_6:_SafeStr_3140, _arg_7:Boolean=true, _arg_8:uint=0, _arg_9:Array=null, _arg_10:String=null):_SafeStr_3248;
        function getRoomImage(_arg_1:String, _arg_2:String, _arg_3:String, _arg_4:int, _arg_5:_SafeStr_3140, _arg_6:String=null):_SafeStr_3248;
        function getRoomObjectImage(_arg_1:int, _arg_2:int, _arg_3:int, _arg_4:IVector3d, _arg_5:int, _arg_6:_SafeStr_3140, _arg_7:uint=0):_SafeStr_3248;
        function getRoomObjectBoundingRectangle(_arg_1:int, _arg_2:int, _arg_3:int, _arg_4:int):Rectangle;
        function getRoomObjectScreenLocation(_arg_1:int, _arg_2:int, _arg_3:int, _arg_4:int=-1):Point;
        function getActiveRoomBoundingRectangle(_arg_1:int):Rectangle;
        function getRoomObjectCount(_arg_1:int, _arg_2:int):int;
        function getRoomObject(_arg_1:int, _arg_2:int, _arg_3:int):IRoomObject;
        function getRoomObjectWithIndex(_arg_1:int, _arg_2:int, _arg_3:int):IRoomObject;
        function modifyRoomObject(_arg_1:int, _arg_2:int, _arg_3:String):Boolean;
        function modifyRoomObjectDataWithMap(_arg_1:int, _arg_2:int, _arg_3:String, _arg_4:_SafeStr_24):Boolean;
        function modifyRoomObjectData(_arg_1:int, _arg_2:int, _arg_3:String, _arg_4:String):Boolean;
        function deleteRoomObject(_arg_1:int, _arg_2:int):Boolean;
        function initializeRoomObjectInsert(_arg_1:String, _arg_2:int, _arg_3:int, _arg_4:int, _arg_5:String=null, _arg_6:IStuffData=null, _arg_7:int=-1, _arg_8:int=-1, _arg_9:String=null):Boolean;
        function cancelRoomObjectInsert():void;
        function selectAvatar(_arg_1:int, _arg_2:int):void;
        function selectRoomObject(_arg_1:int, _arg_2:int, _arg_3:int):void;
        function getWorldType(_arg_1:int):String;
        function getSelectedObjectData(_arg_1:int):ISelectedRoomObjectData;
        function getSelectedAvatarId():int;
        function updateObjectRoomColor(_arg_1:int, _arg_2:uint, _arg_3:int, _arg_4:Boolean):Boolean;
        function updateObjectRoomBackgroundColor(_arg_1:int, _arg_2:Boolean, _arg_3:int, _arg_4:int, _arg_5:int):Boolean;
        function getPetColor(_arg_1:int, _arg_2:int):PetColorResult;
        function getPetColorsByTag(_arg_1:int, _arg_2:String):Array;
        function getPetLayerIdForTag(_arg_1:int, _arg_2:String):int;
        function getPetDefaultPalette(_arg_1:int, _arg_2:String):PetColorResult;
        function addObjectFurniture(_arg_1:int, _arg_2:int, _arg_3:int, _arg_4:IVector3d, _arg_5:IVector3d, _arg_6:int, _arg_7:IStuffData, _arg_8:Number=NaN, _arg_9:int=-1, _arg_10:int=0, _arg_11:int=0, _arg_12:String="", _arg_13:Boolean=true, _arg_14:Boolean=true, _arg_15:Number=-1):Boolean;
        function changeObjectState(_arg_1:int, _arg_2:int, _arg_3:int):void;
        function changeObjectModelData(_arg_1:int, _arg_2:int, _arg_3:int, _arg_4:String, _arg_5:int):Boolean;
        function disposeObjectFurniture(_arg_1:int, _arg_2:int, _arg_3:int=-1, _arg_4:Boolean=false):void;
        function addObjectWallItem(_arg_1:int, _arg_2:int, _arg_3:int, _arg_4:IVector3d, _arg_5:IVector3d, _arg_6:int, _arg_7:String, _arg_8:int=0, _arg_9:int=0, _arg_10:String="", _arg_11:int=-1, _arg_12:Boolean=true):Boolean;
        function updateObjectWallItemLocation(_arg_1:int, _arg_2:int, _arg_3:IVector3d):Boolean;
        function disposeObjectWallItem(_arg_1:int, _arg_2:int, _arg_3:int=-1):void;
        function addObjectUser(_arg_1:int, _arg_2:int, _arg_3:IVector3d, _arg_4:IVector3d, _arg_5:Number, _arg_6:int, _arg_7:String=null):Boolean;
        function addObjectSnowWar(_arg_1:int, _arg_2:int, _arg_3:IVector3d, _arg_4:int):Boolean;
        function updateObjectUser(_arg_1:int, _arg_2:int, _arg_3:IVector3d, _arg_4:IVector3d, _arg_5:Boolean=false, _arg_6:Number=0, _arg_7:IVector3d=null, _arg_8:Number=NaN):Boolean;
        function updateObjectUserFigure(_arg_1:int, _arg_2:int, _arg_3:String, _arg_4:String=null, _arg_5:String=null, _arg_6:Boolean=false):Boolean;
        function updateObjectUserPosture(_arg_1:int, _arg_2:int, _arg_3:String, _arg_4:String=""):Boolean;
        function updateObjectUserGesture(_arg_1:int, _arg_2:int, _arg_3:int):Boolean;
        function updateObjectUserEffect(_arg_1:int, _arg_2:int, _arg_3:int, _arg_4:int=0):Boolean;
        function updateObjectSnowWar(_arg_1:int, _arg_2:int, _arg_3:IVector3d, _arg_4:int):Boolean;
        function disposeObjectSnowWar(_arg_1:int, _arg_2:int, _arg_3:int):void;
        function updateObjectUserAction(_arg_1:int, _arg_2:int, _arg_3:String, _arg_4:int, _arg_5:String=null):Boolean;
        function disposeObjectUser(_arg_1:int, _arg_2:int):void;
        function updateObjectRoom(_arg_1:int, _arg_2:String=null, _arg_3:String=null, _arg_4:String=null, _arg_5:Boolean=false):Boolean;
        function getFurnitureType(_arg_1:int):String;
        function getFurnitureTypeId(_arg_1:String):int;
        function getWallItemType(_arg_1:int, _arg_2:String=null):String;
        function useRoomObjectInActiveRoom(_arg_1:int, _arg_2:int):Boolean;
        function initializeRoom(_arg_1:int, _arg_2:XML):void;
        function disposeRoom(_arg_1:int):void;
        function get isDecorateMode():Boolean;
        function set isGameMode(_arg_1:Boolean):void;
        function get isGameMode():Boolean;
        function showUseProductSelection(_arg_1:int, _arg_2:int, _arg_3:int=-1):void;
        function setAvatarEffect(_arg_1:int):void;
        function setTileCursorState(_arg_1:int, _arg_2:int):void;
        function toggleTileCursorVisibility(_arg_1:int, _arg_2:Boolean):void;
        function addObjectUpdateCategory(_arg_1:int):void;
        function removeObjectUpdateCategory(_arg_1:int):void;
        function snapshotRoomCanvasToBitmap(_arg_1:int, _arg_2:int, _arg_3:BitmapData, _arg_4:Matrix, _arg_5:Boolean):Boolean;
        function set disableUpdate(_arg_1:Boolean):void;
        function runUpdate():void;
        function updateObjectRoomVisibilities(_arg_1:int, _arg_2:Boolean, _arg_3:Boolean=true):Boolean;
        function get mouseEventsDisabledAboveY():int;
        function set mouseEventsDisabledAboveY(_arg_1:int):void;
        function get mouseEventsDisabledLeftToX():int;
        function set mouseEventsDisabledLeftToX(_arg_1:int):void;
        function getRenderRoomMessage(_arg_1:Rectangle, _arg_2:uint, _arg_3:Boolean=false, _arg_4:Boolean=true, _arg_5:Boolean=false, _arg_6:int=-1):IMessageComposer;
        function createScreenShot(_arg_1:int, _arg_2:int, _arg_3:String):void;

    }
}//package com.sulake.habbo.room

// _SafeStr_24 = "_-W1s" (String#60, DoABC#4)
// _SafeStr_3140 = "_-Y1o" (String#1299, DoABC#4)
// _SafeStr_3248 = "_-u1i" (String#807, DoABC#4)


