// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.communication.messages.parser.help._SafeStr_1179

package com.sulake.habbo.communication.messages.parser.help
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class _SafeStr_1179 implements IMessageParser 
    {

        private var _SafeStr_8444:Boolean;
        private var _SafeStr_8445:int;
        private var _SafeStr_8446:String;
        private var _SafeStr_8447:int;


        public function flush():Boolean
        {
            return (true);
        }

        public function parse(_arg_1:IMessageDataWrapper):Boolean
        {
            _SafeStr_8444 = _arg_1.readBoolean();
            _SafeStr_8445 = _arg_1.readInteger();
            _SafeStr_8446 = _arg_1.readString();
            _SafeStr_8447 = _arg_1.readInteger();
            return (true);
        }

        public function get asGuide():Boolean
        {
            return (_SafeStr_8444);
        }

        public function get helpRequestType():int
        {
            return (_SafeStr_8445);
        }

        public function get helpRequestDescription():String
        {
            return (_SafeStr_8446);
        }

        public function get roleSpecificWaitTime():int
        {
            return (_SafeStr_8447);
        }


    }
}//package com.sulake.habbo.communication.messages.parser.help

// _SafeStr_1179 = "_-tk" (String#10296, DoABC#3)
// _SafeStr_8444 = "_-Xb" (String#8811, DoABC#3)
// _SafeStr_8445 = "_-Nh" (String#8105, DoABC#3)
// _SafeStr_8446 = "_-p19" (String#9974, DoABC#3)
// _SafeStr_8447 = "_-JG" (String#7796, DoABC#3)


