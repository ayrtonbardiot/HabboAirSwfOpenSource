// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.room.object.data._SafeStr_1674

package com.sulake.habbo.room.object.data
{
    import com.sulake.habbo.room.IStuffData;
    import com.sulake.core.communication.messages.IMessageDataWrapper;
    import com.sulake.room.object.IRoomObjectModelController;
    import com.sulake.room.object.IRoomObjectModel;

    public class _SafeStr_1674 extends _SafeStr_1612 implements IStuffData 
    {

        public static const FORMAT_KEY:int = 7;
        private static const INTERNAL_STATE_KEY:String = "furniture_crackable_state";
        private static const INTERNAL_HIT_KEY:String = "furniture_crackable_hits";
        private static const INTERNAL_TARGET_KEY:String = "furniture_crackable_target";

        private var _SafeStr_3734:String = "";
        private var _hits:int;
        private var _SafeStr_4017:int;


        override public function initializeFromIncomingMessage(_arg_1:IMessageDataWrapper):void
        {
            _SafeStr_3734 = _arg_1.readString();
            _hits = _arg_1.readInteger();
            _SafeStr_4017 = _arg_1.readInteger();
            super.initializeFromIncomingMessage(_arg_1);
        }

        override public function writeRoomObjectModel(_arg_1:IRoomObjectModelController):void
        {
            super.writeRoomObjectModel(_arg_1);
            _arg_1.setNumber("furniture_data_format", 7);
            _arg_1.setString("furniture_crackable_state", _SafeStr_3734);
            _arg_1.setNumber("furniture_crackable_hits", _hits);
            _arg_1.setNumber("furniture_crackable_target", _SafeStr_4017);
        }

        override public function initializeFromRoomObjectModel(_arg_1:IRoomObjectModel):void
        {
            super.initializeFromRoomObjectModel(_arg_1);
            _SafeStr_3734 = _arg_1.getString("furniture_crackable_state");
            _hits = _arg_1.getNumber("furniture_crackable_hits");
            _SafeStr_4017 = _arg_1.getNumber("furniture_crackable_target");
        }

        override public function getLegacyString():String
        {
            return (_SafeStr_3734);
        }

        public function setString(_arg_1:String):void
        {
            _SafeStr_3734 = _arg_1;
        }

        public function get hits():int
        {
            return (_hits);
        }

        public function get target():int
        {
            return (_SafeStr_4017);
        }

        override public function compare(_arg_1:IStuffData):Boolean
        {
            return (true);
        }


    }
}//package com.sulake.habbo.room.object.data

// _SafeStr_1612 = "_-Nn" (String#8117, DoABC#3)
// _SafeStr_1674 = "_-h1S" (String#9469, DoABC#3)
// _SafeStr_3734 = "_-g1U" (String#9397, DoABC#3)
// _SafeStr_4017 = "_-eB" (String#9298, DoABC#3)


