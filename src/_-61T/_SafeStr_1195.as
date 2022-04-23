// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//_-61T._SafeStr_1195

package _-61T
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class _SafeStr_1195 implements IMessageParser 
    {

        private var _SafeStr_3820:int;
        private var _SafeStr_3819:String;
        private var _SafeStr_6381:String;
        private var _customInfo:String;
        private var _achievementScore:int;


        public function get id():int
        {
            return (_SafeStr_3820);
        }

        public function get figure():String
        {
            return (_SafeStr_3819);
        }

        public function get sex():String
        {
            return (_SafeStr_6381);
        }

        public function get customInfo():String
        {
            return (_customInfo);
        }

        public function get achievementScore():int
        {
            return (_achievementScore);
        }

        public function flush():Boolean
        {
            _SafeStr_3820 = 0;
            _SafeStr_3819 = "";
            _SafeStr_6381 = "";
            _customInfo = "";
            return (true);
        }

        public function parse(_arg_1:IMessageDataWrapper):Boolean
        {
            _SafeStr_3820 = _arg_1.readInteger();
            _SafeStr_3819 = _arg_1.readString();
            _SafeStr_6381 = _arg_1.readString();
            _customInfo = _arg_1.readString();
            _achievementScore = _arg_1.readInteger();
            if (_SafeStr_6381)
            {
                _SafeStr_6381 = _SafeStr_6381.toUpperCase();
            };
            return (true);
        }


    }
}//package _-61T

// _SafeStr_1195 = "_-SA" (String#8435, DoABC#3)
// _SafeStr_3819 = "_-T8" (String#8508, DoABC#3)
// _SafeStr_3820 = "_-t1q" (String#10263, DoABC#3)
// _SafeStr_6381 = "_-51T" (String#6885, DoABC#3)


