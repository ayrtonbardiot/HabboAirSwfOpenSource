// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.communication.messages.parser.game.snowwar.data.FuseObjectData

package com.sulake.habbo.communication.messages.parser.game.snowwar.data
{
    import com.sulake.habbo.room.IStuffData;
    import _-61T._SafeStr_1536;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class FuseObjectData 
    {

        private var _name:String;
        private var _SafeStr_3820:int;
        private var _SafeStr_4050:int;
        private var _SafeStr_4051:int;
        private var _SafeStr_8404:int;
        private var _SafeStr_8405:int;
        private var _SafeStr_4234:int;
        private var _direction:int;
        private var _SafeStr_8406:int;
        private var _SafeStr_6211:Boolean;
        private var _SafeStr_4601:IStuffData;


        public function parse(_arg_1:IMessageDataWrapper):void
        {
            _name = _arg_1.readString();
            _SafeStr_3820 = _arg_1.readInteger();
            _SafeStr_4050 = _arg_1.readInteger();
            _SafeStr_4051 = _arg_1.readInteger();
            _SafeStr_8404 = _arg_1.readInteger();
            _SafeStr_8405 = _arg_1.readInteger();
            _SafeStr_4234 = _arg_1.readInteger();
            _direction = _arg_1.readInteger();
            _SafeStr_8406 = _arg_1.readInteger();
            _SafeStr_6211 = _arg_1.readBoolean();
            _SafeStr_4601 = _SafeStr_1536.parseStuffData(_arg_1);
        }

        public function get name():String
        {
            return (_name);
        }

        public function get id():int
        {
            return (_SafeStr_3820);
        }

        public function get x():int
        {
            return (_SafeStr_4050);
        }

        public function get y():int
        {
            return (_SafeStr_4051);
        }

        public function get xDimension():int
        {
            return (_SafeStr_8404);
        }

        public function get yDimension():int
        {
            return (_SafeStr_8405);
        }

        public function get height():int
        {
            return (_SafeStr_4234);
        }

        public function get direction():int
        {
            return (_direction);
        }

        public function get altitude():int
        {
            return (_SafeStr_8406);
        }

        public function get canStandOn():Boolean
        {
            return (_SafeStr_6211);
        }

        public function get stuffData():IStuffData
        {
            return (_SafeStr_4601);
        }


    }
}//package com.sulake.habbo.communication.messages.parser.game.snowwar.data

// _SafeStr_1536 = "_-KW" (String#7917, DoABC#3)
// _SafeStr_3820 = "_-t1q" (String#10263, DoABC#3)
// _SafeStr_4050 = "_-22N" (String#6666, DoABC#3)
// _SafeStr_4051 = "_-1L" (String#6600, DoABC#3)
// _SafeStr_4234 = "_-z1j" (String#10673, DoABC#3)
// _SafeStr_4601 = "_-o1B" (String#9925, DoABC#3)
// _SafeStr_6211 = "_-e1L" (String#9271, DoABC#3)
// _SafeStr_8404 = "_-NY" (String#8101, DoABC#3)
// _SafeStr_8405 = "_-cy" (String#9164, DoABC#3)
// _SafeStr_8406 = "_-5K" (String#6913, DoABC#3)


