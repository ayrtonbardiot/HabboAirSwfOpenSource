// by nota

//com.sulake.habbo.room.object.data._SafeStr_1681

package com.sulake.habbo.room.object.data
{
    import com.sulake.habbo.room.IStuffData;
    import com.sulake.core.communication.messages.IMessageDataWrapper;
    import com.sulake.core.utils._SafeStr_24;
    import com.sulake.room.object.IRoomObjectModelController;
    import com.sulake.room.object.IRoomObjectModel;

    public class _SafeStr_1681 extends _SafeStr_1612 implements IStuffData 
    {

        public static const FORMAT_KEY:int = 3;
        private static const INTERNAL_STATE_KEY:String = "s";
        private static const INTERNAL_RESULT_KEY:String = "r";

        private var _SafeStr_3734:String = "";
        private var _SafeStr_4258:int;


        override public function initializeFromIncomingMessage(_arg_1:IMessageDataWrapper):void
        {
            _SafeStr_3734 = _arg_1.readString();
            _SafeStr_4258 = _arg_1.readInteger();
            super.initializeFromIncomingMessage(_arg_1);
        }

        override public function writeRoomObjectModel(_arg_1:IRoomObjectModelController):void
        {
            super.writeRoomObjectModel(_arg_1);
            _arg_1.setNumber("furniture_data_format", 3);
            var _local_2:_SafeStr_24 = new _SafeStr_24();
            _local_2.add("s", _SafeStr_3734);
            _local_2.add("r", _SafeStr_4258.toString());
            _arg_1.setStringToStringMap("furniture_data", _local_2);
        }

        override public function initializeFromRoomObjectModel(_arg_1:IRoomObjectModel):void
        {
            super.initializeFromRoomObjectModel(_arg_1);
            var _local_2:_SafeStr_24 = _arg_1.getStringToStringMap("furniture_data");
            _SafeStr_3734 = _local_2.getValue("s");
            _SafeStr_4258 = _local_2.getValue("r");
        }

        override public function getLegacyString():String
        {
            return (_SafeStr_3734);
        }

        public function setString(_arg_1:String):void
        {
            _SafeStr_3734 = _arg_1;
        }

        public function get result():int
        {
            return (_SafeStr_4258);
        }

        override public function compare(_arg_1:IStuffData):Boolean
        {
            return (true);
        }


    }
}//package com.sulake.habbo.room.object.data

// _SafeStr_1612 = "_-Nn" (String#8117, DoABC#3)
// _SafeStr_1681 = "_-v1w" (String#10402, DoABC#3)
// _SafeStr_24 = "_-W1s" (String#8725, DoABC#3)
// _SafeStr_3734 = "_-g1U" (String#9397, DoABC#3)
// _SafeStr_4258 = "_-fc" (String#9371, DoABC#3)


