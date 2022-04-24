// by nota

//com.sulake.habbo.room.object.logic.furniture._SafeStr_3228

package com.sulake.habbo.room.object.logic.furniture
{
    import com.sulake.habbo.room.messages.RoomObjectDataUpdateMessage;
    import com.sulake.room.messages.RoomObjectUpdateMessage;
    import com.sulake.habbo.room.object.data._SafeStr_1613;

    public class _SafeStr_3228 extends FurnitureMultiStateLogic 
    {

        private var _SafeStr_5007:int = 0;
        private var _SafeStr_5008:Number = 0;
        private var _SafeStr_5006:int = 0;


        override public function processUpdateMessage(_arg_1:RoomObjectUpdateMessage):void
        {
            if (_arg_1 == null)
            {
                return;
            };
            var _local_2:RoomObjectDataUpdateMessage = (_arg_1 as RoomObjectDataUpdateMessage);
            if (_local_2 != null)
            {
                handleDataUpdateMessage(_local_2);
                return;
            };
            super.processUpdateMessage(_arg_1);
        }

        private function handleDataUpdateMessage(_arg_1:RoomObjectDataUpdateMessage):void
        {
            var _local_3:* = null;
            var _local_4:int = int((_arg_1.state / 1000));
            var _local_2:int = (_arg_1.state % 1000);
            if (_local_2 == 0)
            {
                _SafeStr_5006 = 0;
                _local_3 = new _SafeStr_1613();
                _local_3.setString(_local_4);
                _arg_1 = new RoomObjectDataUpdateMessage(_local_4, _local_3, _arg_1.extra);
                super.processUpdateMessage(_arg_1);
            }
            else
            {
                _SafeStr_5007 = _local_4;
                _SafeStr_5008 = _arg_1.extra;
                _SafeStr_5006 = (lastUpdateTime + _local_2);
            };
        }

        override public function update(_arg_1:int):void
        {
            var _local_2:* = null;
            var _local_3:* = null;
            if (((_SafeStr_5006 > 0) && (_arg_1 >= _SafeStr_5006)))
            {
                _SafeStr_5006 = 0;
                _local_2 = new _SafeStr_1613();
                _local_2.setString(_SafeStr_5007);
                _local_3 = new RoomObjectDataUpdateMessage(_SafeStr_5007, _local_2, _SafeStr_5008);
                super.processUpdateMessage(_local_3);
            };
            super.update(_arg_1);
        }


    }
}//package com.sulake.habbo.room.object.logic.furniture

// _SafeStr_1613 = "_-xG" (String#3181, DoABC#4)
// _SafeStr_3228 = "_-s1N" (String#18430, DoABC#4)
// _SafeStr_5006 = "_-o11" (String#8043, DoABC#4)
// _SafeStr_5007 = "_-jh" (String#15621, DoABC#4)
// _SafeStr_5008 = "_-u5" (String#17981, DoABC#4)


