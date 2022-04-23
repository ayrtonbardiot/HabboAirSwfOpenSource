// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//_-b1c._SafeStr_1596

package _-b1c
{
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class _SafeStr_1596 
    {

        private var _SafeStr_7175:int;
        private var _SafeStr_7174:Array;

        public function _SafeStr_1596(_arg_1:IMessageDataWrapper)
        {
            var _local_3:int;
            super();
            _SafeStr_7175 = _arg_1.readInteger();
            _SafeStr_7174 = [];
            var _local_2:int = _arg_1.readInteger();
            _local_3 = 0;
            while (_local_3 < _local_2)
            {
                _SafeStr_7174.push(_arg_1.readInteger());
                _local_3++;
            };
        }

        public function dispose():void
        {
            _SafeStr_7175 = -1;
            _SafeStr_7174 = [];
        }

        public function get chance():int
        {
            return (_SafeStr_7175);
        }

        public function get breeds():Array
        {
            return (_SafeStr_7174);
        }


    }
}//package _-b1c

// _SafeStr_1596 = "_-m1g" (String#9811, DoABC#3)
// _SafeStr_7174 = "_-41z" (String#6840, DoABC#3)
// _SafeStr_7175 = "_-71D" (String#7013, DoABC#3)


