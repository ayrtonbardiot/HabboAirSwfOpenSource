// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.communication.messages.parser.help._SafeStr_1177

package com.sulake.habbo.communication.messages.parser.help
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class _SafeStr_1177 implements IMessageParser 
    {

        private var _onDuty:Boolean;
        private var _SafeStr_8441:int;
        private var _SafeStr_8442:int;
        private var _SafeStr_8443:int;


        public function flush():Boolean
        {
            return (true);
        }

        public function parse(_arg_1:IMessageDataWrapper):Boolean
        {
            _onDuty = _arg_1.readBoolean();
            _SafeStr_8441 = _arg_1.readInteger();
            _SafeStr_8442 = _arg_1.readInteger();
            _SafeStr_8443 = _arg_1.readInteger();
            return (true);
        }

        public function get onDuty():Boolean
        {
            return (_onDuty);
        }

        public function get helpersOnDuty():int
        {
            return (_SafeStr_8442);
        }

        public function get guardiansOnDuty():int
        {
            return (_SafeStr_8443);
        }

        public function get guidesOnDuty():int
        {
            return (_SafeStr_8441);
        }


    }
}//package com.sulake.habbo.communication.messages.parser.help

// _SafeStr_1177 = "_-Y9" (String#8861, DoABC#3)
// _SafeStr_8441 = "_-jv" (String#9654, DoABC#3)
// _SafeStr_8442 = "_-il" (String#9571, DoABC#3)
// _SafeStr_8443 = "_-e1w" (String#9292, DoABC#3)


