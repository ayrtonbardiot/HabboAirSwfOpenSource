// by nota

//com.sulake.habbo.room.object.data._SafeStr_1613

package com.sulake.habbo.room.object.data
{
    import com.sulake.habbo.room.IStuffData;
    import com.sulake.core.communication.messages.IMessageDataWrapper;
    import com.sulake.room.object.IRoomObjectModel;
    import com.sulake.room.object.IRoomObjectModelController;

    public class _SafeStr_1613 extends _SafeStr_1612 implements IStuffData 
    {

        public static const FORMAT_KEY:int = 0;

        private var _SafeStr_3740:String = "";


        override public function initializeFromIncomingMessage(_arg_1:IMessageDataWrapper):void
        {
            _SafeStr_3740 = _arg_1.readString();
            super.initializeFromIncomingMessage(_arg_1);
        }

        override public function initializeFromRoomObjectModel(_arg_1:IRoomObjectModel):void
        {
            super.initializeFromRoomObjectModel(_arg_1);
            _SafeStr_3740 = _arg_1.getString("furniture_data");
        }

        override public function writeRoomObjectModel(_arg_1:IRoomObjectModelController):void
        {
            super.writeRoomObjectModel(_arg_1);
            _arg_1.setNumber("furniture_data_format", 0);
            _arg_1.setString("furniture_data", _SafeStr_3740);
        }

        override public function getLegacyString():String
        {
            return (_SafeStr_3740);
        }

        public function setString(_arg_1:String):void
        {
            _SafeStr_3740 = _arg_1;
        }

        override public function compare(_arg_1:IStuffData):Boolean
        {
            return (_SafeStr_3740 == _arg_1.getLegacyString());
        }


    }
}//package com.sulake.habbo.room.object.data

// _SafeStr_1612 = "_-Nn" (String#8117, DoABC#3)
// _SafeStr_1613 = "_-xG" (String#10553, DoABC#3)
// _SafeStr_3740 = "_-vf" (String#94, DoABC#3)


