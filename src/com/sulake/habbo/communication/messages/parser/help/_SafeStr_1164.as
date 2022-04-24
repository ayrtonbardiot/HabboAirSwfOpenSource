// by nota

//com.sulake.habbo.communication.messages.parser.help._SafeStr_1164

package com.sulake.habbo.communication.messages.parser.help
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class _SafeStr_1164 implements IMessageParser 
    {

        private var _SafeStr_4509:String;
        private var _questionIdsForWrongAnswers:Array;


        public function flush():Boolean
        {
            _SafeStr_4509 = null;
            _questionIdsForWrongAnswers = null;
            return (true);
        }

        public function parse(_arg_1:IMessageDataWrapper):Boolean
        {
            var _local_2:int;
            _SafeStr_4509 = _arg_1.readString();
            _questionIdsForWrongAnswers = [];
            var _local_3:int = _arg_1.readInteger();
            _local_2 = 0;
            while (_local_2 < _local_3)
            {
                _questionIdsForWrongAnswers.push(_arg_1.readInteger());
                _local_2++;
            };
            return (true);
        }

        public function get quizCode():String
        {
            return (_SafeStr_4509);
        }

        public function get questionIdsForWrongAnswers():Array
        {
            return (_questionIdsForWrongAnswers);
        }


    }
}//package com.sulake.habbo.communication.messages.parser.help

// _SafeStr_1164 = "_-S1q" (String#8422, DoABC#3)
// _SafeStr_4509 = "_-Fv" (String#7582, DoABC#3)


