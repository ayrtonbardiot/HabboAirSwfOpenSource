// by nota

//com.sulake.habbo.room.object.data.MapStuffData

package com.sulake.habbo.room.object.data
{
    import com.sulake.habbo.room.IStuffData;
    import com.sulake.core.utils._SafeStr_24;
    import com.sulake.core.communication.messages.IMessageDataWrapper;
    import com.sulake.room.object.IRoomObjectModel;
    import com.sulake.room.object.IRoomObjectModelController;
    import com.sulake.habbo.room.object.*;
    import com.sulake.habbo.room.*;

    public class MapStuffData extends _SafeStr_1612 implements IStuffData 
    {

        public static const FORMAT_KEY:int = 1;
        private static const STATE_DEFAULT_KEY:String = "state";
        private static const _SafeStr_8738:String = "rarity";

        private var _SafeStr_3740:_SafeStr_24;

        public function MapStuffData(_arg_1:_SafeStr_24=null)
        {
            if (_arg_1)
            {
                _SafeStr_3740 = _arg_1;
            };
        }

        override public function initializeFromIncomingMessage(_arg_1:IMessageDataWrapper):void
        {
            var _local_3:int;
            var _local_5:* = null;
            var _local_4:* = null;
            _SafeStr_3740 = new _SafeStr_24();
            var _local_2:int = _arg_1.readInteger();
            _local_3 = 0;
            while (_local_3 < _local_2)
            {
                _local_5 = _arg_1.readString();
                _local_4 = _arg_1.readString();
                _SafeStr_3740.add(_local_5, _local_4);
                _local_3++;
            };
            super.initializeFromIncomingMessage(_arg_1);
        }

        override public function initializeFromRoomObjectModel(_arg_1:IRoomObjectModel):void
        {
            super.initializeFromRoomObjectModel(_arg_1);
            _SafeStr_3740 = _arg_1.getStringToStringMap("furniture_data");
        }

        override public function writeRoomObjectModel(_arg_1:IRoomObjectModelController):void
        {
            super.writeRoomObjectModel(_arg_1);
            _arg_1.setNumber("furniture_data_format", 1);
            _arg_1.setStringToStringMap("furniture_data", _SafeStr_3740);
        }

        override public function getLegacyString():String
        {
            if (((_SafeStr_3740) && (!(_SafeStr_3740.getValue("state") == null))))
            {
                return (_SafeStr_3740["state"]);
            };
            return ("");
        }

        public function getValue(_arg_1:String):String
        {
            return (_SafeStr_3740[_arg_1]);
        }

        override public function compare(_arg_1:IStuffData):Boolean
        {
            return (false);
        }

        override public function get rarityLevel():int
        {
            var _local_1:String = _SafeStr_3740["rarity"];
            if (_local_1)
            {
                return (_local_1);
            };
            return (-1);
        }


    }
}//package com.sulake.habbo.room.object.data

// _SafeStr_1612 = "_-Nn" (String#8117, DoABC#3)
// _SafeStr_24 = "_-W1s" (String#8725, DoABC#3)
// _SafeStr_3740 = "_-vf" (String#94, DoABC#3)
// _SafeStr_8738 = "_-ot" (String#9964, DoABC#3)


