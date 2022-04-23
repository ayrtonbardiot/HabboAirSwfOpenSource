// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.communication.messages.parser.game.snowwar.data.Game2PlayerData

package com.sulake.habbo.communication.messages.parser.game.snowwar.data
{
    import com.sulake.core.runtime._SafeStr_13;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class Game2PlayerData implements _SafeStr_13 
    {

        private var _SafeStr_8413:int;
        private var _userName:String;
        private var _figureString:String;
        private var _SafeStr_3834:String;
        private var _SafeStr_4134:int;
        private var _SafeStr_4036:Boolean = false;


        public function dispose():void
        {
            _userName = null;
            _figureString = null;
            _SafeStr_4036 = true;
        }

        public function get disposed():Boolean
        {
            return (_SafeStr_4036);
        }

        public function parse(_arg_1:IMessageDataWrapper):void
        {
            _SafeStr_8413 = _arg_1.readInteger();
            _userName = _arg_1.readString();
            _figureString = _arg_1.readString();
            _SafeStr_3834 = _arg_1.readString();
            _SafeStr_4134 = _arg_1.readInteger();
        }

        public function toString():String
        {
            return ((("[Game Player] " + _SafeStr_8413) + ": ") + _userName);
        }

        public function get referenceId():int
        {
            return (_SafeStr_8413);
        }

        public function get userName():String
        {
            return (_userName);
        }

        public function get figureString():String
        {
            return (_figureString);
        }

        public function get gender():String
        {
            return (_SafeStr_3834);
        }

        public function get teamId():int
        {
            return (_SafeStr_4134);
        }

        public function get isDisposed():Boolean
        {
            return (_SafeStr_4036);
        }


    }
}//package com.sulake.habbo.communication.messages.parser.game.snowwar.data

// _SafeStr_13 = "_-P1N" (String#8235, DoABC#3)
// _SafeStr_3834 = "_-tK" (String#10279, DoABC#3)
// _SafeStr_4036 = "_-Mr" (String#8042, DoABC#3)
// _SafeStr_4134 = "_-O1F" (String#8136, DoABC#3)
// _SafeStr_8413 = "_-p18" (String#9973, DoABC#3)


