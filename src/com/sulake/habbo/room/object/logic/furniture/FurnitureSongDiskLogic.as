// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.room.object.logic.furniture.FurnitureSongDiskLogic

package com.sulake.habbo.room.object.logic.furniture
{
    import com.sulake.room.messages.RoomObjectUpdateMessage;

    public class FurnitureSongDiskLogic extends _SafeStr_3108 
    {


        override public function processUpdateMessage(_arg_1:RoomObjectUpdateMessage):void
        {
            var _local_2:* = null;
            var _local_3:int;
            super.processUpdateMessage(_arg_1);
            if (object == null)
            {
                return;
            };
            if (object.getModelController().getNumber("furniture_real_room_object") == 1)
            {
                _local_2 = object.getModelController().getString("furniture_extras");
                _local_3 = _local_2;
                object.getModelController().setString("RWEIEP_INFOSTAND_EXTRA_PARAM", ("RWEIEP_SONGDISK" + _local_3));
            };
        }


    }
}//package com.sulake.habbo.room.object.logic.furniture

// _SafeStr_3108 = "_-32g" (String#980, DoABC#4)


