// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.room.object.data.StringArrayStuffData

package com.sulake.habbo.room.object.data
{
    import com.sulake.habbo.room.IStuffData;
    import com.sulake.core.communication.messages.IMessageDataWrapper;
    import com.sulake.room.object.IRoomObjectModel;
    import com.sulake.room.object.IRoomObjectModelController;

    public class StringArrayStuffData extends _SafeStr_1612 implements IStuffData 
    {

        public static const FORMAT_KEY:int = 2;
        private static const STATE_DEFAULT_INDEX:int = 0;

        private var _SafeStr_3740:Array = [];


        override public function initializeFromIncomingMessage(_arg_1:IMessageDataWrapper):void
        {
            var _local_3:int;
            var _local_4:* = null;
            _SafeStr_3740 = [];
            var _local_2:int = _arg_1.readInteger();
            _local_3 = 0;
            while (_local_3 < _local_2)
            {
                _local_4 = _arg_1.readString();
                _SafeStr_3740.push(_local_4);
                _local_3++;
            };
            super.initializeFromIncomingMessage(_arg_1);
        }

        override public function initializeFromRoomObjectModel(_arg_1:IRoomObjectModel):void
        {
            super.initializeFromRoomObjectModel(_arg_1);
            _SafeStr_3740 = _arg_1.getStringArray("furniture_data");
        }

        override public function writeRoomObjectModel(_arg_1:IRoomObjectModelController):void
        {
            super.writeRoomObjectModel(_arg_1);
            _arg_1.setNumber("furniture_data_format", 2);
            _arg_1.setStringArray("furniture_data", _SafeStr_3740);
        }

        override public function getLegacyString():String
        {
            if (!_SafeStr_3740)
            {
                return ("");
            };
            return (_SafeStr_3740[0]);
        }

        public function getValue(_arg_1:int):String
        {
            if (((_SafeStr_3740) && (_arg_1 < _SafeStr_3740.length)))
            {
                return (_SafeStr_3740[_arg_1]);
            };
            return ("");
        }

        public function setArray(_arg_1:Array):void
        {
            _SafeStr_3740 = _arg_1;
        }

        override public function compare(_arg_1:IStuffData):Boolean
        {
            var _local_3:int;
            var _local_2:StringArrayStuffData = (_arg_1 as StringArrayStuffData);
            if (!_local_2)
            {
                return (false);
            };
            _local_3 = 0;
            while (_local_3 < _SafeStr_3740.length)
            {
                if (_local_3 != 0)
                {
                    if (_SafeStr_3740[_local_3] != _local_2.getValue(_local_3))
                    {
                        return (false);
                    };
                };
                _local_3++;
            };
            return (true);
        }


    }
}//package com.sulake.habbo.room.object.data

// _SafeStr_1612 = "_-Nn" (String#8117, DoABC#3)
// _SafeStr_3740 = "_-vf" (String#94, DoABC#3)


