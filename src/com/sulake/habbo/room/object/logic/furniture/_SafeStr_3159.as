// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.room.object.logic.furniture._SafeStr_3159

package com.sulake.habbo.room.object.logic.furniture
{
    import com.sulake.room.messages.RoomObjectUpdateMessage;

    public class _SafeStr_3159 extends _SafeStr_3108 
    {


        override public function processUpdateMessage(_arg_1:RoomObjectUpdateMessage):void
        {
            super.processUpdateMessage(_arg_1);
            if (object == null)
            {
                return;
            };
            if (object.getModelController().getNumber("furniture_real_room_object") == 1)
            {
                object.getModelController().setString("RWEIEP_INFOSTAND_EXTRA_PARAM", "RWEIEP_CRACKABLE_FURNI");
            };
        }


    }
}//package com.sulake.habbo.room.object.logic.furniture

// _SafeStr_3108 = "_-32g" (String#980, DoABC#4)
// _SafeStr_3159 = "_-WQ" (String#19173, DoABC#4)


