﻿// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.room.object.logic.furniture._SafeStr_3236

package com.sulake.habbo.room.object.logic.furniture
{
    import com.sulake.room.utils.Vector3d;
    import com.sulake.habbo.room.events.RoomObjectFloorHoleEvent;
    import com.sulake.habbo.room.messages.RoomObjectDataUpdateMessage;
    import com.sulake.room.messages.RoomObjectUpdateMessage;
    import com.sulake.room.object.IRoomObject;

    public class _SafeStr_3236 extends FurnitureMultiStateLogic 
    {

        private static const STATE_HOLE:int = 0;

        private var _SafeStr_4468:int = -1;
        private var _SafeStr_4060:Vector3d = null;


        override public function dispose():void
        {
            if (_SafeStr_4468 == 0)
            {
                eventDispatcher.dispatchEvent(new RoomObjectFloorHoleEvent("ROFHO_REMOVE_HOLE", object));
            };
            super.dispose();
        }

        override public function getEventTypes():Array
        {
            var _local_1:Array = ["ROFHO_ADD_HOLE", "ROFHO_REMOVE_HOLE"];
            return (getAllEventTypes(super.getEventTypes(), _local_1));
        }

        override public function processUpdateMessage(_arg_1:RoomObjectUpdateMessage):void
        {
            var _local_4:* = null;
            var _local_3:int;
            var _local_2:* = null;
            super.processUpdateMessage(_arg_1);
            if (object != null)
            {
                _local_4 = (_arg_1 as RoomObjectDataUpdateMessage);
                if (_local_4 != null)
                {
                    _local_3 = object.getState(0);
                    handleStateUpdate(_local_3);
                };
                _local_2 = object.getLocation();
                if (_SafeStr_4060 == null)
                {
                    _SafeStr_4060 = new Vector3d();
                }
                else
                {
                    if (((!(_local_2.x == _SafeStr_4060.x)) || (!(_local_2.y == _SafeStr_4060.y))))
                    {
                        if (_SafeStr_4468 == 0)
                        {
                            if (eventDispatcher != null)
                            {
                                eventDispatcher.dispatchEvent(new RoomObjectFloorHoleEvent("ROFHO_ADD_HOLE", object));
                            };
                        };
                    };
                };
                _SafeStr_4060.assign(_local_2);
            };
        }

        private function handleStateUpdate(_arg_1:int):void
        {
            if (_arg_1 != _SafeStr_4468)
            {
                if (eventDispatcher != null)
                {
                    if (_arg_1 == 0)
                    {
                        eventDispatcher.dispatchEvent(new RoomObjectFloorHoleEvent("ROFHO_ADD_HOLE", object));
                    }
                    else
                    {
                        if (_SafeStr_4468 == 0)
                        {
                            eventDispatcher.dispatchEvent(new RoomObjectFloorHoleEvent("ROFHO_REMOVE_HOLE", object));
                        };
                    };
                };
                _SafeStr_4468 = _arg_1;
            };
        }

        private function handleAutomaticStateUpdate():void
        {
            var _local_3:* = null;
            var _local_2:Number;
            var _local_4:int;
            var _local_1:IRoomObject = object;
            if (_local_1 != null)
            {
                _local_3 = _local_1.getModel();
                if (_local_3 != null)
                {
                    _local_2 = _local_3.getNumber("furniture_automatic_state_index");
                    if (!isNaN(_local_2))
                    {
                        _local_4 = _local_2;
                        _local_4 = (_local_4 % 2);
                        handleStateUpdate(_local_4);
                    };
                };
            };
        }

        override public function update(_arg_1:int):void
        {
            super.update(_arg_1);
            handleAutomaticStateUpdate();
        }


    }
}//package com.sulake.habbo.room.object.logic.furniture

// _SafeStr_3236 = "_-m1u" (String#21720, DoABC#4)
// _SafeStr_4060 = "_-y1p" (String#2746, DoABC#4)
// _SafeStr_4468 = "_-X12" (String#2196, DoABC#4)


