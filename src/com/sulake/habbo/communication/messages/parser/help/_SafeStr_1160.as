// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.communication.messages.parser.help._SafeStr_1160

package com.sulake.habbo.communication.messages.parser.help
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class _SafeStr_1160 implements IMessageParser 
    {

        private var _SafeStr_4509:String;
        private var _SafeStr_4510:Array;


        public function flush():Boolean
        {
            _SafeStr_4509 = null;
            _SafeStr_4510 = null;
            return (true);
        }

        public function parse(_arg_1:IMessageDataWrapper):Boolean
        {
            var _local_3:int;
            _SafeStr_4509 = _arg_1.readString();
            _SafeStr_4510 = [];
            var _local_2:int = _arg_1.readInteger();
            _local_3 = 0;
            while (_local_3 < _local_2)
            {
                _SafeStr_4510.push(_arg_1.readInteger());
                _local_3++;
            };
            return (true);
        }

        public function get quizCode():String
        {
            return (_SafeStr_4509);
        }

        public function get questionIds():Array
        {
            return (_SafeStr_4510);
        }


    }
}//package com.sulake.habbo.communication.messages.parser.help

// _SafeStr_1160 = "_-Y1d" (String#8848, DoABC#3)
// _SafeStr_4509 = "_-Fv" (String#7582, DoABC#3)
// _SafeStr_4510 = "_-U19" (String#8544, DoABC#3)


