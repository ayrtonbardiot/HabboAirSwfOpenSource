// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//_-d1Q._SafeStr_1373

package _-d1Q
{
    import com.sulake.core.communication.messages.IMessageParser;
    import _-AE._SafeStr_1611;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class _SafeStr_1373 implements IMessageParser 
    {

        private var _SafeStr_7127:int;
        private var _SafeStr_3814:Array = [];
        private var _SafeStr_7201:int;
        private var _SafeStr_7202:Boolean;


        public function get gameTypeId():int
        {
            return (_SafeStr_7127);
        }

        public function get products():Array
        {
            return (_SafeStr_3814);
        }

        public function get minutesUntilNextWeek():int
        {
            return (_SafeStr_7201);
        }

        public function get rewardingOn():Boolean
        {
            return (_SafeStr_7202);
        }

        public function flush():Boolean
        {
            _SafeStr_7127 = -1;
            _SafeStr_3814 = [];
            _SafeStr_7201 = 0;
            _SafeStr_7202 = true;
            return (true);
        }

        public function parse(_arg_1:IMessageDataWrapper):Boolean
        {
            var _local_2:int;
            _SafeStr_7127 = _arg_1.readInteger();
            var _local_3:int = _arg_1.readInteger();
            _local_2 = 0;
            while (_local_2 < _local_3)
            {
                _SafeStr_3814.push(new _SafeStr_1611(_arg_1));
                _local_2++;
            };
            _SafeStr_7201 = _arg_1.readInteger();
            _SafeStr_7202 = _arg_1.readBoolean();
            return (true);
        }


    }
}//package _-d1Q

// _SafeStr_1373 = "_-H1B" (String#7662, DoABC#3)
// _SafeStr_1611 = "_-m6" (String#9821, DoABC#3)
// _SafeStr_3814 = "_-H1d" (String#7672, DoABC#3)
// _SafeStr_7127 = "_-co" (String#9157, DoABC#3)
// _SafeStr_7201 = "_-NZ" (String#8102, DoABC#3)
// _SafeStr_7202 = "_-x8" (String#10549, DoABC#3)


