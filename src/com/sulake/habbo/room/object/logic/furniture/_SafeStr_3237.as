// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.room.object.logic.furniture._SafeStr_3237

package com.sulake.habbo.room.object.logic.furniture
{
    import com.sulake.habbo.room.messages.RoomObjectDataUpdateMessage;
    import com.sulake.habbo.room.object.data._SafeStr_1681;
    import com.sulake.room.messages.RoomObjectUpdateMessage;
    import flash.utils.getTimer;

    public class _SafeStr_3237 extends FurnitureMultiStateLogic 
    {

        private static const UPDATE_INTERVAL:int = 33;
        private static const MAX_UPDATE_TIME:int = 1000;

        private var _SafeStr_5130:int = 0;
        private var _lastUpdate:int = 0;
        private var _SafeStr_3987:int = 33;


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
                    updateTotal(_local_2.result);
                };
            };
        }

        private function get currentTotal():int
        {
            return (object.getModelController().getNumber("furniture_vote_counter_count"));
        }

        private function updateTotal(_arg_1:int):void
        {
            var _local_2:int;
            _SafeStr_5130 = _arg_1;
            if (_lastUpdate == 0)
            {
                object.getModelController().setNumber("furniture_vote_counter_count", _arg_1);
                _lastUpdate = getTimer();
                return;
            };
            if (_SafeStr_5130 != currentTotal)
            {
                _local_2 = Math.abs((_SafeStr_5130 - currentTotal));
                if ((_local_2 * 33) > 1000)
                {
                    _SafeStr_3987 = (1000 / _local_2);
                }
                else
                {
                    _SafeStr_3987 = 33;
                };
                _lastUpdate = getTimer();
            };
        }

        override public function update(_arg_1:int):void
        {
            var _local_2:int;
            var _local_3:int;
            var _local_4:int;
            super.update(_arg_1);
            if (object != null)
            {
                if (((!(currentTotal == _SafeStr_5130)) && (_arg_1 >= (_lastUpdate + _SafeStr_3987))))
                {
                    _local_2 = (_arg_1 - _lastUpdate);
                    _local_3 = int((_local_2 / _SafeStr_3987));
                    _local_4 = 1;
                    if (_SafeStr_5130 < currentTotal)
                    {
                        _local_4 = -1;
                    };
                    if (_local_3 > (_local_4 * (_SafeStr_5130 - currentTotal)))
                    {
                        _local_3 = (_local_4 * (_SafeStr_5130 - currentTotal));
                    };
                    object.getModelController().setNumber("furniture_vote_counter_count", (currentTotal + (_local_4 * _local_3)));
                    _lastUpdate = (_arg_1 - (_local_2 - (_local_3 * _SafeStr_3987)));
                };
            };
        }


    }
}//package com.sulake.habbo.room.object.logic.furniture

// _SafeStr_1681 = "_-v1w" (String#20350, DoABC#4)
// _SafeStr_3237 = "_-n1u" (String#20846, DoABC#4)
// _SafeStr_3987 = "_-U4" (String#2995, DoABC#4)
// _SafeStr_5130 = "_-N1S" (String#8077, DoABC#4)


