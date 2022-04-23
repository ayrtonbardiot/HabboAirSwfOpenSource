// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.room.object.logic.furniture._SafeStr_3220

package com.sulake.habbo.room.object.logic.furniture
{
    import com.sulake.habbo.room.messages.RoomObjectDataUpdateMessage;
    import com.sulake.habbo.room.object.data._SafeStr_1681;
    import com.sulake.room.messages.RoomObjectUpdateMessage;

    public class _SafeStr_3220 extends FurnitureMultiStateLogic 
    {


        override public function processUpdateMessage(_arg_1:RoomObjectUpdateMessage):void
        {
            var _local_2:* = null;
            super.processUpdateMessage(_arg_1);
            var _local_3:RoomObjectDataUpdateMessage = (_arg_1 as RoomObjectDataUpdateMessage);
            if (_local_3 != null)
            {
                _local_2 = (_local_3.data as _SafeStr_1681);
                if (_local_2 != null)
                {
                    object.getModelController().setNumber("furniture_vote_majority_result", _local_2.result);
                };
            };
        }


    }
}//package com.sulake.habbo.room.object.logic.furniture

// _SafeStr_1681 = "_-v1w" (String#20350, DoABC#4)
// _SafeStr_3220 = "_-02h" (String#20244, DoABC#4)


