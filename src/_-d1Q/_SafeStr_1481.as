// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//_-d1Q._SafeStr_1481

package _-d1Q
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class _SafeStr_1481 implements IMessageParser 
    {

        private var _SafeStr_7127:int;
        private var _SafeStr_7203:Array = [];


        public function get gameTypeId():int
        {
            return (_SafeStr_7127);
        }

        public function get winners():Array
        {
            return (_SafeStr_7203);
        }

        public function flush():Boolean
        {
            _SafeStr_7127 = -1;
            _SafeStr_7203 = [];
            return (true);
        }

        public function parse(_arg_1:IMessageDataWrapper):Boolean
        {
            var _local_3:int;
            _SafeStr_7127 = _arg_1.readInteger();
            var _local_2:int = _arg_1.readInteger();
            _local_3 = 0;
            while (_local_3 < _local_2)
            {
                _SafeStr_7203.push(new _SafeStr_1531(_arg_1));
                _local_3++;
            };
            return (true);
        }


    }
}//package _-d1Q

// _SafeStr_1481 = "_-b1T" (String#9052, DoABC#3)
// _SafeStr_1531 = "_-U1J" (String#8550, DoABC#3)
// _SafeStr_7127 = "_-co" (String#9157, DoABC#3)
// _SafeStr_7203 = "_-l1y" (String#9761, DoABC#3)


