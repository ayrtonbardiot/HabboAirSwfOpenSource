// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//_-71X._SafeStr_1517

package _-71X
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class _SafeStr_1517 implements IMessageParser 
    {

        private var _stuffId:int;
        private var _SafeStr_6292:int;
        private var _SafeStr_7124:String;
        private var _SafeStr_7125:int;
        private var _SafeStr_7126:int;
        private var _endTime:int;


        public function flush():Boolean
        {
            _stuffId = -1;
            _SafeStr_6292 = 0;
            _SafeStr_7124 = "";
            _SafeStr_7125 = 0;
            _SafeStr_7126 = 0;
            _endTime = 0;
            return (true);
        }

        public function parse(_arg_1:IMessageDataWrapper):Boolean
        {
            _stuffId = _arg_1.readInteger();
            _SafeStr_6292 = _arg_1.readInteger();
            _SafeStr_7124 = _arg_1.readString();
            _SafeStr_7125 = _arg_1.readInteger();
            _SafeStr_7126 = _arg_1.readInteger();
            _endTime = _arg_1.readInteger();
            return (true);
        }

        public function get stuffId():int
        {
            return (_stuffId);
        }

        public function get achievementId():int
        {
            return (_SafeStr_6292);
        }

        public function get requiredLevelBadgeCode():String
        {
            return (_SafeStr_7124);
        }

        public function get userProgress():int
        {
            return (_SafeStr_7125);
        }

        public function get totalProgress():int
        {
            return (_SafeStr_7126);
        }

        public function get endTime():int
        {
            return (_endTime);
        }


    }
}//package _-71X

// _SafeStr_1517 = "_-O5" (String#8168, DoABC#3)
// _SafeStr_6292 = "_-Q18" (String#8286, DoABC#3)
// _SafeStr_7124 = "_-1h" (String#6615, DoABC#3)
// _SafeStr_7125 = "_-q1W" (String#10053, DoABC#3)
// _SafeStr_7126 = "_-Dw" (String#7461, DoABC#3)


