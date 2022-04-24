// by nota

//com.sulake.habbo.room.object.logic.furniture.FurnitureSoundMachineLogic

package com.sulake.habbo.room.object.logic.furniture
{
    import com.sulake.habbo.room.messages.RoomObjectDataUpdateMessage;
    import com.sulake.room.messages.RoomObjectUpdateMessage;
    import com.sulake.habbo.room.events.RoomObjectFurnitureActionEvent;

    public class FurnitureSoundMachineLogic extends FurnitureMultiStateLogic 
    {

        private var _SafeStr_4469:Boolean;
        private var _SafeStr_3883:Boolean = false;
        private var _SafeStr_4468:int = -1;


        override public function getEventTypes():Array
        {
            var _local_1:Array = ["ROFCAE_SOUND_MACHINE_START", "ROFCAE_SOUND_MACHINE_STOP", "ROFCAE_SOUND_MACHINE_DISPOSE", "ROFCAE_SOUND_MACHINE_INIT"];
            return (getAllEventTypes(super.getEventTypes(), _local_1));
        }

        override public function dispose():void
        {
            requestDispose();
            super.dispose();
        }

        override public function processUpdateMessage(_arg_1:RoomObjectUpdateMessage):void
        {
            var _local_3:* = null;
            var _local_2:int;
            super.processUpdateMessage(_arg_1);
            if (object == null)
            {
                return;
            };
            if (object.getModelController().getNumber("furniture_real_room_object") == 1)
            {
                if (!_SafeStr_3883)
                {
                    requestInitialize();
                };
                _local_3 = (_arg_1 as RoomObjectDataUpdateMessage);
                if (_local_3 == null)
                {
                    return;
                };
                _local_2 = object.getState(0);
                if (_local_2 != _SafeStr_4468)
                {
                    _SafeStr_4468 = _local_2;
                    if (_local_2 == 1)
                    {
                        requestPlayList();
                    }
                    else
                    {
                        if (_local_2 == 0)
                        {
                            requestStopPlaying();
                        };
                    };
                };
            };
        }

        private function requestInitialize():void
        {
            if (((object == null) || (eventDispatcher == null)))
            {
                return;
            };
            _SafeStr_4469 = true;
            var _local_1:RoomObjectFurnitureActionEvent = new RoomObjectFurnitureActionEvent("ROFCAE_SOUND_MACHINE_INIT", object);
            eventDispatcher.dispatchEvent(_local_1);
            _SafeStr_3883 = true;
        }

        private function requestPlayList():void
        {
            if (((object == null) || (eventDispatcher == null)))
            {
                return;
            };
            _SafeStr_4469 = true;
            var _local_1:RoomObjectFurnitureActionEvent = new RoomObjectFurnitureActionEvent("ROFCAE_SOUND_MACHINE_START", object);
            eventDispatcher.dispatchEvent(_local_1);
        }

        private function requestStopPlaying():void
        {
            if (((object == null) || (eventDispatcher == null)))
            {
                return;
            };
            var _local_1:RoomObjectFurnitureActionEvent = new RoomObjectFurnitureActionEvent("ROFCAE_SOUND_MACHINE_STOP", object);
            eventDispatcher.dispatchEvent(_local_1);
        }

        private function requestDispose():void
        {
            if (!_SafeStr_4469)
            {
                return;
            };
            var _local_1:RoomObjectFurnitureActionEvent = new RoomObjectFurnitureActionEvent("ROFCAE_SOUND_MACHINE_DISPOSE", object);
            eventDispatcher.dispatchEvent(_local_1);
        }


    }
}//package com.sulake.habbo.room.object.logic.furniture

// _SafeStr_3883 = "_-w1c" (String#683, DoABC#4)
// _SafeStr_4468 = "_-X12" (String#2196, DoABC#4)
// _SafeStr_4469 = "_-t1g" (String#6189, DoABC#4)


